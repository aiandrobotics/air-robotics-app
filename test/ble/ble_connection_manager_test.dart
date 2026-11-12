import 'package:air_robotics_app/core/ble/ble_connection_manager.dart';
import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    test('reconnect attempts exceeding maxReconnectAttempts sets disconnected', () async {
      final zeroRetryManager = BleConnectionManager(
        transport: transport,
        maxReconnectAttempts: 0,
      );
      addTearDown(zeroRetryManager.dispose);

      final robot = DiscoveredRobot(
        id: 'dev_test_limit',
        name: 'Fabrica-Test',
        rawRssi: -50,
        smoothedRssi: -50.0,
        isPairingMode: false,
        lastSeen: DateTime.now(),
      );

      await zeroRetryManager.connect(robot);
      transport.simulateUnexpectedDisconnection();
      await pumpEventQueue();

      expect(zeroRetryManager.currentState, equals(BleConnectionState.disconnected));
    });

    test('connect error schedules auto-reconnect', () async {
      transport.failNextConnect = true;
      final robot = DiscoveredRobot(
        id: 'dev_fail',
        name: 'Fabrica-Fail',
        rawRssi: -50,
        smoothedRssi: -50.0,
        isPairingMode: false,
        lastSeen: DateTime.now(),
      );

      await expectLater(manager.connect(robot), throwsA(isA<StateError>()));
      await pumpEventQueue();
      expect(manager.currentState, equals(BleConnectionState.reconnecting));
    });

    test('SelectedRobotNotifier and ViewingDeviceNotifier state transitions', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final selectedNotifier = container.read(selectedRobotProvider.notifier);
      expect(container.read(selectedRobotProvider), isNull);

      final robot = DiscoveredRobot(
        id: 'sel_1',
        name: 'Fabrica-Sel',
        rawRssi: -60,
        smoothedRssi: -60.0,
        isPairingMode: true,
        lastSeen: DateTime.now(),
      );

      selectedNotifier.select(robot);
      expect(container.read(selectedRobotProvider)?.id, equals('sel_1'));

      selectedNotifier.select(null);
      expect(container.read(selectedRobotProvider), isNull);

      final viewingNotifier = container.read(isViewingDeviceProvider.notifier);
      expect(container.read(isViewingDeviceProvider), isFalse);

      viewingNotifier.openDevice();
      expect(container.read(isViewingDeviceProvider), isTrue);

      viewingNotifier.closeDevice();
      expect(container.read(isViewingDeviceProvider), isFalse);
    });

    test('auto-reconnect timer triggers connect on target robot and handles manualDisconnect', () {
      fakeAsync((async) {
        final robot = DiscoveredRobot(
          id: 'dev_retry',
          name: 'Fabrica-Retry',
          rawRssi: -50,
          smoothedRssi: -50.0,
          isPairingMode: false,
          lastSeen: DateTime.now(),
        );

        // 1. connect fails with manualDisconnect=true during flight -> line 97 hit
        transport.failNextConnect = true;
        final connectFuture = manager.connect(robot);
        manager.disconnect(); // sets _manualDisconnect = true while connect is in flight
        expect(connectFuture, throwsStateError);
        async.flushMicrotasks();
        expect(manager.currentState, BleConnectionState.disconnected);

        // 2. test reconnect timer executing connect -> lines 153 & 155 hit
        manager.resetManualDisconnect();
        transport.failNextConnect = true;
        expect(() => manager.connect(robot), throwsStateError);
        async.flushMicrotasks();
        expect(manager.currentState, BleConnectionState.reconnecting);

        transport.failNextConnect = false;
        async.elapse(const Duration(milliseconds: 1500));
        async.flushMicrotasks();
        expect(manager.currentState, BleConnectionState.ready);

        // 3. test reconnect timer with manualDisconnect cancelled midway -> line 153 early return
        transport.simulateUnexpectedDisconnection();
        async.flushMicrotasks();
        manager.disconnect(); // sets manual disconnect while timer is pending
        async.elapse(const Duration(milliseconds: 1500));
      });
    });
  });
}
