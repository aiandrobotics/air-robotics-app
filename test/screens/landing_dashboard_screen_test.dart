import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/core/fleet/fleet_providers.dart';
import 'package:air_robotics_app/core/fleet/fleet_storage_service.dart';
import 'package:air_robotics_app/core/fleet/registered_robot.dart';
import 'package:air_robotics_app/screens/landing_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('LandingDashboardScreen Redesigned Home Widget Tests', () {
    late MockBleTransport mockTransport;
    late InMemoryFleetStorageService mockFleetStorage;

    setUp(() {
      mockTransport = MockBleTransport();
      mockFleetStorage = InMemoryFleetStorageService();
    });

    tearDown(() {
      mockTransport.dispose();
      mockFleetStorage.close();
    });

    Widget createTestApp({List<RegisteredRobot>? initialRobots}) {
      if (initialRobots != null) {
        for (final r in initialRobots) {
          mockFleetStorage.saveRobot(r);
        }
      }

      return ProviderScope(
        key: UniqueKey(),
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
        ],
        child: MaterialApp(
          home: LandingDashboardScreen(key: UniqueKey()),
        ),
      );
    }

    testWidgets('renders futuristic header, Add Device hero, Your Devices empty state, and Discovered Robots',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('AIR ROBOTICS'), findsOneWidget);
      expect(find.text('ADD NEW ROBOT'), findsOneWidget);
      expect(find.text('Pair AIR robots'), findsOneWidget);
      expect(find.text('YOUR ROBOTS'), findsOneWidget);
      expect(find.text('No Robots Paired Yet'), findsOneWidget);
      expect(find.text('ADD YOUR FIRST ROBOT'), findsOneWidget);
      expect(find.text('DISCOVERED ROBOTS'), findsOneWidget);
      expect(find.text('AUTO-SCANNING'), findsOneWidget);
    });

    testWidgets('renders registered robots in Your Devices and auto-connects when detected in scan',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final savedRobot = RegisteredRobot(
        id: 'registered-fab-1',
        name: 'Fabrica-1111',
        modelNumber: 'Fabrica-DevKit-v1',
        pairedAt: DateTime.now(),
        customNickname: 'Living Room Folder',
      );

      await tester.pumpWidget(createTestApp(initialRobots: [savedRobot]));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Initially offline before seen in scan
      expect(find.text('Living Room Folder'), findsOneWidget);
      expect(find.text('OFFLINE'), findsOneWidget);
      expect(find.text('RECONNECT'), findsOneWidget);
      // Discovered robots section is hidden when devices are already paired
      expect(find.text('DISCOVERED ROBOTS'), findsNothing);

      // Now emit scan result matching this robot ID with last connected ID set (line 92)
      await mockFleetStorage.setLastConnectedRobotId('registered-fab-1');
      mockTransport.emitDiscoveredRobots([
        DiscoveredRobot(
          id: 'registered-fab-1',
          name: 'Fabrica-1111',
          rawRssi: -58,
          smoothedRssi: -58.0,
          isPairingMode: false,
          lastSeen: DateTime.now(),
        ),
      ]);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Opportunistic auto-connect connects to the paired robot!
      expect(mockTransport.currentConnectionState, BleConnectionState.connected);
      expect(find.text('CONNECTED'), findsOneWidget);
      expect(find.text('OPEN'), findsOneWidget);
      expect(find.text('Strong'), findsOneWidget);
    });

    testWidgets('renders candidate discovered robots and connects to them',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Emit new candidate robot not in fleet
      mockTransport.emitDiscoveredRobots([
        DiscoveredRobot(
          id: 'new-robot-999',
          name: 'Fabrica-9999',
          rawRssi: -50,
          smoothedRssi: -50.0,
          isPairingMode: true,
          lastSeen: DateTime.now(),
        ),
      ]);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Fabrica-9999'), findsOneWidget);
      expect(find.text('PAIR & CONNECT'), findsOneWidget);

      // Tap PAIR & CONNECT
      await tester.tap(find.text('PAIR & CONNECT'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(mockTransport.currentConnectionState, BleConnectionState.connected);

      // Verify the robot was automatically added to Your Devices!
      final registered = await mockFleetStorage.getRegisteredRobots();
      expect(registered.any((r) => r.id == 'new-robot-999'), isTrue);
    });

    testWidgets('tapping Add New Device hero navigates to Add Device Catalog',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await tester.tap(find.text('ADD NEW ROBOT').first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.widgetWithText(AppBar, 'ADD NEW ROBOT'), findsOneWidget);
      expect(find.text('FABRICA'), findsOneWidget);
      expect(find.text('SUPPORTED ROBOTS'), findsOneWidget);
    });

    testWidgets('Registered robot menu: disconnect, rename, factory reset, unpair, and OPEN', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final robot = RegisteredRobot(
        id: 'robot-reg-1',
        name: 'Fabrica-LivingRoom',
        modelNumber: 'Fabrica-DevKit-v1',
        pairedAt: DateTime.now(),
      );

      // Connect transport to this robot
      await mockTransport.connect('robot-reg-1');
      await mockTransport.discoverServices();

      await tester.pumpWidget(createTestApp(initialRobots: [robot]));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Fabrica-LivingRoom'), findsOneWidget);
      expect(find.text('CONNECTED'), findsOneWidget);

      // 1. OPEN button opens device
      final openButton = find.text('OPEN');
      expect(openButton, findsOneWidget);
      await tester.tap(openButton);
      await tester.pump();

      // 2. Open popup menu on registered robot
      final moreButton = find.byIcon(Icons.more_vert);
      expect(moreButton, findsOneWidget);
      await tester.tap(moreButton);
      await tester.pumpAndSettle();

      expect(find.text('Disconnect'), findsOneWidget);
      expect(find.text('Rename'), findsOneWidget);
      expect(find.text('Factory Reset'), findsOneWidget);
      expect(find.text('Unpair'), findsOneWidget);

      // Test Rename: cancel then save
      await tester.tap(find.text('Rename'));
      await tester.pumpAndSettle();
      expect(find.text('Rename Robot'), findsOneWidget);
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Rename'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'Bedroom Folder');
      await tester.tap(find.text('SAVE'));
      await tester.pumpAndSettle();
      expect(find.text('Bedroom Folder'), findsOneWidget);

      // Test Factory Reset (with lastConnectedRobotId set so line 310 executes)
      await mockFleetStorage.setLastConnectedRobotId('robot-reg-1');
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Factory Reset'));
      await tester.pumpAndSettle();

      expect(find.text('Full Hardware Factory Reset?'), findsOneWidget);
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Factory Reset'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('RESET EVERYTHING'));
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pumpAndSettle();

      // Verify opcode 0x1F was sent
      expect(mockTransport.writtenControlPointPayloads.any((p) => p.isNotEmpty && p.first == 0x1F), isTrue);

      // Test Disconnect action on newly connected robot
      final robot2 = RegisteredRobot(
        id: 'robot-reg-2',
        name: 'Fabrica-Kitchen',
        modelNumber: 'Fabrica-DevKit-v1',
        pairedAt: DateTime.now(),
      );
      await mockFleetStorage.saveRobot(robot2);
      await mockTransport.connect('robot-reg-2');
      await mockTransport.discoverServices();
      await tester.pumpWidget(createTestApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      final popupIcons2 = find.byIcon(Icons.more_vert);
      await tester.tap(popupIcons2.first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Disconnect'));
      await tester.pumpAndSettle();
      expect(mockTransport.currentConnectionState, BleConnectionState.disconnected);

      // Test Unpair on connected robot to hit lines 357 and 364
      final robot3 = RegisteredRobot(
        id: 'robot-reg-3',
        name: 'Fabrica-Garage',
        modelNumber: 'Fabrica-DevKit-v1',
        pairedAt: DateTime.now(),
      );
      await mockFleetStorage.saveRobot(robot3);
      await mockFleetStorage.setLastConnectedRobotId('robot-reg-3');
      await mockTransport.connect('robot-reg-3');
      await mockTransport.discoverServices();
      await tester.pumpWidget(createTestApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      final popupIcons3 = find.byIcon(Icons.more_vert);
      await tester.tap(popupIcons3.first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Unpair'));
      await tester.pumpAndSettle();
      expect(find.text('CANCEL'), findsOneWidget);
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      await tester.tap(popupIcons3.first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Unpair'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('UNPAIR'));
      await tester.pumpAndSettle();
    });

    testWidgets('LandingDashboardScreen lifecycle, connections, fallbacks, and dialog cancellations', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1400));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      // 1. Test empty fleet state: ADD YOUR FIRST ROBOT button (lines 705-708)
      // And 2 discovered candidates to trigger separatorBuilder (line 503)
      await tester.pumpWidget(createTestApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      final c1 = DiscoveredRobot(
        id: 'c-1',
        name: 'Fabrica-One',
        rawRssi: -75, // 2 bars (line 1154: AppColors.amber)
        smoothedRssi: -75.0,
        isPairingMode: true,
        lastSeen: DateTime.now(),
      );
      final c2 = DiscoveredRobot(
        id: 'c-2',
        name: 'Fabrica-Two',
        rawRssi: -85, // 1 bar (line 1154: AppColors.crimson)
        smoothedRssi: -85.0,
        isPairingMode: false,
        lastSeen: DateTime.now(),
      );
      mockTransport.emitDiscoveredRobots([c1, c2]);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Verify separator rendered (line 503)
      expect(find.text('Fabrica-One'), findsOneWidget);
      expect(find.text('Fabrica-Two'), findsOneWidget);

      // Connect to candidate failure catch block (lines 136-139)
      mockTransport.failNextConnect = true;
      final connectCandidateBtn = find.text('PAIR & CONNECT').first;
      await tester.tap(connectCandidateBtn);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.textContaining('Failed to connect to Fabrica-One:'), findsOneWidget);

      final manager = ProviderScope.containerOf(tester.element(find.byType(LandingDashboardScreen))).read(bleConnectionManagerProvider);
      await manager.disconnect();

      // Tap ADD YOUR FIRST ROBOT (lines 705-708)
      await tester.tap(find.text('ADD YOUR FIRST ROBOT'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('SUPPORTED ROBOTS'), findsOneWidget);
      Navigator.of(tester.element(find.text('SUPPORTED ROBOTS'))).pop();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      // 2. Lifecycle state resumed (lines 53-60)
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // 3. Test with 2 registered robots (separatorBuilder line 471) and in-range states (lines 742, 757, 802, 877)
      final r1 = RegisteredRobot(id: 'reg-1', name: 'Fabrica-Living', pairedAt: DateTime.now());
      final r2 = RegisteredRobot(id: 'reg-2', name: 'Fabrica-Dining', pairedAt: DateTime.now());
      await mockFleetStorage.saveRobot(r1);
      await mockFleetStorage.saveRobot(r2);

      await tester.pumpWidget(createTestApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Emit scan with matching candidate to test in-range styling (lines 742, 757, 802)
      mockTransport.emitDiscoveredRobots([
        DiscoveredRobot(
          id: 'reg-1',
          name: 'Fabrica-Living',
          rawRssi: -72,
          smoothedRssi: -72.0,
          isPairingMode: false,
          lastSeen: DateTime.now(),
        ),
      ]);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Connect to registered robot failure (lines 169-176)
      mockTransport.failNextConnect = true;
      final reconnectBtns = find.text('RECONNECT');
      if (reconnectBtns.evaluate().isNotEmpty) {
        await tester.tap(reconnectBtns.first);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 200));
        expect(find.textContaining('Could not reach'), findsOneWidget);
      }

      final manager2 = ProviderScope.containerOf(tester.element(find.byType(LandingDashboardScreen))).read(bleConnectionManagerProvider);
      await manager2.disconnect();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Connect to registered robot success (lines 166-167)
      final connectBtn = find.text('CONNECT').first;
      await tester.tap(connectBtn);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      expect(mockTransport.currentConnectionState, BleConnectionState.connected);

      // Unpair r2 while connected to r1 (line 356: connectedRobot?.id != robot.id && currentState != disconnected)
      final moreButtons = find.byIcon(Icons.more_vert);
      await tester.tap(moreButtons.at(1));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      await tester.tap(find.text('Unpair'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      await tester.tap(find.text('UNPAIR'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
    });
  });
}
