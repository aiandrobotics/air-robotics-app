# Requirements — Phase 1: Project Skeleton, Core Theming & Protocol Models

## Scope

### In Scope
1. **Flutter App Scaffolding**: Setup Flutter 3.x project in repository root with Dart 3 sound null safety, Riverpod state foundation, and pedantic lint rules (`analysis_options.yaml`).
2. **Platform Permissions & Configurations**: Configure Android API 26+ with BLE permissions (`BLUETOOTH_SCAN`, `BLUETOOTH_CONNECT`, `ACCESS_FINE_LOCATION`) and iOS 14.0+ `Info.plist` usage descriptions.
3. **Binary Telemetry Codec (`FAB2`)**: Zero-allocation pure Dart parser decoding 31-byte Little-Endian binary notifications into typed immutable `TelemetryPacket` structures matching `firmware/main/telemetry.h`.
4. **Data Integrity Checksum (`CRC32`)**: Pure Dart IEEE 802.3 CRC32 implementation using polynomial `0xEDB88320` matching `firmware/main/storage.c` verification.
5. **Command Encoder (`FAB1`)**: `CommandBuilder` utility serializing command opcodes and parameter payloads matching `firmware/main/ble_transport.h` (`0x00`–`0x11`).
6. **Device Profile Asset Scaffolding**: Create `assets/profiles/air-device-profile.schema.json` and bundled reference profile `assets/profiles/fabrica-devkit-v1.json`.
7. **Core Design System & Dark Safety Theme**: Industrial dark theme tokens with high-contrast safety accents (Precision Cyan `#00E5FF`, Safety Amber `#FFB300`, Alert Crimson `#FF1744`, Success Emerald `#00E676`) and minimum $48\times 48\text{ dp}$ touch targets.
8. **Host Unit Test Suite**: Comprehensive pure-Dart unit tests validating codecs, checksums, and encoders without requiring connected hardware.

### Non-Goals
1. **BLE Transport & Radio Interaction**: Physical Bluetooth scanning, SMP bonding, GATT connections, and MTU exchanges belong strictly to **Phase 2**.
2. **Telemetry Bus & Command Queue Pipeline**: StreamProvider pipelines, packet drop tracking, and queue dispatchers belong strictly to **Phase 3**.
3. **Dynamic SDUI Layout Execution**: Dynamically constructing screens and tabs from profile JSON belongs to **Phase 5**.
4. **2D Flap Canvas CustomPainter**: Interactive canvas visualizers belong to **Phase 6**.
5. **Remote Cloud Services**: Network calls or cloud synchronization (`registry.air-robotics.org`) are deferred to **Phase 7+**.

---

## Decisions

1. **Zero-Allocation Wire Unpacking**:
   - Telemetry byte arrays from `FAB2` must be parsed using Dart `ByteData.sublistView()` with explicit `Endian.little`.
   - No intermediary intermediate string or JSON allocations during the 10 Hz telemetry loop.
2. **Wire Opcode Alignment**:
   - `CommandBuilder` will encode opcodes based on `ble_opcode_t` in `firmware/main/ble_transport.h` (e.g., `0x0A` for `SET_BUTTON_SEQUENCE`, `0x03` for `EMERGENCY_STOP`), rather than internal state machine indices.
3. **Immutable Models**:
   - Freezed with `json_serializable` will be used for profile and packet data models to guarantee compile-time safety and deep immutability.
4. **Offline Asset Bundling**:
   - Pre-bundle `assets/profiles/air-device-profile.schema.json` and `assets/profiles/fabrica-devkit-v1.json` directly into the binary to ensure zero-network runtime operation.

---

## Constraints

1. **Execution Latency**: Telemetry decoding must execute in $<1\text{ ms}$ on host/mobile CPUs to avoid impeding the 10 Hz stream and 60 fps UI rendering.
2. **Bit-Exact Firmware Parity**: Field offsets, widths, signed/unsigned types, and Little-Endian byte orders must strictly match `telemetry_packet_t` (31 bytes), `fold_step_t` (3 bytes), and `fold_routine_t` (53 bytes).
3. **Platform Independence**: Code must be 100% portable across Linux, macOS, and Windows development environments without platform-specific path dependencies.
4. **Accessibility & Safety Bounds**: All interactive touch target tokens in the design system must be $\ge 48\times 48\text{ dp}$.

---

## Context

The AIR Robotics mobile companion interfaces with robots speaking the AIR Robotics BLE protocol (`0000FAB0-...`). The Fabrica cloth-folding robot (`fabrica-devkit-v1`) serves as the primary reference implementation. Phase 1 establishes the foundational project structure, core design language, and protocol data models before network or BLE hardware links are introduced in Phase 2.
