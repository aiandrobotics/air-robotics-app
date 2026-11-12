import 'package:air_robotics_app/core/ble/ble_providers.dart';
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

    testWidgets('renders Day 1 Fabrica card with specs and upcoming ecosystem',
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
      await tester.pumpAndSettle();

      expect(find.text('ADD NEW ROBOT'), findsOneWidget);
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

    testWidgets('tapping Pair Fabrica navigates to PairRobotScreen',
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
      await tester.pumpAndSettle();

      await tester.tap(find.text('PAIR FABRICA NOW'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('PAIR FABRICA-DEVKIT-V1'), findsOneWidget);
      expect(find.text('PAIRING PROCEDURE'), findsOneWidget);
      expect(find.textContaining('From 2nd Device Onwards: Press and hold Button 1'), findsOneWidget);
    });
  });
}
