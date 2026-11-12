import 'dart:async';
import 'dart:typed_data';

/// Standard GATT UUID constants for AIR Robotics ecosystem.
class BleUuids {
  BleUuids._(); // coverage:ignore-line

  /// Standard Device Information Service
  static const String serviceDis = '180a';
  static const String charModelNumber = '2a24';
  static const String charFirmwareRevision = '2a26';
  static const String charManufacturer = '2a29';

  /// Primary AIR Robotics Service
  static const String serviceAirRobotics =
      '0000fab0-0000-1000-8000-00805f9b34fb';

  /// FAB1: Control Point (Write, Write Without Response)
  static const String charControlPoint =
      '0000fab1-0000-1000-8000-00805f9b34fb';

  /// FAB2: Status & Telemetry Stream (Read, Notify)
  static const String charTelemetryStream =
      '0000fab2-0000-1000-8000-00805f9b34fb';

  /// FAB3: Button Sequence Presets 1-4 (Read, Write, Notify)
  static const String charButtonConfig =
      '0000fab3-0000-1000-8000-00805f9b34fb';
}

/// Connection lifecycle states matching the deterministic state machine.
enum BleConnectionState {
  disconnected,
  scanning,
  connecting,
  connected,
  discovering,
  bonding,
  ready,
  reconnecting,
}

/// Represents a candidate robot discovered over BLE advertising packets.
class DiscoveredRobot {
  final String id;
  final String name;
  final int rawRssi;
  final double smoothedRssi;
  final bool isPairingMode;
  final DateTime lastSeen;

  const DiscoveredRobot({
    required this.id,
    required this.name,
    required this.rawRssi,
    required this.smoothedRssi,
    this.isPairingMode = false,
    required this.lastSeen,
  });

  DiscoveredRobot copyWith({
    String? id,
    String? name,
    int? rawRssi,
    double? smoothedRssi,
    bool? isPairingMode,
    DateTime? lastSeen,
  }) {
    return DiscoveredRobot(
      id: id ?? this.id,
      name: name ?? this.name,
      rawRssi: rawRssi ?? this.rawRssi,
      smoothedRssi: smoothedRssi ?? this.smoothedRssi,
      isPairingMode: isPairingMode ?? this.isPairingMode,
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscoveredRobot &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'DiscoveredRobot(id: $id, name: $name, rssi: ${smoothedRssi.round()}dBm, pairing: $isPairingMode)';
}

/// Discovered GATT topology and device metadata.
class BleGattInfo {
  final String modelNumber;
  final String firmwareRevision;
  final String manufacturer;
  final bool hasControlPoint;
  final bool hasTelemetryStream;
  final bool hasConfiguration;
  final int negotiatedMtu;

  const BleGattInfo({
    required this.modelNumber,
    required this.firmwareRevision,
    required this.manufacturer,
    required this.hasControlPoint,
    required this.hasTelemetryStream,
    required this.hasConfiguration,
    required this.negotiatedMtu,
  });

  bool get isAirRoboticsCompatible =>
      hasControlPoint && hasTelemetryStream && hasConfiguration;

  @override
  String toString() =>
      'BleGattInfo(model: $modelNumber, fw: $firmwareRevision, mfg: $manufacturer, mtu: $negotiatedMtu, compatible: $isAirRoboticsCompatible)';
}

/// Abstract BLE Transport interface allowing seamless swapping between native
/// [FlutterBluePlusTransport] and [MockBleTransport] test doubles.
abstract class BleTransport {
  Stream<List<DiscoveredRobot>> get scanResultsStream;
  Stream<bool> get isScanningStream;
  Stream<BleConnectionState> get connectionStateStream;
  BleConnectionState get currentConnectionState;
  DiscoveredRobot? get connectedRobot;

  Future<void> startScan({
    Duration? timeout,
    List<String> namePrefixes = const ['Fabrica-', 'AIR-'],
  });

  Future<void> stopScan();

  Future<void> connect(String deviceId, {Duration timeout = const Duration(seconds: 15)});

  Future<void> disconnect();

  Future<int> requestMtu(int desiredMtu);

  Future<bool> createBond();

  /// Attempts to remove the operating-system-level bond for [deviceId].
  Future<void> removeBond(String deviceId);

  Future<BleGattInfo> discoverServices();

  Future<void> writeControlPoint(Uint8List bytes, {bool withoutResponse = false});

  Future<Uint8List> readCharacteristic(String characteristicUuid);

  Future<void> writeCharacteristic(
    String characteristicUuid,
    Uint8List bytes, {
    bool withoutResponse = false,
  });

  Stream<Uint8List> subscribeCharacteristic(String characteristicUuid);

  /// Subscribes to the primary FAB2 telemetry notification stream.
  Stream<Uint8List> subscribeTelemetry() =>
      subscribeCharacteristic(BleUuids.charTelemetryStream);

  void dispose();
}
