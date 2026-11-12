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
        child: const MaterialApp(
          home: LandingDashboardScreen(),
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
      expect(find.text('YOUR DEVICES'), findsOneWidget);
      expect(find.text('No Devices Paired Yet'), findsOneWidget);
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

      // Now emit scan result matching this robot ID
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
      expect(find.textContaining('-58 dBm'), findsOneWidget);
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
      expect(find.text('PAIRING'), findsOneWidget);
      expect(find.text('CONNECT'), findsOneWidget);

      // Tap CONNECT
      await tester.tap(find.text('CONNECT'));
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
      expect(find.text('Factory Reset (0x1F)'), findsOneWidget);
      expect(find.text('Unpair'), findsOneWidget);

      // Test Rename
      await tester.tap(find.text('Rename'));
      await tester.pumpAndSettle();
      expect(find.text('Rename Robot'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'Bedroom Folder');
      await tester.tap(find.text('SAVE'));
      await tester.pumpAndSettle();
      expect(find.text('Bedroom Folder'), findsOneWidget);

      // Test Factory Reset (0x1F)
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Factory Reset (0x1F)'));
      await tester.pumpAndSettle();

      expect(find.text('Full Hardware Factory Reset?'), findsOneWidget);
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Factory Reset (0x1F)'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('RESET EVERYTHING (0x1F)'));
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pumpAndSettle();

      // Verify opcode 0x1F was sent
      expect(mockTransport.writtenControlPointPayloads.any((p) => p.isNotEmpty && p.first == 0x1F), isTrue);

      // Test Unpair on newly added robot
      final robot2 = RegisteredRobot(
        id: 'robot-reg-2',
        name: 'Fabrica-Kitchen',
        modelNumber: 'Fabrica-DevKit-v1',
        pairedAt: DateTime.now(),
      );
      await mockFleetStorage.saveRobot(robot2);
      await tester.pumpWidget(createTestApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      final popupIcons = find.byIcon(Icons.more_vert);
      await tester.tap(popupIcons.first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      await tester.tap(find.text('Unpair'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.text('CANCEL'), findsOneWidget);
      await tester.tap(find.text('CANCEL'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      await tester.tap(popupIcons.first);
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
