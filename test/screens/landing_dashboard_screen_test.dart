import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/screens/landing_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('LandingDashboardScreen Widget Tests', () {
    late MockBleTransport mockTransport;

    setUp(() {
      mockTransport = MockBleTransport();
    });

    tearDown(() {
      mockTransport.dispose();
    });

    Widget createTestApp({ProviderContainer? container}) {
      final scope = container ??
          ProviderContainer(
            overrides: [
              bleTransportProvider.overrideWithValue(mockTransport),
            ],
          );

      return UncontrolledProviderScope(
        container: scope,
        child: const MaterialApp(
          home: LandingDashboardScreen(),
        ),
      );
    }

    testWidgets('renders consumer branding, demo card, and pairing guide',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      expect(find.text('AIR ROBOTICS'), findsOneWidget);
      expect(find.text('EXPLORE FABRICA (DEMO MODE)'), findsOneWidget);
      expect(find.text('NO HARDWARE NEEDED'), findsOneWidget);
      expect(find.text('START VIRTUAL DEMO'), findsOneWidget);
      expect(find.text('HOW TO PAIR YOUR ROBOT'), findsOneWidget);
      expect(find.text('DISCOVERED ROBOTS'), findsOneWidget);
      expect(find.text('SCAN FOR ROBOTS'), findsOneWidget);
    });

    testWidgets('info button opens local hardware permission rationale dialog',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('Permission & Privacy Info'));
      await tester.pumpAndSettle();

      expect(find.text('Local Hardware Access'), findsOneWidget);
      expect(find.textContaining('100% Offline'), findsOneWidget);
      expect(find.textContaining('Zero Tracking'), findsOneWidget);

      await tester.tap(find.text('UNDERSTOOD'));
      await tester.pumpAndSettle();

      expect(find.text('Local Hardware Access'), findsNothing);
    });

    testWidgets('start virtual demo activates demo mode and transitions state',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(createTestApp(container: container));
      await tester.pumpAndSettle();

      expect(container.read(isDemoModeProvider), isFalse);

      await tester.tap(find.text('START VIRTUAL DEMO'));
      await tester.pumpAndSettle();

      expect(container.read(isDemoModeProvider), isTrue);
    });

    testWidgets('renders discovered robot cards with pairing badge and connect action',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(createTestApp(container: container));
      await tester.pumpAndSettle();

      // Emit discovered robot
      mockTransport.emitDiscoveredRobots([
        DiscoveredRobot(
          id: 'test-fabrica-id',
          name: 'Fabrica-1234',
          rawRssi: -55,
          smoothedRssi: -55.0,
          isPairingMode: true,
          lastSeen: DateTime.now(),
        ),
      ]);
      await tester.pumpAndSettle();

      expect(find.text('Fabrica-1234'), findsOneWidget);
      expect(find.text('PAIRING'), findsOneWidget);
      expect(find.text('CONNECT'), findsOneWidget);

      // Tap Connect
      await tester.tap(find.text('CONNECT'));
      await tester.pumpAndSettle();

      expect(mockTransport.currentConnectionState, BleConnectionState.connected);
    });
  });
}
