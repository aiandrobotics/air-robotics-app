import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/core/ble/simulated_ble_transport.dart';
import 'package:air_robotics_app/core/protocol/command_builder.dart';
import 'package:air_robotics_app/core/protocol/routine_models.dart';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SimulatedBleTransport Virtual Robot Tests', () {
    late SimulatedBleTransport transport;

    setUp(() {
      transport = SimulatedBleTransport();
    });

    tearDown(() {
      transport.dispose();
    });

    test('scanning emits default simulated Fabrica robot', () async {
      final scanExpectation = expectLater(
        transport.scanResultsStream,
        emits(
          predicate<List<DiscoveredRobot>>((robots) {
            return robots.isNotEmpty &&
                robots.first.name == 'Fabrica-DevKit-v1' &&
                robots.first.isPairingMode == true;
          }),
        ),
      );

      await transport.startScan();
      await scanExpectation;
      await transport.stopScan();
    });

    test('connects, negotiates MTU 517, bonds, and discovers GATT info', () async {
      expect(transport.currentConnectionState, BleConnectionState.disconnected);

      await transport.connect('simulated-fabrica-devkit');
      expect(transport.currentConnectionState, BleConnectionState.connected);
      expect(transport.connectedRobot?.name, 'Fabrica-DevKit-v1');

      final mtu = await transport.requestMtu(517);
      expect(mtu, 517);

      final bonded = await transport.createBond();
      expect(bonded, isTrue);

      final gatt = await transport.discoverServices();
      expect(gatt.modelNumber, 'Fabrica-DevKit-v1');
      expect(gatt.firmwareRevision, 'v1.13.0');
      expect(gatt.manufacturer, 'AIR Robotics');
      expect(gatt.isAirRoboticsCompatible, isTrue);

      await transport.disconnect();
      expect(transport.currentConnectionState, BleConnectionState.disconnected);
    });

    test('emits valid 31-byte telemetry stream upon connection', () async {
      await transport.connect('simulated-fabrica-devkit');

      final telemetryFuture = transport.subscribeTelemetry().first;

      // Trigger jog to force immediate telemetry packet
      final jogCmd = CommandBuilder.buildJogMotor(channel: 0, angleDeg: 45);
      await transport.writeControlPoint(jogCmd);

      final rawBytes = await telemetryFuture;
      expect(rawBytes.length, TelemetryPacket.packetLength);

      final packet = TelemetryPacket.fromBytes(rawBytes);
      expect(packet.channelAngles[0], 45);
      expect(packet.systemState, SystemState.calibrating);
    });

    test('runPreset simulates multi-step fold routine motion', () async {
      await transport.connect('simulated-fabrica-devkit');

      final receivedPackets = <TelemetryPacket>[];
      final sub = transport.subscribeTelemetry().listen((bytes) {
        receivedPackets.add(TelemetryPacket.fromBytes(bytes));
      });
      addTearDown(sub.cancel);

      // Trigger Preset 1 (Adult T-shirt: Left, Right, Bottom)
      final presetCmd = CommandBuilder.buildRunPreset(1);
      await transport.writeControlPoint(presetCmd);

      // Allow 250ms of virtual motion ticks
      await Future<void>.delayed(const Duration(milliseconds: 250));

      expect(receivedPackets.isNotEmpty, isTrue);
      final runningPacket = receivedPackets.lastWhere(
        (p) => p.systemState == SystemState.runningMotion,
      );
      expect(runningPacket.activeButtonId, 1);
      expect(runningPacket.totalSteps, 3);
      expect(runningPacket.currentStepIdx, 1);
      expect(receivedPackets.any((p) => p.channelAngles[0] > 0), isTrue);
    });

    test('fast-path emergency stop aborts active motion immediately', () async {
      await transport.connect('simulated-fabrica-devkit');

      final receivedPackets = <TelemetryPacket>[];
      final sub = transport.subscribeTelemetry().listen((bytes) {
        receivedPackets.add(TelemetryPacket.fromBytes(bytes));
      });
      addTearDown(sub.cancel);

      // Start preset motion
      await transport.writeControlPoint(CommandBuilder.buildRunPreset(1));
      await Future<void>.delayed(const Duration(milliseconds: 150));

      // Dispatch Emergency Stop
      await transport.writeControlPoint(
        CommandBuilder.buildEmergencyStop(),
        withoutResponse: true,
      );

      final lastPacket = receivedPackets.last;
      expect(lastPacket.systemState, SystemState.idle);
      expect(lastPacket.ledState, LedState.estop);
      expect(lastPacket.channelAngles.every((angle) => angle == 0), isTrue);
    });

    test('saves routine to button slot and restores factory presets', () async {
      await transport.connect('simulated-fabrica-devkit');

      final customRoutine = FoldRoutine.create([FoldStep.single(3)]);
      final saveCmd = CommandBuilder.buildSetButtonSequence(2, customRoutine);
      await transport.writeControlPoint(saveCmd);

      final restoreCmd = CommandBuilder.buildRestoreFactoryPresets();
      await transport.writeControlPoint(restoreCmd);
    });
  });
}
