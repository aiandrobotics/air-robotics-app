# Requirements — Phase 7: Consumer Shell Polish & App Store Readiness

## Scope
1. **Landing Onboarding Dashboard**:
   - Modernized futuristic home screen with cyber-industrial aesthetic.
   - Prominent "+ ADD NEW DEVICE" hero button linking to hardware catalog.
   - "YOUR DEVICES" section displaying saved/paired robots persisted locally in Hive (`RegisteredRobot`), indicating live "IN RANGE" / "OFFLINE" connectivity with smoothed RSSI and quick connect/reconnect, rename, and unpair actions.
   - "DISCOVERED ROBOTS" section with continuous auto-scanning (no manual scan/stop buttons needed), listing candidate devices with signal strength indicators and 1-tap "CONNECT" action.
   - Pre-permission rationale dialog before OS BLE/Location prompt.
2. **Add Device Catalog & Dedicated Pairing Flow**:
   - `AddDeviceCatalogScreen`: Day 1 catalog presenting Fabrica as active ready hardware with kinematic specs, and futuristic preview of upcoming ecosystem robots.
   - `PairRobotScreen`: Dedicated pairing workflow with 3-second button hold guide, rapid LED pulse indicator, active Fabrica radar search, and 1-tap "PAIR & CONNECT" action.
3. **App Store Assets & Packaging**:
   - Custom app launcher icons for Android and iOS.
   - Native dark splash screen matching `#0F172A` background color.
   - Standardized application display name "AIR Robotics".

## Decisions
- **Pure Hardware Companion**: Focus landing screen directly on pairing and connecting to physical robot hardware without extraneous demo cards.
- **Privacy First**: Pre-permission dialog explicitly assures users that Bluetooth is used exclusively for direct local hardware communication with zero account sign-in or cloud telemetry tracking.
- **Zero White Flashes**: Android `launch_background.xml` and native themes configured to `#0F172A` dark background.

## Constraints
- **Zero OS/User Specific Paths**: All paths must be relative or workspace-agnostic.
- **100% Offline-First**: All wireless pairing and control functions must work with zero internet connectivity.
- **Zero Regressions**: All existing tests must pass without issues.
- **Strict Lint Compliance**: `flutter analyze` must return 0 errors, warnings, or linter hints.

## Non-goals
- Offline virtual simulator mode (removed per design decision to keep app focused on live hardware).
- Cloud account authentication or remote telemetry uploading (Phase 8+).
- In-app purchases or third-party ad SDKs.
- Over-the-air firmware flashing (DFU) in this phase.

## Context
With the core robotics protocols, 2D kinematic canvas, and timeline sequencer completed in Phases 1–6, Phase 7 elevates the user-facing presentation into an App Store release quality product focused on live hardware connection.
