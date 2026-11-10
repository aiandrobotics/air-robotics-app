import 'dart:typed_data';

import 'crc32.dart';

/// Single folding step containing 1 or 2 simultaneous servo motions.
///
/// Packed binary representation is exactly 3 bytes:
/// - Byte 0: `motor_count` (1 or 2)
/// - Bytes 1-2: `motor_ids` (channel 0 to 15)
class FoldStep {
  final int motorCount;
  final List<int> motorIds;

  const FoldStep({
    required this.motorCount,
    required this.motorIds,
  });

  static const int binaryLength = 3;

  /// Creates a single-motor step on channel [motorId].
  factory FoldStep.single(int motorId) {
    if (motorId < 0 || motorId > 15) {
      throw RangeError.range(motorId, 0, 15, 'motorId', 'Channel must be 0-15');
    }
    return FoldStep(motorCount: 1, motorIds: [motorId, 0]);
  }

  /// Creates a dual-motor simultaneous step on channels [motor1] and [motor2].
  factory FoldStep.dual(int motor1, int motor2) {
    if (motor1 < 0 || motor1 > 15) {
      throw RangeError.range(motor1, 0, 15, 'motor1', 'Channel must be 0-15');
    }
    if (motor2 < 0 || motor2 > 15) {
      throw RangeError.range(motor2, 0, 15, 'motor2', 'Channel must be 0-15');
    }
    return FoldStep(motorCount: 2, motorIds: [motor1, motor2]);
  }

  /// Unpacks a 3-byte binary slice into a [FoldStep].
  factory FoldStep.fromBytes(Uint8List bytes, [int offset = 0]) {
    if (bytes.length < offset + binaryLength) {
      throw ArgumentError(
        'Insufficient bytes for FoldStep: need $binaryLength at offset $offset, got ${bytes.length}',
      );
    }
    final count = bytes[offset];
    final m0 = bytes[offset + 1];
    final m1 = bytes[offset + 2];
    return FoldStep(motorCount: count, motorIds: [m0, m1]);
  }

  /// Serializes into exactly 3 bytes.
  Uint8List toBytes() {
    final buffer = Uint8List(binaryLength);
    buffer[0] = motorCount & 0xFF;
    buffer[1] = motorIds.isNotEmpty ? (motorIds[0] & 0xFF) : 0;
    buffer[2] = motorIds.length > 1 ? (motorIds[1] & 0xFF) : 0;
    return buffer;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoldStep &&
          runtimeType == other.runtimeType &&
          motorCount == other.motorCount &&
          motorIds[0] == other.motorIds[0] &&
          motorIds[1] == other.motorIds[1];

  @override
  int get hashCode => Object.hash(motorCount, motorIds[0], motorIds[1]);

  @override
  String toString() => 'FoldStep(motorCount: $motorCount, motorIds: $motorIds)';
}

/// Complete folding routine sequence stored in ESP32 NVS flash.
///
/// Binary format is 53 bytes packed:
/// - Byte 0: `step_count` (1 to 16)
/// - Bytes 1-48: 16 `FoldStep` structs (16 * 3 = 48 bytes)
/// - Bytes 49-52: 32-bit IEEE 802.3 CRC32 checksum (Little-Endian)
class FoldRoutine {
  static const int maxSteps = 16;
  static const int binaryLength = 53;
  static const int checksumOffset = 49;

  final int stepCount;
  final List<FoldStep> steps;
  final int checksum;

  const FoldRoutine({
    required this.stepCount,
    required this.steps,
    required this.checksum,
  });

  /// Constructs a [FoldRoutine] and auto-calculates the CRC32 checksum across
  /// the 49-byte payload (`step_count` + 48 step bytes).
  factory FoldRoutine.create(List<FoldStep> activeSteps) {
    if (activeSteps.isEmpty || activeSteps.length > maxSteps) {
      throw ArgumentError.value(
        activeSteps.length,
        'activeSteps',
        'Routine must contain 1 to $maxSteps steps',
      );
    }

    final paddedSteps = <FoldStep>[...activeSteps];
    while (paddedSteps.length < maxSteps) {
      paddedSteps.add(const FoldStep(motorCount: 0, motorIds: [0, 0]));
    }

    // Build 49-byte payload for checksum
    final payload = Uint8List(checksumOffset);
    payload[0] = activeSteps.length & 0xFF;
    for (var i = 0; i < maxSteps; i++) {
      final stepBytes = paddedSteps[i].toBytes();
      payload.setRange(1 + (i * 3), 1 + ((i + 1) * 3), stepBytes);
    }

    final calculatedCrc = Crc32.compute(payload);

    return FoldRoutine(
      stepCount: activeSteps.length,
      steps: paddedSteps,
      checksum: calculatedCrc,
    );
  }

  /// Unpacks a 53-byte binary payload into a [FoldRoutine] and verifies the CRC32.
  factory FoldRoutine.fromBytes(Uint8List bytes, {bool verifyCrc = true}) {
    if (bytes.length != binaryLength) {
      throw ArgumentError(
        'Expected exactly $binaryLength bytes for FoldRoutine, got ${bytes.length}',
      );
    }

    final byteData = ByteData.sublistView(bytes);
    final count = bytes[0];
    final steps = <FoldStep>[];

    for (var i = 0; i < maxSteps; i++) {
      steps.add(FoldStep.fromBytes(bytes, 1 + (i * 3)));
    }

    final storedCrc = byteData.getUint32(checksumOffset, Endian.little);

    if (verifyCrc) {
      final payload = bytes.sublist(0, checksumOffset);
      final calculated = Crc32.compute(payload);
      if (calculated != storedCrc) {
        throw FormatException(
          'FoldRoutine CRC32 mismatch: calculated 0x${calculated.toRadixString(16).padLeft(8, '0')} != stored 0x${storedCrc.toRadixString(16).padLeft(8, '0')}',
        );
      }
    }

    return FoldRoutine(
      stepCount: count,
      steps: steps,
      checksum: storedCrc,
    );
  }

  /// Serializes into exactly 53 bytes (Little-Endian CRC32).
  Uint8List toBytes() {
    final buffer = Uint8List(binaryLength);
    buffer[0] = stepCount & 0xFF;
    for (var i = 0; i < maxSteps; i++) {
      final stepBytes = steps[i].toBytes();
      buffer.setRange(1 + (i * 3), 1 + ((i + 1) * 3), stepBytes);
    }
    final byteData = ByteData.sublistView(buffer);
    byteData.setUint32(checksumOffset, checksum, Endian.little);
    return buffer;
  }

  /// Serializes into compact variable-length wire format:
  /// `[1B step_count][3B * active_step_count]`
  Uint8List toCompactBytes() {
    final length = 1 + (stepCount * 3);
    final buffer = Uint8List(length);
    buffer[0] = stepCount & 0xFF;
    for (var i = 0; i < stepCount; i++) {
      final stepBytes = steps[i].toBytes();
      buffer.setRange(1 + (i * 3), 1 + ((i + 1) * 3), stepBytes);
    }
    return buffer;
  }
}
