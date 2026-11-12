import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/core/fleet/fleet_providers.dart';
import 'package:air_robotics_app/core/fleet/fleet_storage_service.dart';
import 'package:air_robotics_app/screens/add_device_catalog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('AddDeviceCatalogScreen Widget Tests', () {
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

    testWidgets('renders Supported Robots and clean Fabrica card when no robot is discovered',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            bleTransportProvider.overrideWithValue(mockTransport),
            fleetStorageProvider.overrideWithValue(mockFleetStorage),
          ],
          child: MaterialApp(
            home: AddDeviceCatalogScreen(key: UniqueKey()),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('ADD NEW ROBOT'), findsOneWidget);
      expect(find.text('SUPPORTED ROBOTS'), findsOneWidget);
      expect(find.text('FABRICA'), findsOneWidget);
      expect(find.text('Cloths Folding Robot'), findsOneWidget);
      expect(find.textContaining('Press and hold Button 1 for 3 seconds'), findsOneWidget);
      expect(find.text('PAIR FABRICA NOW'), findsOneWidget);

      // Verify removed elements are NOT present
      expect(find.text('DISCOVERED NEARBY'), findsNothing);
      expect(find.text('AUTO DISCOVERED ROBOT'), findsNothing);
      expect(find.text('SUPPORTED ROBOTS (DAY 1)'), findsNothing);
      expect(find.text('READY TO PAIR'), findsNothing);
      expect(find.text('4 Flap Servos'), findsNothing);
      expect(find.text('DevKit v1'), findsNothing);
      expect(find.text('100% Offline'), findsNothing);
      expect(find.text('UPCOMING ROBOTS'), findsNothing);
      expect(find.text('AIR ARM-X1'), findsNothing);
      expect(find.text('AIR ROVER-S'), findsNothing);
    });

    testWidgets('tapping Pair Fabrica Now navigates to PairRobotScreen',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            bleTransportProvider.overrideWithValue(mockTransport),
            fleetStorageProvider.overrideWithValue(mockFleetStorage),
          ],
          child: MaterialApp(
            home: AddDeviceCatalogScreen(key: UniqueKey()),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await tester.tap(find.text('PAIR FABRICA NOW'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('PAIR FABRICA-DEVKIT-V1'), findsOneWidget);
      expect(find.text('FABRICA PAIRING INSTRUCTIONS'), findsOneWidget);
      expect(find.text('Press and hold Button 1 for 3 seconds to enter pairing mode.'), findsOneWidget);
      expect(find.text('The status LED will blink rapidly to confirm pairing mode is active.'), findsOneWidget);
    });

    testWidgets('displays auto discovered robot at top when detected and jumps to pair screen on tap',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            bleTransportProvider.overrideWithValue(mockTransport),
            fleetStorageProvider.overrideWithValue(mockFleetStorage),
          ],
          child: MaterialApp(
            home: AddDeviceCatalogScreen(key: UniqueKey()),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Initially no auto discovered section
      expect(find.text('AUTO DISCOVERED ROBOT'), findsNothing);

      // Emit discovered Fabrica candidate
      mockTransport.emitDiscoveredRobots([
        DiscoveredRobot(
          id: 'fabrica-live-1234',
          name: 'Fabrica-1234',
          rawRssi: -45,
          smoothedRssi: -45.0,
          isPairingMode: true,
          lastSeen: DateTime.now(),
        ),
      ]);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Verified candidate is presented dynamically at the top under AUTO DISCOVERED ROBOT
      expect(find.text('AUTO DISCOVERED ROBOT'), findsOneWidget);
      expect(find.text('1 READY'), findsOneWidget);
      expect(find.text('Fabrica-1234'), findsOneWidget);
      expect(find.text('PAIRING READY'), findsOneWidget);
      expect(find.text('PAIR'), findsOneWidget);

      // Tap on the discovered card / PAIR button to jump to pair screen
      await tester.tap(find.text('PAIR'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      // Verified jumped to PairRobotScreen
      expect(find.text('PAIR FABRICA-DEVKIT-V1'), findsOneWidget);
      expect(find.text('FABRICA PAIRING INSTRUCTIONS'), findsOneWidget);
    });

    testWidgets('renders multiple discovered candidates with non-pairing mode and varying RSSI', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            bleTransportProvider.overrideWithValue(mockTransport),
            fleetStorageProvider.overrideWithValue(mockFleetStorage),
          ],
          child: MaterialApp(
            home: AddDeviceCatalogScreen(key: UniqueKey()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      mockTransport.emitDiscoveredRobots([
        DiscoveredRobot(
          id: 'fab-1',
          name: 'Fabrica-One',
          rawRssi: -72,
          smoothedRssi: -72.0,
          isPairingMode: true,
          lastSeen: DateTime.now(),
        ),
        DiscoveredRobot(
          id: 'fab-2',
          name: 'Fabrica-Two',
          rawRssi: -88,
          smoothedRssi: -88.0,
          isPairingMode: false,
          lastSeen: DateTime.now(),
        ),
      ]);
      await tester.pumpAndSettle();

      expect(find.text('AUTO DISCOVERED ROBOTS'), findsOneWidget);
      expect(find.text('2 READY'), findsOneWidget);
      expect(find.text('Fabrica-One'), findsOneWidget);
      expect(find.text('Fabrica-Two'), findsOneWidget);

      // Tap on card InkWell directly
      await tester.tap(find.text('Fabrica-One'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('PAIR FABRICA-DEVKIT-V1'), findsOneWidget);
    });
  });
}
