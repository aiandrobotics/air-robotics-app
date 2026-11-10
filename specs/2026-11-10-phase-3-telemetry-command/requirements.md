# Requirements — Phase 3: Binary Telemetry Bus & Real-Time Command Pipeline

## Scope
Phase 3 establishes the bi-directional communication pipeline between the mobile app and physical AIR Robotics hardware:
1. Continuous ingestion, decoding, and reactive streaming of the 31-byte packed Little-Endian telemetry stream from `FAB2`.
2. Telemetry health metrics (live frequency measurement, sequence tracking, and packet drop percentage).
3. Structured command dispatch pipeline for `FAB1` supporting acknowledgment tracking and timeout detection.
4. Dedicated fast-path Emergency Stop bypass ($<50\text{ ms}$ abort latency).
5. On-device developer inspection surface displaying live telemetry telemetry metrics and one-touch command triggers.

## Decisions
- **Decoupled Telemetry Bus**: `TelemetryBus` is a standalone reactive service decoupled from UI components, emitting strongly-typed `TelemetryPacket` events over a broadcast Dart stream.
- **Riverpod 3 Integration**: Telemetry is exposed through `StreamProvider<TelemetryPacket>` and `StreamProvider<TelemetryMetrics>` to enable granular UI updates without triggering unnecessary widget rebuilds.
- **Telemetry-Based Acknowledgment**: Non-emergency commands sent to `FAB1` wait for acknowledgment by monitoring `TelemetryPacket.lastCmdStatus` received on `FAB2`. A timeout of 500ms is enforced before signaling a dispatch failure.
- **Fast-Path Emergency Stop**: The Emergency Stop command (`CMD_EMERGENCY_STOP` / `0x03`) bypasses all queues, mutexes, and ACK wait loops, immediately issuing a `writeWithoutResponse` to guarantee immediate physical actuator cut-off.
- **Inline Telemetry Inspector**: Instead of creating a separate isolated screen, the existing `DeveloperDebugScreen` is enhanced with a dedicated Telemetry Inspector card and quick-action buttons for end-to-end verification.

## Constraints
- **Firmware Invariants**:
  - Telemetry packets must match the exact 31-byte Little-Endian binary layout from `firmware/main/telemetry.h`.
  - Normal idle streaming rate is 1 Hz; motion streaming rate is 10 Hz (`firmware/main/telemetry.c`).
  - Command opcodes must match `firmware/main/command.h`.
  - Emergency stop opcode `0x03` must trigger immediate transition to `STATE_ESTOP` (`firmware/main/state_machine.c`).
- **Performance**:
  - Zero heap allocation during packet unpacking (`ByteData.sublistView`).
  - Stream updates must not cause frame drops or garbage collection pauses on mobile devices running at 60/120 Hz.
- **Test Isolation**:
  - All unit and widget tests must pass headlessly using `MockBleTransport` without physical Bluetooth hardware.

## Non-goals
- **2D Kinematic Canvas Animation**: The interactive 2D flap grid canvas is part of Phase 6; Phase 3 displays raw angles and status metrics textually/numerically in the debugger.
- **Preset Editing & Storage (FAB3)**: Reading and writing the 212-byte sequence table over `FAB3` is scheduled for Phase 6.
- **Dynamic Profile Loading**: Dynamic binding to `assets/profiles/` based on DIS model string is scheduled for Phase 4.

## Context
Phase 1 provided the static binary codec `TelemetryPacket.fromBytes()` and the `CommandBuilder`. Phase 2 provided the active BLE transport (`FlutterBluePlusTransport`), scanning, connection management, and GATT discovery. Phase 3 connects these two layers into a live, reactive pipeline capable of bidirectional interaction with the ESP32 firmware.
