# Plan — Phase 3: Binary Telemetry Bus & Real-Time Command Pipeline

## Task Group 1: Transport Subscription & Telemetry Ingestion Layer
1. Extend `BleTransport` interface and `FlutterBluePlusTransport` / `MockBleTransport` with a dedicated notification stream for `FAB2` (`subscribeToTelemetryStream()`).
2. Implement `TelemetryBus` (`lib/core/protocol/telemetry_bus.dart`):
   - Ingest raw 31-byte binary buffers from `FAB2` notifications.
   - Unpack packets into immutable `TelemetryPacket` instances via `TelemetryPacket.fromBytes()`.
   - Track sequence counter continuity to detect lost packets and calculate live drop rates.
   - Track instantaneous packet arrival timestamps to compute live frequency (10 Hz active vs 1 Hz idle).
   - Expose packet broadcast stream and health metrics (`TelemetryMetrics`).

## Task Group 2: Command Dispatch Pipeline & Fast-Path Emergency Stop
1. Implement `CommandPipeline` (`lib/core/protocol/command_pipeline.dart`):
   - Wrap `CommandBuilder` opcodes into structured command dispatch calls.
   - Implement fast-path Emergency Stop (`CMD_EMERGENCY_STOP` / `0x03`):
     - Dispatches immediately via `Write Without Response` to `FAB1`.
     - Bypasses any command queue or serialization barriers to achieve $<50\text{ ms}$ abort latency.
   - Implement command request-response acknowledgment tracking:
     - Listen to incoming `TelemetryPacket.lastCmdStatus` on `FAB2`.
     - Correlate command execution against status codes (`CMD_STATUS_SUCCESS`, `CMD_STATUS_ERR_BUSY`, `CMD_STATUS_ERR_INVALID_PARAM`).
     - Provide 500ms timeout with descriptive failure states for non-emergency commands.
2. Wire Riverpod providers (`lib/core/protocol/protocol_providers.dart`):
   - `telemetryBusProvider`: Lifecycle-managed `TelemetryBus` tied to the active transport.
   - `latestTelemetryProvider`: Stream provider yielding the most recent `TelemetryPacket`.
   - `telemetryMetricsProvider`: Stream provider yielding live frequency (Hz), total packet count, and drop rate (%).
   - `commandPipelineProvider`: Injectable `CommandPipeline` instance.

## Task Group 3: Developer Debug Screen Enhancement & Telemetry Inspector
1. Enhance `DeveloperDebugScreen` (`lib/core/ble/developer_debug_screen.dart`):
   - Add **Live Telemetry Inspector Card**:
     - System state indicator chip (`IDLE`, `RUNNING_MOTION`, `ESTOP`, `ERROR`, `CALIBRATING`) with corresponding safety colors.
     - Telemetry frequency meter badge (`10 Hz` / `1 Hz`).
     - Packet sequence counter & drop rate counter.
     - Real-time 4-channel flap angle readout ($0^\circ - 180^\circ$).
     - Hardware metrics (Free heap in KB, BLE RSSI in dBm).
   - Add **Quick Command Triggers**:
     - Dedicated high-visibility **EMERGENCY STOP** button (Safety Crimson).
     - Preset 1 Trigger button (`0x00 0x01`).
     - Soft Stop button (`0x02`).

## Task Group 4: Automated Testing & Verification
1. Add unit tests for `TelemetryBus` (`test/protocol/telemetry_bus_test.dart`):
   - Verify parsing of consecutive 31-byte binary frames into `TelemetryPacket`.
   - Verify drop detection when sequence counter jumps (e.g. seq 1 $\to$ seq 4 reports 2 dropped packets).
   - Verify frequency calculation across simulated 10 Hz and 1 Hz bursts.
2. Add unit tests for `CommandPipeline` (`test/protocol/command_pipeline_test.dart`):
   - Verify fast-path E-Stop dispatches `Write Without Response` directly without delay.
   - Verify non-emergency commands wait for telemetry ACK via `last_cmd_status`.
   - Verify 500ms timeout triggers error when robot does not acknowledge.
3. Add widget tests for the enhanced `DeveloperDebugScreen` (`test/ble/developer_debug_screen_test.dart`):
   - Verify live telemetry card displays decoded values from mock stream.
   - Verify quick E-Stop button triggers fast-path dispatch.
4. Run `flutter analyze` and `flutter test` confirming 100% pass rate.
