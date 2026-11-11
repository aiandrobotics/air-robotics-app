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
      expect(find.text('ADD NEW DEVICE'), findsOneWidget);
      expect(find.text('YOUR DEVICES'), findsOneWidget);
      expect(find.text('No Devices Paired Yet'), findsOneWidget);
      expect(find.text('ADD YOUR FIRST ROBOT'), findsOneWidget);
      expect(find.text('DISCOVERED ROBOTS'), findsOneWidget);
      expect(find.text('AUTO-SCANNING'), findsOneWidget);
    });

    testWidgets('info button opens local hardware permission rationale dialog',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await tester.tap(find.byTooltip('Permission & Privacy Info'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Local Hardware Access'), findsOneWidget);
      expect(find.textContaining('100% Offline'), findsOneWidget);
      expect(find.textContaining('Zero Tracking'), findsOneWidget);

      await tester.tap(find.text('UNDERSTOOD'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Local Hardware Access'), findsNothing);
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

      await tester.tap(find.text('ADD NEW DEVICE'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.text('ADD NEW ROBOT'), findsOneWidget);
      expect(find.text('FABRICA'), findsOneWidget);
      expect(find.text('SUPPORTED ROBOTS (DAY 1)'), findsOneWidget);
    });
  });
}
