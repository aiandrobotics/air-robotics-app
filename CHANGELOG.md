# Changelog

## 2026-11-10
- Implemented reactive TelemetryBus decoding 31-byte binary stream, computing arrival frequency, and tracking sequence drops.
- Implemented CommandPipeline with fast-path Emergency Stop bypass (<50ms abort) and telemetry-based acknowledgment tracking.
- Added Riverpod 3 providers for telemetry bus, latest packet stream, health metrics, and command pipeline.
- Enhanced DeveloperDebugScreen with Live Telemetry Inspector card and quick-action safety command triggers.
- Added comprehensive unit and widget tests for telemetry bus, command pipeline, and debug UI with 100% pass rate.
- Implemented universal BleTransport interface with native FlutterBluePlusTransport and MockBleTransport test doubles.
- Implemented BleScanner with Fabrica and AIR Robotics prefix filtering, EMA RSSI smoothing, and 120-second pairing mode tracking.
- Implemented BleConnectionManager with deterministic lifecycle state machine, SMP bonding, 517-byte MTU exchange, and exponential backoff auto-reconnect.
- Added DeveloperDebugScreen with on-device raw hex command injection to FAB1 control point and real-time event logging.
- Added comprehensive unit and widget test coverage for BLE transport, GATT service discovery, and developer debug UI.
- Initialized Flutter 3.x project skeleton with strict analysis options and pinned dependencies.
- Added Android and iOS platform configurations for BLE permissions and minimum SDK 26 / iOS 14.
- Implemented zero-allocation 31-byte Little-Endian binary TelemetryPacket decoder for FAB2 stream.
- Implemented pure Dart IEEE 802.3 CRC32 checksum engine matching firmware storage verification.
- Implemented CommandBuilder wire serializer for FAB1 control point opcodes.
- Implemented FoldRoutine and FoldStep binary wire models with checksum verification.
- Added declarative DeviceProfile models and JSON schema validation with bundled Fabrica profile.
- Implemented industrial dark safety theme, design tokens, and initial dashboard view.
- Added comprehensive unit and widget test suite with 100% pass rate.

## 2026-11-08
- Standardized firmware reference paths and open-source license across platforms.
- Established architecture specifications, technology stack, and development roadmap.
- Initialized repository.
