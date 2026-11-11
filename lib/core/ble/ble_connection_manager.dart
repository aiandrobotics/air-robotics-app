import 'dart:async';
import 'dart:math' as math;

import 'ble_transport_interface.dart';

/// Manages the deterministic BLE connection lifecycle, SMP bonding,
/// MTU negotiation, and exponential backoff auto-reconnection.
class BleConnectionManager {
  final BleTransport transport;
  final int maxReconnectAttempts;
  final Duration maxBackoffInterval;

  BleConnectionState _state = BleConnectionState.disconnected;
  final StreamController<BleConnectionState> _stateController =
      StreamController<BleConnectionState>.broadcast();

  DiscoveredRobot? _targetRobot;
  BleGattInfo? _gattInfo;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  bool _manualDisconnect = false;

  StreamSubscription<BleConnectionState>? _transportStateSub;

  BleConnectionManager({
    required this.transport,
    this.maxReconnectAttempts = 5,
    this.maxBackoffInterval = const Duration(seconds: 30),
  }) {
    _transportStateSub =
        transport.connectionStateStream.listen(_onTransportStateChanged);
  }

  Stream<BleConnectionState> get stateStream => _stateController.stream;
  BleConnectionState get currentState => _state;
  BleGattInfo? get gattInfo => _gattInfo;
  DiscoveredRobot? get connectedRobot => _targetRobot;
  bool get isManualDisconnect => _manualDisconnect;

  /// Resets the manual disconnect flag (e.g. on app resume or user reconnect).
  void resetManualDisconnect() {
    _manualDisconnect = false;
  }

  /// Connects to [robot], requests 517B MTU, establishes SMP bonding,
  /// discovers GATT services, and enters [BleConnectionState.ready].
  Future<void> connect(DiscoveredRobot robot) async {
    if (_state == BleConnectionState.connecting ||
        _state == BleConnectionState.connected ||
        _state == BleConnectionState.discovering ||
        _state == BleConnectionState.bonding ||
        _state == BleConnectionState.ready) {
      return;
    }
    _manualDisconnect = false;
    _reconnectTimer?.cancel();
    _reconnectAttempts = 0;
    _targetRobot = robot;

    _updateState(BleConnectionState.connecting);

    try {
      await transport.connect(robot.id);
      _updateState(BleConnectionState.connected);

      // 1. Negotiate 517-byte MTU for high-throughput sequence table syncing
      try {
        await transport.requestMtu(517);
      } catch (_) {
        // Fallback to default MTU if negotiation fails or is unsupported
      }

      // 2. SMP "Just Works" LE Secure Connections bonding
      _updateState(BleConnectionState.bonding);
      try {
        await transport.createBond();
      } catch (_) {
        // Bonding prompt might already be satisfied or handled by OS
      }

      // 3. Discover DIS & AIR Robotics GATT services
      _updateState(BleConnectionState.discovering);
      _gattInfo = await transport.discoverServices();

      // 4. Mark connection ready
      _updateState(BleConnectionState.ready);
      _reconnectAttempts = 0;
    } catch (e) {
      if (!_manualDisconnect) {
        _scheduleAutoReconnect();
      } else {
        _updateState(BleConnectionState.disconnected);
      }
      rethrow;
    }
  }

  /// Explicitly disconnects and halts any active reconnection attempts.
  Future<void> disconnect() async {
    _manualDisconnect = true;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _reconnectAttempts = 0;
    _targetRobot = null;
    _gattInfo = null;

    try {
      await transport.disconnect();
    } finally {
      _updateState(BleConnectionState.disconnected);
    }
  }

  void _onTransportStateChanged(BleConnectionState transportState) {
    if (transportState == BleConnectionState.disconnected &&
        !_manualDisconnect &&
        _state != BleConnectionState.disconnected &&
        _targetRobot != null) {
      _scheduleAutoReconnect();
    }
  }

  /// Calculates exponential backoff interval: 1s, 2s, 4s, 8s, up to 30s.
  Duration calculateBackoffInterval(int attempt) {
    final seconds = math.min(
      math.pow(2, attempt).toInt(),
      maxBackoffInterval.inSeconds,
    );
    return Duration(seconds: seconds);
  }

  void _scheduleAutoReconnect() {
    _reconnectTimer?.cancel();

    if (_reconnectAttempts >= maxReconnectAttempts) {
      _updateState(BleConnectionState.disconnected);
      return;
    }

    _updateState(BleConnectionState.reconnecting);

    final delay = calculateBackoffInterval(_reconnectAttempts);
    _reconnectAttempts++;

    _reconnectTimer = Timer(delay, () async {
      if (_manualDisconnect || _targetRobot == null) return;
      try {
        await connect(_targetRobot!);
      } catch (_) {
        // Next reconnect cycle will be scheduled if attempts remain
      }
    });
  }

  void _updateState(BleConnectionState newState) {
    if (_state != newState) {
      _state = newState;
      _stateController.add(_state);
    }
  }

  void dispose() {
    _transportStateSub?.cancel();
    _reconnectTimer?.cancel();
    _stateController.close();
  }
}
