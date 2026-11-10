import 'dart:io';

import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/core/profile/profile_providers.dart';
import 'package:air_robotics_app/core/profile/profile_validator.dart';
import 'package:air_robotics_app/core/protocol/command_pipeline.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:air_robotics_app/ui_engine/widget_catalog/preset_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

TelemetryPacket makeTestPacket({
  SystemState systemState = SystemState.idle,
  int activeButtonId = 0,
  int currentStepIdx = 0,
  int totalSteps = 4,
  int stepProgressPct = 0,
}) {
  return TelemetryPacket(
    systemState: systemState,
    ledState: LedState.idle,
    activeButtonId: activeButtonId,
    currentStepIdx: currentStepIdx,
    totalSteps: totalSteps,
    stepProgressPct: stepProgressPct,
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
  group('PresetGridWidget Unit & Widget Tests', () {
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

    testWidgets('renders preset grid and dispatches runPreset on tap',
        (tester) async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport),
          ),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(
              makeTestPacket(systemState: SystemState.idle),
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
              body: PresetGridWidget(
                config: AirWidgetConfig(
                  type: 'preset-grid',
                  title: 'Folding Presets',
                  props: {'columns': 2},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Adult T-Shirt'), findsOneWidget);
      expect(find.text('Long Sleeve'), findsOneWidget);
      expect(find.text('Trousers'), findsOneWidget);
      expect(find.text('Towels'), findsOneWidget);

      // Tap Preset 1 (Adult T-Shirt)
      await tester.tap(find.text('Adult T-Shirt'));
      await tester.pumpAndSettle();

      // Opcode 0x00 with slot 0x01
      expect(mockTransport.writtenControlPointPayloads.length, equals(1));
      expect(
        mockTransport.writtenControlPointPayloads.first,
        equals([0x00, 0x01]),
      );
    });

    testWidgets('shows progress sweep when preset routine is actively running',
        (tester) async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport),
          ),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(
              makeTestPacket(
                systemState: SystemState.runningMotion,
                activeButtonId: 1,
                currentStepIdx: 1, // Step 2 (0-indexed)
                totalSteps: 4,
                stepProgressPct: 65,
              ),
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
              body: PresetGridWidget(
                config: AirWidgetConfig(
                  type: 'preset-grid',
                  props: {'columns': 2},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Step 2/4 (65%)'), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);

      // Tapping active running preset triggers soft stop sequence (opcode 0x02)
      await tester.tap(find.text('Adult T-Shirt'));
      await tester.pumpAndSettle();

      expect(mockTransport.writtenControlPointPayloads.length, equals(1));
      expect(mockTransport.writtenControlPointPayloads.first, equals([0x02]));
    });
  });
}
