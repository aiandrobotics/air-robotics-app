# Validation — Phase 7: Consumer Shell Polish & App Store Readiness

## Required Checks

### 1. Static Analysis & Lint Verification
The codebase must pass all strict analysis rules without errors or warnings:
```bash
flutter analyze
```
- **Acceptance Threshold**: Zero errors, zero warnings, zero linter hints.

### 2. Virtual Simulator & Demo Mode Unit Tests
```bash
flutter test test/ble/simulated_ble_transport_test.dart
```
- Verifies virtual robot connection lifecycle and DIS metadata.
- Verifies 10 Hz telemetry emission during fold routine execution and 1 Hz during idle.
- Verifies channel angle sweeps during Preset 1 execution.
- Verifies immediate angle update on `CMD_JOG_MOTOR` (`0x0D`).
- Verifies immediate abort to idle on `CMD_EMERGENCY_STOP` (`0x03`).

### 3. Consumer Landing Dashboard & Onboarding Widget Tests
```bash
flutter test test/screens/landing_dashboard_screen_test.dart
```
- Verifies modern landing UI renders without Phase 1 developer text.
- Verifies scanning radar animation and 3-second hold pairing prompt.
- Verifies discovered robot card display, RSSI meter, and connect callback.
- Verifies "EXPLORE FABRICA (OFFLINE DEMO)" enters demo mode and renders the Fabrica profile.
- Verifies pre-permission prompt display and actions.

### 4. Full Regression Test Suite
```bash
flutter test
```
- 100% pass rate across all existing 97 tests and new Phase 7 tests (target: 105+ tests).

---

## Manual Review & Demo Steps

1. **Launch App Disconnected**:
   - Verify splash screen launches in dark theme without white flash.
   - Verify landing screen renders the consumer-grade onboarding header, BLE radar scanning animation, and pairing instruction card.
2. **Offline Demo Mode**:
   - Tap **"EXPLORE FABRICA (OFFLINE DEMO)"**.
   - Verify app immediately loads the Fabrica dynamic screen scaffold.
   - Navigate to **Sequencer** tab: observe the 2D Kinematic Canvas is live.
   - Navigate to **Control** tab: tap **Preset 1 (Adult T-Shirt)**.
   - Switch back to **Sequencer**: observe the on-screen flaps articulates through the simulated fold cycle in real time!
   - Tap **EMERGENCY STOP**: verify simulated motion halts immediately.
3. **App Store Asset Inspection**:
   - Inspect Android adaptive icon and iOS icon assets.

---

## Merge Criteria
- [ ] Working branch `phase-7-consumer-shell-store-readiness` created from `main`.
- [ ] `flutter analyze` passes with 0 issues.
- [ ] `flutter test` executes all unit and widget tests with 100% pass rate.
- [ ] Merge to `main` with `--no-ff` and push to remote.
- [ ] `CHANGELOG.md` updated via `changelog-maintenance` skill.
