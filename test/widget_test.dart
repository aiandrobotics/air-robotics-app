import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/fleet/fleet_providers.dart';
import 'package:air_robotics_app/core/fleet/fleet_storage_service.dart';
import 'package:air_robotics_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mock_ble_transport.dart';

void main() {
  testWidgets('AirRoboticsApp initial dashboard renders and opens debugger', (WidgetTester tester) async {
    final mockTransport = MockBleTransport();
    final mockFleetStorage = InMemoryFleetStorageService();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
        ],
        child: const AirRoboticsApp(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('AIR ROBOTICS'), findsOneWidget);
    expect(find.text('ADD NEW DEVICE'), findsOneWidget);
    expect(find.text('YOUR DEVICES'), findsOneWidget);
    expect(find.text('DISCOVERED ROBOTS'), findsOneWidget);

    mockTransport.dispose();
    mockFleetStorage.close();
  });
}
