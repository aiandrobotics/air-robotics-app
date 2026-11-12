import 'dart:async';

import 'ble_transport_interface.dart';

/// RSSI Smoother using a rolling Exponential Moving Average (EMA).
class RssiSmoother {
  final double alpha;
  double? _currentSmoothed;

  RssiSmoother({this.alpha = 0.25}) {
    if (alpha <= 0.0 || alpha > 1.0) {
      throw ArgumentError.value(alpha, 'alpha', 'Smoothing factor must be in (0.0, 1.0]');
    }
  }

  double update(int rawRssi) {
    if (_currentSmoothed == null) {
      _currentSmoothed = rawRssi.toDouble();
    } else {
      _currentSmoothed = (alpha * rawRssi) + ((1.0 - alpha) * _currentSmoothed!);
    }
    return _currentSmoothed!;
  }

  double? get current => _currentSmoothed;

  void reset() {
    _currentSmoothed = null;
  }
}

/// BLE Scanner responsible for prefix filtering, RSSI smoothing, and pairing
/// mode detection.
class BleScanner {
  final BleTransport transport;
  final List<String> allowedPrefixes;
  final double smoothingAlpha;
  final Duration staleThreshold;

  final Map<String, RssiSmoother> _smoothers = {};
  final Map<String, DiscoveredRobot> _discoveredMap = {};
  final StreamController<List<DiscoveredRobot>> _robotsController =
      StreamController<List<DiscoveredRobot>>.broadcast();

  StreamSubscription<List<DiscoveredRobot>>? _scanSub;
  Timer? _pruneTimer;

  BleScanner({
    required this.transport,
    this.allowedPrefixes = const ['Fabrica-', 'AIR-'],
    this.smoothingAlpha = 0.25,
    this.staleThreshold = const Duration(seconds: 5),
  }) {
    _scanSub = transport.scanResultsStream.listen(_onRawScanResults);
  }

  Stream<List<DiscoveredRobot>> get discoveredRobotsStream =>
      _robotsController.stream;

  List<DiscoveredRobot> get discoveredRobots => _sortedRobots();

  Stream<bool> get isScanningStream => transport.isScanningStream;

  Future<void> startScan({
    Duration? timeout,
    bool clearExisting = false,
  }) async {
    if (clearExisting) {
      _discoveredMap.clear();
      _smoothers.clear();
      _robotsController.add([]);
    }
    _startPruneTimer();
    await transport.startScan(
      timeout: timeout,
      namePrefixes: allowedPrefixes,
    );
  }

  Future<void> stopScan() async {
    _stopPruneTimer();
    await transport.stopScan();
  }

  void _startPruneTimer() {
    _pruneTimer?.cancel();
    _pruneTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => _pruneStaleDevices());
  }

  void _stopPruneTimer() {
    _pruneTimer?.cancel();
    _pruneTimer = null;
  }

  /// Processes raw scan results from the transport layer.
  void _onRawScanResults(List<DiscoveredRobot> rawList) {
    final now = DateTime.now();

    for (final raw in rawList) {
      // 1. Prefix filtering check
      if (!_matchesPrefix(raw.name)) {
        continue;
      }

      // 2. RSSI smoothing via EMA
      final smoother = _smoothers.putIfAbsent(
        raw.id,
        () => RssiSmoother(alpha: smoothingAlpha),
      );
      final smoothed = smoother.update(raw.rawRssi);

      // 3. Update entry
      _discoveredMap[raw.id] = DiscoveredRobot(
        id: raw.id,
        name: raw.name.isNotEmpty ? raw.name : 'Unknown Robot',
        rawRssi: raw.rawRssi,
        smoothedRssi: smoothed,
        isPairingMode: raw.isPairingMode,
        lastSeen: now,
      );
    }

    _robotsController.add(_sortedRobots());
  }

  void _pruneStaleDevices() {
    if (_discoveredMap.isEmpty) return;
    final now = DateTime.now();
    bool changed = false;
    _discoveredMap.removeWhere((id, robot) {
      final isStale = now.difference(robot.lastSeen) >= staleThreshold;
      if (isStale) {
        _smoothers.remove(id);
        changed = true;
      }
      return isStale;
    });

    if (changed) {
      _robotsController.add(_sortedRobots());
    }
  }

  bool _matchesPrefix(String name) {
    if (name.isEmpty) return false;
    for (final prefix in allowedPrefixes) {
      if (name.startsWith(prefix)) return true;
    }
    return false;
  }

  List<DiscoveredRobot> _sortedRobots() {
    final list = _discoveredMap.values.toList();
    // Sort descending: strongest signal (least negative RSSI) first
    list.sort((a, b) => b.smoothedRssi.compareTo(a.smoothedRssi));
    return List.unmodifiable(list);
  }

  void dispose() {
    _pruneTimer?.cancel();
    _scanSub?.cancel();
    _robotsController.close();
  }
}
