import 'package:flutter/services.dart';

import 'device_profile.dart';
import 'diagnostic_profile_builder.dart';
import 'profile_storage_service.dart';
import 'profile_validator.dart';

/// 4-Tier Resolution Waterfall for AIR Robotics Device Profiles.
///
/// Priority:
/// 1. **Tier 1 (Memory Cache)**: Fast in-memory compiled profile cache.
/// 2. **Tier 2 (Offline Storage)**: Local Hive document storage (user overrides & calibrations).
/// 3. **Tier 3 (Bundled Asset)**: Pre-packaged profile JSON (`assets/profiles/`) verified by schema.
/// 4. **Tier 4 (Diagnostic Fallback)**: Procedural diagnostic profile for unrecognized models.
class ProfileResolver {
  final ProfileStorageService storageService;
  final AssetBundle? assetBundle;

  final Map<String, DeviceProfile> _memoryCache = {};

  static const String schemaAssetPath =
      'assets/profiles/air-device-profile.schema.json';

  static const Map<String, String> _bundledAssetMap = {
    'fabrica': 'assets/profiles/fabrica-devkit-v1.json',
    'fabrica-devkit-v1': 'assets/profiles/fabrica-devkit-v1.json',
  };

  ProfileResolver({
    required this.storageService,
    this.assetBundle,
  });

  AssetBundle get _bundle => assetBundle ?? rootBundle;

  /// Resolves a [DeviceProfile] for [modelNumber] traversing the 4-tier waterfall.
  Future<DeviceProfile> resolveProfile(String modelNumber) async {
    final cleanModel = modelNumber.trim();
    if (cleanModel.isEmpty) {
      return DiagnosticProfileBuilder.build('AIR-Generic-Diagnostic');
    }

    // Tier 1: In-memory runtime cache
    if (_memoryCache.containsKey(cleanModel)) {
      return _memoryCache[cleanModel]!;
    }

    // Tier 2: Local offline storage (Hive document override)
    final storedProfile = await storageService.getProfile(cleanModel);
    if (storedProfile != null) {
      _memoryCache[cleanModel] = storedProfile;
      return storedProfile;
    }

    // Tier 3: Pre-packaged asset bundle
    final assetProfile = await _tryLoadBundledAsset(cleanModel);
    if (assetProfile != null) {
      _memoryCache[cleanModel] = assetProfile;
      return assetProfile;
    }

    // Tier 4: Procedural diagnostic fallback
    final fallbackProfile = DiagnosticProfileBuilder.build(cleanModel);
    _memoryCache[cleanModel] = fallbackProfile;
    return fallbackProfile;
  }

  Future<DeviceProfile?> _tryLoadBundledAsset(String modelNumber) async {
    final slug = modelNumber.toLowerCase().replaceAll(RegExp(r'\s+'), '-');
    String? assetPath = _bundledAssetMap[slug];
    if (assetPath == null && slug.startsWith('fabrica')) {
      assetPath = 'assets/profiles/fabrica-devkit-v1.json';
    }
    assetPath ??= 'assets/profiles/$slug.json';

    try {
      final profileString = await _bundle.loadString(assetPath);
      final schemaString = await _bundle.loadString(schemaAssetPath);

      return ProfileValidator.validateStrings(
        schemaString: schemaString,
        profileString: profileString,
      );
    } catch (_) {
      // Bundled asset missing or invalid
      return null;
    }
  }

  /// Manually registers a profile in the Tier 1 memory cache.
  void cacheProfile(DeviceProfile profile) {
    _memoryCache[profile.modelNumber] = profile;
  }

  /// Saves a custom profile to Tier 2 local storage and updates the memory cache.
  Future<void> saveUserOverride(DeviceProfile profile) async {
    await storageService.saveProfile(profile);
    _memoryCache[profile.modelNumber] = profile;
  }

  /// Clears a user override from Tier 2 storage and evicts from memory cache.
  Future<void> deleteUserOverride(String modelNumber) async {
    await storageService.deleteProfile(modelNumber);
    _memoryCache.remove(modelNumber);
  }

  /// Clears Tier 1 memory cache.
  void clearCache() {
    _memoryCache.clear();
  }
}
