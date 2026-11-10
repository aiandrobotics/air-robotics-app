# Validation — Phase 5: Dynamic SDUI Renderer & Standard Widget Catalog

## Required Checks

### 1. Static Analysis & Lint Verification
The codebase must pass all strict analysis rules without errors or warnings:
```bash
flutter analyze
```
- **Acceptance Threshold**: Zero errors, zero warnings, zero linter hints.

### 2. SDUI Engine & Widget Registry Unit Tests
```bash
flutter test test/ui_engine/widget_registry_test.dart
flutter test test/ui_engine/dynamic_screen_scaffold_test.dart
```
- **Registry**: Verifies widget type registration, resolution, prop passing, and fallback card generation for unknown types.
- **Scaffold**: Verifies dynamic bottom tab creation from `DeviceProfile.screens` and widget list population.

### 3. Core Widget Catalog Unit & Widget Tests
```bash
flutter test test/ui_engine/status_banner_widget_test.dart
flutter test test/ui_engine/emergency_stop_widget_test.dart
flutter test test/ui_engine/preset_grid_widget_test.dart
flutter test test/ui_engine/jog_slider_bank_widget_test.dart
flutter test test/ui_engine/raw_hex_console_widget_test.dart
```
- **StatusBannerWidget**: Verifies correct state pill colors, LED pulsing, RSSI signal display, and fault bit handling.
- **EmergencyStopWidget**: Verifies fast-path `CMD_EMERGENCY_STOP` (`0x03`) dispatch without response and haptic trigger.
- **PresetGridWidget**: Verifies one-tap preset dispatch (`0x00`), active slot highlight, and step progress percentage display.
- **JogSliderBankWidget**: Verifies 50ms drag throttling to prevent BLE stack flooding, degree bounds enforcement, and motor jog dispatch.
- **RawHexConsoleWidget**: Verifies incoming packet decoding, drop rate calculation, and raw hex command injection to `FAB1`.

### 4. Regression Test Suite
```bash
flutter test
```
- 100% pass rate across all existing and new unit and widget tests (target: 70+ passing tests).

---

## Manual Review & Live Hardware Verification (Fabrica ESP32 on Pixel 8)

With the physical Fabrica robot powered on and connected to the Pixel 8:
1. **Dynamic Tab & Screen Verification**:
   - Verify app displays four tabs matching Fabrica profile: `Control`, `Sequencer`, `Calibrate`, and `Diagnostics`.
   - Verify switching tabs displays the respective widgets smoothly without UI lag or memory leak.
2. **Real-Time Status Banner & LED Mirroring**:
   - Observe the `StatusBannerWidget` at the top of the `Control` tab.
   - Verify machine state reflects `IDLE` (green) or `RUNNING_MOTION` (amber).
   - Verify the simulated LED blinks with the exact pattern of the physical hardware LED (`led_state`).
3. **Preset Execution & Tactile E-Stop**:
   - Tap **Adult T-Shirt** preset on the `PresetGridWidget`.
   - Observe physical servo folding motion while the preset button shows a live progress sweep.
   - Tap the tactile **EMERGENCY STOP** button mid-motion.
   - Verify physical robot halts immediately ($<50\text{ ms}$) and system transitions to `ESTOP`.
4. **Manual Servo Jogging**:
   - Navigate to the **Calibrate** tab.
   - Drag the slider for **Left Flap (Channel 0)**.
   - Verify smooth physical servo movement corresponding to slider position, throttled cleanly to 50ms intervals.
5. **Raw Hex Injection from Console**:
   - Navigate to the **Diagnostics** tab.
   - Enter `0E` into the `RawHexConsoleWidget` text box and tap **SEND**.
   - Verify Fabrica physical LED executes the identify blink sequence and the console logs `OK: 0x0E`.

---

## Merge Criteria
- [x] Working branch `phase-5-sdui-widgets` created from `main`.
- [x] `flutter analyze` passes with 0 issues.
- [x] `flutter test` executes all unit and widget tests with 100% pass rate.
- [x] Merge to `main` with `--no-ff` and push to remote.
- [x] `CHANGELOG.md` updated via `changelog-maintenance` skill.
