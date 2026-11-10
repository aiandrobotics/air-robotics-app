import 'dart:typed_data';

import 'routine_models.dart';

/// Wire opcodes matching `ble_opcode_t` in `firmware/main/ble_transport.h`.
enum BleOpcode {
  runPreset(0x00),
  runRawSequence(0x01),
  stopSequence(0x02),
  emergencyStop(0x03),
  setButtonSequence(0x0A),
  getButtonConfig(0x0B),
  restoreFactoryPresets(0x0C),
  jogMotorAngle(0x0D),
  identifyRobot(0x0E),
  getTelemetry(0x10),
  setTelemetryStream(0x11);

  final int value;
  const BleOpcode(this.value);
}

/// Serializes high-level commands into raw binary payloads for dispatching
/// across the FAB1 Control Point characteristic.
class CommandBuilder {
  CommandBuilder._();

  /// Builds opcode `0x00` [presetId]: Trigger a saved physical button preset (1 to 4).
  static Uint8List buildRunPreset(int presetId) {
    if (presetId < 1 || presetId > 4) {
      throw RangeError.range(presetId, 1, 4, 'presetId', 'Preset slot must be 1 to 4');
    }
    return Uint8List.fromList([BleOpcode.runPreset.value, presetId]);
  }

  /// Builds opcode `0x01` [routine]: Run an unsaved sequence payload directly.
  ///
  /// Can use either full 53-byte [FoldRoutine] or compact wire representation.
  static Uint8List buildRunRawSequence(FoldRoutine routine, {bool compact = false}) {
    final routineBytes = compact ? routine.toCompactBytes() : routine.toBytes();
    final buffer = Uint8List(1 + routineBytes.length);
    buffer[0] = BleOpcode.runRawSequence.value;
    buffer.setRange(1, buffer.length, routineBytes);
    return buffer;
  }

  /// Builds opcode `0x02`: Cleanly stop active sequence or exit calibration.
  static Uint8List buildStopSequence() {
    return Uint8List.fromList([BleOpcode.stopSequence.value]);
  }

  /// Builds opcode `0x03`: Hard Emergency Stop abort (<50ms execution on robot).
  static Uint8List buildEmergencyStop() {
    return Uint8List.fromList([BleOpcode.emergencyStop.value]);
  }

  /// Builds opcode `0x0A` [presetId] [routine]: Persist a custom routine into
  /// physical button slot [presetId] (1 to 4) in NVS flash.
  static Uint8List buildSetButtonSequence(
    int presetId,
    FoldRoutine routine, {
    bool compact = false,
  }) {
    if (presetId < 1 || presetId > 4) {
      throw RangeError.range(presetId, 1, 4, 'presetId', 'Preset slot must be 1 to 4');
    }
    final routineBytes = compact ? routine.toCompactBytes() : routine.toBytes();
    final buffer = Uint8List(2 + routineBytes.length);
    buffer[0] = BleOpcode.setButtonSequence.value;
    buffer[1] = presetId;
    buffer.setRange(2, buffer.length, routineBytes);
    return buffer;
  }

  /// Builds opcode `0x0B`: Request full button configuration table notification.
  static Uint8List buildGetButtonConfig() {
    return Uint8List.fromList([BleOpcode.getButtonConfig.value]);
  }

  /// Builds opcode `0x0C`: One-tap restore of all 4 factory garment presets.
  static Uint8List buildRestoreFactoryPresets() {
    return Uint8List.fromList([BleOpcode.restoreFactoryPresets.value]);
  }

  /// Builds opcode `0x0D` [channel] [angleDeg]: Calibration jog.
  ///
  /// - [channel]: Servo index (0 to 15)
  /// - [angleDeg]: Desired position ($0^\circ$ to $180^\circ$)
  static Uint8List buildJogMotor({
    required int channel,
    required int angleDeg,
  }) {
    if (channel < 0 || channel > 15) {
      throw RangeError.range(channel, 0, 15, 'channel', 'Channel must be 0 to 15');
    }
    if (angleDeg < 0 || angleDeg > 180) {
      throw RangeError.range(angleDeg, 0, 180, 'angleDeg', 'Angle must be 0 to 180 degrees');
    }
    return Uint8List.fromList([
      BleOpcode.jogMotorAngle.value,
      channel,
      angleDeg,
    ]);
  }

  /// Builds opcode `0x0E`: Visual locator LED flash train on physical hardware.
  static Uint8List buildIdentifyRobot() {
    return Uint8List.fromList([BleOpcode.identifyRobot.value]);
  }

  /// Builds opcode `0x10`: Single snapshot telemetry request.
  static Uint8List buildGetTelemetry() {
    return Uint8List.fromList([BleOpcode.getTelemetry.value]);
  }

  /// Builds opcode `0x11` [enable]: Enable or disable active telemetry streaming.
  static Uint8List buildSetTelemetryStream(bool enable) {
    return Uint8List.fromList([
      BleOpcode.setTelemetryStream.value,
      enable ? 1 : 0,
    ]);
  }
}
