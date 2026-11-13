import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/core/fleet/fleet_providers.dart';
import 'package:air_robotics_app/core/fleet/fleet_storage_service.dart';
import 'package:air_robotics_app/core/profile/profile_providers.dart';
import 'package:air_robotics_app/core/profile/profile_storage_service.dart';
import 'package:air_robotics_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mock_ble_transport.dart';

void main() {
  testWidgets('AirRoboticsApp initial dashboard renders', (WidgetTester tester) async {
    final mockTransport = MockBleTransport();
    final mockFleetStorage = InMemoryFleetStorageService();
    final mockProfileStorage = InMemoryProfileStorageService();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
          profileStorageProvider.overrideWithValue(mockProfileStorage),
        ],
        child: const AirRoboticsApp(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('AIR ROBOTICS'), findsOneWidget);
    expect(find.text('ADD NEW ROBOT'), findsOneWidget);
    expect(find.text('YOUR ROBOTS'), findsOneWidget);
    expect(find.text('DISCOVERED ROBOTS'), findsOneWidget);

    mockTransport.dispose();
    mockFleetStorage.close();
    mockProfileStorage.close();
  });

  testWidgets('back button returns from device screen to home page and allows reopening', (WidgetTester tester) async {
    final mockTransport = MockBleTransport();
    final mockFleetStorage = InMemoryFleetStorageService();
    final mockProfileStorage = InMemoryProfileStorageService();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
          profileStorageProvider.overrideWithValue(mockProfileStorage),
        ],
        child: const AirRoboticsApp(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // Discover a robot
    mockTransport.emitDiscoveredRobots([
      DiscoveredRobot(
        id: 'fabrica-live-1',
        name: 'Fabrica-0001',
        rawRssi: -55,
        smoothedRssi: -55.0,
        isPairingMode: true,
        lastSeen: DateTime.now(),
      ),
    ]);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Fabrica-0001'), findsOneWidget);
    expect(find.text('PAIR & CONNECT'), findsOneWidget);

    // Tap PAIR & CONNECT -> connects and auto-switches to device screen
    await tester.tap(find.text('PAIR & CONNECT'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // Device Screen is now visible!
    expect(find.byTooltip('Back to Home'), findsOneWidget);
    expect(find.byTooltip('Disconnect Robot'), findsOneWidget);

    // Tap Back Button -> returns to Home Page!
    await tester.tap(find.byTooltip('Back to Home'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // Home Page is back!
    expect(find.text('AIR ROBOTICS'), findsOneWidget);
    expect(find.text('YOUR ROBOTS'), findsOneWidget);
    expect(find.text('CONNECTED'), findsOneWidget);
    expect(find.text('OPEN'), findsOneWidget);

    // Tap OPEN -> returns back to Device Screen!
    await tester.tap(find.text('OPEN'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byTooltip('Back to Home'), findsOneWidget);

    mockTransport.dispose();
    mockFleetStorage.close();
    mockProfileStorage.close();
  });
}
