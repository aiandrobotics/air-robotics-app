# Validation — Phase 2: Universal BLE Transport, Scanning, Hold-to-Pair & SMP Bonding

## Required Checks

### 1. Static Analysis & Lint Verification
The codebase must pass all strict analysis rules without errors or warnings:
```bash
flutter analyze
```
- **Acceptance Threshold**: Zero errors, zero warnings, zero linter hints.

### 2. Scanner & RSSI Filter Unit Tests
```bash
flutter test test/ble/ble_scanner_test.dart
```
- **Prefix Filtering**:
  - Confirms peripheral names matching `Fabrica-*` (e.g. `Fabrica-A1B2`, `Fabrica-0001`) and standard AIR Robotics prefixes are accepted.
  - Confirms non-robot peripherals (e.g. `AirPods`, `SmartWatch`, `Unknown`) are filtered out.
- **RSSI Smoothing Filter**:
  - Tests convergence of rolling exponential moving average ($\alpha = 0.25$) across fluctuating signal readings (e.g. $-80\text{ dBm} \to -50\text{ dBm}$).
- **Pairing Window Tracking**:
  - Confirms detection of the 120-second pairing window when advertised in manufacturer data or scan response.

### 3. Connection Lifecycle & Auto-Reconnect Unit Tests
```bash
flutter test test/ble/ble_connection_manager_test.dart
```
- **State Machine Transitions**:
  - `disconnected` $\to$ `connecting` $\to$ `connected` $\to$ `discovering` $\to$ `ready`.
- **Uncommanded Disconnection & Auto-Reconnect**:
  - Verifies transition to `reconnecting` state.
  - Verifies exponential backoff intervals (1s, 2s, 4s, 8s, up to 30s max).
  - Verifies abort and transition to `disconnected` upon explicit manual disconnect call.

### 4. GATT Discovery & MTU Exchange Unit Tests
```bash
flutter test test/ble/ble_gatt_service_test.dart
```
- **MTU Exchange**: Verifies 517-byte MTU request upon connection.
- **DIS Metadata Parsing**:
  - Model Number (`0x2A24`) $\to$ `"Fabrica-DevKit-v1"`
  - Firmware Revision (`0x2A26`) $\to$ `"v1.13.0"`
  - Manufacturer (`0x2A29`) $\to$ `"AIR Robotics"`
- **AIR Robotics Service (`FAB0`) Binding**:
  - Successfully resolves characteristic handles for `FAB1`, `FAB2`, and `FAB3`.

### 5. Developer Debug Console Widget Smoke Test
```bash
flutter test test/ble/developer_debug_screen_test.dart
```
- Confirms the debug screen renders connection state pill, text input for hex entry, and dispatches bytes to `FAB1` on send button tap.

---

## Live Hardware Verification Checklist (With Physical Fabrica Robot)

When testing with a physical ESP32 development board running the Fabrica firmware:

1. **Physical Pairing Window Gating**:
   - Power on the ESP32 robot hardware.
   - Long-press any physical button for 3 seconds.
   - Observe hardware LED enter fast double-blink mode (`LED_STATE_BLE_PAIRING`).
   - Observe mobile app scanner detect `Fabrica-XXXX` with an active pairing indicator.
2. **SMP Bonding & MTU Negotiation**:
   - Tap "Connect" in the app.
   - Confirm OS-level Bluetooth pairing prompt appears and completes successfully ("Just Works" LE Secure Connections).
   - Verify MTU negotiation reaches up to 517 bytes in debug logs.
3. **DIS Metadata & Characteristic Discovery**:
   - Verify app displays model number `"Fabrica-DevKit-v1"`, firmware version `"v1.13.0"`, and manufacturer `"AIR Robotics"`.
   - Verify `FAB1`, `FAB2`, and `FAB3` characteristics are discovered.
4. **Developer Hex Command Injection**:
   - Open Developer Debug Console.
   - Enter `0E` (Identify Robot opcode) and tap Send.
   - Verify physical robot executes a 3-second visual locator LED pulse train.
   - Enter `00 01` (Run Preset 1) and tap Send.
   - Verify physical robot initiates Preset 1 folding routine.
   - Enter `03` (Emergency Stop) during motion.
   - Verify physical robot halts immediately ($<50\text{ ms}$).

---

## Merge Criteria

- [x] Branch `phase-2-ble-transport` rebased on latest `main`.
- [x] `flutter analyze` passes with 0 issues.
- [x] `flutter test` executes all unit and mock tests with 100% pass rate (38/38 passing).
- [x] Live hardware verification steps documented or confirmed with test logs.
