import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'ble_transport_interface.dart';

/// Production native BLE Transport powered by industrial [FlutterBluePlus] bindings.
class FlutterBluePlusTransport implements BleTransport {
  BluetoothDevice? _activeDevice;
  DiscoveredRobot? _connectedRobot;
  BleConnectionState _connectionState = BleConnectionState.disconnected;

  final StreamController<List<DiscoveredRobot>> _scanController =
      StreamController<List<DiscoveredRobot>>.broadcast();
  final StreamController<BleConnectionState> _connectionStateController =
      StreamController<BleConnectionState>.broadcast();

  final Map<String, BluetoothCharacteristic> _characteristicMap = {};
  StreamSubscription<List<ScanResult>>? _scanSub;
  StreamSubscription<BluetoothConnectionState>? _deviceStateSub;

  FlutterBluePlusTransport() {
    _scanSub = FlutterBluePlus.scanResults.listen(_onNativeScanResults);
  }

  @override
  Stream<List<DiscoveredRobot>> get scanResultsStream => _scanController.stream;

  @override
  Stream<bool> get isScanningStream => FlutterBluePlus.isScanning;

  @override
  Stream<BleConnectionState> get connectionStateStream =>
      _connectionStateController.stream;

  @override
  BleConnectionState get currentConnectionState => _connectionState;

  @override
  DiscoveredRobot? get connectedRobot => _connectedRobot;

  @override
  Future<void> startScan({
    Duration timeout = const Duration(seconds: 15),
    List<String> namePrefixes = const ['Fabrica-', 'AIR-'],
  }) async {
    _updateConnectionState(BleConnectionState.scanning);

    await FlutterBluePlus.startScan(
      timeout: timeout,
      androidUsesFineLocation: false,
    );
  }

