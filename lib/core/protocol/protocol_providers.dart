import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ble/ble_providers.dart';
import '../ble/ble_transport_interface.dart';
import 'command_pipeline.dart';
import 'telemetry_bus.dart';
import 'telemetry_packet.dart';

/// Provider for the singleton reactive [TelemetryBus].
final telemetryBusProvider = Provider<TelemetryBus>((ref) {
  final transport = ref.watch(bleTransportProvider);
  final bus = TelemetryBus(transport: transport);

  ref.listen<AsyncValue<BleConnectionState>>(
    bleConnectionStateProvider,
    (previous, next) {
      next.whenData((state) {
        if (state == BleConnectionState.ready) {
          bus.start();
        } else if (state == BleConnectionState.disconnected) {
          bus.stop();
          bus.resetMetrics();
        }
      });
    },
    fireImmediately: true,
  );

  ref.onDispose(() => bus.dispose());
  return bus;
});

/// Stream of incoming [TelemetryPacket] instances from the active robot.
final latestTelemetryProvider =
    StreamProvider.autoDispose<TelemetryPacket>((ref) {
  final bus = ref.watch(telemetryBusProvider);
  return bus.packetStream;
});

/// Stream of real-time [TelemetryMetrics] (frequency, drops, packet counts).
final telemetryMetricsProvider =
    StreamProvider.autoDispose<TelemetryMetrics>((ref) {
  final bus = ref.watch(telemetryBusProvider);
  return bus.metricsStream;
});

/// Provider for the [CommandPipeline] controlling robot actions.
final commandPipelineProvider = Provider<CommandPipeline>((ref) {
  final transport = ref.watch(bleTransportProvider);
  final bus = ref.watch(telemetryBusProvider);
  return CommandPipeline(transport: transport, telemetryBus: bus);
});
