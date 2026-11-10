import 'package:air_robotics_app/core/protocol/command_builder.dart';
import 'package:air_robotics_app/core/protocol/routine_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CommandBuilder Serialization', () {
    test('buildRunPreset serializes opcode 0x00 with valid slot', () {
      final cmd1 = CommandBuilder.buildRunPreset(1);
      expect(cmd1, equals([0x00, 0x01]));

      final cmd4 = CommandBuilder.buildRunPreset(4);
      expect(cmd4, equals([0x00, 0x04]));

      expect(() => CommandBuilder.buildRunPreset(0), throwsRangeError);
      expect(() => CommandBuilder.buildRunPreset(5), throwsRangeError);
    });

    test('buildStopSequence serializes opcode 0x02', () {
      final cmd = CommandBuilder.buildStopSequence();
      expect(cmd, equals([0x02]));
    });

    test('buildEmergencyStop serializes fast-path opcode 0x03', () {
      final cmd = CommandBuilder.buildEmergencyStop();
      expect(cmd, equals([0x03]));
    });

    test('buildRestoreFactoryPresets serializes opcode 0x0C', () {
      final cmd = CommandBuilder.buildRestoreFactoryPresets();
      expect(cmd, equals([0x0C]));
    });

    test('buildJogMotor serializes opcode 0x0D with channel and degree', () {
      final cmd = CommandBuilder.buildJogMotor(channel: 2, angleDeg: 120);
      expect(cmd, equals([0x0D, 0x02, 120]));

      expect(
        () => CommandBuilder.buildJogMotor(channel: 16, angleDeg: 90),
        throwsRangeError,
      );
      expect(
        () => CommandBuilder.buildJogMotor(channel: 0, angleDeg: 181),
        throwsRangeError,
      );
    });

    test('buildIdentifyRobot serializes opcode 0x0E', () {
      final cmd = CommandBuilder.buildIdentifyRobot();
      expect(cmd, equals([0x0E]));
    });

    test('buildGetTelemetry serializes opcode 0x10', () {
      final cmd = CommandBuilder.buildGetTelemetry();
      expect(cmd, equals([0x10]));
    });

    test('buildSetTelemetryStream serializes opcode 0x11 with toggle flag', () {
      final cmdEnable = CommandBuilder.buildSetTelemetryStream(true);
      expect(cmdEnable, equals([0x11, 0x01]));

      final cmdDisable = CommandBuilder.buildSetTelemetryStream(false);
      expect(cmdDisable, equals([0x11, 0x00]));
    });

    test('buildRunRawSequence serializes opcode 0x01 with 53-byte payload', () {
      final routine = FoldRoutine.create([
        FoldStep.single(0),
        FoldStep.dual(1, 2),
      ]);

      final cmd = CommandBuilder.buildRunRawSequence(routine);
      expect(cmd.length, equals(1 + FoldRoutine.binaryLength));
      expect(cmd[0], equals(0x01));
      expect(cmd[1], equals(2)); // step_count = 2
    });

    test('buildSetButtonSequence serializes opcode 0x0A with slot and routine', () {
      final routine = FoldRoutine.create([
        FoldStep.single(3),
      ]);

      final cmd = CommandBuilder.buildSetButtonSequence(2, routine);
      expect(cmd.length, equals(2 + FoldRoutine.binaryLength));
      expect(cmd[0], equals(0x0A));
      expect(cmd[1], equals(2)); // preset_id = 2
      expect(cmd[2], equals(1)); // step_count = 1
    });
  });
}
