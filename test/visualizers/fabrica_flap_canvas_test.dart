import 'dart:async';
import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/core/protocol/command_pipeline.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:air_robotics_app/visualizers/fabrica/fabrica_flap_canvas.dart';
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

    testWidgets('renders title, live badge, and flap angle badges at 0 degrees',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 800));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
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
                    title: 'Kinematic Flap Canvas',
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('KINEMATIC FLAP CANVAS'), findsOneWidget);
      expect(find.text('LIVE 60 FPS'), findsOneWidget);
      expect(find.text('LEFT (CH 0)'), findsOneWidget);
      expect(find.text('RIGHT (CH 1)'), findsOneWidget);
      expect(find.text('BOTTOM (CH 2)'), findsOneWidget);
      expect(find.text('TOP (CH 3)'), findsOneWidget);
      expect(find.text('0°'), findsNWidgets(4));
      expect(find.byType(CustomPaint), findsWidgets);
    });

    testWidgets('shows CALIBRATION JOG ON badge when systemState is calibrating',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 800));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport),
          ),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(
              makeTestPacket(state: SystemState.calibrating),
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
                child: FabricaFlapVisualizerWidget(
                  config: AirWidgetConfig(
                    type: 'visualizer',
                    title: 'Kinematic Flap Canvas',
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('CALIBRATION JOG ON'), findsOneWidget);
    });

    testWidgets('interpolates and updates flap badges on telemetry stream updates',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 800));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final streamController = StreamController<TelemetryPacket>.broadcast();
      addTearDown(streamController.close);

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport),
          ),
          latestTelemetryProvider.overrideWith(
            (ref) => streamController.stream,
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
                    title: 'Kinematic Flap Canvas',
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      // Emit initial packet: 0°
      streamController.add(makeTestPacket(sequence: 1));
      await tester.pumpAndSettle();
      expect(find.text('0°'), findsNWidgets(4));

      // Emit new packet with Ch 0 at 175° and Ch 1 at 45°
      final angles = List<int>.filled(16, 0);
      angles[0] = 175;
      angles[1] = 45;
      streamController.add(makeTestPacket(sequence: 2, channelAngles: angles));

      // Pump 120ms to allow interpolation controller to finish
      await tester.pump(const Duration(milliseconds: 120));
      await tester.pumpAndSettle();

      expect(find.text('175°'), findsOneWidget);
      expect(find.text('45°'), findsOneWidget);
    });

    testWidgets('handles pan drag gesture and dispatches jog command',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 800));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport),
          ),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(makeTestPacket(state: SystemState.calibrating)),
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
                    title: 'Kinematic Flap Canvas',
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find the interactive GestureDetector on the canvas
      final gestureFinder = find.byType(GestureDetector).first;
      expect(gestureFinder, findsOneWidget);

      // Touch drag on the left flap area
      // Canvas center is (width/2, 120) relative to canvas top-left
      final canvasOrigin = tester.getTopLeft(gestureFinder);
      final leftFlapPos = canvasOrigin + const Offset(120, 120);

      final gesture = await tester.startGesture(leftFlapPos);
      await tester.pump();
      await gesture.moveBy(const Offset(30, 0));
      await tester.pump(const Duration(milliseconds: 60));
      await gesture.up();
      await tester.pumpAndSettle();

      // Check if command was dispatched to transport
      final written = mockTransport.writtenControlPointPayloads;
      expect(written.isNotEmpty, isTrue);
      // Jog motor opcode is 0x0D (BleOpcode.jogMotorAngle)
      expect(written.first[0], 0x0D);
    });
  });
}
