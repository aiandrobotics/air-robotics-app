import 'dart:typed_data';

import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/core/protocol/telemetry_bus.dart';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

TelemetryPacket createPacket({
  required int sequenceCounter,
  SystemState systemState = SystemState.idle,
  int angle0 = 0,
  int angle1 = 0,
  int angle2 = 0,
  int angle3 = 0,
  CmdStatus lastCmdStatus = CmdStatus.ok,
}) {
  final angles = List<int>.filled(16, 0);
  angles[0] = angle0;
  angles[1] = angle1;
  angles[2] = angle2;
  angles[3] = angle3;

  return TelemetryPacket(
    systemState: systemState,
    ledState: LedState.idle,
    activeButtonId: 0,
    currentStepIdx: 0,
    totalSteps: 0,
    stepProgressPct: 0,
    elapsedStepTimeMs: 0,
    channelAngles: angles,
    lastCmdStatus: lastCmdStatus,
    freeHeapKb: 210,
    bleRssiDbm: -60,
    errorCode: 0,
    sequenceCounter: sequenceCounter,
  );
}

void main() {
  group('TelemetryBus Ingestion & Metrics Tests', () {
    late MockBleTransport mockTransport;
    late TelemetryBus bus;

    setUp(() {
      mockTransport = MockBleTransport();
      bus = TelemetryBus(transport: mockTransport);
    });

    tearDown(() {
      bus.dispose();
      mockTransport.dispose();
    });

    test('ingests 31-byte raw notifications and emits decoded TelemetryPacket', () async {
      final emittedPackets = <TelemetryPacket>[];
      bus.packetStream.listen(emittedPackets.add);

      final p1 = createPacket(sequenceCounter: 1, angle0: 45, angle1: 90);
      mockTransport.emitCharacteristicData(
        BleUuids.charTelemetryStream,
        p1.toBytes(),
      );

      await pumpEventQueue();

      expect(emittedPackets.length, equals(1));
      expect(emittedPackets.first.sequenceCounter, equals(1));
      expect(emittedPackets.first.channelAngles[0], equals(45));
      expect(emittedPackets.first.channelAngles[1], equals(90));
      expect(bus.latestPacket?.sequenceCounter, equals(1));
      expect(bus.currentMetrics.totalPackets, equals(1));
      expect(bus.currentMetrics.droppedPackets, equals(0));
      expect(bus.currentMetrics.dropRatePercent, equals(0.0));
    });

    test('ignores non-31-byte malformed buffers cleanly without throwing', () async {
      final emittedPackets = <TelemetryPacket>[];
      bus.packetStream.listen(emittedPackets.add);

      mockTransport.emitCharacteristicData(
        BleUuids.charTelemetryStream,
        Uint8List.fromList([0x01, 0x02, 0x03]),
      );

      await pumpEventQueue();

      expect(emittedPackets, isEmpty);
      expect(bus.currentMetrics.totalPackets, equals(0));
    });

    test('detects lost packets and calculates accurate drop counts and rates', () async {
      bus.ingestBytes(createPacket(sequenceCounter: 1).toBytes());
      // Jump from 1 to 4 -> packets 2 and 3 dropped (count = 2)
      bus.ingestBytes(createPacket(sequenceCounter: 4).toBytes());

      expect(bus.currentMetrics.totalPackets, equals(2));
      expect(bus.currentMetrics.droppedPackets, equals(2));
      // Total expected = 2 received + 2 dropped = 4. Drop rate = 2/4 = 50.0%
      expect(bus.currentMetrics.dropRatePercent, closeTo(50.0, 0.1));

      // Consecutive packet 5 -> no additional drops
      bus.ingestBytes(createPacket(sequenceCounter: 5).toBytes());
      expect(bus.currentMetrics.totalPackets, equals(3));
      expect(bus.currentMetrics.droppedPackets, equals(2));
      // Total expected = 3 received + 2 dropped = 5. Drop rate = 2/5 = 40.0%
      expect(bus.currentMetrics.dropRatePercent, closeTo(40.0, 0.1));
    });

    test('calculates live arrival frequency across packet burst', () async {
      // Ingest packets with simulated time
      bus.ingestBytes(createPacket(sequenceCounter: 1).toBytes());
      await Future<void>.delayed(const Duration(milliseconds: 100));
      bus.ingestBytes(createPacket(sequenceCounter: 2).toBytes());
      await Future<void>.delayed(const Duration(milliseconds: 100));
      bus.ingestBytes(createPacket(sequenceCounter: 3).toBytes());

      expect(bus.currentMetrics.frequencyHz, greaterThan(0.0));
      expect(bus.currentMetrics.frequencyHz, closeTo(10.0, 3.0));
    });

    test('resets metrics to pristine zero state upon resetMetrics()', () {
      bus.ingestBytes(createPacket(sequenceCounter: 1).toBytes());
      bus.ingestBytes(createPacket(sequenceCounter: 5).toBytes());

      expect(bus.currentMetrics.totalPackets, equals(2));
      expect(bus.currentMetrics.droppedPackets, equals(3));

      bus.resetMetrics();

      expect(bus.currentMetrics.totalPackets, equals(0));
      expect(bus.currentMetrics.droppedPackets, equals(0));
      expect(bus.currentMetrics.dropRatePercent, equals(0.0));
      expect(bus.currentMetrics.frequencyHz, equals(0.0));
    });
  });
}
