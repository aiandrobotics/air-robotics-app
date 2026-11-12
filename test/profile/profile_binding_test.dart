import 'dart:convert';
import 'dart:io';

import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/core/profile/diagnostic_profile_builder.dart';
import 'package:air_robotics_app/core/profile/profile_providers.dart';
import 'package:air_robotics_app/core/profile/profile_resolver.dart';
import 'package:air_robotics_app/core/profile/profile_storage_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

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
  group('Active Profile Binding & Riverpod Integration Tests', () {
    late MockBleTransport mockTransport;
    late InMemoryProfileStorageService storage;
    late AssetBundle assetBundle;
    late ProfileResolver resolver;
    late ProviderContainer container;

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

      mockTransport = MockBleTransport();
      storage = InMemoryProfileStorageService();
      assetBundle = _MapAssetBundle(assets);
      resolver = ProfileResolver(
        storageService: storage,
        assetBundle: assetBundle,
      );

      container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          profileStorageProvider.overrideWithValue(storage),
          profileResolverProvider.overrideWithValue(resolver),
        ],
      );
    });

    tearDown(() {
      container.dispose();
      mockTransport.dispose();
    });

    test('initial profile is generic diagnostic before robot connection', () {
      final profile = container.read(activeProfileProvider);
      expect(profile.modelNumber, equals('AIR-Generic'));
      expect(profile.actuators.length, equals(16));
    });

    test('auto-binds bundled Fabrica profile when BLE reaches ready state',
        () async {
      // Listen to activeProfileProvider to keep it alive and record changes
      final emittedProfiles = <DeviceProfile>[];
      container.listen<DeviceProfile>(
        activeProfileProvider,
        (previous, next) => emittedProfiles.add(next),
        fireImmediately: true,
      );

      final manager = container.read(bleConnectionManagerProvider);
      mockTransport.mockModelNumber = 'Fabrica-DevKit-v1';

      final robot = DiscoveredRobot(
        id: 'AA:BB:CC:DD:EE:FF',
        name: 'Fabrica-DevKit-01',
        rawRssi: -45,
        smoothedRssi: -45.0,
        isPairingMode: true,
        lastSeen: DateTime.now(),
      );

      await manager.connect(robot);
      expect(manager.currentState, equals(BleConnectionState.ready));

      // Allow microtasks for async profile resolution
      await Future<void>.delayed(const Duration(milliseconds: 20));

      final activeProfile = container.read(activeProfileProvider);
      expect(activeProfile.modelNumber, equals('Fabrica-DevKit-v1'));
      expect(activeProfile.name, equals('Fabrica Cloth Folding Robot'));
      expect(activeProfile.actuators.length, equals(4));
    });

    test('auto-binds procedural diagnostic profile when DIS model is unrecognized',
        () async {
      container.listen<DeviceProfile>(
        activeProfileProvider,
        (previous, next) {},
        fireImmediately: true,
      );

      final manager = container.read(bleConnectionManagerProvider);
      mockTransport.mockModelNumber = 'Unknown-Manipulator-V9';

      final robot = DiscoveredRobot(
        id: '11:22:33:44:55:66',
        name: 'AIR-Robot-Arm',
        rawRssi: -50,
        smoothedRssi: -50.0,
        isPairingMode: false,
        lastSeen: DateTime.now(),
      );

      await manager.connect(robot);
      expect(manager.currentState, equals(BleConnectionState.ready));

      await Future<void>.delayed(const Duration(milliseconds: 20));

      final activeProfile = container.read(activeProfileProvider);
      expect(activeProfile.modelNumber, equals('Unknown-Manipulator-V9'));
      expect(activeProfile.name,
          equals('Diagnostic Companion (Unknown-Manipulator-V9)'));
      expect(activeProfile.actuators.length, equals(16));
    });

    test('manual selectProfile and selectByModel updates activeProfileProvider',
        () async {
      final notifier = container.read(activeProfileProvider.notifier);

      final custom = DiagnosticProfileBuilder.build('Manual-Override-Bot');
      notifier.selectProfile(custom);

      expect(container.read(activeProfileProvider).modelNumber,
          equals('Manual-Override-Bot'));

      await notifier.selectByModel('fabrica-devkit-v1');
      expect(container.read(activeProfileProvider).modelNumber,
          equals('Fabrica-DevKit-v1'));
      expect(container.read(activeProfileProvider).actuators.length, equals(4));
    });

    test('falls back to robot name when DIS model is empty string', () async {
      container.listen<DeviceProfile>(
        activeProfileProvider,
        (previous, next) {},
        fireImmediately: true,
      );

      final manager = container.read(bleConnectionManagerProvider);
      mockTransport.mockModelNumber = '';

      final robot = DiscoveredRobot(
        id: '22:33:44:55:66:77',
        name: 'Fabrica-Cloth-Folder',
        rawRssi: -50,
        smoothedRssi: -50.0,
        isPairingMode: false,
        lastSeen: DateTime.now(),
      );

      await manager.connect(robot);
      await Future<void>.delayed(const Duration(milliseconds: 20));

      final activeProfile = container.read(activeProfileProvider);
      expect(activeProfile.modelNumber, equals('Fabrica-DevKit-v1'));
    });

    test('falls back to non-Fabrica robot name when DIS model is empty string', () async {
      container.listen<DeviceProfile>(
        activeProfileProvider,
        (previous, next) {},
        fireImmediately: true,
      );

      final manager = container.read(bleConnectionManagerProvider);
      mockTransport.mockModelNumber = '';

      final robot = DiscoveredRobot(
        id: '33:44:55:66:77:88',
        name: 'AIR-Rover-01',
        rawRssi: -50,
        smoothedRssi: -50.0,
        isPairingMode: false,
        lastSeen: DateTime.now(),
      );

      await manager.connect(robot);
      await Future<void>.delayed(const Duration(milliseconds: 20));

      final activeProfile = container.read(activeProfileProvider);
      expect(activeProfile.modelNumber, equals('AIR-Rover-01'));
    });
  });
}
