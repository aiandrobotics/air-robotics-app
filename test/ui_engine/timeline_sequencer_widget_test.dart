import 'dart:io';

import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/core/profile/profile_providers.dart';
import 'package:air_robotics_app/core/profile/profile_storage_service.dart';
import 'package:air_robotics_app/core/profile/profile_validator.dart';
import 'package:air_robotics_app/core/protocol/command_builder.dart';
import 'package:air_robotics_app/core/protocol/command_pipeline.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/core/protocol/routine_models.dart';
import 'package:air_robotics_app/core/theme/app_colors.dart';
import 'package:air_robotics_app/ui_engine/widget_catalog/timeline_sequencer_widget.dart';
import 'package:air_robotics_app/visualizers/fabrica/fabrica_arrangement_provider.dart';
import 'package:air_robotics_app/visualizers/fabrica/sequencer_programming_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('TimelineSequencerWidget Tests', () {
    late MockBleTransport mockTransport;
    late DeviceProfile fabricaProfile;

    setUp(() {
      mockTransport = MockBleTransport();
      final schemaStr =
          File('assets/profiles/air-device-profile.schema.json')
              .readAsStringSync();
      final profileStr =
          File('assets/profiles/fabrica-devkit-v1.json').readAsStringSync();
      fabricaProfile = ProfileValidator.validateStrings(
        schemaString: schemaStr,
        profileString: profileStr,
      );
    });

    tearDown(() {
      mockTransport.dispose();
    });

    ProviderContainer createContainer({
      bool selectFabricaProfile = true,
      List<dynamic> extraOverrides = const [],
    }) {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          profileStorageProvider.overrideWithValue(
            InMemoryProfileStorageService(),
          ),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport, telemetryBus: null),
          ),
          ...extraOverrides.cast(),
        ],
      );
      if (selectFabricaProfile) {
        container
            .read(activeProfileProvider.notifier)
            .selectProfile(fabricaProfile);
      }
      return container;
    }

    Widget createTestWidget({
      AirWidgetConfig? config,
      required ProviderContainer container,
    }) {
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

    testWidgets(
        'renders 1x4 button row matching Control names/colors, loads Button 1 by default, and shows 1-tap Save button',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(400, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = createContainer();
      addTearDown(container.dispose);

      await container
          .read(presetNamesProvider.notifier)
          .renamePreset(2, 'Work Shirts');
      await container
          .read(presetColorsProvider.notifier)
          .setPresetColor(2, AppColors.emerald.toARGB32());

      await tester.pumpWidget(createTestWidget(container: container));
      await tester.pumpAndSettle();

      expect(find.text('FOLDING TIMELINE'), findsOneWidget);

      // 4 compact button tiles with numbers, names, and custom name
      for (int slot = 1; slot <= 4; slot++) {
        expect(find.byKey(Key('sequencer_button_$slot')), findsOneWidget);
        expect(
          find.descendant(
            of: find.byKey(Key('sequencer_button_$slot')),
            matching: find.text('$slot'),
          ),
          findsOneWidget,
        );
      }
      expect(find.text('Adult T-Shirt'), findsOneWidget);
      expect(find.text('Work Shirts'), findsOneWidget);
      expect(find.text('Trousers'), findsOneWidget);
      expect(find.text('Towels'), findsOneWidget);

      // All 4 buttons are arranged horizontally in one row (same top y)
      final y1 = tester.getTopLeft(find.byKey(const Key('sequencer_button_1'))).dy;
      final y4 = tester.getTopLeft(find.byKey(const Key('sequencer_button_4'))).dy;
      expect(y1, equals(y4));

      // Button 1 timeline loaded by default (4 factory steps)
      expect(container.read(sequencerProgrammingProvider).selectedButtonId, 1);
      expect(container.read(sequencerProgrammingProvider).isDirty, isFalse);
      expect(find.text('Module #1 • Channel 1'), findsOneWidget);
      expect(find.text('Module #7 • Channel 2'), findsOneWidget);
      expect(find.text('Module #6 • Channel 3'), findsOneWidget);
      expect(find.text('Module #12 • Channel 4'), findsOneWidget);
      expect(find.text('ADD STEP (4/16)'), findsOneWidget);

      // Bottom action buttons
      expect(find.text('PREVIEW ON ROBOT'), findsOneWidget);
      expect(find.text('SAVE TO BUTTON 1'), findsOneWidget);
      expect(find.text('UNSAVED'), findsNothing);
    });

    testWidgets(
        'clicking another button when clean loads its timeline and updates Save button label/color',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(400, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = createContainer();
      addTearDown(container.dispose);

      await container
          .read(presetColorsProvider.notifier)
          .setPresetColor(2, AppColors.emerald.toARGB32());

      await tester.pumpWidget(createTestWidget(container: container));
      await tester.pumpAndSettle();

      // Tap Button 2 (Long Sleeve: 5 factory steps starting with dual [0,1])
      await tester.tap(find.byKey(const Key('sequencer_button_2')));
      await tester.pumpAndSettle();

      expect(find.text('Unsaved Changes'), findsNothing);
      expect(container.read(sequencerProgrammingProvider).selectedButtonId, 2);
      expect(container.read(sequencerProgrammingProvider).isDirty, isFalse);
      expect(find.text('ADD STEP (5/16)'), findsOneWidget);
      expect(find.text('DUAL'), findsOneWidget);
      expect(find.text('SAVE TO BUTTON 2'), findsOneWidget);

      // Tap Button 3 (Trousers: 3 factory steps)
      await tester.tap(find.byKey(const Key('sequencer_button_3')));
      await tester.pumpAndSettle();

      expect(container.read(sequencerProgrammingProvider).selectedButtonId, 3);
      expect(find.text('ADD STEP (3/16)'), findsOneWidget);
      expect(find.text('SAVE TO BUTTON 3'), findsOneWidget);
    });

    testWidgets(
        '3-dot menu shows only preset templates and loads template onto selected button as unsaved',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(createTestWidget(container: container));
      await tester.pumpAndSettle();

      // Select Button 2 first
      await tester.tap(find.byKey(const Key('sequencer_button_2')));
      await tester.pumpAndSettle();

      // Open 3-dot template menu: should contain templates, NOT Button 1..4
      await tester.tap(find.byTooltip('Load Template'));
      await tester.pumpAndSettle();

      expect(find.text('Adult T-Shirt Template'), findsOneWidget);
      expect(find.text('Long Sleeve Template'), findsOneWidget);
      expect(find.text('Dual Sweep Template'), findsOneWidget);
      expect(find.textContaining('Button 1'), findsNothing);

      // Select Dual Sweep Template -> applies to Button 2 and marks unsaved
      await tester.tap(find.text('Dual Sweep Template'));
      await tester.pumpAndSettle();

      final seq = container.read(sequencerProgrammingProvider);
      expect(seq.selectedButtonId, equals(2));
      expect(seq.isDirty, isTrue);
      expect(
        seq.draftSteps,
        equals([
          [0, 1],
          [2],
        ]),
      );
      expect(find.text('DUAL'), findsOneWidget);
      expect(find.text('ADD STEP (2/16)'), findsOneWidget);
      expect(find.text('UNSAVED'), findsOneWidget);
      expect(
        find.text('Loaded Dual Sweep Template into Button 2'),
        findsOneWidget,
      );
      // Should NOT auto-save to robot
      expect(mockTransport.writtenControlPointPayloads, isEmpty);
    });

    testWidgets(
        '1-tap SAVE TO BUTTON N directly writes opcode 0x0A for selected slot and persists routine',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(createTestWidget(container: container));
      await tester.pumpAndSettle();

      // Select Button 2 and load Dual Sweep Template
      await tester.tap(find.byKey(const Key('sequencer_button_2')));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Load Template'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dual Sweep Template'));
      await tester.pumpAndSettle();

      expect(container.read(sequencerProgrammingProvider).isDirty, isTrue);

      // Tap SAVE TO BUTTON 2 -> direct 1-tap write, no modal dialog
      final saveBtn = find.text('SAVE TO BUTTON 2');
      await tester.ensureVisible(saveBtn);
      await tester.tap(saveBtn);
      await tester.pumpAndSettle();

      expect(find.text('Save Routine to Robot'), findsNothing);
      final payloads = mockTransport.writtenControlPointPayloads;
      expect(payloads.length, equals(1));
      expect(payloads.first[0], BleOpcode.setButtonSequence.value); // 0x0A
      expect(payloads.first[1], 2); // Slot 2
      expect(payloads.first.length, 2 + FoldRoutine.binaryLength); // 55 bytes

      expect(find.text('Saved successfully to Button 2'), findsOneWidget);
      expect(container.read(sequencerProgrammingProvider).isDirty, isFalse);
      expect(find.text('UNSAVED'), findsNothing);

      // Switch to Button 1 and back to Button 2 -> loads saved 2-step routine
      await tester.tap(find.byKey(const Key('sequencer_button_1')));
      await tester.pumpAndSettle();
      expect(find.text('ADD STEP (4/16)'), findsOneWidget);

      await tester.tap(find.byKey(const Key('sequencer_button_2')));
      await tester.pumpAndSettle();
      expect(
        container.read(sequencerProgrammingProvider).draftSteps,
        equals([
          [0, 1],
          [2],
        ]),
      );
      expect(find.text('ADD STEP (2/16)'), findsOneWidget);
    });

    testWidgets(
        'switching buttons with unsaved changes prompts Cancel, Discard, and Save & Switch',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(createTestWidget(container: container));
      await tester.pumpAndSettle();

      // Modify Button 1 by loading Dual Sweep Template (2 steps)
      await tester.tap(find.byTooltip('Load Template'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dual Sweep Template'));
      await tester.pumpAndSettle();
      expect(container.read(sequencerProgrammingProvider).isDirty, isTrue);

      // 1. Tap Button 2 -> dialog appears -> tap CANCEL -> stays on Button 1 with edits
      await tester.tap(find.byKey(const Key('sequencer_button_2')));
      await tester.pumpAndSettle();
      expect(find.text('Unsaved Changes'), findsOneWidget);
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      expect(container.read(sequencerProgrammingProvider).selectedButtonId, 1);
      expect(container.read(sequencerProgrammingProvider).isDirty, isTrue);
      expect(find.text('ADD STEP (2/16)'), findsOneWidget);

      // 2. Tap Button 2 -> tap DISCARD -> switches to Button 2 without saving Button 1
      await tester.tap(find.byKey(const Key('sequencer_button_2')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('DISCARD'));
      await tester.pumpAndSettle();

      expect(mockTransport.writtenControlPointPayloads, isEmpty);
      expect(container.read(sequencerProgrammingProvider).selectedButtonId, 2);
      expect(container.read(sequencerProgrammingProvider).isDirty, isFalse);
      expect(find.text('ADD STEP (5/16)'), findsOneWidget);

      // 3. Modify Button 2 (load Adult T-Shirt Template -> 3 steps), then tap Button 3 -> SAVE & SWITCH
      await tester.tap(find.byTooltip('Load Template'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Adult T-Shirt Template'));
      await tester.pumpAndSettle();
      expect(container.read(sequencerProgrammingProvider).isDirty, isTrue);

      await tester.tap(find.byKey(const Key('sequencer_button_3')));
      await tester.pumpAndSettle();
      expect(find.text('Unsaved Changes'), findsOneWidget);
      await tester.tap(find.text('SAVE & SWITCH'));
      await tester.pumpAndSettle();

      // Saved Button 2 (opcode 0x0A, slot 2) and switched to Button 3
      expect(mockTransport.writtenControlPointPayloads.length, equals(1));
      expect(
        mockTransport.writtenControlPointPayloads.first[0],
        BleOpcode.setButtonSequence.value,
      );
      expect(mockTransport.writtenControlPointPayloads.first[1], equals(2));
      expect(container.read(sequencerProgrammingProvider).selectedButtonId, 3);
      expect(container.read(sequencerProgrammingProvider).isDirty, isFalse);

      // Switching back to Button 2 reflects the newly saved 3-step routine
      await tester.tap(find.byKey(const Key('sequencer_button_2')));
      await tester.pumpAndSettle();
      expect(
        container.read(sequencerProgrammingProvider).draftSteps,
        equals([
          [0],
          [1],
          [2],
        ]),
      );
    });

    testWidgets(
        'SAVE & SWITCH stays on current button if validation fails or BLE write fails',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(createTestWidget(container: container));
      await tester.pumpAndSettle();

      // Add an empty (invalid) step on Button 1
      await tester.tap(find.text('ADD STEP (4/16)'));
      await tester.pumpAndSettle();

      // Try SAVE & SWITCH -> validation should keep user on Button 1
      await tester.tap(find.byKey(const Key('sequencer_button_2')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('SAVE & SWITCH'));
      await tester.pumpAndSettle();

      expect(container.read(sequencerProgrammingProvider).selectedButtonId, 1);
      expect(
        find.text('Step 5 must have at least 1 motorized panel.'),
        findsOneWidget,
      );
      expect(mockTransport.writtenControlPointPayloads, isEmpty);

      // Remove empty step, remove another step so routine is valid & dirty, then fail BLE write
      await tester.tap(find.byTooltip('Remove Step').last);
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Remove Step').last);
      await tester.pumpAndSettle();
      expect(container.read(sequencerProgrammingProvider).isDirty, isTrue);

      mockTransport.failNextWrite = true;
      await tester.tap(find.byKey(const Key('sequencer_button_2')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('SAVE & SWITCH'));
      await tester.pumpAndSettle();

      expect(container.read(sequencerProgrammingProvider).selectedButtonId, 1);
      expect(container.read(sequencerProgrammingProvider).isDirty, isTrue);
      expect(find.textContaining('Failed to save to robot:'), findsOneWidget);
    });

    testWidgets('hydrates Button 1 from live FAB3 buttonConfigProvider on open',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final table = ButtonConfigTable(
        routines: {
          1: FoldRoutine.fromSteps([FoldStep.dual(0, 1), FoldStep.single(3)]),
          2: FoldRoutine.fromSteps([FoldStep.single(2)]),
          3: FoldRoutine.fromSteps([FoldStep.single(0), FoldStep.single(1)]),
          4: FoldRoutine.fromSteps([FoldStep.single(3)]),
        },
      );

      final container = createContainer(
        extraOverrides: [
          bleConnectionStateProvider.overrideWith(
            (ref) => Stream.value(BleConnectionState.ready),
          ),
          buttonConfigProvider.overrideWith(
            (ref) => Stream.value(table),
          ),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(createTestWidget(container: container));
      await tester.pumpAndSettle();

      // Button 1 hydrated from live FAB3 table
      expect(container.read(sequencerProgrammingProvider).selectedButtonId, 1);
      expect(
        container.read(sequencerProgrammingProvider).draftSteps,
        equals([
          [0, 1],
          [3],
        ]),
      );
      expect(container.read(sequencerProgrammingProvider).isDirty, isFalse);

      // Switching to Button 2 loads its live FAB3 routine
      await tester.tap(find.byKey(const Key('sequencer_button_2')));
      await tester.pumpAndSettle();
      expect(
        container.read(sequencerProgrammingProvider).draftSteps,
        equals([
          [2],
        ]),
      );
    });

    testWidgets(
        'adds an empty step, validates at least 1 motor, and respects min/max bounds',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 2500));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(createTestWidget(container: container));
      await tester.pumpAndSettle();

      // Tap large ADD STEP button -> adds empty Step 5
      await tester.tap(find.text('ADD STEP (4/16)'));
      await tester.pumpAndSettle();

      expect(find.text('ADD STEP (5/16)'), findsOneWidget);
      expect(find.text('Tap 1–2 motor panels on grid'), findsOneWidget);

      // Validation blocks PREVIEW ON ROBOT when a step has 0 motorized panels
      await tester.tap(find.text('PREVIEW ON ROBOT'));
      await tester.pumpAndSettle();
      expect(
        find.text('Step 5 must have at least 1 motorized panel.'),
        findsOneWidget,
      );
      expect(mockTransport.writtenControlPointPayloads, isEmpty);

      // Remove empty step -> back to 4 steps
      await tester.tap(find.byTooltip('Remove Step').last);
      await tester.pumpAndSettle();
      expect(find.text('ADD STEP (4/16)'), findsOneWidget);

      // Fill up to 16 steps
      for (var i = 0; i < 12; i++) {
        final btn = find.textContaining('ADD STEP');
        await tester.ensureVisible(btn);
        await tester.tap(btn);
        await tester.pumpAndSettle();
      }
      expect(find.text('ROUTINE FULL (16/16 STEPS)'), findsOneWidget);

      // Remove down to 1 step and check minimum bound
      for (var i = 0; i < 15; i++) {
        await tester.tap(find.byTooltip('Remove Step').last);
        await tester.pumpAndSettle();
      }
      expect(find.text('ADD STEP (1/16)'), findsOneWidget);

      await tester.tap(find.byTooltip('Remove Step').first);
      await tester.pumpAndSettle();
      expect(find.text('Routine must contain at least 1 step'), findsOneWidget);
      expect(find.text('ADD STEP (1/16)'), findsOneWidget);
    });

    testWidgets(
        'PREVIEW ON ROBOT dispatches opcode 0x01 and surfaces dispatch errors',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(createTestWidget(container: container));
      await tester.pumpAndSettle();

      await tester.tap(find.text('PREVIEW ON ROBOT'));
      await tester.pumpAndSettle();

      final payloads = mockTransport.writtenControlPointPayloads;
      expect(payloads.isNotEmpty, isTrue);
      expect(payloads.first[0], BleOpcode.runRawSequence.value); // 0x01
      expect(payloads.first.length, 1 + FoldRoutine.binaryLength); // 54 bytes
      expect(find.textContaining('Preview running on robot'), findsOneWidget);

      // Preview error
      mockTransport.failNextWrite = true;
      await tester.tap(find.text('PREVIEW ON ROBOT'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Preview dispatch error:'), findsOneWidget);

      // Direct save error
      mockTransport.failNextWrite = true;
      await tester.tap(find.text('SAVE TO BUTTON 1'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Failed to save to robot:'), findsOneWidget);
    });

    testWidgets('requires at least one motorized module from arrangement',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = createContainer();
      addTearDown(container.dispose);

      // Remove all motorized modules from arrangement
      final arrNotifier = container.read(fabricaArrangementProvider.notifier);
      for (final id in [1, 6, 7, 8, 11, 12]) {
        arrNotifier.removePanel(id);
      }

      await tester.pumpWidget(createTestWidget(container: container));
      await tester.pumpAndSettle();

      expect(
        find.text(
          'Routine requires at least one Motorized module from Fabrica Arrangement.',
        ),
        findsOneWidget,
      );

      await tester.tap(find.text('PREVIEW ON ROBOT'));
      await tester.pumpAndSettle();
      expect(mockTransport.writtenControlPointPayloads, isEmpty);
    });
  });
}
