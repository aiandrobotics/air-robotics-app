import 'dart:typed_data';

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
  });
}
