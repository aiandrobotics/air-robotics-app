import 'dart:async';
import 'dart:typed_data';

import '../ble/ble_transport_interface.dart';
import 'telemetry_packet.dart';

/// Real-time health, throughput, and packet delivery metrics for the telemetry bus.
class TelemetryMetrics {
  final int totalPackets;
  final int droppedPackets;
  final double dropRatePercent;
  final double frequencyHz;
  final DateTime? lastPacketTime;

  const TelemetryMetrics({
    this.totalPackets = 0,
    this.droppedPackets = 0,
    this.dropRatePercent = 0.0,
    this.frequencyHz = 0.0,
    this.lastPacketTime,
  });

  TelemetryMetrics copyWith({
    int? totalPackets,
    int? droppedPackets,
    double? dropRatePercent,
    double? frequencyHz,
    DateTime? lastPacketTime,
  }) {
    return TelemetryMetrics(
      totalPackets: totalPackets ?? this.totalPackets,
      droppedPackets: droppedPackets ?? this.droppedPackets,
      dropRatePercent: dropRatePercent ?? this.dropRatePercent,
      frequencyHz: frequencyHz ?? this.frequencyHz,
      lastPacketTime: lastPacketTime ?? this.lastPacketTime,
    );
  }

  @override
  String toString() =>
      'TelemetryMetrics(total: $totalPackets, dropped: $droppedPackets, '
      'dropRate: ${dropRatePercent.toStringAsFixed(1)}%, '
      'freq: ${frequencyHz.toStringAsFixed(1)} Hz)';
}

/// Reactive telemetry bus ingesting 31-byte Little-Endian binary packets from FAB2,
/// verifying sequence counter continuity, calculating live packet frequencies,
/// and streaming updates to UI consumers.
class TelemetryBus {
  final BleTransport? transport;

  final StreamController<TelemetryPacket> _packetController =
      StreamController<TelemetryPacket>.broadcast();
  final StreamController<TelemetryMetrics> _metricsController =
      StreamController<TelemetryMetrics>.broadcast();

  StreamSubscription<Uint8List>? _transportSub;
  TelemetryPacket? _latestPacket;
  TelemetryMetrics _currentMetrics = const TelemetryMetrics();

  int _totalPackets = 0;
  int _droppedPackets = 0;
  int? _lastSequenceCounter;
  final List<DateTime> _recentTimestamps = [];

  TelemetryBus({this.transport});

  Stream<TelemetryPacket> get packetStream => _packetController.stream;
  Stream<TelemetryMetrics> get metricsStream => _metricsController.stream;
  TelemetryPacket? get latestPacket => _latestPacket;
  TelemetryMetrics get currentMetrics => _currentMetrics;

  /// Starts listening to the BLE transport's FAB2 characteristic notification stream.
  void start() {
    if (transport == null || _transportSub != null) return;
    try {
      _transportSub = transport!.subscribeTelemetry().listen(
        ingestBytes,
        onError: (_) {
          // Handle unexpected radio error gracefully without terminating stream
        },
      );
    } catch (_) {
      // Characteristic not bound yet or radio not ready
    }
  }

  /// Stops listening to transport notifications and clears cached packets.
  void stop() {
    _transportSub?.cancel();
    _transportSub = null;
    resetMetrics();
  }

  /// Ingests a raw byte buffer (expected 31 bytes), decodes it into a [TelemetryPacket],
  /// recalculates live metrics, and notifies active stream listeners.
  void ingestBytes(Uint8List rawBytes) {
    if (rawBytes.length != TelemetryPacket.packetLength) {
      return;
    }

    final packet = TelemetryPacket.fromBytes(rawBytes);
    final now = DateTime.now();

    // 1. Sequence counter continuity & drop calculation
    if (_lastSequenceCounter != null) {
      final diff = (packet.sequenceCounter - _lastSequenceCounter!) & 0xFFFF;
      if (diff > 1 && diff < 30000) {
        _droppedPackets += (diff - 1);
      }
    }
    _lastSequenceCounter = packet.sequenceCounter;
    _totalPackets++;

    // 2. Rolling arrival frequency calculation (window of 2000 ms)
    _recentTimestamps.add(now);
    _recentTimestamps.removeWhere(
      (t) => now.difference(t).inMilliseconds > 2000,
    );

    double freq = 0.0;
    if (_recentTimestamps.length >= 2) {
      final spanMs = _recentTimestamps.last
          .difference(_recentTimestamps.first)
          .inMilliseconds;
      if (spanMs > 0) {
        freq = ((_recentTimestamps.length - 1) * 1000.0) / spanMs;
      }
    }

    final totalExpected = _totalPackets + _droppedPackets;
    final dropRate = totalExpected > 0
        ? (_droppedPackets / totalExpected) * 100.0
        : 0.0;

    _latestPacket = packet;
    _currentMetrics = TelemetryMetrics(
      totalPackets: _totalPackets,
      droppedPackets: _droppedPackets,
      dropRatePercent: dropRate,
      frequencyHz: freq,
      lastPacketTime: now,
    );

    _packetController.add(packet);
    _metricsController.add(_currentMetrics);
  }

  /// Resets all counters, cached packet, and rolling history.
  void resetMetrics() {
    _totalPackets = 0;
    _droppedPackets = 0;
    _lastSequenceCounter = null;
    _recentTimestamps.clear();
    _latestPacket = null;
    _currentMetrics = const TelemetryMetrics();
    _metricsController.add(_currentMetrics);
  }

  void dispose() {
    stop();
    _packetController.close();
    _metricsController.close();
  }
}
