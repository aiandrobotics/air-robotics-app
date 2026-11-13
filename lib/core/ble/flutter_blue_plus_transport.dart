// coverage:ignore-file
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
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
    Duration? timeout,
    List<String> namePrefixes = const ['Fabrica-', 'AIR-'],
  }) async {
    if (FlutterBluePlus.isScanningNow) {
      return;
    }
    if (_connectionState == BleConnectionState.disconnected) {
      _updateConnectionState(BleConnectionState.scanning);
    }

    await FlutterBluePlus.startScan(
      timeout: timeout,
      androidUsesFineLocation: false,
      continuousUpdates: true,
      removeIfGone: const Duration(seconds: 15),
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
      if (nativeState == BluetoothConnectionState.disconnected &&
          _connectionState != BleConnectionState.disconnected &&
          _connectionState != BleConnectionState.connecting) {
        _characteristicMap.clear();
        _updateConnectionState(BleConnectionState.disconnected);
      }
    });

    _updateConnectionState(BleConnectionState.connecting);

    // Crucial for Android/iOS: BLE scanning must be stopped before initiating GATT connection
    // to avoid GATT_CONNECTION_TIMEOUT (status 147) and status 133 radio collisions.
    if (FlutterBluePlus.isScanningNow) {
      await stopScan();
    }

    try {
      await device.connect(
        timeout: timeout,
        autoConnect: false,
        license: License.nonprofit,
      );
    } catch (e) {
      // On Android, if connection fails due to stale bond teardown or radio contention,
      // allow a short delay for the OS to finalize bond state removal and retry once.
      if (defaultTargetPlatform == TargetPlatform.android) {
        await Future<void>.delayed(const Duration(milliseconds: 600));
        await device.connect(
          timeout: timeout,
          autoConnect: false,
          license: License.nonprofit,
        );
      } else {
        rethrow;
      }
    }

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
    // iOS/macOS handle MTU negotiation automatically via CoreBluetooth.
    // Calling requestMtu on iOS throws FlutterBluePlusException (android-only).
    if (defaultTargetPlatform != TargetPlatform.android) {
      return _activeDevice!.mtuNow;
    }
    return await _activeDevice!.requestMtu(desiredMtu);
  }

  @override
  Future<bool> createBond() async {
    if (_activeDevice == null) return false;
    // iOS and Android natively handle SMP Just Works bonding automatically upon
    // receiving the peripheral's SMP Security Request or when accessing encrypted characteristics.
    // Concurrently invoking native device.createBond() while the peripheral is initiating SMP
    // causes the mobile OS to display duplicate system pairing popups.
    return true;
  }

  @override
  Future<void> removeBond(String deviceId) async {
    // iOS does not allow programmatically removing bonds; users must 'Forget This Device' in iOS Settings.
    if (defaultTargetPlatform != TargetPlatform.android) return;
    try {
      final device = BluetoothDevice.fromId(deviceId);
      await device.removeBond();
    } catch (_) {}
  }

  @override
  Future<BleGattInfo> discoverServices() async {
    if (_activeDevice == null) {
      throw StateError('Cannot discover services: no active device');
    }

    _updateConnectionState(BleConnectionState.discovering);
    List<BluetoothService> services;
    try {
      services = await _activeDevice!.discoverServices();
    } catch (_) {
      // If service discovery collided with Android connection parameter update or MTU negotiation,
      // pause briefly and retry once
      await Future<void>.delayed(const Duration(milliseconds: 400));
      services = await _activeDevice!.discoverServices();
    }

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
      return const Stream<Uint8List>.empty();
    }

    char.setNotifyValue(true);
    return char.onValueReceived.map((list) => Uint8List.fromList(list));
  }

  @override
  Stream<Uint8List> subscribeTelemetry() =>
      subscribeCharacteristic(BleUuids.charTelemetryStream);

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
