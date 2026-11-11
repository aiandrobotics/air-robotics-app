# Requirements — Phase 7: Consumer Shell Polish & App Store Readiness

## Scope
1. **Landing Onboarding Dashboard**:
   - Modernized home screen replacing the initial developer placeholder text.
   - Dedicated BLE discovery widget with active radar animation, scanning controls, discovered robot cards, and RSSI indicators.
   - Clear visual instructions for the physical 3-second button hold pairing mode (`LED_STATE_BLE_PAIRING`).
   - Pre-permission rationale dialog before OS BLE/Location prompt.
2. **App Store Assets & Packaging**:
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
