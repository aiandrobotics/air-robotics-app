import 'dart:convert';
import 'package:hive/hive.dart';

import 'registered_robot.dart';

/// Abstract storage contract for persistent user robot fleet management.
abstract class FleetStorageService {
  Future<void> init();
  Future<List<RegisteredRobot>> getRegisteredRobots();
  Future<void> saveRobot(RegisteredRobot robot);
  Future<void> removeRobot(String id);
  Future<void> updateNickname(String id, String nickname);
  Future<void> setLastConnectedRobotId(String? id);
  Future<String?> getLastConnectedRobotId();
  Future<void> close();
}

/// Hive NoSQL document storage implementation for user robot fleet.
class HiveFleetStorageService implements FleetStorageService {
  static const String boxName = 'air_registered_robots';
  static const String lastConnectedKey = '__last_connected_robot_id__';

  Box<String>? _box;

  HiveFleetStorageService({Box<String>? box}) {
    _box = box;
  }

  @override
  Future<void> init() async {
    _box ??= await Hive.openBox<String>(boxName);
  }

  Future<Box<String>> _getBox() async {
    if (_box != null && _box!.isOpen) {
      return _box!;
    }
    _box = await Hive.openBox<String>(boxName);
    return _box!;
  }

  @override
  Future<List<RegisteredRobot>> getRegisteredRobots() async {
    try {
      final box = await _getBox();
      final list = <RegisteredRobot>[];
      for (final entry in box.toMap().entries) {
        if (entry.key == lastConnectedKey) continue;
        try {
          final map = jsonDecode(entry.value) as Map<String, dynamic>;
          list.add(RegisteredRobot.fromJson(map));
        } catch (_) {
          // Ignore malformed individual entries
        }
      }
      list.sort((a, b) => b.pairedAt.compareTo(a.pairedAt));
      return list;
    } catch (_) {
      return [];
    }
  }

  @override
  Future<void> saveRobot(RegisteredRobot robot) async {
    final box = await _getBox();
    final jsonStr = jsonEncode(robot.toJson());
    await box.put(robot.id, jsonStr);
  }

  @override
  Future<void> removeRobot(String id) async {
    final box = await _getBox();
    await box.delete(id);
    final last = await getLastConnectedRobotId();
    if (last == id) {
      await setLastConnectedRobotId(null);
    }
  }

  @override
  Future<void> updateNickname(String id, String nickname) async {
    final box = await _getBox();
    final raw = box.get(id);
    if (raw != null) {
      try {
        final map = jsonDecode(raw) as Map<String, dynamic>;
        final robot = RegisteredRobot.fromJson(map);
        final updated = robot.copyWith(
          customNickname: nickname.trim().isEmpty ? null : nickname.trim(),
        );
        await box.put(id, jsonEncode(updated.toJson()));
      } catch (_) {}
    }
  }

  @override
  Future<void> setLastConnectedRobotId(String? id) async {
    final box = await _getBox();
    if (id == null) {
      await box.delete(lastConnectedKey);
    } else {
      await box.put(lastConnectedKey, id);
    }
  }

  @override
  Future<String?> getLastConnectedRobotId() async {
    final box = await _getBox();
    return box.get(lastConnectedKey);
  }

  @override
  Future<void> close() async {
    if (_box != null && _box!.isOpen) {
      await _box!.close();
    }
  }
}

/// In-memory implementation of [FleetStorageService] for fast unit/widget testing.
class InMemoryFleetStorageService implements FleetStorageService {
  final Map<String, RegisteredRobot> _robots = {};
  String? _lastConnectedRobotId;

  InMemoryFleetStorageService([List<RegisteredRobot>? initialRobots]) {
    if (initialRobots != null) {
      for (final r in initialRobots) {
        _robots[r.id] = r;
      }
    }
  }

  @override
  Future<void> init() async {}

  @override
  Future<List<RegisteredRobot>> getRegisteredRobots() async {
    final list = _robots.values.toList();
    list.sort((a, b) => b.pairedAt.compareTo(a.pairedAt));
    return list;
  }

  @override
  Future<void> saveRobot(RegisteredRobot robot) async {
    _robots[robot.id] = robot;
  }

  @override
  Future<void> removeRobot(String id) async {
    _robots.remove(id);
    if (_lastConnectedRobotId == id) {
      _lastConnectedRobotId = null;
    }
  }

  @override
  Future<void> updateNickname(String id, String nickname) async {
    final existing = _robots[id];
    if (existing != null) {
      _robots[id] = existing.copyWith(
        customNickname: nickname.trim().isEmpty ? null : nickname.trim(),
      );
    }
  }

  @override
  Future<void> setLastConnectedRobotId(String? id) async {
    _lastConnectedRobotId = id;
  }

  @override
  Future<String?> getLastConnectedRobotId() async {
    return _lastConnectedRobotId;
  }

  @override
  Future<void> close() async {
    _robots.clear();
    _lastConnectedRobotId = null;
  }
}
