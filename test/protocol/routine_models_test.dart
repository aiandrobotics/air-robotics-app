import 'package:air_robotics_app/core/protocol/routine_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FoldStep Model', () {
    test('serializes and deserializes single motor step', () {
      final step = FoldStep.single(0);
      expect(step.motorCount, equals(1));
      expect(step.motorIds[0], equals(0));

      final bytes = step.toBytes();
      expect(bytes.length, equals(3));
      expect(bytes[0], equals(1));
      expect(bytes[1], equals(0));

      final decoded = FoldStep.fromBytes(bytes);
      expect(decoded.motorCount, equals(1));
      expect(decoded.motorIds[0], equals(0));
    });

    test('serializes and deserializes dual motor step', () {
      final step = FoldStep.dual(1, 3);
      expect(step.motorCount, equals(2));
      expect(step.motorIds, equals([1, 3]));

      final bytes = step.toBytes();
      expect(bytes.length, equals(3));
      expect(bytes[0], equals(2));
      expect(bytes[1], equals(1));
      expect(bytes[2], equals(3));

      final decoded = FoldStep.fromBytes(bytes);
      expect(decoded.motorCount, equals(2));
      expect(decoded.motorIds, equals([1, 3]));
    });

    test('bounds checks channel ids', () {
      expect(() => FoldStep.single(16), throwsRangeError);
      expect(() => FoldStep.dual(0, 16), throwsRangeError);
    });
  });

  group('FoldRoutine Model & CRC32 Verification', () {
    test('creates routine and calculates deterministic CRC32', () {
      final routine = FoldRoutine.create([
        FoldStep.single(0),
        FoldStep.single(1),
        FoldStep.dual(2, 3),
      ]);

      expect(routine.stepCount, equals(3));
      expect(routine.steps.length, equals(16));
      expect(routine.checksum, isNonZero);

      final bytes = routine.toBytes();
      expect(bytes.length, equals(53));

      // Unpack and verify CRC
      final decoded = FoldRoutine.fromBytes(bytes, verifyCrc: true);
      expect(decoded.stepCount, equals(3));
      expect(decoded.checksum, equals(routine.checksum));
      expect(decoded.steps[0].motorIds[0], equals(0));
      expect(decoded.steps[1].motorIds[0], equals(1));
      expect(decoded.steps[2].motorIds, equals([2, 3]));
    });

    test('throws FormatException on corrupted routine CRC32', () {
      final routine = FoldRoutine.create([
        FoldStep.single(0),
      ]);

      final bytes = routine.toBytes();
      // Corrupt a step byte
      bytes[1] ^= 0xFF;

      expect(
        () => FoldRoutine.fromBytes(bytes, verifyCrc: true),
        throwsFormatException,
      );
    });

    test('creates compact variable-length wire format', () {
      final routine = FoldRoutine.create([
        FoldStep.single(0),
        FoldStep.single(1),
      ]);

      final compact = routine.toCompactBytes();
      // 1 byte step_count + 2 steps * 3 bytes = 7 bytes
      expect(compact.length, equals(7));
      expect(compact[0], equals(2));
    });
  });
}
