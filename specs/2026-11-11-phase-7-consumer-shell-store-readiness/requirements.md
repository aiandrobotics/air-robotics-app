# Requirements — Phase 7: Consumer Shell Polish & App Store Readiness

## Scope
1. **Landing Onboarding Dashboard**:
   - Modernized home screen replacing the initial developer placeholder text.
   - Dedicated BLE discovery widget with active radar animation, scanning controls, discovered robot cards, and RSSI indicators.
   - Clear visual instructions for the physical 3-second button hold pairing mode (`LED_STATE_BLE_PAIRING`).
   - Pre-permission rationale dialog before OS BLE/Location prompt.
2. **Interactive Virtual Robot Simulator (Demo Mode)**:
   - Built-in `SimulatedBleTransport` implementing `BleTransport`.
   - Generates realistic, timing-accurate 10 Hz `TelemetryPacket` streams during folding sequences (Preset 1: Adult T-Shirt, Preset 2: Long Sleeve, Preset 3: Trousers, Preset 4: Towels).
   - Simulates flap angular motion for the 2D Kinematic Canvas ($0^\circ \to 180^\circ \to 0^\circ$).
   - Simulates manual servo jogging and multi-step sequence preview in RAM.
   - Provides an instant **"EXPLORE FABRICA (OFFLINE DEMO)"** entrance on the landing screen.
3. **App Store Assets & Packaging**:
   - Custom app launcher icons for Android and iOS.
   - Native dark splash screen matching `#0F172A` background color.
   - Production package ID configuration (`com.airrobotics.app`).

## Decisions
- **Simulator Implementation**: Implemented cleanly as an interchangeable `BleTransport` subclass (`SimulatedBleTransport`), avoiding changes or hacks to Riverpod state, UI widgets, or the protocol bus.
- **Demo Mode Entry**: Tapping "Explore Fabrica (Offline Demo)" swaps `bleTransportProvider` to `SimulatedBleTransport`, binds the bundled `fabrica-devkit-v1.json` profile, and mounts `DynamicScreenScaffold` seamlessly.
- **Privacy First**: Pre-permission dialog explicitly assures users that Bluetooth is used exclusively for direct local hardware communication with zero account sign-in or cloud telemetry tracking.
- **Zero White Flashes**: Android `launch_background.xml` and native themes configured to `#0F172A` dark background.

## Constraints
- **Zero OS/User Specific Paths**: All paths must be relative or workspace-agnostic.
- **100% Offline-First**: Both the live BLE stack and the offline demo simulator must work with zero internet connectivity.
- **Zero Regressions**: All 97 existing tests must continue to pass without modification.
- **Strict Lint Compliance**: `flutter analyze` must return 0 errors, warnings, or linter hints.

## Non-goals
- Cloud account authentication or remote telemetry uploading (Phase 8+).
- In-app purchases or third-party ad SDKs.
- Over-the-air firmware flashing (DFU) in this phase.

## Context
With the core robotics protocols, 2D kinematic canvas, and timeline sequencer completed in Phases 1–6, Phase 7 elevates the user-facing presentation into an App Store release quality product that delights both hardware owners and reviewers testing without physical hardware.
