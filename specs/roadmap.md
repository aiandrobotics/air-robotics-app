# Roadmap — AIR Robotics Mobile Application (Flutter)

Each phase is a small, independently buildable and testable unit of work.
Build, validate, and verify each milestone before moving to the next phase.

---

## 1. Authoritative Firmware Reference & Source Code Alignment

When implementing Fabrica features, screens, protocol models, and hardware integrations, developers and agents **MUST directly refer to the authoritative ESP32 firmware source code** located in the companion `fabrica` repository at:

📁 **`<workspace>/fabrica/firmware`** (e.g. `../fabrica/firmware` or `../../fabrica/fabrica/firmware`)

### Firmware Source Code Mapping Table

| Subsystem / Feature | Firmware Source (`firmware/main/`) | Mobile App Component |
| :--- | :--- | :--- |
| **BLE Transport & GATT Topology** | `ble_transport.c`, `ble_transport.h` | `lib/core/ble/` — GATT UUIDs (`FAB0`, `FAB1`, `FAB2`, `FAB3`), DIS (`0x180A`), 120s pairing window, SMP bonding, RPA privacy resolution, 517B MTU exchange |
| **Command Opcodes & Payloads** | `command.h`, `remote_cmd.c`, `remote_cmd.h` | `lib/core/protocol/command_builder.dart` & `command_pipeline.dart` — Opcodes (`0x00`–`0x11`), argument serialization, command status acknowledgment codes |
| **31-Byte Binary Telemetry** | `telemetry.c`, `telemetry.h` | `lib/core/protocol/telemetry_packet.dart` & `telemetry_bus.dart` — Zero-allocation 31-byte Little-Endian wire unpacker, 10 Hz motion / 1 Hz idle stream handling |
| **System State Machine** | `state_machine.c`, `state_machine.h` | `lib/core/protocol/` & UI widgets — Machine states (`IDLE`, `RUNNING_MOTION`, `ESTOP`, `ERROR`, `CALIBRATING`) |
| **LED Status Indicator** | `led.c`, `led.h` | `lib/ui_engine/widget_catalog/status_banner_widget.dart` — Mirror firmware LED patterns (idle, pairing fast double-blink, estop, running, save success) |
| **Servo Kinematics & Flap Motion** | `motion.c`, `motion.h`, `pca9685.c` | `lib/visualizers/fabrica/` — Flap channel mapping (Ch 0: Left, Ch 1: Right, Ch 2: Bottom, Ch 3: Top), fold angles ($0^\circ-180^\circ$), timing sweeps |
| **NVS Presets & CRC32 Storage** | `storage.c`, `storage.h` | `lib/core/protocol/crc32.dart` & `timeline_sequencer_widget.dart` — 212-byte `FAB3` sequence table, IEEE 802.3 CRC32 verification |
| **Physical Button Hardware** | `buttons.c`, `buttons.h` | Preset mapping (Buttons 1–4) & physical 3-second button hold pairing gate logic |
| **Global Parameters & Bounds** | `config.h` | Timing thresholds, angle bounds, safety limits, firmware version constants |

---

## 2. Hardware Testing Progression & Hex Command Injection

Testing against the physical Fabrica robot follows an incremental verification progression:

| Phase | Interacts with Hardware? | What Can Be Tested with Fabrica | Hex Command Testing Capability |
| :--- | :---: | :--- | :--- |
| **Phase 0 & 1** | ❌ *(Host Only)* | Host-only unit tests (`flutter test`) verifying packet serialization, binary decoders, and CRC32 without needing the robot powered on. | Protocol unit test assertions against synthetic binary frames. |
| **Phase 2** | **✅ YES (First Hardware Link)** | **Hardware interaction begins:** Peripheral discovery (`Fabrica-*`), physical 120s Hold-to-Pair gate (`LED_STATE_BLE_PAIRING`), SMP bonding, RPA auto-reconnect, and GATT discovery (`FAB1`, `FAB2`, `FAB3`). | Developer debug input field to dispatch arbitrary raw hex bytes to `FAB1`. |
| **Phase 3** | **✅ YES** | Ingestion of live 31-byte telemetry stream from `FAB2` (10 Hz motion, 1 Hz idle), fast-path $<50\text{ ms}$ Emergency Stop (`0x03`), and `last_cmd_status` checking. | Command pipeline verifies raw opcode execution against live ESP32 firmware responses. |
| **Phase 4** | **✅ YES** | Automatic dynamic binding to DIS Model Number (`"Fabrica-DevKit-v1"`), loading on-device profile, and offline persistence. | Test profile overrides and configuration persistence against live device. |
| **Phase 5** | **✅ YES** | Full UI surface testing: real-time status banner, jog slider bank, preset grid, and tactile E-Stop. | **`RawHexConsoleWidget`**: styled UI console with text input to send arbitrary hex commands and view live incoming packet stream. |
| **Phase 6** | **✅ YES** | Complete operational validation: 2D Flap visualizer canvas animating at 60 fps matching physical flap motion, sequence preview, and flash button commits. | Full end-to-end multi-step sequence execution on physical robot. |