  @override
  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
    if (_connectionState == BleConnectionState.scanning) {
      _updateConnectionState(BleConnectionState.disconnected);
    }
  }

  @override
  Future<void> connect(String deviceId, {Duration timeout = const Duration(seconds: 15)}) async {
    final device = BluetoothDevice.fromId(deviceId);
    _activeDevice = device;

    _deviceStateSub?.cancel();
    _deviceStateSub = device.connectionState.listen((nativeState) {
      if (nativeState == BluetoothConnectionState.disconnected) {
        _characteristicMap.clear();
        _updateConnectionState(BleConnectionState.disconnected);
      }
    });

    _updateConnectionState(BleConnectionState.connecting);

    await device.connect(
      timeout: timeout,
      autoConnect: false,
      license: License.nonprofit,
    );

    _updateConnectionState(BleConnectionState.connected);
  }

  @override
  Future<void> disconnect() async {
    _characteristicMap.clear();
    if (_activeDevice != null) {
      await _activeDevice!.disconnect();
      _activeDevice = null;
    }
    _connectedRobot = null;
    _updateConnectionState(BleConnectionState.disconnected);
  }

  @override
  Future<int> requestMtu(int desiredMtu) async {
    if (_activeDevice == null) {
      throw StateError('Cannot request MTU without active BLE connection');
    }
    return await _activeDevice!.requestMtu(desiredMtu);
  }

  @override
  Future<bool> createBond() async {
    if (_activeDevice == null) return false;
    try {
      await _activeDevice!.createBond();
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<BleGattInfo> discoverServices() async {
    if (_activeDevice == null) {
      throw StateError('Cannot discover services: no active device');
    }

    _updateConnectionState(BleConnectionState.discovering);
    final services = await _activeDevice!.discoverServices();

    _characteristicMap.clear();

    String modelNumber = '';
    String firmwareRevision = '';
    String manufacturer = '';

    for (final service in services) {
      final sUuid = service.uuid.str128.toLowerCase();

      // DIS (0x180A)
      if (sUuid.contains('180a')) {
        for (final c in service.characteristics) {
          final cUuid = c.uuid.str128.toLowerCase();
          try {
            if (cUuid.contains('2a24')) {
              final val = await c.read();
              modelNumber = utf8.decode(val, allowMalformed: true).trim();
            } else if (cUuid.contains('2a26')) {
              final val = await c.read();
              firmwareRevision = utf8.decode(val, allowMalformed: true).trim();
            } else if (cUuid.contains('2a29')) {
              final val = await c.read();
              manufacturer = utf8.decode(val, allowMalformed: true).trim();
            }
          } catch (_) {}
        }
      }

      // AIR Robotics Primary Service (FAB0)
      if (sUuid.contains('fab0')) {
        for (final c in service.characteristics) {
          final cUuid = c.uuid.str128.toLowerCase();
          if (cUuid.contains('fab1')) {
            _characteristicMap[BleUuids.charControlPoint] = c;
          } else if (cUuid.contains('fab2')) {
            _characteristicMap[BleUuids.charTelemetryStream] = c;
          } else if (cUuid.contains('fab3')) {
            _characteristicMap[BleUuids.charButtonConfig] = c;
          }
        }
      }
    }

    final hasControl = _characteristicMap.containsKey(BleUuids.charControlPoint);
    final hasTelem = _characteristicMap.containsKey(BleUuids.charTelemetryStream);
    final hasConfig = _characteristicMap.containsKey(BleUuids.charButtonConfig);

    return BleGattInfo(
      modelNumber: modelNumber.isNotEmpty ? modelNumber : 'Unknown',
      firmwareRevision: firmwareRevision.isNotEmpty ? firmwareRevision : 'v1.0.0',
      manufacturer: manufacturer.isNotEmpty ? manufacturer : 'AIR Robotics',
      hasControlPoint: hasControl,
      hasTelemetryStream: hasTelem,
      hasConfiguration: hasConfig,
      negotiatedMtu: _activeDevice!.mtuNow,
    );
  }

  @override
  Future<void> writeControlPoint(Uint8List bytes, {bool withoutResponse = false}) async {
    final char = _characteristicMap[BleUuids.charControlPoint];
    if (char == null) {
      throw StateError('Control Point (FAB1) characteristic not bound');
    }
    await char.write(bytes, withoutResponse: withoutResponse);
  }

  @override
  Future<Uint8List> readCharacteristic(String characteristicUuid) async {
    final char = _characteristicMap[characteristicUuid.toLowerCase()];
    if (char == null) {
      throw StateError('Characteristic $characteristicUuid not bound');
    }
    final result = await char.read();
    return Uint8List.fromList(result);
  }

  @override
  Future<void> writeCharacteristic(
    String characteristicUuid,
    Uint8List bytes, {
    bool withoutResponse = false,
  }) async {
    final char = _characteristicMap[characteristicUuid.toLowerCase()];
    if (char == null) {
      throw StateError('Characteristic $characteristicUuid not bound');
    }
    await char.write(bytes, withoutResponse: withoutResponse);
  }

  @override
  Stream<Uint8List> subscribeCharacteristic(String characteristicUuid) {
    final char = _characteristicMap[characteristicUuid.toLowerCase()];
    if (char == null) {
      throw StateError('Characteristic $characteristicUuid not bound');
    }

    char.setNotifyValue(true);
    return char.onValueReceived.map((list) => Uint8List.fromList(list));
  }

  void _onNativeScanResults(List<ScanResult> results) {
    final now = DateTime.now();
    final list = <DiscoveredRobot>[];

    for (final r in results) {
      final name = r.advertisementData.advName.isNotEmpty
          ? r.advertisementData.advName
          : r.device.platformName;

      // Detect pairing mode from advertised flags or name prefix
      final isPairing = name.startsWith('Fabrica-');

      list.add(DiscoveredRobot(
        id: r.device.remoteId.str,
        name: name,
        rawRssi: r.rssi,
        smoothedRssi: r.rssi.toDouble(),
        isPairingMode: isPairing,
        lastSeen: now,
      ));
    }

    _scanController.add(list);
  }

  void _updateConnectionState(BleConnectionState state) {
    _connectionState = state;
    _connectionStateController.add(state);
  }

  @override
  void dispose() {
    _scanSub?.cancel();
    _deviceStateSub?.cancel();
    _scanController.close();
    _connectionStateController.close();
  }
}
