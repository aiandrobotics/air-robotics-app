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
            String model = manager.gattInfo?.modelNumber ?? '';
            if (model.isEmpty) {
              final name = manager.connectedRobot?.name ?? '';
              if (name.toLowerCase().contains('fabrica')) {
                model = 'Fabrica';
              } else if (name.isNotEmpty) {
                model = name;
              }
            }
            if (model.isNotEmpty) {
              final resolved = await resolver.resolveProfile(model);
              if (ref.mounted) {
                state = resolved;
              }
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
        if (ref.mounted) {
          state = resolved;
        }
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

/// State notifier managing user-defined custom subtitle names for preset buttons.
class PresetNamesNotifier extends Notifier<Map<int, String>> {
  @override
  Map<int, String> build() {
    final modelNumber =
        ref.watch(activeProfileProvider.select((p) => p.modelNumber));
    final storage = ref.watch(profileStorageProvider);

    Future.microtask(() async {
      final loaded = await storage.getPresetNames(modelNumber);
      if (ref.mounted && loaded.isNotEmpty) {
        state = loaded;
      }
    });

    return const {};
  }

  /// Renames a preset button's custom subtitle. Empty string clears the custom name.
  Future<void> renamePreset(int presetId, String name) async {
    final trimmed = name.trim();
    final updated = Map<int, String>.from(state);
    if (trimmed.isEmpty) {
      updated.remove(presetId);
    } else {
      updated[presetId] = trimmed;
    }
    state = updated;

    final modelNumber = ref.read(activeProfileProvider).modelNumber;
    await ref.read(profileStorageProvider).savePresetNames(modelNumber, updated);
  }

  /// Clears all custom preset button names in memory and local storage.
  Future<void> clear() async {
    state = const {};
    final modelNumber = ref.read(activeProfileProvider).modelNumber;
    await ref.read(profileStorageProvider).savePresetNames(modelNumber, const {});
  }
}

/// Provider exposing user-customized preset button names keyed by preset ID.
final presetNamesProvider =
    NotifierProvider<PresetNamesNotifier, Map<int, String>>(
  PresetNamesNotifier.new,
);

/// State notifier managing user-defined custom colors (ARGB ints) for preset buttons.
class PresetColorsNotifier extends Notifier<Map<int, int>> {
  @override
  Map<int, int> build() {
    final modelNumber =
        ref.watch(activeProfileProvider.select((p) => p.modelNumber));
    final storage = ref.watch(profileStorageProvider);

    Future.microtask(() async {
      final loaded = await storage.getPresetColors(modelNumber);
      if (ref.mounted && loaded.isNotEmpty) {
        state = loaded;
      }
    });

    return const {};
  }

  /// Sets a custom ARGB color for [presetId], or pass `null` to reset to default.
  Future<void> setPresetColor(int presetId, int? colorValue) async {
    final updated = Map<int, int>.from(state);
    if (colorValue == null) {
      updated.remove(presetId);
    } else {
      updated[presetId] = colorValue;
    }
    state = updated;

    final modelNumber = ref.read(activeProfileProvider).modelNumber;
    await ref.read(profileStorageProvider).savePresetColors(modelNumber, updated);
  }

  /// Clears all custom preset button colors in memory and local storage.
  Future<void> clear() async {
    state = const {};
    final modelNumber = ref.read(activeProfileProvider).modelNumber;
    await ref.read(profileStorageProvider).savePresetColors(modelNumber, const {});
  }
}

/// Provider exposing user-customized preset button ARGB colors keyed by preset ID.
final presetColorsProvider =
    NotifierProvider<PresetColorsNotifier, Map<int, int>>(
  PresetColorsNotifier.new,
);