---

## Phase 0 — Project Constitution & Mobile Specs ✅
- Create `specs/mission.md`, `specs/roadmap.md`, and `specs/tech-stack.md`.
- Establish architectural foundation: **Flutter (Dart 3)** cross-platform framework, **`flutter_blue_plus`** for native CoreBluetooth/BluetoothGatt BLE, **Riverpod** for reactive state, and **Hive** for local offline persistence.
- Establish the **On-Device Profile-Driven Architecture**: Single generic **AIR Robotics** companion app dynamically rendering robot interfaces from pre-bundled on-device **Device Profiles** (`assets/profiles/`).
- Formulate the reference implementation profile for the **Fabrica Cloth Folding Robot** (`fabrica-devkit-v1`), mapping directly to the ESP32 firmware GATT services (`FAB1`, `FAB2`, `FAB3`).

---

## Phase 1 — Project Skeleton, Core Theming & Protocol Models ✅
- **Firmware Reference**: Inspect `firmware/main/command.h`, `firmware/main/telemetry.h`, and `firmware/main/storage.h` for exact struct byte offsets, Little-Endian packing, and opcode constants.
- **Flutter Project Scaffolding** (`mobile-app/`):
  - Initialize Flutter project with strict lint rules (`flutter_lints`, pedantic analysis options).
  - Configure Android permissions (`BLUETOOTH_SCAN`, `BLUETOOTH_CONNECT`, `ACCESS_FINE_LOCATION`) and iOS `Info.plist` usage descriptions (`NSBluetoothAlwaysUsageDescription`).
  - Configure assets directory: `assets/profiles/` and `assets/icons/`.
- **Protocol Data Models & Binary Codecs** (`lib/core/protocol/`):
  - Implement zero-allocation `TelemetryPacket` decoder unpacking the packed 31-byte Little-Endian struct (`system_state`, `led_state`, `active_button_id`, `current_step_idx`, `total_steps`, `step_progress_pct`, `elapsed_step_time_ms`, 16 `channel_angles`, `last_cmd_status`, `free_heap_kb`, `ble_rssi_dbm`, `error_code`, `sequence_counter`) matching `telemetry.h`.
  - Implement standard IEEE 802.3 CRC32 checksum engine (`0xEDB88320` polynomial) matching `storage.c` for sequence validation.
  - Implement `CommandBuilder` for encoding opcodes matching `command.h` (`0x00` Run Preset, `0x01` Raw Preview, `0x02` Stop, `0x03` E-Stop, `0x0A` Save Preset, `0x0D` Jog Motor, `0x11` Telemetry Stream Control).
- **Core Theming & Design System** (`lib/core/theme/`):
  - Implement Dark Mode theme with high-contrast safety accents (Precision Cyan `#00E5FF`, Safety Amber `#FFB300`, Alert Crimson `#FF1744`, Success Emerald `#00E676`).
  - Configure typography, touch targets ($\ge 48\times 48\text{ dp}$), and tactile haptics.
- **Validation**: Host unit tests (`flutter test`) verifying 100% bit-exact telemetry decoding, CRC32 parity against test vectors, and command serialization (no physical hardware required).

---

## Phase 2 — Universal BLE Transport, Scanning, Hold-to-Pair & SMP Bonding ✅
- **Firmware Reference**: Inspect `firmware/main/ble_transport.c`, `firmware/main/ble_transport.h`, `firmware/main/led.c`, and `firmware/main/buttons.c`.
- **Discovery & RSSI Filtering** (`lib/core/ble/ble_scanner.dart`):
  - Implement BLE scanner with prefix filtering (`Fabrica-*` and AIR Robotics ecosystem hardware).
  - Provide RSSI signal strength smoothing (rolling exponential average).
  - Surface active 120-second pairing window indicators (`LED_STATE_BLE_PAIRING` fast double-blink) to guide user onboarding.
