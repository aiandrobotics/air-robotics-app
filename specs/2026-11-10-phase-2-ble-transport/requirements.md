# Requirements — Phase 2: Universal BLE Transport, Scanning, Hold-to-Pair & SMP Bonding

## Scope

### In Scope
1. **BLE Native Driver Integration**: Pinned `flutter_blue_plus` dependency configuration with native iOS CoreBluetooth and Android BluetoothGatt bindings.
2. **Clean Transport Abstraction (`BleTransport`)**: Interface allowing application components to be unit tested on host machines using mock BLE peripherals without requiring live hardware radios.
3. **Targeted Peripheral Discovery**: Scanner with prefix filtering (`Fabrica-*`), RSSI signal smoothing using rolling exponential moving average, and pairing window detection (`LED_STATE_BLE_PAIRING`).
4. **Deterministic Connection Lifecycle**: State machine tracking `disconnected`, `scanning`, `connecting`, `connected`, `discovering`, `bonding`, `ready`, and `reconnecting`.
5. **SMP "Just Works" Bonding & RPA Privacy**: LE Secure Connections pairing support with persistent bond keys for automatic reconnection across 15-minute iOS/Android Resolvable Private Address rotations.
6. **Exponential Backoff Auto-Reconnect**: Automatic reconnection on uncommanded radio disconnection (intervals: 1s, 2s, 4s, 8s, up to 30s max).
7. **GATT Discovery & MTU 517B Exchange**: Auto-negotiation of 517-byte MTU upon connection; reading standard DIS (`0x180A`: Model Number `0x2A24`, Firmware Revision `0x2A26`, Manufacturer `0x2A29`); discovering and binding `FAB1`, `FAB2`, and `FAB3`.
8. **Developer Debug Screen**: Lightweight on-device debug tool with raw hex input to send arbitrary byte commands to `FAB1` and view dispatch logs during hardware testing.
9. **Host Test Suite**: Unit tests verifying state machine transitions, RSSI smoothing, and GATT binding against mock transport.

### Non-Goals
1. **Continuous 10 Hz Telemetry Streaming Bus**: Subscribing to continuous notifications, sequence counter drop tracking, and Riverpod `StreamProvider` belong to **Phase 3**.
2. **Fast-Path Command Pipeline Queuing**: Command queuing and acknowledgment request-response matching belong to **Phase 3**.
3. **Dynamic SDUI Screen Rendering**: Rendering dynamic screens and tabs from profile JSON belongs to **Phase 5**.
4. **Kinematic Flap Visualizer**: Hardware-accelerated 2D flap canvas belongs to **Phase 6**.

---

## Decisions

1. **Transport Abstraction Layer**:
   - `BleTransport` interface wraps all Bluetooth interactions (`startScan`, `stopScan`, `connect`, `disconnect`, `requestMtu`, `readCharacteristic`, `writeCharacteristic`).
   - Production implementation: `FlutterBluePlusTransport`.
   - Test implementation: `MockBleTransport`.
2. **GATT UUID Alignment**:
   - Primary Service: `0000FAB0-0000-1000-8000-00805F9B34FB`
   - Control Point (`FAB1`): `0000FAB1-0000-1000-8000-00805F9B34FB` (Properties: `Write`, `Write Without Response`)
   - Telemetry Stream (`FAB2`): `0000FAB2-0000-1000-8000-00805F9B34FB` (Properties: `Read`, `Notify`)
   - Configuration Table (`FAB3`): `0000FAB3-0000-1000-8000-00805F9B34FB` (Properties: `Read`, `Write`, `Notify`)
   - Device Information Service (`0x180A`): Model `0x2A24`, Firmware `0x2A26`, Manufacturer `0x2A29`.
3. **RSSI Smoothing Algorithm**:
   - Rolling Exponential Moving Average: $\text{RSSI}_{\text{smoothed}} = \alpha \cdot \text{RSSI}_{\text{new}} + (1 - \alpha) \cdot \text{RSSI}_{\text{old}}$, with $\alpha = 0.25$ to dampen radio jitter.
4. **Developer Debug Tooling**:
   - Accessible via the top-right search icon on the main screen, providing a raw hex command injector (`TextEditingController` parsing hex strings into `Uint8List`).

---

## Constraints

1. **Host-Side Testability**: All scanning, connection state, and GATT logic must execute cleanly in host unit tests (`flutter test`) without crashing on non-mobile host environments (Linux, macOS, Windows).
2. **Android & iOS BLE Permissions**: Proper runtime permission verification before invoking BLE scan commands.
3. **Non-blocking Operations**: All radio operations must be asynchronous to avoid blocking UI rendering or frame drops.
4. **MTU Safety**: If MTU negotiation returns $<517\text{ bytes}$ (e.g. on older Android 8/9 devices), the transport must fall back gracefully to the negotiated MTU size.

---

## Context

Phase 2 establishes the physical and logical radio connection between the AIR Robotics mobile companion and robotics hardware speaking the AIR Robotics BLE protocol. The Fabrica cloth folding robot (`Fabrica-*`) provides the primary testbed, exercising 120-second physical button hold pairing, SMP bonding, and primary service discovery (`FAB0`).
