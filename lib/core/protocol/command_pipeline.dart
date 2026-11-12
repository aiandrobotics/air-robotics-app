import 'dart:async';
import 'dart:typed_data';

import '../ble/ble_transport_interface.dart';
import 'command_builder.dart';
import 'routine_models.dart';
import 'telemetry_bus.dart';
import 'telemetry_packet.dart';

/// Exception thrown when a robot rejects a command with an error status.
class CommandExecutionException implements Exception {
  final CmdStatus status;
  final String message;

  CommandExecutionException(this.status, [String? message])
      : message = message ??
            'Command rejected with status: ${status.name} (code ${status.value})';

  @override
  String toString() => 'CommandExecutionException: $message';
}

/// Dispatches structured protocol commands to the robot across the FAB1 Control Point,
/// verifies execution status via FAB2 telemetry acknowledgments, and provides an
/// unqueued fast-path Emergency Stop bypass.
class CommandPipeline {
  final BleTransport transport;
  final TelemetryBus? telemetryBus;

  CommandPipeline({
    required this.transport,
    this.telemetryBus,
  });

  /// Immediate fast-path Emergency Stop (<50ms execution).
  ///
  /// Dispatches opcode `0x03` directly using GATT Write Without Response,
  /// bypassing any command queue, mutex, or telemetry acknowledgment loop.
  Future<void> emergencyStop() async {
    final payload = CommandBuilder.buildEmergencyStop();
    await transport.writeControlPoint(payload, withoutResponse: true);
  }

  /// Sends a raw command payload to FAB1 and waits for confirmation via incoming telemetry.
  ///
  /// If [telemetryBus] is provided, this method waits for the next telemetry packet
  /// to verify [TelemetryPacket.lastCmdStatus]. Throws a [CommandExecutionException]
  /// if the status is not [CmdStatus.ok], or [TimeoutException] if no packet arrives
  /// within [timeout].
  Future<void> sendCommand(
    Uint8List commandBytes, {
    Duration timeout = const Duration(milliseconds: 1500),
  }) async {
    // If telemetry bus is absent, perform direct write
    if (telemetryBus == null) {
      await transport.writeControlPoint(commandBytes, withoutResponse: false);
      return;
    }

    // Set up listener for the subsequent packet before dispatching to prevent race condition
    final ackFuture = telemetryBus!.packetStream.first.timeout(
      timeout,
      onTimeout: () => throw TimeoutException(
        'Command timed out waiting for ACK from FAB2',
        timeout,
      ),
    );

    await transport.writeControlPoint(commandBytes, withoutResponse: false);

    final ackPacket = await ackFuture;
    if (ackPacket.lastCmdStatus != CmdStatus.ok) {
      throw CommandExecutionException(ackPacket.lastCmdStatus);
    }
  }

  /// Triggers a saved folding routine (preset 1 to 4).
  Future<void> runPreset(int presetId) async {
    final payload = CommandBuilder.buildRunPreset(presetId);
    await sendCommand(payload);
  }

  /// Executes an unsaved folding routine directly in RAM.
  Future<void> runRawSequence(
    FoldRoutine routine, {
    bool compact = false,
  }) async {
    final payload = CommandBuilder.buildRunRawSequence(routine, compact: compact);
    await sendCommand(payload);
  }

  /// Commits a folding routine into persistent NVS flash assigned to physical button [presetId] (1 to 4).
  Future<void> setButtonSequence(
    int presetId,
    FoldRoutine routine, {
    bool compact = false,
  }) async {
    final payload = CommandBuilder.buildSetButtonSequence(
      presetId,
      routine,
      compact: compact,
    );
    await sendCommand(payload);
  }

  /// Cleanly stops active motion, clears latched E-Stop, or exits calibration mode.
  Future<void> stopSequence({bool withoutResponse = true}) async {
    final payload = CommandBuilder.buildStopSequence();
    if (withoutResponse) {
      await transport.writeControlPoint(payload, withoutResponse: true);
    } else {
      await sendCommand(payload);
    }
  }

  /// Triggers a 3-second rapid visual pulse train on the robot's LED.
  Future<void> identifyRobot({bool withoutResponse = true}) async {
    final payload = CommandBuilder.buildIdentifyRobot();
    if (withoutResponse) {
      await transport.writeControlPoint(payload, withoutResponse: true);
    } else {
      await sendCommand(payload);
    }
  }

  /// Jogs a single motor channel to a target angle (0° to 180°).
  ///
  /// Uses Write Without Response by default for <20ms real-time dragging latency.
  Future<void> jogMotor({
    required int channel,
    required int angleDeg,
    bool withoutResponse = true,
  }) async {
    final payload = CommandBuilder.buildJogMotor(
      channel: channel,
      angleDeg: angleDeg,
    );
    if (withoutResponse) {
      await transport.writeControlPoint(payload, withoutResponse: true);
    } else {
      await sendCommand(payload);
    }
  }

  /// Enables or disables periodic BLE telemetry notifications on the robot.
  Future<void> setTelemetryStream(bool enable) async {
    final payload = CommandBuilder.buildSetTelemetryStream(enable);
    await sendCommand(payload);
  }

  /// Requests an immediate single-shot 31-byte telemetry snapshot on FAB2 (Opcode 0x10).
  Future<void> getTelemetry() async {
    final payload = CommandBuilder.buildGetTelemetry();
    await sendCommand(payload);
  }

  /// Requests a full 212-byte button sequence configuration table push on FAB3 (Opcode 0x0B).
  Future<void> getButtonConfig() async {
    final payload = CommandBuilder.buildGetButtonConfig();
    await sendCommand(payload);
  }

  /// Restores all 4 garment folding presets to factory defaults (Opcode 0x0C).
  ///
  /// Leaves BLE security bonds untouched.
  Future<void> restoreFactoryPresets() async {
    final payload = CommandBuilder.buildRestoreFactoryPresets();
    await sendCommand(payload);
  }

  /// Dispatches full factory reset (Opcode 0x1F).
  ///
  /// Wipes all folding routines in flash, homes servos, and purges all BLE bonds
  /// from hardware flash before the robot disconnects and re-enters pairing mode.
  Future<void> factoryResetAll() async {
    final payload = CommandBuilder.buildFactoryResetAll();
    try {
      await transport.writeControlPoint(payload, withoutResponse: false);
    } catch (_) {
      try {
        await transport.writeControlPoint(payload, withoutResponse: true);
      } catch (_) {}
    }
  }

  /// Dispatches an arbitrary raw byte payload to the FAB1 control point.
  Future<void> sendRawControlPoint(
    Uint8List bytes, {
    bool withoutResponse = false,
  }) async {
    await transport.writeControlPoint(bytes, withoutResponse: withoutResponse);
  }
}
