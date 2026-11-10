# Plan — Phase 5: Dynamic SDUI Renderer & Standard Widget Catalog

## Task Group 1: SDUI Engine, DynamicScreenScaffold & Widget Registry Foundation
1. **Widget Contract & Pluggable Registry** (`lib/ui_engine/widget_registry.dart`):
   - Define `SduiWidgetBuilder` typedef accepting `(BuildContext context, AirWidgetConfig config, WidgetRef ref)`.
   - Implement `WidgetRegistry` singleton/provider with register, resolve, and fallback builder mechanisms for unknown widget types.
   - Register placeholder builders for future Phase 6 visualizers (`visualizer`, `timeline-sequencer`) so screen schemas render without error.
2. **Dynamic Screen & Tab Scaffold** (`lib/ui_engine/dynamic_screen_scaffold.dart`):
   - Read `DeviceProfile.screens` from `activeProfileProvider`.
   - Render dynamic `NavigationBar` / `BottomNavigationBar` (or tabs) matching `screen.id`, `screen.title`, and `screen.icon`.
   - Render scrollable list/grid of widgets defined in `screen.widgets` dynamically via `WidgetRegistry`.
   - Provide a persistent top app bar with connection status pill, active robot model badge, and quick action icon to open the BLE Hardware Debugger.
3. **Application Shell Integration** (`lib/main.dart`):
   - Enhance root view to mount `DynamicScreenScaffold` as the primary interactive surface whenever a device profile is active.
   - Keep the existing `DeveloperDebugScreen` readily accessible via navigation action.

## Task Group 2: Core Control & Safety Widget Implementations
1. **StatusBannerWidget** (`lib/ui_engine/widget_catalog/status_banner_widget.dart`):
   - Decode `props`: `show_led_mirror`, `show_rssi`.
   - Watch `latestTelemetryProvider` and `bleConnectionStateProvider`.
   - Display machine state pill (`IDLE`, `RUNNING_MOTION`, `ESTOP`, `ERROR`, `CALIBRATING`) with matching color tokens.
   - Display firmware LED mirror pulsing widget mimicking ESP32 `led_state` patterns (`LED_STATE_*`).
   - Display RSSI signal strength bar and error code alert chips if fault bits are set (`BIT0` I2C, `BIT1` NVS, `BIT2` E-Stop).
2. **EmergencyStopWidget** (`lib/ui_engine/widget_catalog/emergency_stop_widget.dart`):
   - Large, tactile crimson Emergency Stop button ($\ge 56\text{ dp}$ height, high-contrast text).
   - Pulsating safety border when machine is in `RUNNING_MOTION` or `ESTOP`.
   - Dispatch `CMD_EMERGENCY_STOP` (`0x03`) immediately via fast-path `commandPipelineProvider.emergencyStop()` ($<50\text{ ms}$).
   - Trigger heavy impact haptic feedback (`HapticFeedback.heavyImpact()`).
3. **PresetGridWidget** (`lib/ui_engine/widget_catalog/preset_grid_widget.dart`):
   - Decode `props`: `columns`.
   - Populate from `activeProfile.presets` (e.g. 4 Fabrica presets: Adult T-Shirt, Long Sleeve, Trousers, Towels).
   - One-tap execution: dispatch `commandPipeline.runPreset(preset.id)`.
   - Display active slot indicator matching telemetry `active_button_id` with circular/linear progress sweep derived from `step_progress_pct`.
   - Disable or dim non-active buttons when motion is running.
4. **JogSliderBankWidget** (`lib/ui_engine/widget_catalog/jog_slider_bank_widget.dart`):
   - Decode `props`: `drag_throttle_ms` (default 50ms).
   - Render sliders for all actuators declared in `activeProfile.actuators` (4 channels for Fabrica).
   - Display current degree reading (e.g. `0°`–`180°`) sourced from `channel_angles` in telemetry.
   - Drag listener with 50ms throttling to command `commandPipeline.jogMotor(channel, targetAngle)` without flooding BLE buffers.
   - Include auto-home button to reset channel to `default_angle`.

## Task Group 3: Engineering Diagnostic Widgets & Navigation Integration
1. **RawHexConsoleWidget** (`lib/ui_engine/widget_catalog/raw_hex_console_widget.dart`):
   - Decode `props`: `buffer_size` (default 250).
   - Real-time rolling packet monitor showing live RX packets (`FAB2`) and TX command dispatches (`FAB1`).
   - Integrated hex injection text field to send arbitrary hex payloads directly to `FAB1` (with optional withoutResponse toggle).
   - Live packet frequency indicator (Hz) and drop rate metric counter.
2. **TelemetryStripChartWidget** (`lib/ui_engine/widget_catalog/telemetry_strip_chart_widget.dart`):
   - Decode `props`: `window_seconds` (default 10).
   - Render real-time time-series rolling chart using Flutter `CustomPainter` plotting active channel angles over time.
   - High performance, zero unnecessary allocations.
3. **Comprehensive Widget & SDUI Unit/Widget Tests**:
   - `test/ui_engine/widget_registry_test.dart`: Test widget lookup, custom registration, and fallback.
   - `test/ui_engine/dynamic_screen_scaffold_test.dart`: Test dynamic tabs and screen layout rendering from profile schema.
   - `test/ui_engine/status_banner_widget_test.dart`: Test state transitions and LED pattern mirroring.
   - `test/ui_engine/emergency_stop_widget_test.dart`: Test $<50\text{ ms}$ fast-path dispatch and haptics.
   - `test/ui_engine/preset_grid_widget_test.dart`: Test preset dispatching, progress sweeps, and button states.
   - `test/ui_engine/jog_slider_bank_widget_test.dart`: Test 50ms throttling and jog motor dispatching.
   - `test/ui_engine/raw_hex_console_widget_test.dart`: Test packet logging and hex injection.
4. **Hardware Validation with Fabrica Robot**:
   - Verify all 4 tabs (Control, Sequencer, Calibrate, Diagnostics) render on physical Pixel 8.
   - Test Preset 1 trigger, emergency stop, manual flap jog, and raw hex injection against physical ESP32.
