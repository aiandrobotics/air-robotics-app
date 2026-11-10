# Validation — Phase 4: Dynamic Profile Engine, JSON Schema Validator & Local Storage

## Required Checks

### 1. Static Analysis & Lint Verification
The codebase must pass all strict analysis rules without errors or warnings:
```bash
flutter analyze
```
- **Acceptance Threshold**: Zero errors, zero warnings, zero linter hints.

### 2. Profile Storage Service Unit Tests
```bash
flutter test test/profile/profile_storage_service_test.dart
```
- **CRUD Operations**: Verifies storing, retrieving, updating, and deleting customized profile documents in Hive.
- **Isolation**: Confirms storage operations run in a temporary directory or in-memory box without polluting host state.

### 3. Profile Resolver Waterfall Unit Tests
```bash
flutter test test/profile/profile_resolver_test.dart
```
- **Tier 1 (Memory Cache)**: Confirms resolving an already cached profile returns synchronously without hitting disk or assets.
- **Tier 2 (Hive Override)**: Confirms a customized profile stored in Hive takes precedence over a bundled asset with the same model ID.
- **Tier 3 (Bundled Asset)**: Confirms resolving model `"Fabrica-DevKit-v1"` loads `assets/profiles/fabrica-devkit-v1.json` and successfully validates against the schema.
- **Tier 4 (Diagnostic Fallback)**: Confirms resolving an unknown model (e.g. `"Unknown-Robot-99"`) produces a valid `AIR-Generic-Diagnostic` profile with 16 default channels and E-Stop support.

### 4. Dynamic BLE DIS Binding Integration Tests
```bash
flutter test test/profile/profile_binding_test.dart
```
- Simulates BLE connection with peripheral advertising DIS Model Number `"Fabrica-DevKit-v1"`.
- Verifies Riverpod `activeProfileProvider` automatically resolves and binds the Fabrica reference profile.

### 5. Regression Test Suite
```bash
flutter test
```
- 100% pass rate across all existing unit and widget tests (minimum 50+ passing).

---

## Manual Review & Live Hardware Verification (Fabrica ESP32)

With the physical Fabrica robot powered on and connected to the Pixel 8:
1. **Automatic Profile Binding**:
   - Connect to `Fabrica-XXXX` in the app.
   - Inspect the **Active Profile Card** in the Developer Debugger.
   - Verify active profile displays:
     - Model ID: `Fabrica-DevKit-v1`
     - Name: `Fabrica Cloth Folder`
     - Actuators: 4 Flap Servos (Ch 0: Left, Ch 1: Right, Ch 2: Bottom, Ch 3: Top)
     - Max Channels: 16
     - Capabilities: Emergency Stop, Raw Preview, Flash Sync, Calibration Jog
2. **Offline Persistence Across Relaunch**:
   - Force-close the app on the phone while offline (Airplane Mode with Bluetooth ON).
   - Relaunch the app.
   - Verify the profile resolves instantly from local storage/cache without internet access.
3. **Diagnostic Fallback Verification**:
   - Connect to an unprofiled test ESP32 GATT server or simulate an unknown DIS model string.
   - Verify the app loads the `AIR-Generic-Diagnostic` profile cleanly without throwing exceptions.

---

## Merge Criteria
- [x] Working branch `phase-4-profile-engine` created from `main`.
- [x] `flutter analyze` passes with 0 issues.
- [x] `flutter test` executes all unit and widget tests with 100% pass rate.
- [x] Merge to `main` with `--no-ff` and push to remote.
- [x] `CHANGELOG.md` updated via `changelog-maintenance` skill.
