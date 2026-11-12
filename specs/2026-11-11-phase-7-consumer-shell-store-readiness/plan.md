# Plan — Phase 7: Consumer Shell Polish & App Store Readiness

## Task Group 1: Consumer Landing & BLE Discovery Dashboard
1. Refactor and modernize the landing screen (`lib/main.dart` / `lib/screens/landing_dashboard_screen.dart`), replacing early Phase 1 placeholder text with consumer-grade branding and onboarding layout.
2. Implement Futuristic Home Screen Architecture:
   - Top action banner with prominent "+ ADD NEW DEVICE" button navigating to the hardware catalog.
   - "YOUR DEVICES" section displaying saved/paired robots persisted locally in Hive (`RegisteredRobot`), indicating live "IN RANGE" / "OFFLINE" connectivity with smoothed RSSI and quick connect/reconnect, rename, and unpair actions.
   - Sleek futuristic empty state when no robots have been added yet.
   - "DISCOVERED ROBOTS" continuous auto-scanning section displaying un-paired candidate peripherals with live signal meters and 1-tap "CONNECT" (no manual scan/stop buttons needed).
3. Implement `AddDeviceCatalogScreen` (`lib/screens/add_device_catalog_screen.dart`):
   - Day 1 active model: Fabrica (4-Panel Planar Cloth Folding Robot) with detailed kinematic specs and "READY TO PAIR" badge.
   - Preview of upcoming AIR ecosystem hardware (AIR Arm-X1, AIR Rover-S) to establish a forward-looking cyber-industrial aesthetic.
4. Implement `PairRobotScreen` (`lib/screens/pair_robot_screen.dart`):
   - Dedicated pairing flow with 3-second physical button hold guide and rapid-flashing LED visual indicator.
   - Active radar scan for Fabrica peripherals and 1-tap "PAIR & CONNECT" action saving to fleet storage.
5. Implement `BlePermissionDialog`:
   - Pre-permission explanation sheet explaining that Bluetooth Low Energy is used exclusively for direct local robot control with zero account, telemetry tracking, or cloud dependencies.

## Task Group 2: Store Packaging, Launcher Icons & Native Splash
1. Configure custom dark-mode app launcher icons for Android (adaptive icons) and iOS asset catalog.
2. Configure native dark industrial splash screen to eliminate white flash on launch.
3. Set application label to "AIR Robotics" across Android and iOS manifests.

## Task Group 3: Comprehensive Fabrica Firmware Command Integration
1. Extend `BleOpcode` and `CommandBuilder`:
   - Implement `factoryResetAll` (`0x1F`), `getButtonConfig` (`0x0B`), and verify all opcodes (`0x00`–`0x1F`).
2. Implement 212-byte `ButtonConfigTable` in `routine_models.dart` for packing/unpacking 4 `FoldRoutine` slots on `FAB3`.
3. Upgrade `CommandPipeline`:
   - Add `factoryResetAll()`, `getButtonConfig()`, `getTelemetry()`.
   - Update `jogMotor`, `stopSequence`, and `identifyRobot` to support `withoutResponse: true` for zero-latency fast-path execution.
4. UI Enhancements:
   - `EmergencyStopWidget`: Add dynamic `CLEAR & UNLATCH E-STOP` (`0x02`) action button when in E-stop latch state.
   - `StatusBannerWidget`: Add quick `IDENTIFY` (`0x0E`) 3-second locator pulse button.
   - `DynamicScreenScaffold`: Add Identify button, Erase Presets (`0x0C`), and destructive Full Factory Reset (`0x1F`) action with confirmation dialog.
   - `JogSliderBankWidget`: Fast-path slider jogging (`withoutResponse: true`), `HOME ALL (0x02)` action button, and 10s thermal cutoff warning.
   - `TimelineSequencerWidget`: Add `SYNC FROM ROBOT (0x0B)` action button to ingest live sequence table from `FAB3`.
   - `RawHexConsoleWidget`: Add snapshot (`0x10`), pause/resume stream (`0x11`), identify (`0x0E`), and get config (`0x0B`) diagnostic chips, plus DIS (`0x180A`) hardware metadata card.

## Task Group 4: Automated Testing & Verification
1. Write widget tests for consumer landing and onboarding (`test/screens/landing_dashboard_screen_test.dart`):
   - Renders radar animation and pairing guide.
   - Discovered robot selection and connect trigger.
   - Pre-permission prompt displays and callbacks trigger correctly.
2. Update regression widget tests (`test/widget_test.dart`) for the consumer landing dashboard.
3. Unit & widget tests for all protocol and UI components:
   - `test/protocol/command_builder_test.dart`
   - `test/protocol/command_pipeline_test.dart`
   - `test/protocol/routine_models_test.dart`
   - `test/ui_engine/emergency_stop_widget_test.dart`
   - `test/ui_engine/status_banner_widget_test.dart`
   - `test/ui_engine/timeline_sequencer_widget_test.dart`
   - `test/ui_engine/raw_hex_console_widget_test.dart`
4. Run `flutter analyze` and confirm 0 issues.
5. Run full test suite `flutter test` and confirm 100% pass rate.
6. Update validation spec and commit on branch `phase-7-consumer-shell-store-readiness`.
