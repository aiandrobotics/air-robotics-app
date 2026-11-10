import 'dart:convert';
import 'package:json_schema/json_schema.dart';

import 'device_profile.dart';

/// Validates device profile JSON maps against `air-device-profile.schema.json`.
class ProfileValidator {
  ProfileValidator._();

  /// Validates [profileJson] against [schemaJson].
  ///
  /// Throws [FormatException] if validation errors are detected.
  /// Returns typed [DeviceProfile] if valid.
  static DeviceProfile validate({
    required Map<String, dynamic> schemaJson,
    required Map<String, dynamic> profileJson,
  }) {
    final schema = JsonSchema.create(schemaJson);
    final result = schema.validate(profileJson);

    if (!result.isValid) {
      final errorMessages = result.errors.map((e) => e.message).join('; ');
      throw FormatException('Device Profile validation failed: $errorMessages');
    }

    return DeviceProfile.fromJson(profileJson);
  }

  /// Convenience helper parsing raw JSON strings.
  static DeviceProfile validateStrings({
    required String schemaString,
    required String profileString,
  }) {
    final schemaMap = jsonDecode(schemaString) as Map<String, dynamic>;
    final profileMap = jsonDecode(profileString) as Map<String, dynamic>;
    return validate(schemaJson: schemaMap, profileJson: profileMap);
  }
}
