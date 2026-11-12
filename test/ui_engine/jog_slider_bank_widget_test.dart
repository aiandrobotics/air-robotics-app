import 'dart:io';

import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/core/profile/profile_providers.dart';
import 'package:air_robotics_app/core/profile/profile_validator.dart';
import 'package:air_robotics_app/core/protocol/command_pipeline.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:air_robotics_app/ui_engine/widget_catalog/jog_slider_bank_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

TelemetryPacket makeTestPacket({
  List<int>? channelAngles,
}) {
  return TelemetryPacket(
    systemState: SystemState.calibrating,
    ledState: LedState.idle,
    activeButtonId: 0,
    currentStepIdx: 0,
    totalSteps: 0,
    stepProgressPct: 0,
    elapsedStepTimeMs: 0,
    channelAngles: channelAngles ?? List<int>.filled(16, 0),
    lastCmdStatus: CmdStatus.ok,
    freeHeapKb: 200,
    bleRssiDbm: -55,
    errorCode: 0,
    sequenceCounter: 1,
  );
}

void main() {
  group('JogSliderBankWidget Unit & Widget Tests', () {
    late MockBleTransport mockTransport;
    late DeviceProfile profile;

    setUp(() {
      mockTransport = MockBleTransport();
      final schemaStr =
          File('assets/profiles/air-device-profile.schema.json')
              .readAsStringSync();
      final profileStr =
          File('assets/profiles/fabrica-devkit-v1.json').readAsStringSync();

      profile = ProfileValidator.validateStrings(
        schemaString: schemaStr,
        profileString: profileStr,
      );
    });

    tearDown(() {
      mockTransport.dispose();
    });

    testWidgets('renders all actuators and commanded degrees',
        (tester) async {
      final initialAngles = List<int>.filled(16, 0);
      initialAngles[0] = 45; // Left flap at 45°
      initialAngles[1] = 90; // Right flap at 90°

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport),
          ),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(
              makeTestPacket(channelAngles: initialAngles),
            ),
          ),
        ],
      );
      addTearDown(container.dispose);
      container.read(activeProfileProvider.notifier).selectProfile(profile);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: JogSliderBankWidget(
                config: AirWidgetConfig(
                  type: 'jog-slider-bank',
                  title: 'Servo Manual Jog',
                  props: {'drag_throttle_ms': 50},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('SERVO MANUAL JOG'), findsOneWidget);
      expect(find.text('Left Flap'), findsOneWidget);
      expect(find.text('Right Flap'), findsOneWidget);
      expect(find.text('Bottom Flap'), findsOneWidget);
      expect(find.text('Top Flap'), findsOneWidget);

      expect(find.text('(45°)'), findsOneWidget);
      expect(find.text('(90°)'), findsOneWidget);
    });

    testWidgets('tapping HOME dispatches default angle (0°) jog command',
        (tester) async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport),
          ),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(
              makeTestPacket(),
            ),
          ),
        ],
      );
      addTearDown(container.dispose);
      container.read(activeProfileProvider.notifier).selectProfile(profile);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: JogSliderBankWidget(
                config: AirWidgetConfig(
                  type: 'jog-slider-bank',
                  props: {'drag_throttle_ms': 50},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Tap HOME on channel 0
      final homeButtons = find.text('HOME');
      expect(homeButtons, findsNWidgets(4));
      await tester.tap(homeButtons.first);
      await tester.pumpAndSettle();

      // Opcode 0x0D: [0x0D, 0x00, 0x00] (channel 0, 0°)
      expect(mockTransport.writtenControlPointPayloads.length, equals(1));
      expect(
        mockTransport.writtenControlPointPayloads.first,
        equals([0x0D, 0x00, 0x00]),
      );

      // Tap HOME ALL (0x02) button
      final homeAllBtn = find.text('HOME ALL (0x02)');
      expect(homeAllBtn, findsOneWidget);
      await tester.tap(homeAllBtn);
      await tester.pumpAndSettle();
      expect(mockTransport.writtenControlPointPayloads.any((p) => p.length == 1 && p[0] == 0x02), isTrue);

      // Drag first slider
      final sliders = find.byType(Slider);
      expect(sliders, findsWidgets);
      await tester.drag(sliders.first, const Offset(100, 0));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();
    });
  });
}
