import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ble/ble_providers.dart';
import '../ble/ble_transport_interface.dart';
import 'device_profile.dart';
import 'diagnostic_profile_builder.dart';
import 'profile_resolver.dart';
import 'profile_storage_service.dart';

/// Provider for local profile storage service.
final profileStorageProvider = Provider<ProfileStorageService>((ref) {
  final storage = HiveProfileStorageService();
  ref.onDispose(() => storage.close());
  return storage;
});

/// Provider for the [ProfileResolver] 4-tier waterfall engine.
final profileResolverProvider = Provider<ProfileResolver>((ref) {
  final storage = ref.watch(profileStorageProvider);
  return ProfileResolver(storageService: storage);
});

/// State notifier managing the currently bound [DeviceProfile].
class ActiveProfileNotifier extends Notifier<DeviceProfile> {
  @override
  DeviceProfile build() {
    final resolver = ref.watch(profileResolverProvider);

    // Auto-bind when BLE connection enters ready state with discovered DIS model
    ref.listen<AsyncValue<BleConnectionState>>(
      bleConnectionStateProvider,
      (previous, next) {
        next.whenData((connState) async {
          if (connState == BleConnectionState.ready) {
            final manager = ref.read(bleConnectionManagerProvider);
            final model = manager.gattInfo?.modelNumber;
            if (model != null && model.isNotEmpty) {
              final resolved = await resolver.resolveProfile(model);
              state = resolved;
            }
          }
        });
      },
    );

    // Initial default profile
    final manager = ref.read(bleConnectionManagerProvider);
    final currentModel = manager.gattInfo?.modelNumber;
    if (manager.currentState == BleConnectionState.ready &&
        currentModel != null &&
        currentModel.isNotEmpty) {
      Future.microtask(() async {
        final resolved = await resolver.resolveProfile(currentModel);
        state = resolved;
      });
    }

    return DiagnosticProfileBuilder.build('AIR-Generic');
  }

  /// Manually switches to an explicit [DeviceProfile].
  void selectProfile(DeviceProfile profile) {
    state = profile;
  }

  /// Resolves and binds a profile by model string.
  Future<void> selectByModel(String modelNumber) async {
    final resolver = ref.read(profileResolverProvider);
    final resolved = await resolver.resolveProfile(modelNumber);
    state = resolved;
  }
}

/// Provider exposing the active [DeviceProfile] bound to the application.
final activeProfileProvider =
    NotifierProvider<ActiveProfileNotifier, DeviceProfile>(
  ActiveProfileNotifier.new,
);
