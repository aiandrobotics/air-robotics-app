import 'dart:typed_data';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TelemetryPacket 31-Byte Codec', () {
    test('enforces exact 31-byte frame length', () {
      expect(
        () => TelemetryPacket.fromBytes(Uint8List(30)),
        throwsArgumentError,
      );
      expect(
        () => TelemetryPacket.fromBytes(Uint8List(32)),
        throwsArgumentError,
      );
    });

    test('decodes all packed fields with bit-exact parity', () {
      final raw = Uint8List(31);
      final byteData = ByteData.sublistView(raw);

      raw[0] = 1; // system_state = RUNNING_MOTION
      raw[1] = 6; // led_state = CONNECTED
      raw[2] = 2; // active_button_id = 2
      raw[3] = 3; // current_step_idx = 3
      raw[4] = 8; // total_steps = 8
      raw[5] = 75; // step_progress_pct = 75%
      byteData.setUint16(6, 1250, Endian.little); // elapsed_step_time_ms = 1250ms

      // Set 16 channel angles (e.g. 0 to 15 * 10)
      for (var i = 0; i < 16; i++) {
        raw[8 + i] = (i * 10) & 0xFF;
      }

      raw[24] = 0; // last_cmd_status = OK
      byteData.setUint16(25, 215, Endian.little); // free_heap_kb = 215 KB
      byteData.setInt8(27, -68); // ble_rssi_dbm = -68 dBm
      raw[28] = 0x05; // error_code = BIT0 (I2C) | BIT2 (ESTOP)
      byteData.setUint16(29, 42000, Endian.little); // sequence_counter = 42000

      final packet = TelemetryPacket.fromBytes(raw);

      expect(packet.systemState, equals(SystemState.runningMotion));
      expect(packet.ledState, equals(LedState.connected));
      expect(packet.activeButtonId, equals(2));
      expect(packet.currentStepIdx, equals(3));
      expect(packet.totalSteps, equals(8));
      expect(packet.stepProgressPct, equals(75));
      expect(packet.elapsedStepTimeMs, equals(1250));

      // Validate channels
      expect(packet.channelAngles.length, equals(16));
      expect(packet.leftFlapAngle, equals(0));
      expect(packet.rightFlapAngle, equals(10));
      expect(packet.bottomFlapAngle, equals(20));
      expect(packet.topFlapAngle, equals(30));

      expect(packet.lastCmdStatus, equals(CmdStatus.ok));
      expect(packet.freeHeapKb, equals(215));
      expect(packet.bleRssiDbm, equals(-68));
      expect(packet.errorCode, equals(0x05));
      expect(packet.sequenceCounter, equals(42000));

      // Convenience getters
      expect(packet.isEstopActive, isTrue);
      expect(packet.isI2cFault, isTrue);
      expect(packet.isNvsFault, isFalse);
      expect(packet.isMotionActive, isTrue);
    });

    test('encodes and decodes identically in roundtrip serialization', () {
      const original = TelemetryPacket(
        systemState: SystemState.calibrating,
        ledState: LedState.pairing,
        activeButtonId: 1,
        currentStepIdx: 0,
        totalSteps: 4,
        stepProgressPct: 25,
        elapsedStepTimeMs: 450,
        channelAngles: [
          45, 90, 135, 180, 0, 0, 0, 0,
          0, 0, 0, 0, 0, 0, 0, 0,
        ],
        lastCmdStatus: CmdStatus.ok,
        freeHeapKb: 198,
        bleRssiDbm: -54,
        errorCode: 0,
        sequenceCounter: 1024,
      );

      final encoded = original.toBytes();
      expect(encoded.length, equals(31));

      final decoded = TelemetryPacket.fromBytes(encoded);
      expect(decoded.systemState, equals(original.systemState));
      expect(decoded.ledState, equals(original.ledState));
      expect(decoded.activeButtonId, equals(original.activeButtonId));
      expect(decoded.currentStepIdx, equals(original.currentStepIdx));
      expect(decoded.totalSteps, equals(original.totalSteps));
      expect(decoded.stepProgressPct, equals(original.stepProgressPct));
      expect(decoded.elapsedStepTimeMs, equals(original.elapsedStepTimeMs));
      expect(decoded.channelAngles, equals(original.channelAngles));
      expect(decoded.lastCmdStatus, equals(original.lastCmdStatus));
      expect(decoded.freeHeapKb, equals(original.freeHeapKb));
      expect(decoded.bleRssiDbm, equals(original.bleRssiDbm));
      expect(decoded.errorCode, equals(original.errorCode));
      expect(decoded.sequenceCounter, equals(original.sequenceCounter));
    });
  });
}
