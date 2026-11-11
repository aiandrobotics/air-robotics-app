# Plan — Phase 7: Consumer Shell Polish & App Store Readiness

## Task Group 1: Consumer Landing & BLE Discovery Dashboard
1. Refactor and modernize the landing screen (`lib/main.dart` / `lib/screens/landing_dashboard_screen.dart`), replacing early Phase 1 placeholder text with consumer-grade branding and onboarding layout.
2. Implement `BleDiscoveryCard`:
   - Interactive radar scanning indicator showing search state.
   - 3-second physical button Hold-to-Pair visual prompt with pulsing LED guide.
   - Discovered robot card listing peripheral name (`Fabrica-XXXX`), RSSI signal meter, and 1-tap **"CONNECT"** action.
3. Implement `BlePermissionDialog`:
   - Pre-permission explanation sheet explaining that Bluetooth Low Energy is used exclusively for direct local robot control with zero account, telemetry tracking, or cloud dependencies.

## Task Group 2: Store Packaging, Launcher Icons & Native Splash
1. Configure custom dark-mode app launcher icons for Android (adaptive icons) and iOS asset catalog.
2. Configure native dark industrial splash screen to eliminate white flash on launch.
3. Set application label to "AIR Robotics" across Android and iOS manifests.

## Task Group 3: Automated Testing & Verification
1. Write widget tests for consumer landing and onboarding (`test/screens/landing_dashboard_screen_test.dart`):
   - Renders radar animation and pairing guide.
   - Discovered robot selection and connect trigger.
   - Pre-permission prompt displays and callbacks trigger correctly.
2. Update regression widget tests (`test/widget_test.dart`) for the consumer landing dashboard.
3. Run `flutter analyze` and confirm 0 issues.
4. Run full test suite `flutter test` and confirm 100% pass rate.
5. Update validation spec and commit on branch `phase-7-consumer-shell-store-readiness`.
