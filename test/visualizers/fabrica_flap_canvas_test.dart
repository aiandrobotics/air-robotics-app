import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/core/profile/profile_providers.dart';
import 'package:air_robotics_app/core/profile/profile_storage_service.dart';
import 'package:air_robotics_app/core/protocol/command_pipeline.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:air_robotics_app/visualizers/fabrica/fabrica_arrangement_provider.dart';
import 'package:air_robotics_app/visualizers/fabrica/fabrica_flap_canvas.dart';
import 'package:air_robotics_app/visualizers/fabrica/sequencer_programming_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

TelemetryPacket makeTestPacket({
  SystemState state = SystemState.idle,
  List<int>? channelAngles,
  int sequence = 1,
}) {
  return TelemetryPacket(
    systemState: state,
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
    sequenceCounter: sequence,
  );
}

void main() {
  group('FabricaFlapVisualizerWidget Tests', () {
    late MockBleTransport mockTransport;

    setUp(() {
      mockTransport = MockBleTransport();
    });

    tearDown(() {
      mockTransport.dispose();
    });

    testWidgets('renders default 3x4 (4 rows x 3 cols) arrangement without LIVE 60 FPS badge',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          profileStorageProvider.overrideWithValue(InMemoryProfileStorageService()),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport),
          ),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(makeTestPacket()),
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
                child: FabricaFlapVisualizerWidget(
                  config: AirWidgetConfig(
                    type: 'visualizer',
                    title: 'Fabrica Arrangement',
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('FABRICA ARRANGEMENT'), findsOneWidget);
      expect(find.text('LIVE 60 FPS'), findsNothing);
      expect(find.text('12/32 • 4/16 M'), findsNothing);
      expect(find.text('EDIT ARRANGEMENT'), findsOneWidget);
      expect(find.text('ADD PANEL'), findsNothing);
      expect(find.text('3/6'), findsNothing);
      expect(find.text('4/6'), findsNothing);
      expect(find.text('CONTROLLER'), findsOneWidget);
      expect(find.text('1'), findsAtLeastNWidgets(1));
      expect(find.text('2'), findsAtLeastNWidgets(1));
      expect(find.text('3'), findsAtLeastNWidgets(1));
      expect(find.text('4'), findsAtLeastNWidgets(1));

      // Default 3x4 grid (4 rows x 3 cols) has panels numbered #1..#12 starting from top
      for (int i = 1; i <= 12; i++) {
        expect(find.text('#$i'), findsOneWidget);
      }

      // Default panel config: 6 motorized (#1,6,7,8,11,12), 2 base (#2,5), 4 follower (#3,4,9,10)
      final arr = container.read(fabricaArrangementProvider);
      expect(arr.motorizedCount, equals(6));
      for (final p in arr.panels) {
        final num = arr.flapNumberForPanel(p.id);
        if ({1, 6, 7, 8, 11, 12}.contains(num)) {
          expect(p.type, equals(FabricaPanelType.motorized));
        } else if ({2, 5}.contains(num)) {
          expect(p.type, equals(FabricaPanelType.base));
        } else {
          expect(p.type, equals(FabricaPanelType.follower));
        }
      }

      // Tapping motorized panel #6 while Step 1 ([0]) is selected adds Ch 2 (Channel 3, 2 motors max)
      await tester.tap(find.text('#6'));
      await tester.pump();
      expect(container.read(sequencerProgrammingProvider).draftSteps[0], equals([0, 2]));

      // Add empty Step 5 and tap #1 then #6 to populate it; tapping #7 is blocked at max 2
      container.read(sequencerProgrammingProvider.notifier).addEmptyStep();
      await tester.pump();
      await tester.tap(find.text('#1'));
      await tester.pump();
      await tester.tap(find.text('#6'));
      await tester.pump();
      await tester.tap(find.text('#7'));
      await tester.pump();
      final steps = container.read(sequencerProgrammingProvider).steps;
      expect(steps.length, equals(5));
      expect(steps.last.motorCount, equals(2));

      // Open Edit Arrangement screen and expand columns/rows up to 6x6 max
      await tester.tap(find.text('EDIT ARRANGEMENT'));
      await tester.pumpAndSettle();

      expect(find.text('Edit Fabrica Arrangement'), findsOneWidget);
      expect(find.text('ADD PANEL'), findsOneWidget);
      expect(find.text('3/6'), findsOneWidget);
      expect(find.text('4/6'), findsOneWidget);

      for (int c = 3; c < 6; c++) {
        await tester.tap(find.byTooltip('Add Column (Max 6)'));
        await tester.pump();
      }
      for (int r = 4; r < 6; r++) {
        await tester.tap(find.byTooltip('Add Row (Max 6)'));
        await tester.pump();
      }
      expect(find.text('6/6'), findsNWidgets(2));
    });

    testWidgets('adds panels of 3 types and enforces 32 total / 16 motorized',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          profileStorageProvider.overrideWithValue(InMemoryProfileStorageService()),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport),
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
                child: FabricaFlapVisualizerWidget(
                  config: AirWidgetConfig(
                    type: 'visualizer',
                    title: 'Fabrica Arrangement',
                  ),
                  isEditable: true,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Add a Motorized Assembly via UI
      await tester.tap(find.text('ADD PANEL'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.text('Motorized Assembly'), findsOneWidget);
      expect(find.text('Follower Assembly'), findsOneWidget);
      expect(find.text('Base Assembly'), findsOneWidget);

      await tester.tap(find.text('Motorized Assembly'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      expect(container.read(fabricaArrangementProvider).totalCount, equals(13));
      expect(container.read(fabricaArrangementProvider).motorizedCount, equals(7));
      expect(find.text('#13'), findsOneWidget);

      // Verify notifier limits: max 16 motorized, max 32 total
      final notifier = container.read(fabricaArrangementProvider.notifier);
      for (int i = 0; i < 9; i++) {
        expect(notifier.addPanel(FabricaPanelType.motorized), isNull);
      }
      // 17th motorized should fail
      expect(notifier.addPanel(FabricaPanelType.motorized), isNotNull);

      // Fill remaining up to 32 with base assemblies
      while (container.read(fabricaArrangementProvider).totalCount < 32) {
        expect(notifier.addPanel(FabricaPanelType.base), isNull);
      }
      // 33rd total panel should fail
      expect(notifier.addPanel(FabricaPanelType.follower), isNotNull);
    });

    testWidgets('selects panel to resize, change type, and remove',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          profileStorageProvider.overrideWithValue(InMemoryProfileStorageService()),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport),
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
                child: FabricaFlapVisualizerWidget(
                  config: AirWidgetConfig(
                    type: 'visualizer',
                    title: 'Fabrica Arrangement',
                  ),
                  isEditable: true,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Tap panel #3 (Follower)
      await tester.tap(find.text('#3'));
      await tester.pump();

      expect(find.text('FLAP #3 • FOLLOWER ASSEMBLY'), findsOneWidget);
      expect(find.text('REMOVE'), findsOneWidget);

      // Remove panel #3 -> total drops to 11
      await tester.tap(find.text('REMOVE'));
      await tester.pump();

      expect(container.read(fabricaArrangementProvider).totalCount, equals(11));

      // Removing a column with panels prompts confirmation and deletes panels in that column
      await tester.tap(find.byTooltip('Remove Column'));
      await tester.pumpAndSettle();
      expect(find.text('Remove Column 3?'), findsOneWidget);
      await tester.tap(find.text('DELETE & REMOVE'));
      await tester.pumpAndSettle();
      expect(container.read(fabricaArrangementProvider).gridColumns, equals(2));
      expect(container.read(fabricaArrangementProvider).totalCount, equals(8));

      // Verify removing a panel does NOT rearrange other panels' (row, col)
      final notifier = container.read(fabricaArrangementProvider.notifier);
      final panel7Before = container
          .read(fabricaArrangementProvider)
          .panels
          .firstWhere((p) => p.id == 7);
      expect(panel7Before.row, equals(1));
      expect(panel7Before.col, equals(0));

      // Remove panel #1 (bottom-left at (3, 0)) -> panel #7 must stay at (1, 0)
      notifier.removePanel(1);
      final panel7After = container
          .read(fabricaArrangementProvider)
          .panels
          .firstWhere((p) => p.id == 7);
      expect(panel7After.row, equals(1));
      expect(panel7After.col, equals(0));

      // Move panel #7 into the empty (3, 0) slot
      notifier.movePanelToCell(7, 3, 0);
      final panel7Moved = container
          .read(fabricaArrangementProvider)
          .panels
          .firstWhere((p) => p.id == 7);
      expect(panel7Moved.row, equals(3));
      expect(panel7Moved.col, equals(0));
    });

    testWidgets(
        'motor panel bottom editor shows all channels (1-16) and swaps when selecting an assigned channel',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          profileStorageProvider
              .overrideWithValue(InMemoryProfileStorageService()),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport),
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
                child: FabricaFlapVisualizerWidget(
                  config: AirWidgetConfig(
                    type: 'visualizer',
                    title: 'Fabrica Arrangement',
                  ),
                  isEditable: true,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Default arrangement: panel #1 has Channel 1 (0), panel #7 has Channel 2 (1).
      // Tap motor panel #1 (Channel 1).
      await tester.tap(find.text('#1'));
      await tester.pump();

      final dropdownFinder = find.byKey(const Key('motor_channel_dropdown'));
      expect(dropdownFinder, findsOneWidget);

      // Open dropdown menu
      await tester.tap(dropdownFinder);
      await tester.pumpAndSettle();

      // All channels 1..16 are present in the dropdown (Channel 2 & Channel 10 visible)
      expect(find.text('Channel 2'), findsWidgets);
      expect(find.text('Channel 16'), findsWidgets);

      // Select Channel 2 (already assigned to panel #7) -> should swap channels!
      await tester.tap(find.text('Channel 2').last);
      await tester.pumpAndSettle();

      final panelsAfterSwap = container.read(fabricaArrangementProvider).panels;
      final panel1AfterSwap = panelsAfterSwap.firstWhere((p) => p.id == 1);
      final panel7AfterSwap = panelsAfterSwap.firstWhere((p) => p.id == 7);
      expect(panel1AfterSwap.motorChannel, equals(1));
      expect(panel7AfterSwap.motorChannel, equals(0));

      // Selecting an unassigned channel (Channel 10 -> 9) updates panel #1
      await tester.tap(dropdownFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Channel 10').last);
      await tester.pumpAndSettle();

      final panel1AfterUnused = container
          .read(fabricaArrangementProvider)
          .panels
          .firstWhere((p) => p.id == 1);
      expect(panel1AfterUnused.motorChannel, equals(9));
    });
  });
}
