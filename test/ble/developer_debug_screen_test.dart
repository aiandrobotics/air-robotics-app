import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/developer_debug_screen.dart';
import 'package:air_robotics_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('DeveloperDebugScreen Widget Test', () {
    late MockBleTransport mockTransport;

    setUp(() {
      mockTransport = MockBleTransport();
    });

    tearDown(() {
      mockTransport.dispose();
    });

    testWidgets('renders UI, accepts hex input, and dispatches to FAB1', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            bleTransportProvider.overrideWithValue(mockTransport),
          ],
          child: MaterialApp(
            theme: AppTheme.darkTheme,
            home: const DeveloperDebugScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Check header and connection state
      expect(find.text('BLE Hardware Debugger'), findsOneWidget);
      expect(find.text('DISCONNECTED'), findsOneWidget);
      expect(find.text('RAW HEX COMMAND INJECTOR (FAB1)'), findsOneWidget);

      // Enter hex opcode 0E (Identify)
      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      await tester.enterText(textField, '0E');
      await tester.pump();

      // Tap SEND button
      final sendButton = find.widgetWithText(ElevatedButton, 'SEND');
      expect(sendButton, findsOneWidget);
      await tester.tap(sendButton);
      await tester.pumpAndSettle();

      // Verify payload dispatched to transport
      expect(mockTransport.writtenControlPointPayloads.length, equals(1));
      expect(mockTransport.writtenControlPointPayloads.first, equals([0x0E]));
      expect(mockTransport.writtenControlPointNoResponse.first, isFalse);

      // Check log output
      expect(find.textContaining('TX -> FAB1: [0E]'), findsOneWidget);

      // Check Write Without Response checkbox
      final checkbox = find.byType(Checkbox);
      expect(checkbox, findsOneWidget);
      await tester.tap(checkbox);
      await tester.pump();

      // Enter E-Stop opcode 03
      await tester.enterText(textField, '03');
      await tester.pump();
      await tester.tap(sendButton);
      await tester.pumpAndSettle();

      // Verify fast-path without response flag
      expect(mockTransport.writtenControlPointPayloads.length, equals(2));
      expect(mockTransport.writtenControlPointPayloads.last, equals([0x03]));
      expect(mockTransport.writtenControlPointNoResponse.last, isTrue);
      expect(find.textContaining('TX -> FAB1: [03] (noResp: true)'), findsOneWidget);
    });
  });
}
