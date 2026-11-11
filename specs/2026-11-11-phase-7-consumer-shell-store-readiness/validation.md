# Validation — Phase 7: Consumer Shell Polish & App Store Readiness

## Required Checks

### 1. Static Analysis & Lint Verification
The codebase must pass all strict analysis rules without errors or warnings:
```bash
flutter analyze
```
- **Acceptance Threshold**: Zero errors, zero warnings, zero linter hints.

### 2. Consumer Landing Dashboard & Onboarding Widget Tests
```bash
flutter test test/screens/landing_dashboard_screen_test.dart
flutter test test/screens/add_device_catalog_screen_test.dart
flutter test test/screens/pair_robot_screen_test.dart
flutter test test/fleet/fleet_storage_service_test.dart
flutter test test/widget_test.dart
```
- Verifies modern landing UI renders "+ ADD NEW DEVICE", "YOUR DEVICES", and "DISCOVERED ROBOTS".
- Verifies continuous auto-scanning without manual scan/stop buttons.
- Verifies discovered robot card display, RSSI meter, and 1-tap connect callback with automatic fleet persistence.
- Verifies Add Device catalog renders Fabrica on Day 1 and upcoming ecosystem models.
- Verifies dedicated pair screen displays step-by-step pairing guidance and live candidates.
- Verifies pre-permission prompt display and actions.

### 3. Full Regression Test Suite
```bash
flutter test
```
- 100% pass rate across all existing tests (107 tests passing).

---

## Manual Review & Demo Steps

1. **Launch App Disconnected**:
   - Verify splash screen launches in dark theme without white flash.
   - Verify landing screen renders the consumer-grade onboarding header, BLE radar scanning animation, and pairing instruction card.
2. **Hardware Pairing & Connect**:
   - Hold physical button on Fabrica robot for 3 seconds (`LED_STATE_BLE_PAIRING`).
   - Tap "SCAN FOR ROBOTS".
   - Verify Fabrica appears in the discovered robot list with RSSI meter and `PAIRING` chip.
   - Tap "CONNECT" and verify transition to the live dynamic robot controls.
3. **App Store Asset Inspection**:
   - Inspect Android adaptive icon and iOS icon assets.

---

## Merge Criteria
- [x] Working branch `phase-7-consumer-shell-store-readiness` created from `main`.
- [x] `flutter analyze` passes with 0 issues.
- [x] `flutter test` executes all unit and widget tests with 100% pass rate.
- [ ] Merge to `main` with `--no-ff` and push to remote (on hold per user instruction).
- [ ] `CHANGELOG.md` updated via `changelog-maintenance` skill.
