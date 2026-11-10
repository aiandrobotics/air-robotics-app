/// Declarative representation of an AIR Robotics Device Profile.
class AirGattConfig {
  final String serviceUuid;
  final String controlPointUuid;
  final String telemetryStreamUuid;
  final String configurationUuid;

  const AirGattConfig({
    required this.serviceUuid,
    required this.controlPointUuid,
    required this.telemetryStreamUuid,
    required this.configurationUuid,
  });

  factory AirGattConfig.fromJson(Map<String, dynamic> json) {
    return AirGattConfig(
      serviceUuid: json['service_uuid'] as String,
      controlPointUuid: json['control_point_uuid'] as String,
      telemetryStreamUuid: json['telemetry_stream_uuid'] as String,
      configurationUuid: json['configuration_uuid'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'service_uuid': serviceUuid,
        'control_point_uuid': controlPointUuid,
        'telemetry_stream_uuid': telemetryStreamUuid,
        'configuration_uuid': configurationUuid,
      };
}

class AirCapabilities {
  final int maxChannels;
  final bool supportsEmergencyStop;
  final bool supportsRawPreview;
  final bool supportsFlashSync;
  final bool supportsCalibrationJog;
  final double motionHz;
  final double idleHz;

  const AirCapabilities({
    required this.maxChannels,
    required this.supportsEmergencyStop,
    required this.supportsRawPreview,
    required this.supportsFlashSync,
    this.supportsCalibrationJog = true,
    this.motionHz = 10.0,
    this.idleHz = 1.0,
  });

  factory AirCapabilities.fromJson(Map<String, dynamic> json) {
    final rates = json['telemetry_rates'] as Map<String, dynamic>?;
    return AirCapabilities(
      maxChannels: (json['max_channels'] as num?)?.toInt() ?? 16,
      supportsEmergencyStop: json['supports_emergency_stop'] as bool? ?? true,
      supportsRawPreview: json['supports_raw_preview'] as bool? ?? true,
      supportsFlashSync: json['supports_flash_sync'] as bool? ?? true,
      supportsCalibrationJog: json['supports_calibration_jog'] as bool? ?? true,
      motionHz: (rates?['motion_hz'] as num?)?.toDouble() ?? 10.0,
      idleHz: (rates?['idle_hz'] as num?)?.toDouble() ?? 1.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'max_channels': maxChannels,
        'supports_emergency_stop': supportsEmergencyStop,
        'supports_raw_preview': supportsRawPreview,
        'supports_flash_sync': supportsFlashSync,
        'supports_calibration_jog': supportsCalibrationJog,
        'telemetry_rates': {
          'motion_hz': motionHz,
          'idle_hz': idleHz,
        },
      };
}

class AirActuator {
  final int channel;
  final String name;
  final String role;
  final double minLimit;
  final double maxLimit;
  final double defaultAngle;
  final bool inverted;

  const AirActuator({
    required this.channel,
    required this.name,
    required this.role,
    this.minLimit = 0.0,
    this.maxLimit = 180.0,
    this.defaultAngle = 0.0,
    this.inverted = false,
  });

  factory AirActuator.fromJson(Map<String, dynamic> json) {
    return AirActuator(
      channel: (json['channel'] as num).toInt(),
      name: json['name'] as String,
      role: json['role'] as String? ?? '',
      minLimit: (json['min_limit'] as num?)?.toDouble() ?? 0.0,
      maxLimit: (json['max_limit'] as num?)?.toDouble() ?? 180.0,
      defaultAngle: (json['default_angle'] as num?)?.toDouble() ?? 0.0,
      inverted: json['inverted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'channel': channel,
        'name': name,
        'role': role,
        'min_limit': minLimit,
        'max_limit': maxLimit,
        'default_angle': defaultAngle,
        'inverted': inverted,
      };
}

class AirPreset {
  final int id;
  final String label;
  final String description;
  final String icon;

  const AirPreset({
    required this.id,
    required this.label,
    this.description = '',
    this.icon = '',
  });

  factory AirPreset.fromJson(Map<String, dynamic> json) {
    return AirPreset(
      id: (json['id'] as num).toInt(),
      label: json['label'] as String,
      description: json['description'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'description': description,
        'icon': icon,
      };
}

class AirVisualizerConfig {
  final String id;
  final String type;
  final Map<String, dynamic> options;

  const AirVisualizerConfig({
    required this.id,
    required this.type,
    this.options = const {},
  });

  factory AirVisualizerConfig.fromJson(Map<String, dynamic> json) {
    return AirVisualizerConfig(
      id: json['id'] as String,
      type: json['type'] as String,
      options: (json['options'] as Map<String, dynamic>?) ?? const {},
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'options': options,
      };
}

class AirWidgetConfig {
  final String type;
  final String title;
  final Map<String, dynamic> props;

  const AirWidgetConfig({
    required this.type,
    this.title = '',
    this.props = const {},
  });

  factory AirWidgetConfig.fromJson(Map<String, dynamic> json) {
    return AirWidgetConfig(
      type: json['type'] as String,
      title: json['title'] as String? ?? '',
      props: (json['props'] as Map<String, dynamic>?) ?? const {},
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
        'props': props,
      };
}

class AirScreenConfig {
  final String id;
  final String title;
  final String icon;
  final List<AirWidgetConfig> widgets;

  const AirScreenConfig({
    required this.id,
    required this.title,
    this.icon = '',
    required this.widgets,
  });

  factory AirScreenConfig.fromJson(Map<String, dynamic> json) {
    final rawWidgets = json['widgets'] as List<dynamic>? ?? [];
    return AirScreenConfig(
      id: json['id'] as String,
      title: json['title'] as String,
      icon: json['icon'] as String? ?? '',
      widgets: rawWidgets
          .map((w) => AirWidgetConfig.fromJson(w as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'icon': icon,
        'widgets': widgets.map((w) => w.toJson()).toList(),
      };
}

class DeviceProfile {
  final String schemaVersion;
  final String modelNumber;
  final String name;
  final String description;
  final String manufacturer;
  final AirGattConfig gatt;
  final AirCapabilities capabilities;
  final List<AirActuator> actuators;
  final List<AirPreset> presets;
  final List<AirVisualizerConfig> visualizers;
  final List<AirScreenConfig> screens;

  const DeviceProfile({
    required this.schemaVersion,
    required this.modelNumber,
    required this.name,
    this.description = '',
    required this.manufacturer,
    required this.gatt,
    required this.capabilities,
    required this.actuators,
    this.presets = const [],
    this.visualizers = const [],
    required this.screens,
  });

  factory DeviceProfile.fromJson(Map<String, dynamic> json) {
    return DeviceProfile(
      schemaVersion: json['schema_version'] as String? ?? '1.0.0',
      modelNumber: json['model_number'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      manufacturer: json['manufacturer'] as String,
      gatt: AirGattConfig.fromJson(json['gatt'] as Map<String, dynamic>),
      capabilities: AirCapabilities.fromJson(
        json['capabilities'] as Map<String, dynamic>,
      ),
      actuators: (json['actuators'] as List<dynamic>)
          .map((a) => AirActuator.fromJson(a as Map<String, dynamic>))
          .toList(),
      presets: (json['presets'] as List<dynamic>?)
              ?.map((p) => AirPreset.fromJson(p as Map<String, dynamic>))
              .toList() ??
          const [],
      visualizers: (json['visualizers'] as List<dynamic>?)
              ?.map((v) =>
                  AirVisualizerConfig.fromJson(v as Map<String, dynamic>))
              .toList() ??
          const [],
      screens: (json['screens'] as List<dynamic>)
          .map((s) => AirScreenConfig.fromJson(s as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'schema_version': schemaVersion,
        'model_number': modelNumber,
        'name': name,
        'description': description,
        'manufacturer': manufacturer,
        'gatt': gatt.toJson(),
        'capabilities': capabilities.toJson(),
        'actuators': actuators.map((a) => a.toJson()).toList(),
        'presets': presets.map((p) => p.toJson()).toList(),
        'visualizers': visualizers.map((v) => v.toJson()).toList(),
        'screens': screens.map((s) => s.toJson()).toList(),
      };
}
