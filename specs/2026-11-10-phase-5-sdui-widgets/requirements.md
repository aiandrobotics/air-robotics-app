# Requirements — Phase 5: Dynamic SDUI Renderer & Standard Widget Catalog

## Scope
Phase 5 implements the Server-Driven UI (SDUI) rendering architecture and the core standard widget catalog for AIR Robotics. Instead of hardcoded screens, the UI dynamically interprets `DeviceProfile.screens` and renders adaptive bottom/top tab bars and component bodies using a pluggable `WidgetRegistry`.

### In-Scope Subsystems & Widgets
1. **`DynamicScreenScaffold`**:
   - Reads the active `DeviceProfile` from Riverpod `activeProfileProvider`.
   - Dynamically constructs tabs for every item in `profile.screens` (e.g. `Control`, `Sequencer`, `Calibrate`, `Diagnostics`).
   - Renders each screen's `widgets` array in an optimized, scrollable layout.
   - Provides a global app bar with connection status, robot model indicator, and debug navigation shortcut.
2. **`WidgetRegistry`**:
   - Central registration hub mapping widget type strings (`status-banner`, `preset-grid`, `emergency-stop-button`, `jog-slider-bank`, `raw-hex-console`, `telemetry-strip-chart`, `visualizer`, `timeline-sequencer`) to concrete Flutter widget builders.
   - Graceful fallback for unrecognized widget types (rendering a fallback card displaying widget type and properties).
3. **Core Standard Widget Catalog**:
   - **`StatusBannerWidget`**: Real-time state machine pill (`IDLE`, `RUNNING_MOTION`, `ESTOP`, `ERROR`, `CALIBRATING`), ESP32 LED pattern mirror (`LED_STATE_*`), BLE RSSI indicator, and error alerts.
   - **`EmergencyStopWidget`**: Prominent tactile E-Stop button with safety border, haptics, and fast-path $<50\text{ ms}$ `writeWithoutResponse` dispatch.
   - **`PresetGridWidget`**: Dynamic 2-column or 1-column grid representing robot presets (e.g. 4 Fabrica folding presets), displaying active step progress derived from `step_progress_pct`.
   - **`JogSliderBankWidget`**: Calibration sliders for all declared actuators with 50ms drag throttling to protect radio bandwidth, dual readout of commanded vs actual angles, and an auto-home trigger.
   - **`RawHexConsoleWidget`**: Real-time engineering console showing live incoming telemetry packets and outgoing commands, drop rates, and an interactive hex command injector.
   - **`TelemetryStripChartWidget`**: Lightweight time-series rolling chart rendering live servo angles.

## Decisions
1. **Dynamic Navigation Architecture**:
   - `DynamicScreenScaffold` serves as the primary view when a robot is bound to `activeProfileProvider`.
   - The navigation structure directly mirrors the profile's `screens` definition, enabling identical app code to render vastly different UI layouts across different robot types.
2. **Throttled Jog Commands**:
   - Dragging jog sliders throttles BLE `CMD_JOG_MOTOR` (`0x0D`) writes to at most once per 50ms (`drag_throttle_ms`) using a lightweight Dart timer/debouncer, preventing BLE stack congestion.
3. **Safety Fast-Path Preservation**:
   - The `EmergencyStopWidget` bypasses all SDUI abstractions and directly invokes `CommandPipeline.emergencyStop()` to guarantee hard safety compliance.
4. **Phase 6 Forward Compatibility**:
   - For `visualizer` and `timeline-sequencer` widget types (which receive specialized implementations in Phase 6), the registry provides informative interactive placeholder cards allowing the rest of the application screens to operate completely without crashes.

## Constraints
1. **100% Offline Autonomy**: All widgets and screens must render offline with zero network dependencies.
2. **Deterministic UI Responsiveness**: Widgets must bind to reactive Riverpod providers (`latestTelemetryProvider`, `bleConnectionStateProvider`) with 0 frame drops on 60/120 Hz displays.
3. **Touch Accessibility**: All interactive buttons, sliders, and controls must maintain touch targets $\ge 48\times 48\text{ dp}$.

## Non-goals
- Full 2D kinematic canvas math and interactive flap fold graphics (reserved for Phase 6: `lib/visualizers/fabrica/`).
- Full multi-step sequence timeline editing and NVS flash burning (reserved for Phase 6: `timeline_sequencer_widget.dart`).
- Remote SDUI downloads over HTTP (reserved for Phase 7+ cloud expansion).

## Context & Authoritative Firmware Mapping
- **System States & LED Modes**: `firmware/main/state_machine.h` & `firmware/main/led.h`.
- **Command Dispatch Opcodes**: `firmware/main/command.h` (`0x00` Run Preset, `0x02` Stop, `0x03` E-Stop, `0x0D` Jog Motor).
- **Telemetry Wire Protocol**: `firmware/main/telemetry.h` (31-byte Little-Endian struct).
- **Bundled Profile**: `assets/profiles/fabrica-devkit-v1.json`.
