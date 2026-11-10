import '../ble/ble_transport_interface.dart';
import 'device_profile.dart';

/// Procedurally constructs a valid Tier 4 [DeviceProfile] for unprofiled
/// or unrecognized AIR Robotics hardware models.
class DiagnosticProfileBuilder {
  DiagnosticProfileBuilder._();

  /// Builds an in-memory [DeviceProfile] exposing standard 16 servo channels,
  /// emergency stop, status banner, jog controls, and raw hex console.
  static DeviceProfile build(String modelNumber) {
    final cleanModel = modelNumber.isNotEmpty ? modelNumber : 'AIR-Generic-Diagnostic';

    return DeviceProfile(
      schemaVersion: '1.0.0',
      modelNumber: cleanModel,
      name: 'Diagnostic Companion ($cleanModel)',
      description:
          'Procedural diagnostic profile for unprofiled AIR Robotics BLE hardware.',
      manufacturer: 'AIR Robotics Ecosystem',
      gatt: const AirGattConfig(
        serviceUuid: BleUuids.serviceAirRobotics,
        controlPointUuid: BleUuids.charControlPoint,
        telemetryStreamUuid: BleUuids.charTelemetryStream,
        configurationUuid: BleUuids.charButtonConfig,
      ),
      capabilities: const AirCapabilities(
        maxChannels: 16,
        supportsEmergencyStop: true,
        supportsRawPreview: false,
        supportsFlashSync: false,
        supportsCalibrationJog: true,
        motionHz: 10.0,
        idleHz: 1.0,
      ),
      actuators: List.generate(
        16,
        (i) => AirActuator(
          channel: i,
          name: 'Channel $i',
          role: 'generic_servo_$i',
          minLimit: 0.0,
          maxLimit: 180.0,
          defaultAngle: 90.0,
          inverted: false,
        ),
      ),
      presets: List.generate(
        4,
        (i) => AirPreset(
          id: i + 1,
          label: 'Preset ${i + 1}',
          description: 'Generic preset trigger ${i + 1}',
          icon: 'play_arrow',
        ),
      ),
      visualizers: const [],
      screens: const [
        AirScreenConfig(
          id: 'screen_diagnostic_control',
          title: 'Control',
          icon: 'gamepad',
          widgets: [
            AirWidgetConfig(
              type: 'status-banner',
              title: 'Hardware Status',
              props: {'show_led_mirror': true, 'show_rssi': true},
            ),
            AirWidgetConfig(
              type: 'emergency-stop-button',
              title: 'Emergency Stop',
              props: {'tactile_feedback': true},
            ),
            AirWidgetConfig(
              type: 'preset-grid',
              title: 'Standard Presets',
              props: {'columns': 2},
            ),
          ],
        ),
        AirScreenConfig(
          id: 'screen_diagnostic_actuators',
          title: 'Jog & Diagnostics',
          icon: 'terminal',
          widgets: [
            AirWidgetConfig(
              type: 'jog-slider-bank',
              title: '16-Channel Manual Jog',
              props: {'drag_throttle_ms': 50},
            ),
            AirWidgetConfig(
              type: 'raw-hex-console',
              title: 'Packet Console',
              props: {'buffer_size': 250},
            ),
          ],
        ),
      ],
    );
  }
}
