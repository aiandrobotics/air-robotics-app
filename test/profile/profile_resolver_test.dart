import 'dart:convert';
import 'dart:io';
import 'package:air_robotics_app/core/profile/diagnostic_profile_builder.dart';
import 'package:air_robotics_app/core/profile/profile_resolver.dart';
import 'package:air_robotics_app/core/profile/profile_storage_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class _MapAssetBundle extends CachingAssetBundle {
  final Map<String, String> assets;

  _MapAssetBundle(this.assets);

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    final content = assets[key];
    if (content == null) {
      throw ArgumentError('Unable to load asset: $key');
    }
    return content;
  }

  @override
  Future<ByteData> load(String key) async {
    final content = assets[key];
    if (content == null) {
      throw ArgumentError('Unable to load asset: $key');
    }
    return ByteData.sublistView(Uint8List.fromList(utf8.encode(content)));
  }
}

void main() {
  group('ProfileResolver 4-Tier Waterfall', () {
    late InMemoryProfileStorageService storage;
    late AssetBundle assetBundle;
    late ProfileResolver resolver;

    setUp(() {
      final schemaFile =
          File('assets/profiles/air-device-profile.schema.json');
      final fabricaFile = File('assets/profiles/fabrica-devkit-v1.json');

      final assets = <String, String>{
        'assets/profiles/air-device-profile.schema.json':
            schemaFile.readAsStringSync(),
        'assets/profiles/fabrica-devkit-v1.json':
            fabricaFile.readAsStringSync(),
      };

      storage = InMemoryProfileStorageService();
      assetBundle = _MapAssetBundle(assets);
      resolver = ProfileResolver(
        storageService: storage,
        assetBundle: assetBundle,
      );
    });

    test('Tier 3: resolves bundled asset with schema validation for Fabrica',
        () async {
      final profile = await resolver.resolveProfile('fabrica-devkit-v1');

      expect(profile.modelNumber, equals('Fabrica-DevKit-v1'));
      expect(profile.name, equals('Fabrica Cloth Folding Robot'));
      expect(profile.actuators.length, equals(4));
      expect(profile.capabilities.maxChannels, equals(4));
      expect(profile.capabilities.supportsEmergencyStop, isTrue);
    });

    test('Tier 1: returns in-memory cached profile immediately on repeat resolve',
        () async {
      final customProfile =
          DiagnosticProfileBuilder.build('Cached-Custom-Model');
      resolver.cacheProfile(customProfile);

      final resolved = await resolver.resolveProfile('Cached-Custom-Model');
      expect(identical(resolved, customProfile), isTrue);
    });

    test('Tier 2: local storage override takes priority over bundled asset',
        () async {
      // Create a customized Fabrica profile with 6 actuators instead of 4
      final customFabrica = DiagnosticProfileBuilder.build('Fabrica-DevKit-v1');
      await resolver.saveUserOverride(customFabrica);

      // Clear memory cache to ensure Tier 2 offline storage loads and re-caches it
      resolver.clearCache();

      final resolved = await resolver.resolveProfile('Fabrica-DevKit-v1');
      expect(resolved.modelNumber, equals('Fabrica-DevKit-v1'));
      expect(resolved.actuators.length, equals(16)); // Overridden

      // Evict user override
      await resolver.deleteUserOverride('Fabrica-DevKit-v1');

      // Now it should fallback to Tier 3 bundled asset
      final fallbackToAsset =
          await resolver.resolveProfile('fabrica-devkit-v1');
      expect(fallbackToAsset.name, equals('Fabrica Cloth Folding Robot'));
      expect(fallbackToAsset.actuators.length, equals(4));
    });

    test('Tier 4: generates procedural fallback profile for unknown robot',
        () async {
      final profile = await resolver.resolveProfile('Mystery-Robot-99');

      expect(profile.modelNumber, equals('Mystery-Robot-99'));
      expect(profile.name,
          equals('Diagnostic Companion (Mystery-Robot-99)'));
      expect(profile.actuators.length, equals(16));
      expect(profile.capabilities.supportsEmergencyStop, isTrue);
      expect(profile.screens.length, equals(2));
      expect(profile.screens[0].id, equals('screen_diagnostic_control'));
    });

    test('Tier 4: handles empty or whitespace model strings gracefully',
        () async {
      final profile = await resolver.resolveProfile('   ');

      expect(profile.modelNumber, equals('AIR-Generic-Diagnostic'));
      expect(profile.actuators.length, equals(16));
    });
  });
}
