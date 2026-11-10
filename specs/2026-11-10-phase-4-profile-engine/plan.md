# Plan — Phase 4: Dynamic Profile Engine, JSON Schema Validator & Local Storage

## Task Group 1: Hive Storage & Local Document Persistence Layer
1. Add `hive: ^2.2.3` and `hive_flutter: ^1.1.0` dependencies to `pubspec.yaml` and initialize storage.
2. Implement `ProfileStorageService` (`lib/core/profile/profile_storage_service.dart`):
   - Manage Hive box `'air_device_profiles'` for offline persistence.
   - Save, load, and delete custom device profile JSON documents keyed by model string (e.g. `Fabrica-DevKit-v1`).
   - Store user-modified sequence assignments and actuator calibration offsets.
   - Support abstract or in-memory storage double for headless host tests.

## Task Group 2: 4-Tier Profile Resolution Hierarchy & Fallback Generator
1. Implement procedural Tier 4 fallback generator (`lib/core/profile/diagnostic_profile_builder.dart`):
   - Generate `AIR-Generic-Diagnostic` profile for unrecognized robot models.
   - Configure default 16 servo channels ($0^\circ - 180^\circ$), basic status banner, emergency stop, and raw hex console.
2. Implement `ProfileResolver` (`lib/core/profile/profile_resolver.dart`):
   - Execute the 4-tier waterfall resolution:
     - **Tier 1 (Memory)**: Fast in-memory compiled profile cache.
     - **Tier 2 (Storage)**: Offline Hive document storage with user customizations.
     - **Tier 3 (Asset)**: Bundled asset file (`assets/profiles/fabrica-devkit-v1.json`) validated against `air-device-profile.schema.json`.
     - **Tier 4 (Fallback)**: Procedural diagnostic fallback profile.
   - Provide `Future<DeviceProfile> resolveProfile(String modelNumber)`.

## Task Group 3: Dynamic BLE Binding & Riverpod Integration
1. Implement Riverpod profile providers (`lib/core/profile/profile_providers.dart`):
   - `profileStorageProvider`: Provides active storage service.
   - `profileResolverProvider`: Provides singleton `ProfileResolver`.
   - `activeProfileNotifier`: Reactive notifier managing active `DeviceProfile`, supporting manual profile switching.
2. Connect BLE discovery to Profile Engine:
   - When `BleConnectionManager` discovers DIS Model Number (`0x2A24`), trigger profile resolution and automatically update `activeProfileProvider`.
3. Enhance `DeveloperDebugScreen` with an **Active Profile Metadata Card**:
   - Display active model string, profile version, actuator channel count, and capability badges.

## Task Group 4: Automated Testing & Verification
1. Add unit tests for `ProfileStorageService` (`test/profile/profile_storage_service_test.dart`):
   - Verify save, load, delete, and list operations in Hive storage.
2. Add unit tests for `ProfileResolver` waterfall (`test/profile/profile_resolver_test.dart`):
   - Verify Tier 1 in-memory cache hit.
   - Verify Tier 2 Hive override priority over bundled asset.
   - Verify Tier 3 asset bundle loading and schema validation for `"Fabrica-DevKit-v1"`.
   - Verify Tier 4 diagnostic fallback generation for unknown model `"AIR-Experimental-Rover"`.
3. Add integration test for BLE DIS auto-binding (`test/profile/profile_binding_test.dart`):
   - Simulate peripheral connection emitting DIS model number `"Fabrica-DevKit-v1"`.
   - Confirm active profile automatically transitions from default to Fabrica reference profile.
4. Run `flutter analyze` and `flutter test` confirming 100% pass rate.
