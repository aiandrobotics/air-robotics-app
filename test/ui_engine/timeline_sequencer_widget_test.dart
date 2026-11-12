import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/core/protocol/command_builder.dart';
import 'package:air_robotics_app/core/protocol/command_pipeline.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/core/protocol/routine_models.dart';
import 'package:air_robotics_app/ui_engine/widget_catalog/timeline_sequencer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('TimelineSequencerWidget Tests', () {
    late MockBleTransport mockTransport;

    setUp(() {
      mockTransport = MockBleTransport();
    });

    tearDown(() {
      mockTransport.dispose();
    });

    Widget createTestWidget({AirWidgetConfig? config}) {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport, telemetryBus: null),
          ),
        ],
      );

      return UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: TimelineSequencerWidget(
                config: config ??
                    const AirWidgetConfig(
                      type: 'timeline-sequencer',
                      title: 'Folding Timeline',
                    ),
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('renders initial 3 steps and operation buttons',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('FOLDING TIMELINE'), findsOneWidget);
      expect(find.text('Left Flap (Ch 0)'), findsOneWidget);
      expect(find.text('Right Flap (Ch 1)'), findsOneWidget);
      expect(find.text('Bottom Flap (Ch 2)'), findsOneWidget);
      expect(find.text('ADD MOTION STEP (3/16)'), findsOneWidget);
      expect(find.text('PREVIEW ON ROBOT'), findsOneWidget);
      expect(find.text('SAVE TO BUTTON'), findsOneWidget);
      expect(find.text('SYNC FROM ROBOT'), findsOneWidget);
      expect(find.text('RESTORE FACTORY PRESETS'), findsOneWidget);
    });

    testWidgets('loads pre-defined routine templates correctly',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Open popup menu
      await tester.tap(find.byTooltip('Load Template'));
      await tester.pumpAndSettle();

      // Select Long Sleeve Template
      await tester.tap(find.text('Long Sleeve Template'));
      await tester.pumpAndSettle();

      expect(find.text('Top Flap (Ch 3)'), findsOneWidget);
      expect(find.text('ADD MOTION STEP (4/16)'), findsOneWidget);

      // Open popup menu and select Dual Sweep
      await tester.tap(find.byTooltip('Load Template'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Dual Sweep Template'));
      await tester.pumpAndSettle();

      expect(find.text('Left Flap (Ch 0) + Right Flap (Ch 1)'), findsOneWidget);
      expect(find.text('DUAL'), findsOneWidget);
      expect(find.text('ADD MOTION STEP (2/16)'), findsOneWidget);

      // Open popup menu and select Adult T-Shirt Template (lines 77-80)
      await tester.tap(find.byTooltip('Load Template'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Adult T-Shirt Template'));
      await tester.pumpAndSettle();
      expect(find.text('ADD MOTION STEP (3/16)'), findsOneWidget);
    });

    testWidgets('adds a motion step and respects routine bounds',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Tap Add Motion Step
      await tester.tap(find.text('ADD MOTION STEP (3/16)'));
      await tester.pumpAndSettle();

      expect(find.text('Add Motion Step'), findsOneWidget);

      // Tap ADD button in dialog
      await tester.tap(find.text('ADD'));
      await tester.pumpAndSettle();

      expect(find.text('ADD MOTION STEP (4/16)'), findsOneWidget);

      // Remove step using trailing IconButton
      final removeButtons = find.byTooltip('Remove Step');
      expect(removeButtons, findsNWidgets(4));

      await tester.tap(removeButtons.last);
      await tester.pumpAndSettle();

      expect(find.text('ADD MOTION STEP (3/16)'), findsOneWidget);
    });

    testWidgets('prevents removing all steps below minimum of 1',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Remove 2 steps so 1 remains
      await tester.tap(find.byTooltip('Remove Step').first);
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Remove Step').first);
      await tester.pumpAndSettle();

      expect(find.text('ADD MOTION STEP (1/16)'), findsOneWidget);

      // Try to remove the last step
      await tester.tap(find.byTooltip('Remove Step').first);
      await tester.pumpAndSettle();

      expect(find.text('Routine must contain at least 1 step'), findsOneWidget);
      expect(find.text('ADD MOTION STEP (1/16)'), findsOneWidget);
    });

    testWidgets('PREVIEW ON ROBOT dispatches opcode 0x01 with valid FoldRoutine payload',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('PREVIEW ON ROBOT'));
      await tester.pumpAndSettle();

      final payloads = mockTransport.writtenControlPointPayloads;
      expect(payloads.isNotEmpty, isTrue);

      final previewPacket = payloads.first;
      expect(previewPacket[0], BleOpcode.runRawSequence.value); // 0x01
      expect(previewPacket.length, 1 + FoldRoutine.binaryLength); // 54 bytes
      expect(find.textContaining('Preview running on robot'), findsOneWidget);
    });

    testWidgets('SAVE TO BUTTON selects slot and writes opcode 0x0A with CRC32',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('SAVE TO BUTTON'));
      await tester.pumpAndSettle();

      expect(find.text('Program Hardware Preset Button'), findsOneWidget);
      expect(find.text('Button 2'), findsOneWidget);

      // Select Button 2
      await tester.tap(find.text('Button 2'));
      await tester.pumpAndSettle();

      // Confirm
      await tester.tap(find.text('COMMIT TO FLASH'));
      await tester.pumpAndSettle();

      final payloads = mockTransport.writtenControlPointPayloads;
      expect(payloads.isNotEmpty, isTrue);

      final savePacket = payloads.first;
      expect(savePacket[0], BleOpcode.setButtonSequence.value); // 0x0A
      expect(savePacket[1], 2); // Slot 2
      expect(savePacket.length, 2 + FoldRoutine.binaryLength); // 55 bytes
      expect(find.textContaining('Saved successfully to Button 2'), findsOneWidget);
    });

    testWidgets('RESTORE FACTORY PRESETS confirmation dispatches opcode 0x0C',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('RESTORE FACTORY PRESETS'));
      await tester.pumpAndSettle();

      expect(find.text('Restore Factory Presets?'), findsOneWidget);

      await tester.tap(find.text('RESTORE DEFAULTS'));
      await tester.pumpAndSettle();

      final payloads = mockTransport.writtenControlPointPayloads;
      expect(payloads.isNotEmpty, isTrue);

      final restorePacket = payloads.first;
      expect(restorePacket[0], BleOpcode.restoreFactoryPresets.value); // 0x0C
      expect(restorePacket.length, 1);
      expect(find.textContaining('Factory presets restored successfully'),
          findsOneWidget);
    });

    testWidgets('sync from robot dispatches 0x0B opcode to request FAB3 push',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('SYNC FROM ROBOT'));
      await tester.pumpAndSettle();

      final payloads = mockTransport.writtenControlPointPayloads;
      expect(payloads.isNotEmpty, isTrue);
      expect(payloads.first, equals([0x0B]));
      expect(find.textContaining('Routines synchronized successfully'), findsOneWidget);
    });

    testWidgets('cancels restore and flash dialogs and adds dual step', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 2500));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // 1. Cancel restore dialog
      final restoreBtn = find.text('RESTORE FACTORY PRESETS');
      await tester.ensureVisible(restoreBtn);
      await tester.tap(restoreBtn);
      await tester.pumpAndSettle();
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      // 2. Cancel flash dialog
      final saveBtn = find.text('SAVE TO BUTTON');
      await tester.ensureVisible(saveBtn);
      await tester.tap(saveBtn);
      await tester.pumpAndSettle();
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      // 3. Add step dialog with dropdown selection, dual flap and cancel
      final addStepBtn = find.textContaining('ADD MOTION STEP');
      await tester.ensureVisible(addStepBtn);
      await tester.tap(addStepBtn);
      await tester.pumpAndSettle();

      // Change flap 1 dropdown (lines 291-292)
      await tester.tap(find.byType(DropdownButtonFormField<int>).first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Right Flap (Ch 1)').last);
      await tester.pumpAndSettle();

      final dualCheckbox = find.byType(CheckboxListTile);
      await tester.tap(dualCheckbox);
      await tester.pumpAndSettle();

      // Change flap 2 dropdown (lines 321-322)
      await tester.tap(find.byType(DropdownButtonFormField<int>).last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Bottom Flap (Ch 2)').last);
      await tester.pumpAndSettle();

      // Cancel add dialog (line 329)
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      // Re-open and add dual step
      await tester.ensureVisible(find.textContaining('ADD MOTION STEP'));
      await tester.tap(find.textContaining('ADD MOTION STEP'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('ADD'));
      await tester.pumpAndSettle();

      // 4. Fill up to 16 steps and test max bound error (line 50)
      for (var i = 0; i < 12; i++) {
        final btn = find.textContaining('ADD MOTION STEP');
        await tester.ensureVisible(btn);
        await tester.tap(btn);
        await tester.pumpAndSettle();
        await tester.tap(find.text('ADD'));
        await tester.pumpAndSettle();
      }
      expect(find.text('ROUTINE FULL (16/16 STEPS)'), findsOneWidget);

      // Defensive limit check (line 50)
      (tester.state(find.byType(TimelineSequencerWidget)) as dynamic)._addStep(0);
      await tester.pumpAndSettle();
      expect(find.textContaining('Maximum 16 steps allowed by firmware'), findsOneWidget);

      // 5. Preview error (line 115)
      mockTransport.failNextWrite = true;
      final previewBtn = find.text('PREVIEW ON ROBOT');
      await tester.ensureVisible(previewBtn);
      await tester.tap(previewBtn);
      await tester.pumpAndSettle();
      expect(find.textContaining('Preview dispatch error:'), findsOneWidget);

      // 6. Flash commit error (line 201)
      mockTransport.failNextWrite = true;
      await tester.ensureVisible(saveBtn);
      await tester.tap(saveBtn);
      await tester.pumpAndSettle();
      await tester.tap(find.text('COMMIT TO FLASH'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Flash commit error:'), findsOneWidget);

      // 7. Restore factory presets error (line 244)
      mockTransport.failNextWrite = true;
      await tester.ensureVisible(restoreBtn);
      await tester.tap(restoreBtn);
      await tester.pumpAndSettle();
      await tester.tap(find.text('RESTORE DEFAULTS'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Restore error:'), findsOneWidget);

      // 8. Sync error (line 260)
      mockTransport.failNextWrite = true;
      final syncBtn = find.text('SYNC FROM ROBOT');
      await tester.ensureVisible(syncBtn);
      await tester.tap(syncBtn);
      await tester.pumpAndSettle();
      expect(find.textContaining('Sync error:'), findsOneWidget);
    });
  });
}
