import 'dart:io';
import 'package:air_robotics_app/core/fleet/fleet_providers.dart';
import 'package:air_robotics_app/core/fleet/fleet_storage_service.dart';
import 'package:air_robotics_app/core/fleet/registered_robot.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

      // Test last connected robot id persistence
      expect(await storage.getLastConnectedRobotId(), isNull);
      await storage.setLastConnectedRobotId('robot-1');
      expect(await storage.getLastConnectedRobotId(), 'robot-1');
      await storage.removeRobot('robot-1');
      expect(await storage.getLastConnectedRobotId(), isNull);
    });

    test('initializes with initialRobots and supports init()', () async {
      final initialRobot = RegisteredRobot(
        id: 'init-1',
        name: 'InitRobot',
        pairedAt: DateTime.now(),
      );
      final seededStorage = InMemoryFleetStorageService([initialRobot]);
      await seededStorage.init();
      final robots = await seededStorage.getRegisteredRobots();
      expect(robots.length, equals(1));
      expect(robots.first.id, equals('init-1'));
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

      // Persist and restore last connected id
      await hiveStorage.setLastConnectedRobotId('hive-fabrica-1');
      expect(await hiveStorage.getLastConnectedRobotId(), 'hive-fabrica-1');
      await hiveStorage.saveRobot(robot);
      await hiveStorage.removeRobot('hive-fabrica-1');
      expect(await hiveStorage.getLastConnectedRobotId(), isNull);
    });
  });

  group('RegisteredRobot entity tests', () {
    test('displayName handles null, empty, and whitespace customNickname', () {
      final r1 = RegisteredRobot(id: '1', name: 'Original', pairedAt: DateTime.now());
      expect(r1.displayName, equals('Original'));

      final r2 = r1.copyWith(customNickname: '');
      expect(r2.displayName, equals('Original'));

      final r3 = r1.copyWith(customNickname: '   ');
      expect(r3.displayName, equals('Original'));

      final r4 = r1.copyWith(customNickname: 'Custom');
      expect(r4.displayName, equals('Custom'));
    });

    test('fromJson handles null pairedAt and default model/name', () {
      final json = {'id': 'test-123'};
      final robot = RegisteredRobot.fromJson(json);
      expect(robot.id, equals('test-123'));
      expect(robot.name, equals('AIR Robot'));
      expect(robot.modelNumber, equals('Fabrica'));
      expect(robot.pairedAt, isNotNull);
    });

    test('equality and hashCode', () {
      final dt = DateTime(2026, 1, 1);
      final r1 = RegisteredRobot(id: '1', name: 'Name', pairedAt: dt, customNickname: 'Nick');
      final r2 = RegisteredRobot(id: '1', name: 'Name', pairedAt: dt, customNickname: 'Nick');
      final r3 = RegisteredRobot(id: '2', name: 'Name', pairedAt: dt, customNickname: 'Nick');

      expect(r1, equals(r2));
      expect(r1.hashCode, equals(r2.hashCode));
      expect(r1 == r3, isFalse);
    });

    test('copyWith preserves customNickname when omitted', () {
      final r = RegisteredRobot(id: '1', name: 'Orig', pairedAt: DateTime.now(), customNickname: 'Nick');
      final copy = r.copyWith(name: 'NewName');
      expect(copy.customNickname, equals('Nick'));
    });
  });

  group('RegisteredRobotsNotifier & fleetStorageProvider Tests', () {
    test('fleetStorageProvider default factory creates and disposes HiveFleetStorageService', () {
      final container = ProviderContainer();
      final storage = container.read(fleetStorageProvider);
      expect(storage, isA<HiveFleetStorageService>());
      container.dispose();
    });

    test('HiveFleetStorageService opens box lazily via _getBox and handles error gracefully', () async {
      final storage = HiveFleetStorageService();
      addTearDown(() => storage.close());

      final r = RegisteredRobot(id: 'lazy-1', name: 'Lazy 1', pairedAt: DateTime.now());
      await storage.saveRobot(r);
      final list = await storage.getRegisteredRobots();
      expect(list.length, equals(1));
      expect(list.first.id, equals('lazy-1'));

      // Test error fallback line 59 in getRegisteredRobots using a failing box
      final failingStorage = HiveFleetStorageService(box: _FailingBox());
      final emptyList = await failingStorage.getRegisteredRobots();
      expect(emptyList, isEmpty);
    });
    test('Notifier adds, renames, and removes robots in state', () async {
      final inMemory = InMemoryFleetStorageService();
      final container = ProviderContainer(
        overrides: [
          fleetStorageProvider.overrideWithValue(inMemory),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(registeredRobotsProvider.notifier);
      final r = RegisteredRobot(id: 'r-1', name: 'Robot 1', pairedAt: DateTime.now());

      await notifier.addRobot(r);
      var robots = container.read(registeredRobotsProvider).value!;
      expect(robots.length, equals(1));
      expect(robots.first.id, equals('r-1'));

      await notifier.renameRobot('r-1', 'Renamed');
      robots = container.read(registeredRobotsProvider).value!;
      expect(robots.first.displayName, equals('Renamed'));

      await notifier.removeRobot('r-1');
      robots = container.read(registeredRobotsProvider).value!;
      expect(robots, isEmpty);
    });
  });
}

class _FailingBox extends Fake implements Box<String> {
  @override
  bool get isOpen => true;

  @override
  Map<dynamic, String> toMap() => throw Exception('Corrupt DB');
}
