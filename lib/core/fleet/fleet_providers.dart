import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fleet_storage_service.dart';
import 'registered_robot.dart';

/// Provider for the fleet storage service. Can be overridden in tests.
final fleetStorageProvider = Provider<FleetStorageService>((ref) {
  final storage = HiveFleetStorageService();
  ref.onDispose(() => storage.close());
  return storage;
});

/// Riverpod AsyncNotifier managing the user's paired robot fleet.
class RegisteredRobotsNotifier extends AsyncNotifier<List<RegisteredRobot>> {
  @override
  Future<List<RegisteredRobot>> build() async {
    final storage = ref.watch(fleetStorageProvider);
    return storage.getRegisteredRobots();
  }

  /// Adds or updates a robot in the registered fleet and updates state.
  Future<void> addRobot(RegisteredRobot robot) async {
    final storage = ref.read(fleetStorageProvider);
    await storage.saveRobot(robot);
    state = AsyncData(await storage.getRegisteredRobots());
  }

  /// Removes a robot from the registered fleet.
  Future<void> removeRobot(String id) async {
    final storage = ref.read(fleetStorageProvider);
    await storage.removeRobot(id);
    state = AsyncData(await storage.getRegisteredRobots());
  }

  /// Renames a registered robot with a custom nickname.
  Future<void> renameRobot(String id, String nickname) async {
    final storage = ref.read(fleetStorageProvider);
    await storage.updateNickname(id, nickname);
    state = AsyncData(await storage.getRegisteredRobots());
  }
}

final registeredRobotsProvider =
    AsyncNotifierProvider<RegisteredRobotsNotifier, List<RegisteredRobot>>(
  RegisteredRobotsNotifier.new,
);
