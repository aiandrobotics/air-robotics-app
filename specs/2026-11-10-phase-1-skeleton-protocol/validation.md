# Validation — Phase 1: Project Skeleton, Core Theming & Protocol Models

## Required Checks

### 1. Static Analysis & Lint Verification
The codebase must pass all strict analysis rules without errors or warnings:
```bash
flutter analyze
```
- **Acceptance Threshold**: Zero errors, zero warnings, zero linter hints on pedantic rule configuration.

### 2. Protocol Telemetry Decoder (`TelemetryPacket`) Unit Tests
```bash
flutter test test/protocol/telemetry_packet_test.dart
```
- **Packet Length Invariant**: Verifies parser accepts exactly 31-byte payloads and gracefully rejects malformed lengths ($<31\text{ bytes}$ or $>31\text{ bytes}$).
- **Bit-Exact Field Decoding**:
  - `system_state` (offset 0, uint8)
  - `led_state` (offset 1, uint8)
  - `active_button_id` (offset 2, uint8)
  - `current_step_idx` (offset 3, uint8)
  - `total_steps` (offset 4, uint8)
  - `step_progress_pct` (offset 5, uint8)
  - `elapsed_step_time_ms` (offset 6–7, uint16 Little-Endian)
  - `channel_angles` (offset 8–23, uint8[16])
  - `last_cmd_status` (offset 24, uint8)
  - `free_heap_kb` (offset 25–26, uint16 Little-Endian)
  - `ble_rssi_dbm` (offset 27, signed int8, e.g. -65 dBm)
  - `error_code` (offset 28, uint8 bitmask: BIT0=I2C, BIT1=NVS, BIT2=ESTOP)
  - `sequence_counter` (offset 29–30, uint16 Little-Endian)

### 3. IEEE 802.3 CRC32 Checksum Engine Tests
```bash
flutter test test/protocol/crc32_test.dart
```
- **Standard Test Vectors**:
  - ASCII `"123456789"` $\to$ `0xCBF43926`
  - Empty byte buffer $\to$ `0x00000000`
- **Firmware Routine Checksum Parity**:
  - Validates checksum output against simulated 49-byte sequence payloads matching `storage_compute_crc32()` in `firmware/main/storage.c`.

### 4. CommandBuilder Serialization Tests
```bash
flutter test test/protocol/command_builder_test.dart
```
- Verifies exact wire byte sequences for all opcodes:
  - `buildRunPreset(1)` $\to$ `[0x00, 0x01]`
  - `buildStop()` $\to$ `[0x02]`
  - `buildEmergencyStop()` $\to$ `[0x03]`
  - `buildRestoreFactoryPresets()` $\to$ `[0x0C]`
  - `buildJogMotor(channel: 0, angle: 90)` $\to$ `[0x0D, 0x00, 0x5A]`
  - `buildSetTelemetryStream(true)` $\to$ `[0x11, 0x01]`

### 5. Profile Schema & Asset Validation
```bash
flutter test test/profile/profile_schema_test.dart
```
- Validates `assets/profiles/fabrica-devkit-v1.json` against `assets/profiles/air-device-profile.schema.json` using `json_schema`.

---

## Manual Review

1. **Platform Manifest Review**:
   - Confirm Android permissions in `AndroidManifest.xml` include `BLUETOOTH_SCAN`, `BLUETOOTH_CONNECT`, `ACCESS_FINE_LOCATION`.
   - Confirm iOS `Info.plist` includes user-facing descriptions for `NSBluetoothAlwaysUsageDescription` and `NSBluetoothPeripheralUsageDescription`.
2. **Theme Inspection**:
   - Review `lib/core/theme/` tokens for dark background, cyan/amber/crimson/emerald accents, and minimum $48\times 48\text{ dp}$ touch target constants.

---

## Merge Criteria

- [ ] Branch `phase-1-skeleton-protocol` is rebased on latest `main`.
- [ ] `flutter analyze` passes with 0 issues.
- [ ] `flutter test` executes all unit tests with 100% pass rate.
- [ ] No platform-specific absolute paths or user-specific metadata in committed files.
