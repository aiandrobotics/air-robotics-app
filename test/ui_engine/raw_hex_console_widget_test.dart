import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/core/protocol/command_pipeline.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/core/protocol/telemetry_bus.dart';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:air_robotics_app/ui_engine/widget_catalog/raw_hex_console_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

TelemetryPacket makeTestPacket({
  int sequence = 1,
  SystemState systemState = SystemState.idle,
}) {
  return TelemetryPacket(
    systemState: systemState,
    ledState: LedState.idle,
    activeButtonId: 0,
    currentStepIdx: 0,
    totalSteps: 0,
    stepProgressPct: 0,
    elapsedStepTimeMs: 0,
    channelAngles: List<int>.filled(16, 0),
    lastCmdStatus: CmdStatus.ok,
    freeHeapKb: 200,
    bleRssiDbm: -55,
    errorCode: 0,
    sequenceCounter: sequence,
  );
}

void main() {
  group('RawHexConsoleWidget Unit & Widget Tests', () {
    late MockBleTransport mockTransport;

    setUp(() {
      mockTransport = MockBleTransport();
    });

    tearDown(() {
      mockTransport.dispose();
    });

    testWidgets('renders stream statistics, logs packets, and dispatches hex',
        (tester) async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          telemetryMetricsProvider.overrideWith(
            (ref) => Stream.value(
              const TelemetryMetrics(
                totalPackets: 150,
                droppedPackets: 2,
                dropRatePercent: 1.3,
                frequencyHz: 10.0,
              ),
            ),
          ),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(
              makeTestPacket(sequence: 42, systemState: SystemState.idle),
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: RawHexConsoleWidget(
                  config: AirWidgetConfig(
                    type: 'raw-hex-console',
                    title: 'Packet Console',
                    props: {'buffer_size': 100},
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Check Header & Metrics
      expect(find.text('PACKET CONSOLE'), findsOneWidget);
      expect(find.text('10.0 Hz'), findsOneWidget);
      expect(find.text('Drops: 2 (1.3%)'), findsOneWidget);
      expect(find.text('Total: 150'), findsOneWidget);

      // Check packet logged
      expect(find.textContaining('RX #00042'), findsOneWidget);

      // Verify DIS metadata card
      expect(find.text('DEVICE INFORMATION'), findsOneWidget);
      expect(find.text('Fabrica-DevKit-v1'), findsOneWidget);
      expect(find.text('v1.13.0'), findsOneWidget);
      expect(find.text('AIR Robotics'), findsOneWidget);

      // Verify quick diagnostic action chips
      expect(find.text('SNAPSHOT'), findsOneWidget);
      expect(find.text('PAUSE STREAM'), findsOneWidget);
      expect(find.text('IDENTIFY'), findsOneWidget);
      expect(find.text('SYNC ROUTINES'), findsOneWidget);

      // Enter hex opcode 0E (Identify)
      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      await tester.enterText(textField, '0E');
      await tester.pump();

      final sendButton = find.widgetWithText(ElevatedButton, 'SEND');
      expect(sendButton, findsOneWidget);
      await tester.tap(sendButton);
      await tester.pumpAndSettle();

      // Verify command sent to mock transport
      expect(mockTransport.writtenControlPointPayloads.length, equals(1));
      expect(mockTransport.writtenControlPointPayloads.first, equals([0x0E]));
      expect(mockTransport.writtenControlPointNoResponse.first, isFalse);
      expect(find.textContaining('TX -> FAB1: [0E]'), findsOneWidget);

      // Toggle Write Without Response
      final checkbox = find.byType(Checkbox);
      await tester.tap(checkbox);
      await tester.pump();

      // Enter opcode 03 (E-Stop)
      await tester.enterText(textField, '03');
      await tester.pump();
      await tester.tap(sendButton);
      await tester.pumpAndSettle();

      expect(mockTransport.writtenControlPointPayloads.length, equals(2));
      expect(mockTransport.writtenControlPointPayloads.last, equals([0x03]));
      expect(mockTransport.writtenControlPointNoResponse.last, isTrue);

      // Tap quick action chips: Snapshot, Stream toggle, Identify, Get config
      await tester.tap(find.text('SNAPSHOT'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('PAUSE STREAM'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('IDENTIFY'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('SYNC ROUTINES'));
      await tester.pumpAndSettle();

      // Test odd hex string error
      await tester.enterText(textField, 'A');
      await tester.tap(sendButton);
      await tester.pumpAndSettle();
      expect(find.textContaining('ERR: Odd hex string length'), findsOneWidget);

      // Test Clear button
      final clearBtn = find.widgetWithText(TextButton, 'CLEAR');
      await tester.tap(clearBtn);
      await tester.pumpAndSettle();
    });

    testWidgets('RawHexConsoleWidget buffer overflow, onSubmitted, and error dispatches', (tester) async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          commandPipelineProvider.overrideWithValue(CommandPipeline(transport: mockTransport, telemetryBus: null)),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: RawHexConsoleWidget(
                config: AirWidgetConfig(
                  type: 'raw-hex-console',
                  props: {'buffer_size': 2},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final textField = find.byType(TextField);

      // 1. Enter hex and submit via onSubmitted (line 405)
      await tester.enterText(textField, '02');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(find.textContaining('TX -> FAB1: [02]'), findsOneWidget);

      // 2. Buffer size truncation (line 43): send 3 more messages so buffer_size (2) is exceeded
      await tester.enterText(textField, '03');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      await tester.enterText(textField, '04');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // 3. Dispatch failure catch block (line 86)
      mockTransport.failNextWrite = true;
      final sendButton = find.widgetWithText(ElevatedButton, 'SEND');
      await tester.enterText(textField, '0E');
      await tester.tap(sendButton);
      await tester.pumpAndSettle();
      expect(find.textContaining('ERR: Dispatch failed:'), findsOneWidget);

      // 4. Stream toggle success (line 299)
      final streamChip = find.text('PAUSE STREAM');
      await tester.tap(streamChip);
      await tester.pumpAndSettle();

      // 5. Identify failure catch block (line 313)
      mockTransport.failNextWrite = true;
      final identifyChip = find.text('IDENTIFY');
      await tester.tap(identifyChip);
      await tester.pumpAndSettle();
      expect(find.textContaining('ERR: Identify failed:'), findsOneWidget);
    });
  });
}
