# Changelog

## 2026-11-10
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
