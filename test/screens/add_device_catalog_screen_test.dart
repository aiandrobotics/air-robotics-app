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

    testWidgets('renders Discovered Nearby at top, Day 1 Fabrica card with specs, and upcoming ecosystem',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            bleTransportProvider.overrideWithValue(mockTransport),
            fleetStorageProvider.overrideWithValue(mockFleetStorage),
          ],
          child: const MaterialApp(
            home: AddDeviceCatalogScreen(),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('ADD NEW ROBOT'), findsOneWidget);
      expect(find.text('DISCOVERED NEARBY'), findsOneWidget);
      expect(find.text('Auto-scanning for nearby robots...'), findsOneWidget);
      expect(find.text('SUPPORTED ROBOTS (DAY 1)'), findsOneWidget);
      expect(find.text('FABRICA'), findsOneWidget);
      expect(find.text('READY TO PAIR'), findsOneWidget);
      expect(find.text('4 Flap Servos'), findsOneWidget);
      expect(find.text('PAIR FABRICA NOW'), findsOneWidget);

      // Future ecosystem cards
      expect(find.text('UPCOMING ECOSYSTEM'), findsOneWidget);
      expect(find.text('AIR ARM-X1'), findsOneWidget);
      expect(find.text('AIR ROVER-S'), findsOneWidget);
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
          child: const MaterialApp(
            home: AddDeviceCatalogScreen(),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await tester.tap(find.text('PAIR FABRICA NOW'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('PAIR FABRICA-DEVKIT-V1'), findsOneWidget);
      expect(find.text('PAIRING PROCEDURE'), findsOneWidget);
      expect(find.textContaining('From 2nd Device Onwards: Press and hold Button 1'), findsOneWidget);
    });

    testWidgets('displays discovered robots at top and enables 1-tap direct pairing',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            bleTransportProvider.overrideWithValue(mockTransport),
            fleetStorageProvider.overrideWithValue(mockFleetStorage),
          ],
          child: const MaterialApp(
            home: AddDeviceCatalogScreen(),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

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

      // Verified candidate is presented at the top under Discovered Nearby
      expect(find.text('DISCOVERED NEARBY'), findsOneWidget);
      expect(find.text('Fabrica-1234'), findsOneWidget);
      expect(find.text('PAIRING READY'), findsOneWidget);
      expect(find.text('PAIR & CONNECT'), findsOneWidget);

      // Verified Fabrica card below also acknowledges the detected hardware
      expect(find.text('READY TO PAIR (Fabrica-1234)'), findsOneWidget);
      expect(find.text('PAIR FABRICA-1234 (1-TAP)'), findsOneWidget);
      expect(find.text('STEP-BY-STEP PAIRING GUIDE'), findsOneWidget);

      // Tap 1-tap Pair & Connect at the top
      await tester.tap(find.text('PAIR & CONNECT'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Verifies connection and registration without navigating to intermediate screen!
      expect(mockTransport.currentConnectionState, BleConnectionState.connected);
      final registered = await mockFleetStorage.getRegisteredRobots();
      expect(registered.any((r) => r.id == 'fabrica-live-1234'), isTrue);
    });
  });
}
