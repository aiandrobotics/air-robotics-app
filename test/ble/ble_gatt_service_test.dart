import 'dart:typed_data';

import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('GATT Discovery & Transport Controls', () {
    late MockBleTransport transport;

    setUp(() {
      transport = MockBleTransport();
    });

    tearDown(() {
      transport.dispose();
    });

    test('discovers standard DIS metadata and AIR Robotics characteristics', () async {
      await transport.connect('dev_test_1');
      final gatt = await transport.discoverServices();

      expect(gatt.modelNumber, equals('Fabrica-DevKit-v1'));
      expect(gatt.firmwareRevision, equals('v1.13.0'));
      expect(gatt.manufacturer, equals('AIR Robotics'));
      expect(gatt.hasControlPoint, isTrue);
      expect(gatt.hasTelemetryStream, isTrue);
      expect(gatt.hasConfiguration, isTrue);
      expect(gatt.isAirRoboticsCompatible, isTrue);
    });

    test('dispatches control point payload with and without response flags', () async {
      final stopCmd = Uint8List.fromList([0x02]);
      final estopCmd = Uint8List.fromList([0x03]);

      // Standard command with response
      await transport.writeControlPoint(stopCmd, withoutResponse: false);
      expect(transport.writtenControlPointPayloads.last, equals(stopCmd));
      expect(transport.writtenControlPointNoResponse.last, isFalse);

      // Fast-path Emergency Stop without response (<50ms radio priority)
      await transport.writeControlPoint(estopCmd, withoutResponse: true);
      expect(transport.writtenControlPointPayloads.last, equals(estopCmd));
      expect(transport.writtenControlPointNoResponse.last, isTrue);
    });

    test('DiscoveredRobot copyWith, equality, hashCode and toString', () {
      final now = DateTime.now();
      final robot1 = DiscoveredRobot(
        id: 'r1',
        name: 'Fabrica-1',
        rawRssi: -70,
        smoothedRssi: -70.0,
        isPairingMode: true,
        lastSeen: now,
      );
      final robot2 = robot1.copyWith(name: 'Fabrica-2', isPairingMode: false);
      expect(robot2.name, equals('Fabrica-2'));
      expect(robot2.id, equals('r1'));
      expect(robot2.isPairingMode, isFalse);

      final robotIdentical = robot1.copyWith();
      expect(robot1, equals(robotIdentical));
      expect(robot1.hashCode, equals(robotIdentical.hashCode));
      expect(robot1.toString(), contains('Fabrica-1'));

      final robotDifferent = DiscoveredRobot(
        id: 'r2',
        name: 'Fabrica-1',
        rawRssi: -70,
        smoothedRssi: -70.0,
        isPairingMode: true,
        lastSeen: now,
      );
      expect(robot1 == robotDifferent, isFalse);
    });

    test('BleGattInfo toString and compatibility', () {
      const gatt = BleGattInfo(
        modelNumber: 'TestModel',
        firmwareRevision: '1.0',
        manufacturer: 'AIR',
        hasControlPoint: true,
        hasTelemetryStream: true,
        hasConfiguration: true,
        negotiatedMtu: 512,
      );
      expect(gatt.toString(), contains('TestModel'));
      expect(gatt.isAirRoboticsCompatible, isTrue);
    });

    test('BleTransport subscribeTelemetry subscribes to telemetry characteristic', () {
      final stream = transport.subscribeTelemetry();
      expect(stream, isNotNull);
    });
  });
}
