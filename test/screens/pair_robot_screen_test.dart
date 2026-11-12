import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/core/fleet/fleet_providers.dart';
import 'package:air_robotics_app/core/fleet/fleet_storage_service.dart';
import 'package:air_robotics_app/screens/pair_robot_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('PairRobotScreen Widget Tests', () {
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

    testWidgets('renders pairing steps and discovers matching Fabrica candidate',
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
            home: PairRobotScreen(
              targetModel: 'Fabrica-DevKit-v1',
              namePrefix: 'Fabrica-',
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('PAIR FABRICA-DEVKIT-V1'), findsOneWidget);
      expect(find.text('FABRICA PAIRING INSTRUCTIONS'), findsOneWidget);
      expect(find.textContaining('Power on your Fabrica robot'), findsOneWidget);
      expect(find.textContaining('Press and hold Button 1 for 3 seconds to enter pairing mode'), findsOneWidget);
      expect(find.textContaining('status LED will blink rapidly to confirm pairing mode is active'), findsOneWidget);
      expect(find.text('DISCOVERED CANDIDATES'), findsOneWidget);
      expect(find.textContaining('Searching for Fabrica-DevKit-v1'), findsOneWidget);

      // Emit discovered candidate
      mockTransport.emitDiscoveredRobots([
        DiscoveredRobot(
          id: 'fab-dev-1234',
          name: 'Fabrica-1234',
          rawRssi: -48,
          smoothedRssi: -48.0,
          isPairingMode: true,
          lastSeen: DateTime.now(),
        ),
      ]);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Fabrica-1234'), findsOneWidget);
      expect(find.text('PAIRING READY'), findsOneWidget);
      expect(find.text('PAIR & CONNECT'), findsOneWidget);

      // Tap Pair & Connect
      await tester.tap(find.text('PAIR & CONNECT'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(mockTransport.currentConnectionState, BleConnectionState.connected);

      // Verify saved in fleet
      final fleet = await mockFleetStorage.getRegisteredRobots();
      expect(fleet.length, 1);
      expect(fleet.first.id, 'fab-dev-1234');
      expect(fleet.first.name, 'Fabrica-1234');
      expect(fleet.first.modelNumber, 'Fabrica-DevKit-v1');
    });

    testWidgets('renders generic instructions and handles scan toggle and connection failure', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            bleTransportProvider.overrideWithValue(mockTransport),
            fleetStorageProvider.overrideWithValue(mockFleetStorage),
          ],
          child: const MaterialApp(
            home: PairRobotScreen(
              targetModel: 'AIR-Generic-v1',
              namePrefix: 'AIR-',
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('PAIRING PROCEDURE'), findsOneWidget);
      expect(find.textContaining('Ensure Bluetooth pairing mode is active'), findsOneWidget);

      // Tap scan action icon
      final scanAction = find.byTooltip('Stop Scan');
      if (scanAction.evaluate().isNotEmpty) {
        await tester.tap(scanAction);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 200));
      }
      final rescanAction = find.byTooltip('Rescan');
      if (rescanAction.evaluate().isNotEmpty) {
        await tester.tap(rescanAction);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 200));
      }

      // Test connection failure
      mockTransport.failNextConnect = true;
      mockTransport.emitDiscoveredRobots([
        DiscoveredRobot(
          id: 'air-fail-1',
          name: 'AIR-FailBot',
          rawRssi: -50,
          smoothedRssi: -50.0,
          isPairingMode: true,
          lastSeen: DateTime.now(),
        ),
      ]);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      await tester.tap(find.text('PAIR & CONNECT'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.textContaining('Failed to connect to AIR-FailBot'), findsOneWidget);
    });
  });
}
