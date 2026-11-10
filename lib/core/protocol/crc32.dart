import 'dart:typed_data';

/// Pure-Dart IEEE 802.3 CRC32 checksum engine.
///
/// Uses the standard reversed polynomial `0xEDB88320` with a precomputed
/// 256-entry lookup table, bit-exact with the ESP32 firmware verification
/// implementation in `firmware/main/storage.c`.
class Crc32 {
  Crc32._();

  static const int polynomial = 0xEDB88320;

  static final Uint32List _table = _generateTable();

  static Uint32List _generateTable() {
    final table = Uint32List(256);
    for (var i = 0; i < 256; i++) {
      var c = i;
      for (var j = 0; j < 8; j++) {
        if ((c & 1) != 0) {
          c = polynomial ^ (c >>> 1);
        } else {
          c = c >>> 1;
        }
      }
      table[i] = c;
    }
    return table;
  }

  /// Computes the IEEE 802.3 32-bit CRC checksum for the given byte buffer.
  ///
  /// Initial value: `0xFFFFFFFF`
  /// Final XOR: `0xFFFFFFFF`
  /// Returns a 32-bit unsigned integer (`0x00000000` to `0xFFFFFFFF`).
  static int compute(List<int> data) {
    var crc = 0xFFFFFFFF;
    for (var i = 0; i < data.length; i++) {
      final index = (crc ^ data[i]) & 0xFF;
      crc = _table[index] ^ (crc >>> 8);
    }
    return (crc ^ 0xFFFFFFFF) & 0xFFFFFFFF;
  }

  /// Verifies if [data] matches the expected 32-bit checksum.
  static bool verify(List<int> data, int expectedChecksum) {
    return compute(data) == (expectedChecksum & 0xFFFFFFFF);
  }
}