- **Connection Lifecycle & SMP Bonding** (`lib/core/ble/ble_connection_manager.dart`):
  - Implement deterministic connection state machine (Disconnected $\to$ Scanning $\to$ Connecting $\to$ Discovering $\to$ Bonding $\to$ Ready).
  - Handle peripheral-initiated SMP "Just Works" LE Secure Connections bonding; store peer identity keys for RPA privacy resolution.
  - Implement exponential backoff auto-reconnect logic (1s, 2s, 4s, 8s, up to 30s max).
- **GATT Service Discovery & MTU Negotiation** (`lib/core/ble/ble_gatt_service.dart`):
  - Request 517-byte MTU exchange upon ACL connection.
  - Query standard Device Information Service (`0x180A`) characteristics: Model Number (`0x2A24`), Firmware Revision (`0x2A26`), and Manufacturer (`0x2A29` `"AIR Robotics"`).
  - Discover primary AIR Robotics Service (`0000FAB0-...`) and bind characteristics: `FAB1` (Control Point), `FAB2` (Telemetry Stream), and `FAB3` (Button Sequences).
- **Developer Debug Input**: Provide a lightweight developer hex entry input in the debug screen to send raw test bytes directly to `FAB1`.
- **Hardware Validation with Fabrica**:
  1. Boot ESP32 hardware and initiate 3-second button hold to enter pairing mode (`LED_STATE_BLE_PAIRING`).
  2. Scan and discover `Fabrica-XXXX` peripheral.
  3. Complete SMP bonding and establish persistent link keys.
  4. Verify automatic reconnection across 15-minute RPA address rotation.
  5. Verify DIS reading and characteristic discovery.

---

## Phase 3 — Binary Telemetry Bus & Real-Time Command Pipeline ✅
- **Firmware Reference**: Inspect `firmware/main/telemetry.c`, `firmware/main/remote_cmd.c`, and `firmware/main/state_machine.c`.
- **Reactive Telemetry Stream Pipeline** (`lib/core/protocol/telemetry_bus.dart`):
  - Subscribe to `FAB2` notifications and pipe incoming raw byte arrays through `TelemetryPacket.fromBytes()`.
  - Expose stream via Riverpod `StreamProvider<TelemetryPacket>` for zero-latency UI reactivity.
  - Implement drop detection: track sequence counter discontinuities and calculate live packet drop rates.
  - Handle rate transitions: smooth rendering between 10 Hz motion stream and 1 Hz idle stream as emitted by firmware.
- **Command Dispatch Pipeline & Fast-Path E-Stop** (`lib/core/protocol/command_pipeline.dart`):
  - Implement unified command dispatcher for `FAB1`.
  - **Fast-Path Emergency Stop**: Direct invocation of `writeWithoutResponse` bypassing command queues, achieving $<50\text{ ms}$ abort latency on the robot.
  - Implement request-response tracking for `last_cmd_status` acknowledgments (`OK`, `ERR_BUSY`, `ERR_CRC_MISMATCH`).
- **Hardware Validation with Fabrica**:
  1. Receive continuous live telemetry notifications on `FAB2` and confirm monotonic sequence counters.
  2. Dispatch `CMD_RUN_PRESET_1` (`0x00 0x01`) and observe telemetry transition from 1 Hz idle to 10 Hz motion.
  3. Dispatch `CMD_EMERGENCY_STOP` (`0x03`) during active motion and verify physical abort in $<50\text{ ms}$ (`system_state == ESTOP`).

---

## Phase 4 — Dynamic Profile Engine, JSON Schema Validator & Local Storage ✅
- **Firmware Reference**: Inspect `firmware/main/config.h` for default channel bounds, servo timings, and capabilities.
- **Profile Schema & Serialization** (`lib/core/profile/`):
  - Embed `assets/profiles/air-device-profile.schema.json` and validate on-device profiles using Dart `json_schema`.
  - Implement `DeviceProfile` immutable data models with Freezed/JSON serialization.
  - Model capabilities (channel counts, limits, E-Stop support), command dictionaries, telemetry layouts, and screen descriptors.
- **On-Device Profile Resolution Hierarchy** (`lib/core/profile/profile_resolver.dart`):
  - Tier 1: In-memory compiled profile cache.
  - Tier 2: Local Hive document storage (persisting user overrides and calibration settings).
  - Tier 3: Pre-packaged asset bundles (`assets/profiles/fabrica-devkit-v1.json`).
  - Tier 4: Generic diagnostic fallback profile for unrecognized robot models.
