# AIR Robotics Mobile Application Mission Specification

## Project Purpose

Develop, implement, and validate **AIR Robotics** — a universal, high-performance, cross-platform mobile companion platform built with **Flutter (Dart 3)** for controlling robots wirelessly over Bluetooth Low Energy (BLE).

The `mobile-app` subsystem provides the wireless user interface, motion sequencer, real-time telemetry dashboard, and configuration manager for the **Fabrica Cloth Folding Robot** and future AIR Robotics-compatible hardware. 

Rather than building isolated, single-use mobile applications for each robot, **AIR Robotics is a generic companion application**. The app discovers, connects to, and controls any robot speaking the **AIR Robotics BLE protocol**. Each robot type plugs in dynamically as a **Device Profile** that declaratively describes what the robot can do, what telemetry it produces, what commands it accepts, and how its user interface screens should look.

In **Phase 1**, all Device Profiles are stored **100% on-device** (pre-bundled in the application asset bundle under `assets/profiles/`). This guarantees immediate, zero-latency startup and complete offline operation without requiring internet connectivity or external cloud servers. Dynamic cloud profile distribution and over-the-air updates will be introduced as an expansion in a future phase.

The mobile application is designed to be:
- **Universal & Profile-Driven**: A single unified mobile companion app (**AIR Robotics**). Robot models are identified via standard BLE Device Information Service (`0x180A`, DIS `0x2A24`), loading tailored controls, telemetry decoders, and UI dashboards dynamically from local on-device profiles.
- **Enterprise-Grade Wireless Reliability**: Industrial BLE core built on `flutter_blue_plus`, supporting 120-second "Hold-to-Pair" physical security gating, SMP "Just Works" LE Secure Connections bonding, seamless automatic reconnection across 15-minute Resolvable Private Address (RPA) rotations, and MTU auto-negotiation up to 517 bytes.
- **Ultra-Low Latency & High Frame-Rate**: Zero-copy 31-byte binary telemetry decoding at 10 Hz during active motion, throttled to 1 Hz during idle, rendering smoothly at 60/120 fps without garbage collection pauses.
- **Fail-Safe & Instant Emergency Abort**: Dedicated fast-path Emergency Stop (`CMD_EMERGENCY_STOP` / `0x03`) dispatched via `Write Without Response` to preempt any running motion and home actuators to safety in $<50\text{ ms}$.
- **100% Offline-First by Design**: Functions completely offline in workshops, makerspaces, or laundry rooms using a local on-device profile resolution hierarchy (Memory $\to$ Local Storage $\to$ Bundled Asset $\to$ Generic Fallback) and local sequence database.
- **Extensible Dynamic UI & Native Canvas**: Rich Server-Driven UI (SDUI) widget catalog paired with an extensible native canvas registry for complex mechanical visualizers (e.g. Fabrica's interactive 2D flap grid).

---

## Core Subsystems & Scalable Architecture

```mermaid
graph TD
    subgraph BLE_Hardware [AIR Robotics BLE Hardware Ecosystem]
        ESP32[ESP32 Robot Controller<br/>GATT Server: FAB0 Base UUID]
    end

    subgraph Flutter_Client [AIR Robotics Mobile Application (Flutter)]
        subgraph Transport_Core [1. Universal BLE Transport Layer]
            SCANNER[BLE Discovery & RSSI Filter]
            SECURITY[SMP Bonding & RPA Resolver]
            GATT[GATT Client & MTU 517B Handler]
            AUTO_RECONNECT[Exponential Backoff Reconnect]
        end

        subgraph Protocol_Bus [2. Protocol Codec & Telemetry Bus]
            BINARY_DECODER[Zero-Copy 31B Struct Decoder]
            TELEM_STREAM[10 Hz / 1 Hz Reactive Stream]
            CMD_PIPELINE[Command Serializer & E-Stop Fast-Path]
            CRC32_ENGINE[IEEE 802.3 CRC32 Engine]
        end

        subgraph Profile_Engine [3. On-Device Profile Runtime]
            PROFILE_RESOLVER[On-Device Profile Resolver]
            SCHEMA_VALIDATOR[JSON Schema Validator]
            LOCAL_STORAGE[(Hive Storage & User Customizations)]
            BUNDLED_ASSETS[Pre-Bundled Asset Profiles<br/>assets/profiles/*.json]
        end

        subgraph UI_Engine [4. Dynamic SDUI & Presentation]
            DYNAMIC_SCAFFOLD[Adaptive Screen & Tab Scaffold]
            WIDGET_CATALOG[Dynamic Widget Catalog<br/>Banners, Presets, Sliders, E-Stop]
            CANVAS_REGISTRY[Pluggable Canvas Registry]
            FABRICA_CANVAS[Fabrica 2D Flap Visualizer<br/>CustomPainter 60fps Interactive]
        end
    end

    ESP32 <-->|DIS 0x180A + FAB0 Service| GATT
    GATT --> BINARY_DECODER
    CMD_PIPELINE -->|FAB1 Write| GATT
    BINARY_DECODER --> TELEM_STREAM
    TELEM_STREAM --> WIDGET_CATALOG
    TELEM_STREAM --> FABRICA_CANVAS
    PROFILE_RESOLVER --> LOCAL_STORAGE
    PROFILE_RESOLVER --> BUNDLED_ASSETS
    PROFILE_RESOLVER --> SCHEMA_VALIDATOR
    PROFILE_RESOLVER --> DYNAMIC_SCAFFOLD
    DYNAMIC_SCAFFOLD --> WIDGET_CATALOG
    CANVAS_REGISTRY --> FABRICA_CANVAS
    WIDGET_CATALOG --> CANVAS_REGISTRY
```

### 1. Universal BLE Transport & Security Layer
* **120-Second Hold-to-Pair Integration**: Scans for peripherals advertising with configured prefix (`Fabrica-XXXX`). Honors the robot's physical 3-second button hold pairing gate, providing visual feedback during the 120-second discovery window (`LED_STATE_BLE_PAIRING`).
* **SMP "Just Works" LE Secure Connections Bonding**: Proactively completes native Bluetooth pairing prompts, exchanging and storing encryption keys (LTK) and Identity Resolving Keys (IRK).
* **RPA Privacy Resolution**: Automatically reconnects to bonded robots as their Bluetooth MAC address rotates periodically (standard iOS/Android 15-minute Resolvable Private Address cycle) without requiring manual re-pairing.
* **GATT MTU Auto-Negotiation**: Automatically negotiates ATT MTU up to 517 bytes upon connection to enable high-throughput sequence table synchronization (`FAB3`).

### 2. Binary Protocol Codec & Telemetry Bus
* **Zero-Allocation ByteData Unpacker**: Ingests packed 31-byte Little-Endian binary frames from `FAB2` notification streams into typed immutable `TelemetryPacket` models at 10 Hz during motion, dropping to 1 Hz during idle.
* **Stream Quality & Drop Tracking**: Monitors the monotonically increasing 16-bit packet sequence counter to register dropped frames, radio jitter, and link RSSI in diagnostics.
* **Fast-Path Emergency Stop**: Dispatches `CMD_EMERGENCY_STOP` (`0x03`) directly via `Write Without Response`, bypassing intermediate job queues to enforce $<50\text{ ms}$ physical abort latency.
* **IEEE 802.3 CRC32 Generation**: Calculates deterministic CRC32 checksums (`0xEDB88320` polynomial) for custom sequences before persisting them to robot flash (`FAB3` / `CMD_SET_BUTTON_SEQUENCE`).

### 3. On-Device Profile Runtime (Phase 1)
* **Local Resolution Hierarchy**: Resolves device profiles using an entirely on-device, offline waterfall:
  1. *Memory Cache*: Instant hot lookup of the active compiled profile.
  2. *Local Storage (Hive)*: Persisted user-customized sequences and saved calibration offsets.
  3. *Pre-Bundled Assets*: Default JSON profiles stored in `assets/profiles/` (e.g., `fabrica-devkit-v1.json`).
  4. *Generic Fallback*: Auto-generated diagnostic UI with generic sliders and raw hex monitor if an unrecognized robot connects.
* **JSON Schema Enforced**: Validates profiles against `air-device-profile.schema.json` to guarantee structural consistency.

### 4. Dynamic SDUI & Widget Catalog
* **Declarative Layout Engine**: Dynamically constructs screen scaffolds, tab bars, and responsive widget grids from profile definitions.
* **Built-in Widget Library**:
  - `status-banner`: Real-time machine state, LED pattern mirror, and error alerts.
  - `emergency-stop-button`: Sticky tactile red safety button with haptic feedback.
  - `preset-grid`: 1-tap triggering of Button 1–4 routines with animated step progress.
  - `jog-slider-bank`: Calibrated real-time motor positioning with safety boundary clamping.
  - `timeline-sequencer`: Multi-step drag-and-drop folding routine editor.
  - `telemetry-strip-chart`: Rolling time-series trajectory tracking.
  - `raw-hex-console`: Low-level engineer packet inspector and command injector.

### 5. Pluggable Custom Canvas Registry (Fabrica Visualizer)
* **CustomPainter Canvas Engine**: Exposes an extensibility hook for domain-specific visualizers.
* **`fabrica-flap-grid` Reference Component**: Interactive 2D planar projection of the Fabrica folding table. Animates Left (Ch 0), Right (Ch 1), Bottom (Ch 2), and Top (Ch 3) flaps smoothly in real time at 60 fps based on live telemetry angles. Supports touch-drag gestures to jog servos directly from the screen during calibration mode.

### 6. Visual Sequence Builder & Flash Memory Manager
* **Stateless Preview**: Test custom folding routines on the robot in real time (`CMD_RUN_RAW_SEQUENCE`) without committing changes to flash memory.
* **1-Tap Flash Persistence**: Commit custom routines to physical Buttons 1–4 with auto-generated CRC32 checksums, verified via read-back notifications on `FAB3`.
* **Factory Default Reset**: One-touch recovery of factory garment presets (Adult T-Shirt, Long Sleeve, Trousers, Towels).

---

## Target Audience & Supported Platforms

- **Primary Platforms**: iOS (14.0+) and Android (8.0+ / API Level 26+).
- **Target Audience**: Makers, STEM educators, and robotics enthusiasts operating the Fabrica cloth folder, alongside open-source robotics builders implementing the AIR Robotics protocol on custom hardware.

---

## System Invariants & Success Criteria

1. **Safety Interlock**: Physical Emergency Stop command (`0x03`) executes from UI tap to BLE radio link layer in $<50\text{ ms}$.
2. **Telemetry Performance**: Ingestion and UI rendering of 10 Hz binary telemetry stream consumes $<5\%$ CPU on mid-tier mobile hardware, maintaining a consistent 60 fps without frame drops.
3. **Zero-Setup Pairing**: Successful SMP pairing and bonding within the 120-second pairing window with persistent auto-reconnection across RPA rotations.
4. **Data Integrity**: 100% bit-exact parity between client-generated CRC32 sequence checksums and firmware NVS flash verification.
5. **Zero-Network Dependency**: 100% of controls, profiles, and sequences function completely offline without active internet connection.
