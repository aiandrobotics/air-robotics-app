# Plan — Phase 7: Consumer Shell Polish & App Store Readiness

## Task Group 1: Consumer Landing & BLE Discovery Dashboard
1. Refactor and modernize the landing screen (`lib/main.dart` / `lib/screens/landing_dashboard_screen.dart`), replacing early Phase 1 placeholder text with consumer-grade branding and onboarding layout.
2. Implement `BleDiscoveryCard`:
   - Interactive radar scanning indicator showing search state.
   - 3-second physical button Hold-to-Pair visual prompt with pulsing LED guide.
   - Discovered robot card listing peripheral name (`Fabrica-XXXX`), RSSI signal meter, and 1-tap **"CONNECT"** action.
3. Implement `BlePermissionDialog`:
   - Pre-permission explanation sheet explaining that Bluetooth Low Energy is used exclusively for direct local robot control with zero account, telemetry tracking, or cloud dependencies.

## Task Group 2: Full Interactive Virtual Robot Simulator & Demo Mode
1. Implement `SimulatedBleTransport` (`lib/core/ble/simulated_ble_transport.dart`) implementing the universal `BleTransport` interface:
   - Emulates a virtual Fabrica DevKit robot (`"Fabrica-DevKit-v1"`).
   - Generates realistic 10 Hz `TelemetryPacket` streams during active folding motion and 1 Hz during idle.
   - Smoothly articulates virtual servo flap angles ($0^\circ \to 180^\circ \to 0^\circ$) when `runPreset` is triggered.
   - Supports live touch-drag flap jogging (`jogMotor`) and stateless sequence execution (`runRawSequence`).
   - Supports fast-path emergency stop abort (`emergencyStop`).
2. Add a prominent **"EXPLORE FABRICA (OFFLINE DEMO)"** card and button on the landing dashboard allowing testers, consumers, and app store reviewers to immediately experience the 2D Kinematic Canvas and Timeline Sequencer without hardware.

## Task Group 3: Store Packaging, Launcher Icons & Native Splash
1. Configure custom dark-mode app launcher icons for Android (adaptive icons) and iOS asset catalog.
2. Configure native dark industrial splash screen to eliminate white flash on launch.
3. Update Android application ID (`com.airrobotics.app`) and verify release build configs (`flutter build apk --debug / --release`).

## Task Group 4: Automated Testing & Merge
1. Write unit tests for `SimulatedBleTransport` (`test/ble/simulated_ble_transport_test.dart`):
   - Telemetry emission rates (10 Hz motion, 1 Hz idle).
   - Preset sequence simulation and angle transitions.
   - Immediate jog angle updates and fast-path emergency stop abort.
2. Write widget tests for consumer landing and onboarding (`test/screens/landing_dashboard_screen_test.dart`):
   - Renders radar animation and pairing guide.
   - Discovered robot selection and connect trigger.
   - Demo mode button launches Fabrica dynamic profile with interactive simulator.
   - Pre-permission prompt displays and callbacks trigger correctly.
3. Run `flutter analyze` and confirm 0 issues.
4. Run full test suite `flutter test` and confirm 100% pass rate across all 105+ tests.
5. Update `specs/roadmap.md`, `specs/2026-11-11-phase-7-consumer-shell-store-readiness/validation.md`, and `CHANGELOG.md`.
6. Commit on branch, push, checkout `main`, merge with `--no-ff`, and push `main`.
