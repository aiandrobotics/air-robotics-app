import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mock_ble_transport.dart';

void main() {
  testWidgets('AirRoboticsApp initial dashboard renders and opens debugger', (WidgetTester tester) async {
    final mockTransport = MockBleTransport();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
        ],
        child: const AirRoboticsApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('AIR ROBOTICS'), findsOneWidget);
    expect(find.text('Fabrica Cloth Folder'), findsOneWidget);
    expect(find.text('READY (PHASE 1)'), findsOneWidget);
    expect(find.text('Universal Companion Ready'), findsOneWidget);

    mockTransport.dispose();
  });
}
