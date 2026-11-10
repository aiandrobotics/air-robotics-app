# Validation — Phase 6: Fabrica Reference Implementation: 2D Flap Canvas, Sequencer & E2E Validation

## Required Checks

### 1. Static Analysis & Lint Verification
The codebase must pass all strict analysis rules without errors or warnings:
```bash
flutter analyze
```
- **Acceptance Threshold**: Zero errors, zero warnings, zero linter hints.

### 2. 2D Flap Canvas & Kinematics Unit Tests
```bash
flutter test test/visualizers/fabrica_geometry_test.dart
flutter test test/visualizers/fabrica_flap_canvas_test.dart
```
- **Geometry & Math**: Verifies angle projection scaling ($0^\circ \to 1.0$, $90^\circ \to 0.0$, $180^\circ \to -1.0$) and hit-testing on Left, Right, Bottom, Top panels.
- **Canvas Rendering**: Verifies `CustomPainter` renders all 4 panels without exception and updates when angles change.
- **Interactive Drag**: Verifies touch drag in calibration mode triggers throttled `jogMotor` dispatches.

### 3. Timeline Sequencer Widget Tests
```bash
flutter test test/ui_engine/timeline_sequencer_widget_test.dart
```
- **Step Management**: Verifies adding, editing, and deleting steps up to 16 maximum.
- **Stateless Raw Preview**: Verifies tapping "Preview on Robot" serializes `FoldRoutine` and dispatches `CMD_RUN_RAW_SEQUENCE` (`0x01`).
- **NVS Flash Programming**: Verifies selecting Button slot 2 serializes `FoldRoutine` with 4-byte CRC32 and dispatches `CMD_SET_BUTTON_SEQUENCE` (`0x0A 0x02`).
- **Factory Reset**: Verifies tapping "Restore Defaults" dispatches `CMD_RESTORE_FACTORY_PRESETS` (`0x0C`).

### 4. Regression Test Suite
```bash
flutter test
```
- 100% pass rate across all existing and new unit and widget tests (target: 85+ passing tests).

---

## Manual Review & End-to-End Hardware Checklist (Fabrica ESP32 on Pixel 8)

With the physical Fabrica DevKit robot powered on and connected to the Pixel 8:
1. **120s Pairing & Discovery**:
   - Hold hardware button for 3 seconds (`LED_STATE_BLE_PAIRING`).
   - Connect via app; verify SMP bonding and automatic transition to Dynamic Profile UI.
2. **Interactive 2D Flap Visualizer**:
   - Navigate to the **Sequencer** tab.
   - Trigger Preset 1 (Adult T-Shirt): observe 2D on-screen flaps articulate in real-time matching physical panels at 60 fps.
3. **Custom Sequence Creation & Stateless Preview**:
   - In the Sequencer editor, build a custom 3-step routine:
     - Step 1: Left Flap (Ch 0)
     - Step 2: Right Flap (Ch 1)
     - Step 3: Bottom Flap (Ch 2)
   - Tap **PREVIEW ON ROBOT**: verify Fabrica executes the 3 steps immediately in RAM without altering stored flash presets.
4. **Flash Programming to Button 2**:
   - Tap **SAVE TO PRESET BUTTON**, choose **Button 2 (Long Sleeve)**, and confirm.
   - Verify ESP32 LED blinks green (`LED_STATE_SAVE_SUCCESS`).
   - Disconnect app and press physical hardware **Button 2** on the robot: verify robot executes the newly programmed 3-step sequence from flash.
5. **Fast-Path Emergency Stop Abort**:
   - Run the sequence again from app.
   - Tap **EMERGENCY STOP** during active motion: verify physical fold cycle halts immediately in $<50\text{ ms}$.
6. **Factory Default Recovery**:
   - Tap **RESTORE FACTORY DEFAULTS**: verify Button 2 resets back to factory Long Sleeve routine.

---

## Merge Criteria
- [x] Working branch `phase-6-fabrica-visualizer-sequencer` created from `main`.
- [x] `flutter analyze` passes with 0 issues.
- [x] `flutter test` executes all unit and widget tests with 100% pass rate.
- [x] Merge to `main` with `--no-ff` and push to remote.
- [x] `CHANGELOG.md` updated via `changelog-maintenance` skill.
