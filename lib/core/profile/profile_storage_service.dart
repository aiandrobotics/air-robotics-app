import 'dart:convert';
import 'package:hive/hive.dart';

import 'device_profile.dart';

/// Abstract contract for local offline storage of device profiles and user customizations.
abstract class ProfileStorageService {
  Future<void> init();
  Future<void> saveProfile(DeviceProfile profile);
  Future<DeviceProfile?> getProfile(String modelNumber);
  Future<void> deleteProfile(String modelNumber);
  Future<List<String>> listStoredModels();

  Future<void> saveCalibration(String modelNumber, Map<int, int> channelOffsets);
  Future<Map<int, int>?> getCalibration(String modelNumber);
  Future<void> close();
}

/// Hive NoSQL document implementation for persistent offline storage.
class HiveProfileStorageService implements ProfileStorageService {
  static const String profileBoxName = 'air_device_profiles';
  static const String calibrationBoxName = 'air_calibration_offsets';

  Box<String>? _profileBox;
  Box<String>? _calibrationBox;

  HiveProfileStorageService({
    Box<String>? profileBox,
    Box<String>? calibrationBox,
  }) {
    _profileBox = profileBox;
    _calibrationBox = calibrationBox;
  }

  @override
  Future<void> init() async {
    await _getProfileBox();
    await _getCalibrationBox();
  }

  Future<Box<String>?> _getProfileBox() async {
    if (_profileBox != null && _profileBox!.isOpen) return _profileBox;
    try {
      _profileBox = await Hive.openBox<String>(profileBoxName);
      return _profileBox;
    } catch (_) {
      return null;
    }
  }

  Future<Box<String>?> _getCalibrationBox() async {
    if (_calibrationBox != null && _calibrationBox!.isOpen) return _calibrationBox;
    try {
      _calibrationBox = await Hive.openBox<String>(calibrationBoxName);
      return _calibrationBox;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveProfile(DeviceProfile profile) async {
    final box = await _getProfileBox();
    if (box == null) return;
    final jsonStr = jsonEncode(profile.toJson());
    await box.put(profile.modelNumber, jsonStr);
  }

  @override
  Future<DeviceProfile?> getProfile(String modelNumber) async {
    final box = await _getProfileBox();
    if (box == null) return null;
    final jsonStr = box.get(modelNumber);
    if (jsonStr == null) return null;

    try {
      final map = jsonDecode(jsonStr) as Map<String, dynamic>;
      return DeviceProfile.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> deleteProfile(String modelNumber) async {
    final box = await _getProfileBox();
    if (box == null) return;
    await box.delete(modelNumber);
  }

  @override
  Future<List<String>> listStoredModels() async {
    final box = await _getProfileBox();
    if (box == null) return [];
    return box.keys.map((k) => k.toString()).toList();
  }

  @override
  Future<void> saveCalibration(
    String modelNumber,
    Map<int, int> channelOffsets,
  ) async {
    final box = await _getCalibrationBox();
    if (box == null) return;
    final mapped = channelOffsets.map((k, v) => MapEntry(k.toString(), v));
    await box.put(modelNumber, jsonEncode(mapped));
  }

  @override
  Future<Map<int, int>?> getCalibration(String modelNumber) async {
    final box = await _getCalibrationBox();
    if (box == null) return null;
    final jsonStr = box.get(modelNumber);
    if (jsonStr == null) return null;

    try {
      final decoded = jsonDecode(jsonStr) as Map<String, dynamic>;
      return decoded.map((k, v) => MapEntry(int.parse(k), (v as num).toInt()));
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> close() async {
    await _profileBox?.close();
    await _calibrationBox?.close();
  }
}

/// In-memory storage double for headless unit testing.
class InMemoryProfileStorageService implements ProfileStorageService {
  final Map<String, String> _profiles = {};
  final Map<String, Map<int, int>> _calibrations = {};

  @override
  Future<void> init() async {}

  @override
  Future<void> saveProfile(DeviceProfile profile) async {
    _profiles[profile.modelNumber] = jsonEncode(profile.toJson());
  }

  @override
  Future<DeviceProfile?> getProfile(String modelNumber) async {
    final jsonStr = _profiles[modelNumber];
    if (jsonStr == null) return null;
    try {
      final map = jsonDecode(jsonStr) as Map<String, dynamic>;
      return DeviceProfile.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> deleteProfile(String modelNumber) async {
    _profiles.remove(modelNumber);
  }

  @override
  Future<List<String>> listStoredModels() async {
    return _profiles.keys.toList();
  }

  @override
  Future<void> saveCalibration(
    String modelNumber,
    Map<int, int> channelOffsets,
  ) async {
    _calibrations[modelNumber] = Map<int, int>.from(channelOffsets);
  }

  @override
  Future<Map<int, int>?> getCalibration(String modelNumber) async {
    final cal = _calibrations[modelNumber];
    return cal != null ? Map<int, int>.from(cal) : null;
  }

  @override
  Future<void> close() async {
    _profiles.clear();
    _calibrations.clear();
  }
}
