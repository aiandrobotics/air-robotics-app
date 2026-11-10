import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:air_robotics_app/ui_engine/widget_catalog/emergency_stop_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

TelemetryPacket makeTestPacket({
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
    sequenceCounter: 1,
  );
}

void main() {
  group('EmergencyStopWidget Unit & Widget Tests', () {
    late MockBleTransport mockTransport;

    setUp(() {
      mockTransport = MockBleTransport();
    });

    tearDown(() {
      mockTransport.dispose();
    });

    testWidgets('dispatches fast-path 0x03 opcode without response on tap',
        (tester) async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(
              makeTestPacket(systemState: SystemState.runningMotion),
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
              body: EmergencyStopWidget(
                config: AirWidgetConfig(
                  type: 'emergency-stop-button',
                  title: 'Emergency Stop',
                  props: {'tactile_feedback': true},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final eStopButton = find.byType(ElevatedButton);
      expect(eStopButton, findsOneWidget);
      expect(find.text('EMERGENCY STOP'), findsOneWidget);

      await tester.tap(eStopButton);
      await tester.pumpAndSettle();

      expect(mockTransport.writtenControlPointPayloads.length, equals(1));
      expect(mockTransport.writtenControlPointPayloads.first, equals([0x03]));
      expect(mockTransport.writtenControlPointNoResponse.first, isTrue);
    });

    testWidgets('shows halted state text when systemState is estop',
        (tester) async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(
              makeTestPacket(systemState: SystemState.estop),
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
              body: EmergencyStopWidget(
                config: AirWidgetConfig(
                  type: 'emergency-stop-button',
                  title: 'Emergency Stop',
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('E-STOP ACTIVE (HALTED)'), findsOneWidget);
    });
  });
}
