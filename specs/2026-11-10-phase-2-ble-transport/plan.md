# Plan — Phase 2: Universal BLE Transport, Scanning, Hold-to-Pair & SMP Bonding

## Task Group 1: BLE Transport Driver, Abstraction Layer & Scanning Subsystem
1. Add `flutter_blue_plus` (v1.32+) to `pubspec.yaml` dependencies and verify platform builds.
2. Define the core `BleTransport` interface abstraction (`lib/core/ble/ble_transport_interface.dart`) modeling device discovery, connection state streams, MTU negotiation, bonding, and characteristic reads/writes, allowing seamless swapping between native `FlutterBluePlusTransport` and mock test harnesses.
3. Implement `BleScanner` (`lib/core/ble/ble_scanner.dart`):
   - Configurable prefix filtering (`Fabrica-*` and standard AIR Robotics hardware identifiers).
   - Rolling exponential moving average (EMA) RSSI smoothing to prevent signal flicker.
   - 120-second physical pairing window detection and indicator parsing (`LED_STATE_BLE_PAIRING`).
4. Implement Riverpod state providers for scanning state (`isScanningProvider`, `discoveredRobotsProvider`, `selectedRobotProvider`).

## Task Group 2: Connection Lifecycle State Machine, SMP Bonding & GATT Service Discovery
1. Implement `BleConnectionManager` (`lib/core/ble/ble_connection_manager.dart`):
   - Deterministic connection state machine: `disconnected` $\to$ `scanning` $\to$ `connecting` $\to$ `connected` $\to$ `discovering` $\to$ `bonding` $\to$ `ready` (and `reconnecting`).
   - Peripheral-initiated SMP "Just Works" LE Secure Connections bonding handling.
   - Persistent peer identity resolution keys (IRK) storage to handle 15-minute Resolvable Private Address (RPA) rotations.
   - Exponential backoff auto-reconnect strategy (1s, 2s, 4s, 8s, up to 30s max) upon uncommanded link drop.
2. Implement `BleGattService` (`lib/core/ble/ble_gatt_service.dart`):
   - Request 517-byte MTU exchange upon ACL connection establishment.
   - Query standard Device Information Service (`0x180A`) characteristics: Model Number String (`0x2A24`), Firmware Revision (`0x2A26`), and Manufacturer (`0x2A29` `"AIR Robotics"`).
   - Discover primary AIR Robotics service (`0000FAB0-0000-1000-8000-00805F9B34FB`) and bind target characteristics:
     - Control Point: `FAB1` (`0000FAB1-...`)
     - Telemetry Stream: `FAB2` (`0000FAB2-...`)
     - Configuration Table: `FAB3` (`0000FAB3-...`)

## Task Group 3: Developer Debug Hex Injector & Host Validation Suite
1. Create `MockBleTransport` (`test/mocks/mock_ble_transport.dart`) simulating peripheral advertisements, connection lifecycle transitions, DIS metadata queries, and characteristic writes.
2. Implement an on-device `DeveloperDebugConsole` screen (`lib/core/ble/developer_debug_screen.dart`):
   - Text input field to dispatch arbitrary raw hex bytes directly to `FAB1` (e.g. `0x00 0x01`, `0x03`, `0x0E`).
   - Rolling log showing dispatched hex payloads, write statuses, and connection events.
   - Connection status pill mirroring current lifecycle state.
3. Author host-side unit tests (`test/ble/ble_scanner_test.dart`):
   - Prefix filtering logic (`Fabrica-*` vs non-robot devices).
   - RSSI smoothing filter convergence.
4. Author host-side unit tests (`test/ble/ble_connection_manager_test.dart`):
   - State machine transitions from disconnected to ready.
   - Backoff reconnect timing calculations and retry exhaustion.
5. Author host-side unit tests (`test/ble/ble_gatt_service_test.dart`):
   - DIS reading and characteristic handle binding.
6. Run `flutter analyze` and `flutter test` ensuring 0 warnings and 100% test pass rate.
