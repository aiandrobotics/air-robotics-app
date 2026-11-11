import 'dart:io';
import 'package:air_robotics_app/core/fleet/fleet_storage_service.dart';
import 'package:air_robotics_app/core/fleet/registered_robot.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  group('InMemoryFleetStorageService', () {
    late InMemoryFleetStorageService storage;

    setUp(() {
      storage = InMemoryFleetStorageService();
    });

    tearDown(() async {
      await storage.close();
    });

    test('saves, retrieves, updates nickname, and removes robots', () async {
      expect(await storage.getRegisteredRobots(), isEmpty);

      final robot1 = RegisteredRobot(
        id: 'robot-1',
        name: 'Fabrica-001',
        modelNumber: 'Fabrica-DevKit-v1',
        pairedAt: DateTime(2026, 11, 10, 10, 0),
      );

      final robot2 = RegisteredRobot(
        id: 'robot-2',
        name: 'Fabrica-002',
        modelNumber: 'Fabrica-DevKit-v1',
        pairedAt: DateTime(2026, 11, 11, 12, 0),
      );

      await storage.saveRobot(robot1);
      await storage.saveRobot(robot2);

      final list = await storage.getRegisteredRobots();
      expect(list.length, 2);
      // Sorted newest first
      expect(list.first.id, 'robot-2');
      expect(list.last.id, 'robot-1');

      // Update nickname
      await storage.updateNickname('robot-1', 'Laundry Room Fabrica');
      final updatedList = await storage.getRegisteredRobots();
      final updatedRobot1 = updatedList.firstWhere((r) => r.id == 'robot-1');
      expect(updatedRobot1.customNickname, 'Laundry Room Fabrica');
      expect(updatedRobot1.displayName, 'Laundry Room Fabrica');

      // Remove robot
      await storage.removeRobot('robot-2');
      final remaining = await storage.getRegisteredRobots();
      expect(remaining.length, 1);
      expect(remaining.first.id, 'robot-1');
    });
  });

  group('HiveFleetStorageService', () {
    late Directory tempDir;
    late HiveFleetStorageService hiveStorage;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp('hive_fleet_test_');
      Hive.init(tempDir.path);
      hiveStorage = HiveFleetStorageService();
      await hiveStorage.init();
    });

    tearDown(() async {
      await hiveStorage.close();
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    });

    test('persists and restores registered robots to Hive', () async {
      final robot = RegisteredRobot(
        id: 'hive-fabrica-1',
        name: 'Fabrica-Hive',
        modelNumber: 'Fabrica-DevKit-v1',
        pairedAt: DateTime.now(),
        customNickname: 'My Fast Folder',
      );

      await hiveStorage.saveRobot(robot);

      final loaded = await hiveStorage.getRegisteredRobots();
      expect(loaded.length, 1);
      expect(loaded.first.id, 'hive-fabrica-1');
      expect(loaded.first.displayName, 'My Fast Folder');

      // Update nickname
      await hiveStorage.updateNickname('hive-fabrica-1', 'Renamed Folder');
      final reloaded = await hiveStorage.getRegisteredRobots();
      expect(reloaded.first.displayName, 'Renamed Folder');

      // Remove
      await hiveStorage.removeRobot('hive-fabrica-1');
      final empty = await hiveStorage.getRegisteredRobots();
      expect(empty, isEmpty);
    });
  });
}
