import 'dart:io';
import 'package:air_robotics_app/core/profile/diagnostic_profile_builder.dart';
import 'package:air_robotics_app/core/profile/profile_storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  group('InMemoryProfileStorageService', () {
    late InMemoryProfileStorageService storage;

    setUp(() {
      storage = InMemoryProfileStorageService();
    });

    tearDown(() async {
      await storage.close();
    });

    test('stores, retrieves, and deletes device profiles', () async {
      final profile = DiagnosticProfileBuilder.build('Test-Bot-9000');

      expect(await storage.getProfile('Test-Bot-9000'), isNull);
      expect(await storage.listStoredModels(), isEmpty);

      await storage.saveProfile(profile);

      final retrieved = await storage.getProfile('Test-Bot-9000');
      expect(retrieved, isNotNull);
      expect(retrieved!.modelNumber, equals('Test-Bot-9000'));
      expect(retrieved.actuators.length, equals(16));
      expect(await storage.listStoredModels(), contains('Test-Bot-9000'));

      await storage.deleteProfile('Test-Bot-9000');
      expect(await storage.getProfile('Test-Bot-9000'), isNull);
      expect(await storage.listStoredModels(), isEmpty);
    });

    test('stores and retrieves actuator calibration offsets', () async {
      final offsets = {0: 5, 1: -3, 2: 0, 3: 12};

      expect(await storage.getCalibration('Test-Bot-9000'), isNull);

      await storage.saveCalibration('Test-Bot-9000', offsets);

      final retrieved = await storage.getCalibration('Test-Bot-9000');
      expect(retrieved, isNotNull);
      expect(retrieved![0], equals(5));
      expect(retrieved[1], equals(-3));
      expect(retrieved[2], equals(0));
      expect(retrieved[3], equals(12));
    });
  });

  group('HiveProfileStorageService', () {
    late Directory tempDir;
    late HiveProfileStorageService hiveStorage;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp('hive_test_');
      Hive.init(tempDir.path);
      hiveStorage = HiveProfileStorageService();
      await hiveStorage.init();
    });

    tearDown(() async {
      await hiveStorage.close();
      await Hive.close();
      if (tempDir.existsSync()) {
        await tempDir.delete(recursive: true);
      }
    });

    test('persists and restores device profiles to Hive NoSQL document store',
        () async {
      final profile = DiagnosticProfileBuilder.build('Fabrica-Custom-Override');

      expect(await hiveStorage.getProfile('Fabrica-Custom-Override'), isNull);

      await hiveStorage.saveProfile(profile);

      final retrieved =
          await hiveStorage.getProfile('Fabrica-Custom-Override');
      expect(retrieved, isNotNull);
      expect(retrieved!.modelNumber, equals('Fabrica-Custom-Override'));
      expect(retrieved.actuators.length, equals(16));
      expect(await hiveStorage.listStoredModels(),
          contains('Fabrica-Custom-Override'));

      await hiveStorage.deleteProfile('Fabrica-Custom-Override');
      expect(await hiveStorage.getProfile('Fabrica-Custom-Override'), isNull);
    });

    test('persists and decodes integer calibration offsets', () async {
      final offsets = {0: -10, 1: 15, 2: 2};

      await hiveStorage.saveCalibration('Fabrica-DevKit-v1', offsets);

      final retrieved = await hiveStorage.getCalibration('Fabrica-DevKit-v1');
      expect(retrieved, isNotNull);
      expect(retrieved![0], equals(-10));
      expect(retrieved[1], equals(15));
      expect(retrieved[2], equals(2));
    });
  });
}
