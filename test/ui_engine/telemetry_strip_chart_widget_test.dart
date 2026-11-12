import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:air_robotics_app/ui_engine/widget_catalog/telemetry_strip_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

TelemetryPacket makeTestPacket({
  required int seq,
  required List<int> angles,
}) {
  return TelemetryPacket(
    systemState: SystemState.runningMotion,
    ledState: LedState.running,
    activeButtonId: 0,
    currentStepIdx: 0,
    totalSteps: 0,
    stepProgressPct: 0,
    elapsedStepTimeMs: 0,
    channelAngles: angles,
    lastCmdStatus: CmdStatus.ok,
    freeHeapKb: 200,
    bleRssiDbm: -60,
    errorCode: 0,
    sequenceCounter: seq,
  );
}

void main() {
  group('TelemetryStripChartWidget Tests', () {
    testWidgets('renders legend, ingests rolling samples, and paints trajectories', (tester) async {
      final mockTransport = MockBleTransport();
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: TelemetryStripChartWidget(
                  config: AirWidgetConfig(
                    type: 'telemetry-strip-chart',
                    title: 'Live Angles',
                    props: {'window_seconds': 5},
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('LIVE ANGLES'), findsOneWidget);
      expect(find.text('5s window'), findsOneWidget);

      // Ingest sample 1
      container.read(telemetryBusProvider).ingestBytes(
        makeTestPacket(seq: 1, angles: [30, 60, 90, 120]).toBytes(),
      );
      await tester.pump(const Duration(milliseconds: 50));

      // Ingest sample 2 (so samples.length >= 2, triggering path rendering)
      container.read(telemetryBusProvider).ingestBytes(
        makeTestPacket(seq: 2, angles: [45, 75, 105, 135]).toBytes(),
      );
      await tester.pump(const Duration(milliseconds: 50));
      await tester.pumpAndSettle();

      expect(find.byType(CustomPaint), findsWidgets);
    });
  });
}
