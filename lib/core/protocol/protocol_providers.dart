import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ble/ble_providers.dart';
import '../ble/ble_transport_interface.dart';
import 'command_pipeline.dart';
import 'routine_models.dart';
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
        } else {
          bus.stop();
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

/// Stream of live synchronized [ButtonConfigTable] button routines from FAB3.
final buttonConfigProvider = StreamProvider.autoDispose<ButtonConfigTable>((ref) {
  final transport = ref.watch(bleTransportProvider);
  final connState = ref.watch(bleConnectionStateProvider).value ??
      BleConnectionState.disconnected;

  if (connState != BleConnectionState.ready) {
    return const Stream.empty();
  }

  return transport
      .subscribeCharacteristic(BleUuids.charButtonConfig)
      .where((bytes) => bytes.length >= ButtonConfigTable.totalBytes)
      .map((bytes) => ButtonConfigTable.fromBytes(bytes));
});

/// Tracks whether telemetry streaming from the robot is actively enabled or paused (Opcode 0x11).
class TelemetryStreamActiveNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  void setStreamActive(bool active) {
    state = active;
  }
}

final isTelemetryStreamActiveProvider =
    NotifierProvider<TelemetryStreamActiveNotifier, bool>(
  TelemetryStreamActiveNotifier.new,
);