- **Hardware Validation with Fabrica**:
  1. Read model string `"Fabrica-DevKit-v1"` over DIS `0x2A24`.
  2. Confirm automatic binding to `assets/profiles/fabrica-devkit-v1.json`.
  3. Validate offline persistence in Hive across app restart without network connection.

---

## Phase 5 — Dynamic SDUI Renderer & Standard Widget Catalog ✅
- **Firmware Reference**: Inspect `firmware/main/remote_cmd.h`, `firmware/main/led.h`, and `firmware/main/buttons.h`.
- **Dynamic Screen & Tab Scaffold** (`lib/ui_engine/dynamic_screen_scaffold.dart`):
  - Dynamically render adaptive top bars, tab navigators, and scrollable content bodies from profile `screens` array.
- **Standard Widget Library** (`lib/ui_engine/widget_catalog/`):
  - `StatusBannerWidget`: Real-time machine state text, LED pulse mirror (`LED_STATE_*`), RSSI signal bar, and persistent error alerts.
  - `EmergencyStopWidget`: Tactile red emergency stop button with pulsating warning border and haptic feedback.
  - `PresetGridWidget`: 4-slot preset grid with 1-tap trigger, circular progress sweep, and long-press configuration.
  - `JogSliderBankWidget`: Actuator calibration sliders with 50ms drag throttling, direct degree readouts, and auto-home on exit.
  - `RawHexConsoleWidget`: **Engineering diagnostic tool with rolling packet log, drop rate metrics, and raw hex command injection text box.**
  - `TelemetryStripChartWidget`: Rolling time-series motor trajectory tracking.
- **Hardware Validation with Fabrica**:
  1. Send custom raw hex opcodes from the `RawHexConsoleWidget` text box directly to Fabrica and view live firmware responses.
  2. Jog individual servos via calibration sliders and verify immediate mechanical response on the robot.
  3. Trigger presets 1–4 from the `PresetGridWidget` and observe live progress updates.

---

## Phase 6 — Fabrica Reference Implementation: 2D Flap Canvas, Sequencer & E2E Validation ✅
- **Firmware Reference**: Inspect `firmware/main/motion.c`, `firmware/main/pca9685.c`, and `firmware/main/storage.c`.
- **Custom Canvas: Fabrica 2D Flap Visualizer** (`lib/visualizers/fabrica/`):
  - Implement `FabricaFlapGrid` using Flutter `CustomPainter`.
  - Draw Left (Ch 0), Right (Ch 1), Bottom (Ch 2), and Top (Ch 3) panels with planar perspective and realistic fold angles ($0^\circ \text{ to } 180^\circ$).
  - Interpolate live angles from `channel_angles` telemetry at 60 fps.
  - Implement interactive touch-jog gestures: drag virtual flaps on screen to position physical servos in calibration mode.
- **Timeline Sequence Builder & NVS Synchronization** (`lib/ui_engine/widget_catalog/timeline_sequencer_widget.dart`):
  - Multi-step interactive editor (up to 16 steps, parallel flap execution, dwell duration).
  - Preview raw routine on robot without saving (`CMD_RUN_RAW_SEQUENCE` / `0x01`).
  - Save routine to Buttons 1–4 with auto-CRC32 calculation (`CMD_SET_BUTTON_SEQUENCE` / `0x0A` and `FAB3`).
  - One-tap factory default preset restoration (`CMD_RESTORE_FACTORY_PRESETS` / `0x0C`).
- **End-to-End System Validation on Fabrica Hardware**:
  - Live hardware test against the ESP32 Dev Board running the Fabrica firmware:
    1. 120s Hold-to-Pair discovery & SMP bonding confirmation.
    2. Real-time 10 Hz telemetry tracking during Adult T-Shirt fold execution (Preset 1).
    3. Live 2D Flap Visualizer articulating smoothly at 60 fps matching physical flaps.
    4. $<50\text{ ms}$ Emergency Stop abort verification during active fold cycle.
    5. Custom routine creation, raw preview, and flash persistence to Button 2.
    6. Offline recovery across app restart with zero internet connection.

---

## Future Expansion: Cloud Profile Registry (Phase 7+)
- Asynchronous cloud synchronization from `registry.air-robotics.org` using HTTP ETag caching.
- Over-the-air profile updates for community-built robotics hardware without requiring new mobile app store releases.
