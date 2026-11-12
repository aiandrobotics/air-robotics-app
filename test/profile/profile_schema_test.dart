import 'dart:io';
import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/core/profile/profile_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Profile Schema Validator', () {
    test('validates bundled Fabrica profile against air-device-profile schema', () {
      final schemaFile = File('assets/profiles/air-device-profile.schema.json');
      final profileFile = File('assets/profiles/fabrica-devkit-v1.json');

      expect(schemaFile.existsSync(), isTrue, reason: 'Schema file must exist');
      expect(profileFile.existsSync(), isTrue, reason: 'Profile file must exist');

      final schemaStr = schemaFile.readAsStringSync();
      final profileStr = profileFile.readAsStringSync();

      final profile = ProfileValidator.validateStrings(
        schemaString: schemaStr,
        profileString: profileStr,
      );

      expect(profile.modelNumber, equals('Fabrica-DevKit-v1'));
      expect(profile.name, equals('Fabrica Cloth Folding Robot'));
      expect(profile.manufacturer, equals('AIR Robotics'));
      expect(profile.capabilities.maxChannels, equals(4));
      expect(profile.capabilities.supportsEmergencyStop, isTrue);
      expect(profile.capabilities.supportsRawPreview, isTrue);
      expect(profile.capabilities.supportsFlashSync, isTrue);

      // Verify actuators
      expect(profile.actuators.length, equals(4));
      expect(profile.actuators[0].name, equals('Left Flap'));
      expect(profile.actuators[1].name, equals('Right Flap'));
      expect(profile.actuators[2].name, equals('Bottom Flap'));
      expect(profile.actuators[3].name, equals('Top Flap'));

      // Verify presets
      expect(profile.presets.length, equals(4));
      expect(profile.presets[0].label, equals('Adult T-Shirt'));
      expect(profile.presets[1].label, equals('Long Sleeve'));
      expect(profile.presets[2].label, equals('Trousers'));
      expect(profile.presets[3].label, equals('Towels'));

      // Verify screens
      expect(profile.screens.length, equals(4));
      expect(profile.screens[0].title, equals('Control'));
      expect(profile.screens[1].title, equals('Sequencer'));
      expect(profile.screens[2].title, equals('Calibrate'));
      expect(profile.screens[3].title, equals('Diagnostics'));
    });

    test('rejects profile with missing mandatory fields', () {
      final schemaFile = File('assets/profiles/air-device-profile.schema.json');
      final schemaStr = schemaFile.readAsStringSync();

      const invalidProfileStr = '''
      {
        "schema_version": "1.0.0",
        "model_number": "Broken-Robot"
      }
      ''';

      expect(
        () => ProfileValidator.validateStrings(
          schemaString: schemaStr,
          profileString: invalidProfileStr,
        ),
        throwsFormatException,
      );
    });

    test('AirVisualizerConfig toJson serialization', () {
      final config = AirVisualizerConfig(id: 'vis_1', type: 'custom', options: {'speed': 100});
      final json = config.toJson();
      expect(json['id'], equals('vis_1'));
      expect(json['type'], equals('custom'));
      expect(json['options'], equals({'speed': 100}));
    });
  });
}
