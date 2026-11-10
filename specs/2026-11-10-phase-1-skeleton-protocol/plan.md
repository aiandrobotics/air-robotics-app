# Plan — Phase 1: Project Skeleton, Core Theming & Protocol Models

## Task Group 1: Flutter Project Scaffolding & Platform Configurations
1. Initialize the Flutter application structure in the repository root (`air-robotics-app`) with sound null-safety, strict analysis options (`flutter_lints`), and pinned dependencies (`flutter_riverpod`, `freezed_annotation`, `json_annotation`, `json_schema`, `build_runner`, `freezed`, `json_serializable`).
2. Configure Android platform manifests (`android/app/src/main/AndroidManifest.xml`) with required BLE permissions (`BLUETOOTH_SCAN`, `BLUETOOTH_CONNECT`, `ACCESS_FINE_LOCATION`) and minimum SDK version 26 (Android 8.0).
3. Configure iOS platform manifests (`ios/Runner/Info.plist`) with required Bluetooth usage descriptions (`NSBluetoothAlwaysUsageDescription`, `NSBluetoothPeripheralUsageDescription`) and minimum deployment target iOS 14.0.
4. Establish the asset directory structure: `assets/profiles/` (containing the initial `air-device-profile.schema.json` and `fabrica-devkit-v1.json` profile) and `assets/icons/`.

## Task Group 2: Protocol Codecs, CRC32 Engine & Command Builder
1. Implement pure-Dart zero-allocation `TelemetryPacket` decoder (`lib/core/protocol/telemetry_packet.dart`) reading packed 31-byte Little-Endian binary payloads via `ByteData` matching `firmware/main/telemetry.h` (`system_state`, `led_state`, `active_button_id`, `current_step_idx`, `total_steps`, `step_progress_pct`, `elapsed_step_time_ms`, 16 `channel_angles`, `last_cmd_status`, `free_heap_kb`, `ble_rssi_dbm`, `error_code`, `sequence_counter`).
2. Implement pure-Dart IEEE 802.3 CRC32 checksum engine (`lib/core/protocol/crc32.dart`) using the standardized reversed polynomial `0xEDB88320` with precomputed lookup table, bit-exact with `firmware/main/storage.c`.
3. Implement `CommandBuilder` (`lib/core/protocol/command_builder.dart`) serializing wire command payloads matching `firmware/main/ble_transport.h` wire opcodes (`0x00` Run Preset, `0x01` Raw Sequence, `0x02` Stop, `0x03` Emergency Stop, `0x0A` Set Button Sequence, `0x0B` Get Config, `0x0C` Restore Defaults, `0x0D` Jog Motor, `0x0E` Identify, `0x10` Get Telemetry, `0x11` Set Stream).
4. Run code generation via `dart run build_runner build --delete-conflicting-outputs` for immutable models.

## Task Group 3: Core Dark Safety Theme & Host Validation Suite
1. Implement the industrial dark safety theme and design tokens (`lib/core/theme/`): dark background palette, high-contrast status accents (Precision Cyan `#00E5FF`, Safety Amber `#FFB300`, Alert Crimson `#FF1744`, Success Emerald `#00E676`), and typography.
2. Ensure touch target tokens enforce minimum accessibility bounds ($\ge 48\times 48\text{ dp}$) for tactile workshop interaction.
3. Author host-side unit tests (`test/protocol/telemetry_packet_test.dart`) asserting bit-exact decoding, signed RSSI handling, Little-Endian integers, and fault bitmask parsing against synthetic 31-byte byte arrays.
4. Author host-side unit tests (`test/protocol/crc32_test.dart`) asserting CRC32 checksums against known IEEE 802.3 test vectors and simulated 53-byte `fold_routine_t` payloads.
5. Author host-side unit tests (`test/protocol/command_builder_test.dart`) validating wire byte encoding for all supported opcodes.
6. Verify clean analysis and test execution via `flutter analyze` and `flutter test`.
