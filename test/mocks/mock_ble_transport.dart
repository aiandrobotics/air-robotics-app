import 'dart:async';
import 'dart:typed_data';

import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';

/// Test double simulating native BLE peripheral responses and connection events.
class MockBleTransport implements BleTransport {
  BleConnectionState _state = BleConnectionState.disconnected;
  DiscoveredRobot? _connectedRobot;

  final StreamController<List<DiscoveredRobot>> _scanController =
      StreamController<List<DiscoveredRobot>>.broadcast();
  final StreamController<bool> _isScanningController =
      StreamController<bool>.broadcast();
  final StreamController<BleConnectionState> _connectionStateController =
      StreamController<BleConnectionState>.broadcast();

  final List<Uint8List> writtenControlPointPayloads = [];
  final List<bool> writtenControlPointNoResponse = [];
  final Map<String, List<Uint8List>> writtenCharacteristics = {};
  final Map<String, List<Uint8List>> deviceWrittenControlPointPayloads = {};

  bool failNextConnect = false;
  bool failNextWrite = false;
  int negotiatedMtu = 517;

  @override
  Stream<List<DiscoveredRobot>> get scanResultsStream => _scanController.stream;

  @override
  Stream<bool> get isScanningStream => _isScanningController.stream;

  @override
  Stream<BleConnectionState> get connectionStateStream =>
      _connectionStateController.stream;

  @override
  BleConnectionState get currentConnectionState => _state;

  @override
  DiscoveredRobot? get connectedRobot => _connectedRobot;

  /// Programmatically emits candidate peripherals for scan testing.
  void emitDiscoveredRobots(List<DiscoveredRobot> robots) {
    _scanController.add(robots);
  }

  /// Programmatically triggers a radio link drop to test auto-reconnection.
  void simulateUnexpectedDisconnection() {
    _connectedRobot = null;
    _updateState(BleConnectionState.disconnected);
  }

  @override
  Future<void> startScan({
    Duration? timeout,
    List<String> namePrefixes = const ['Fabrica-', 'AIR-'],
  }) async {
    _isScanningController.add(true);
  }

  @override
  Future<void> stopScan() async {
    _isScanningController.add(false);
  }

  @override
  Future<void> connect(String deviceId, {Duration timeout = const Duration(seconds: 15)}) async {
    if (failNextConnect) {
      failNextConnect = false;
      throw StateError('Simulated connection failure to $deviceId');
    }
    _connectedRobot = DiscoveredRobot(
      id: deviceId,
      name: 'Fabrica-DevKit',
      rawRssi: -60,
      smoothedRssi: -60.0,
      isPairingMode: true,
      lastSeen: DateTime.now(),
    );
    _updateState(BleConnectionState.connected);
  }

  @override
  Future<void> disconnect() async {
    _connectedRobot = null;
    _updateState(BleConnectionState.disconnected);
  }

  @override
  Future<int> requestMtu(int desiredMtu) async {
    negotiatedMtu = desiredMtu;
    return negotiatedMtu;
  }

  @override
  Future<bool> createBond() async {
    return true;
  }

  @override
  Future<void> removeBond(String deviceId) async {}

  String mockModelNumber = 'Fabrica-DevKit-v1';

  @override
  Future<BleGattInfo> discoverServices() async {
    return BleGattInfo(
      modelNumber: mockModelNumber,
      firmwareRevision: 'v1.13.0',
      manufacturer: 'AIR Robotics',
      hasControlPoint: true,
      hasTelemetryStream: true,
      hasConfiguration: true,
      negotiatedMtu: negotiatedMtu,
    );
  }

  @override
  Future<void> writeControlPoint(Uint8List bytes, {bool withoutResponse = false}) async {
    if (failNextWrite) {
      failNextWrite = false;
      throw StateError('Simulated write failure');
    }
    writtenControlPointPayloads.add(bytes);
    writtenControlPointNoResponse.add(withoutResponse);
    if (_connectedRobot != null) {
      deviceWrittenControlPointPayloads
          .putIfAbsent(_connectedRobot!.id, () => [])
          .add(bytes);
    }
  }

  @override
  Future<Uint8List> readCharacteristic(String characteristicUuid) async {
    return Uint8List.fromList([0x00]);
  }

  @override
  Future<void> writeCharacteristic(
    String characteristicUuid,
    Uint8List bytes, {
    bool withoutResponse = false,
  }) async {
    writtenCharacteristics.putIfAbsent(characteristicUuid, () => []).add(bytes);
  }

  final Map<String, StreamController<Uint8List>> _characteristicStreamControllers = {};

  @override
  Stream<Uint8List> subscribeCharacteristic(String characteristicUuid) {
    final key = characteristicUuid.toLowerCase();
    return _characteristicStreamControllers
        .putIfAbsent(key, () => StreamController<Uint8List>.broadcast())
        .stream;
  }

  @override
  Stream<Uint8List> subscribeTelemetry() =>
      subscribeCharacteristic(BleUuids.charTelemetryStream);

  /// Programmatically emits characteristic notification payload for testing.
  void emitCharacteristicData(String characteristicUuid, Uint8List data) {
    final key = characteristicUuid.toLowerCase();
    _characteristicStreamControllers[key]?.add(data);
  }

  /// Programmatically emits an error on characteristic notification stream for testing.
  void emitCharacteristicError(String characteristicUuid, Object error) {
    final key = characteristicUuid.toLowerCase();
    _characteristicStreamControllers[key]?.addError(error);
  }

  /// Programmatically emits characteristic error for testing.
  void emitTelemetryError(Object error) =>
      emitCharacteristicError(BleUuids.charTelemetryStream, error);

  void _updateState(BleConnectionState newState) {
    _state = newState;
    _connectionStateController.add(newState);
  }

  @override
  void dispose() {
    _scanController.close();
    _isScanningController.close();
    _connectionStateController.close();
    for (final controller in _characteristicStreamControllers.values) {
      controller.close();
    }
    _characteristicStreamControllers.clear();
  }
}
