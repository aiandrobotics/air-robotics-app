import 'dart:async';
import 'dart:typed_data';

import 'package:air_robotics_app/core/protocol/command_pipeline.dart';
import 'package:air_robotics_app/core/protocol/telemetry_bus.dart';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

TelemetryPacket makeAckPacket({
  CmdStatus status = CmdStatus.ok,
  int sequence = 1,
}) {
  return TelemetryPacket(
    systemState: SystemState.idle,
    ledState: LedState.idle,
    activeButtonId: 0,
    currentStepIdx: 0,
    totalSteps: 0,
    stepProgressPct: 0,
    elapsedStepTimeMs: 0,
    channelAngles: List<int>.filled(16, 0),
    lastCmdStatus: status,
    freeHeapKb: 200,
    bleRssiDbm: -55,
    errorCode: 0,
    sequenceCounter: sequence,
  );
}

void main() {
  group('CommandPipeline Execution & Acknowledgment Tests', () {
    late MockBleTransport mockTransport;
    late TelemetryBus telemetryBus;
    late CommandPipeline pipeline;

    setUp(() {
      mockTransport = MockBleTransport();
      telemetryBus = TelemetryBus(transport: mockTransport);
      telemetryBus.start();
      pipeline = CommandPipeline(
        transport: mockTransport,
        telemetryBus: telemetryBus,
      );
    });

    tearDown(() {
      telemetryBus.dispose();
      mockTransport.dispose();
    });

    test('emergencyStop dispatches fast-path without response immediately', () async {
      await pipeline.emergencyStop();

      expect(mockTransport.writtenControlPointPayloads.length, equals(1));
      expect(mockTransport.writtenControlPointPayloads.first, equals([0x03]));
      expect(mockTransport.writtenControlPointNoResponse.first, isTrue);
    });

    test('runPreset dispatches opcode 0x00 and resolves on telemetry ACK', () async {
      final future = pipeline.runPreset(1);

      // Verify payload written
      expect(mockTransport.writtenControlPointPayloads.length, equals(1));
      expect(mockTransport.writtenControlPointPayloads.first, equals([0x00, 0x01]));
      expect(mockTransport.writtenControlPointNoResponse.first, isFalse);

      // Emit simulated robot ACK on FAB2
      telemetryBus.ingestBytes(makeAckPacket(status: CmdStatus.ok).toBytes());

      // Future should complete cleanly without error
      await expectLater(future, completes);
    });

    test('command throws CommandExecutionException when robot returns error status', () async {
      final future = pipeline.runPreset(2);

      // Emit simulated robot BUSY error on FAB2
      telemetryBus.ingestBytes(makeAckPacket(status: CmdStatus.errBusy).toBytes());

      expect(
        future,
        throwsA(
          isA<CommandExecutionException>().having(
            (e) => e.status,
            'status',
            equals(CmdStatus.errBusy),
          ),
        ),
      );
    });

    test('command throws TimeoutException when no telemetry arrives within deadline', () async {
      final future = pipeline.sendCommand(
        mockTransport.writtenControlPointPayloads.isNotEmpty
            ? mockTransport.writtenControlPointPayloads.first
            : Uint8List.fromList([0x0E]),
        timeout: const Duration(milliseconds: 50),
      );

      await expectLater(future, throwsA(isA<TimeoutException>()));
    });

    test('all helper methods serialize correct opcodes and arguments', () async {
      // 1. Stop sequence (0x02)
      final fStop = pipeline.stopSequence(withoutResponse: false);
      telemetryBus.ingestBytes(makeAckPacket().toBytes());
      await fStop;
      expect(mockTransport.writtenControlPointPayloads.last, equals([0x02]));

      // 2. Identify robot (0x0E)
      final fIdentify = pipeline.identifyRobot(withoutResponse: false);
      telemetryBus.ingestBytes(makeAckPacket().toBytes());
      await fIdentify;
      expect(mockTransport.writtenControlPointPayloads.last, equals([0x0E]));

      // 3. Jog motor (0x0D channel 3 angle 90, without response fast path)
      await pipeline.jogMotor(channel: 3, angleDeg: 90);
      expect(mockTransport.writtenControlPointPayloads.last, equals([0x0D, 0x03, 0x5A]));
      expect(mockTransport.writtenControlPointNoResponse.last, isTrue);

      // 4. Set telemetry stream (0x11 enable=true)
      final fTelem = pipeline.setTelemetryStream(true);
      telemetryBus.ingestBytes(makeAckPacket().toBytes());
      await fTelem;
      expect(mockTransport.writtenControlPointPayloads.last, equals([0x11, 0x01]));

      // 5. Restore factory presets (0x0C)
      final fRestore = pipeline.restoreFactoryPresets();
      telemetryBus.ingestBytes(makeAckPacket().toBytes());
      await fRestore;
      expect(mockTransport.writtenControlPointPayloads.last, equals([0x0C]));

      // 6. Get button config (0x0B)
      final fConfig = pipeline.getButtonConfig();
      telemetryBus.ingestBytes(makeAckPacket().toBytes());
      await fConfig;
      expect(mockTransport.writtenControlPointPayloads.last, equals([0x0B]));

      // 7. Get telemetry snapshot (0x10)
      final fSnapshot = pipeline.getTelemetry();
      telemetryBus.ingestBytes(makeAckPacket().toBytes());
      await fSnapshot;
      expect(mockTransport.writtenControlPointPayloads.last, equals([0x10]));

      // 8. Factory reset all (0x1F)
      await pipeline.factoryResetAll();
      expect(mockTransport.writtenControlPointPayloads.last, equals([0x1F]));
    });
  });
}
