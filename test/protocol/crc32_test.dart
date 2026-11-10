import 'dart:convert';
import 'package:air_robotics_app/core/protocol/crc32.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IEEE 802.3 CRC32 Engine', () {
    test('standard ASCII "123456789" vector evaluates to 0xCBF43926', () {
      final input = ascii.encode('123456789');
      final result = Crc32.compute(input);
      expect(result, equals(0xCBF43926));
      expect(Crc32.verify(input, 0xCBF43926), isTrue);
    });

    test('empty byte array evaluates to 0x00000000', () {
      final input = <int>[];
      final result = Crc32.compute(input);
      expect(result, equals(0x00000000));
      expect(Crc32.verify(input, 0x00000000), isTrue);
    });

    test('single null byte vector parity', () {
      final input = [0x00];
      final result = Crc32.compute(input);
      expect(result, equals(0xD202EF8D));
      expect(Crc32.verify(input, 0xD202EF8D), isTrue);
    });

    test('detects altered payload bit inversion', () {
      final input = ascii.encode('123456789');
      final corrupted = List<int>.from(input);
      corrupted[4] ^= 0x01; // flip single bit
      expect(Crc32.verify(corrupted, 0xCBF43926), isFalse);
    });
  });
}
