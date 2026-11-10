# Validation — Phase 3: Binary Telemetry Bus & Real-Time Command Pipeline

## Required Checks

### 1. Static Analysis
The codebase must pass all strict analysis rules without errors or warnings:
```bash
flutter analyze
```
- **Threshold**: 0 errors, 0 warnings, 0 lints.

### 2. Telemetry Ingestion & Metrics Tests
```bash
flutter test test/protocol/telemetry_bus_test.dart
```
- **Binary Decoding**: Ingests synthetic 31-byte binary buffers and emits valid `TelemetryPacket` instances.
- **Drop Rate Calculation**: Simulates lost packets (e.g. sequence counter jumps) and confirms accurate drop count and percentage.
- **Frequency Meter**: Simulates bursts at 10 Hz and 1 Hz, confirming the calculated frequency stabilizes within $\pm 10\%$.

### 3. Command Pipeline & ACK Tests
```bash
flutter test test/protocol/command_pipeline_test.dart
```
- **Fast-Path Emergency Stop**: Confirms `emergencyStop()` invokes `writeControlPoint` with `withoutResponse: true` immediately without blocking.
- **Command Acknowledgment**: Confirms normal command dispatch resolves successfully when `last_cmd_status` in telemetry transitions to `CMD_STATUS_SUCCESS`.
- **Command Timeout**: Confirms command dispatch throws a timeout exception if no ACK is received within 500ms.

### 4. UI Widget & Telemetry Inspector Tests
```bash
flutter test test/ble/developer_debug_screen_test.dart
```
- Confirms the Telemetry Inspector card renders on the debug screen when connected.
- Confirms incoming telemetry packets update the displayed system state, frequency meter, and servo angles.
- Confirms tapping the quick E-Stop button triggers fast-path dispatch.

### 5. Full Test Suite Regression
```bash
flutter test
```
- 100% pass rate across all existing and new unit/widget tests.

---

## Manual Review & Live Hardware Verification (Fabrica ESP32)

With the physical Fabrica robot powered on and connected to the Pixel 8:
1. **Live 1 Hz Idle Stream**:
   - Verify Telemetry Inspector displays `1 Hz` frequency and system state `IDLE`.
   - Verify sequence counter increments continuously by 1 without drops.
2. **Preset Execution & 10 Hz Motion Transition**:
   - Tap "RUN PRESET 1" quick button.
   - Observe frequency meter jump to `10 Hz` and system state switch to `RUNNING_MOTION`.
   - Observe real-time 4-channel servo angles updating continuously as flaps articulate.
3. **Emergency Stop Response**:
   - While the robot is moving in Preset 1, tap the red **EMERGENCY STOP** button.
   - Verify physical robot halts immediately ($<50\text{ ms}$).
   - Observe system state transition to `ESTOP` (Alert Crimson) and frequency transition back to 1 Hz.

---

## Merge Criteria
- [x] Working branch `phase-3-telemetry-command` created from `main`.
- [x] `flutter analyze` passes with 0 issues.
- [x] `flutter test` executes all unit and widget tests with 100% pass rate (50/50 passing).
- [ ] Merge to `main` with `--no-ff` and push to remote.
- [x] `CHANGELOG.md` updated via `changelog-maintenance` skill.
