import 'package:air_robotics_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AirRoboticsApp initial dashboard renders', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: AirRoboticsApp()));
    await tester.pumpAndSettle();

    expect(find.text('AIR ROBOTICS'), findsOneWidget);
    expect(find.text('Fabrica Cloth Folder'), findsOneWidget);
    expect(find.text('READY (PHASE 1)'), findsOneWidget);
    expect(find.text('Universal Companion Ready'), findsOneWidget);
  });
}
