import 'package:air_robotics_app/core/ble/ble_connection_manager.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('BleConnectionManager Lifecycle & Reconnection', () {
    late MockBleTransport transport;
    late BleConnectionManager manager;

    setUp(() {
      transport = MockBleTransport();
      manager = BleConnectionManager(
        transport: transport,
        maxReconnectAttempts: 3,
        maxBackoffInterval: const Duration(seconds: 30),
      );
    });

    tearDown(() {
      manager.dispose();
      transport.dispose();
    });

    test('progresses through deterministic lifecycle to ready', () async {
      final states = <BleConnectionState>[];
      manager.stateStream.listen(states.add);

      final robot = DiscoveredRobot(
        id: 'dev_fabrica_1',
        name: 'Fabrica-DevKit',
        rawRssi: -55,
        smoothedRssi: -55.0,
        isPairingMode: true,
        lastSeen: DateTime.now(),
      );

      await manager.connect(robot);
      await pumpEventQueue();

      expect(manager.currentState, equals(BleConnectionState.ready));
      expect(manager.gattInfo?.negotiatedMtu, equals(517));
      expect(manager.gattInfo?.isAirRoboticsCompatible, isTrue);

      // Verifies state sequence
      expect(
        states,
        containsAllInOrder([
          BleConnectionState.connecting,
          BleConnectionState.connected,
          BleConnectionState.bonding,
          BleConnectionState.discovering,
          BleConnectionState.ready,
        ]),
      );
    });

    test('calculates exponential backoff intervals clamped to max', () {
      expect(manager.calculateBackoffInterval(0), equals(const Duration(seconds: 1)));
      expect(manager.calculateBackoffInterval(1), equals(const Duration(seconds: 2)));
      expect(manager.calculateBackoffInterval(2), equals(const Duration(seconds: 4)));
      expect(manager.calculateBackoffInterval(3), equals(const Duration(seconds: 8)));
      expect(manager.calculateBackoffInterval(4), equals(const Duration(seconds: 16)));
      // Clamped to 30s max
      expect(manager.calculateBackoffInterval(5), equals(const Duration(seconds: 30)));
      expect(manager.calculateBackoffInterval(6), equals(const Duration(seconds: 30)));
    });

    test('transitions to reconnecting state upon unexpected radio drop', () async {
      final robot = DiscoveredRobot(
        id: 'dev_fabrica_1',
        name: 'Fabrica-DevKit',
        rawRssi: -55,
        smoothedRssi: -55.0,
        isPairingMode: true,
        lastSeen: DateTime.now(),
      );

      await manager.connect(robot);
      expect(manager.currentState, equals(BleConnectionState.ready));

      // Trigger unexpected drop
      transport.simulateUnexpectedDisconnection();
      await pumpEventQueue();

      // State machine should immediately enter reconnecting
      expect(manager.currentState, equals(BleConnectionState.reconnecting));
    });

    test('manual disconnect cleanly enters disconnected without auto-reconnect', () async {
      final robot = DiscoveredRobot(
        id: 'dev_fabrica_1',
        name: 'Fabrica-DevKit',
        rawRssi: -55,
        smoothedRssi: -55.0,
        isPairingMode: true,
        lastSeen: DateTime.now(),
      );

      await manager.connect(robot);
      await manager.disconnect();

      expect(manager.currentState, equals(BleConnectionState.disconnected));
      expect(manager.connectedRobot, isNull);
    });
  });
}
