# Requirements — Phase 4: Dynamic Profile Engine, JSON Schema Validator & Local Storage

## Scope
Phase 4 provides the runtime engine that makes the AIR Robotics companion application truly generic and profile-driven:
1. Local offline persistence via Hive NoSQL document storage for custom profile overrides, calibration offsets, and modified routines.
2. 4-tier profile resolution waterfall (Memory $\to$ Local Storage $\to$ Bundled Asset $\to$ Diagnostic Fallback).
3. Runtime JSON schema validation against `assets/profiles/air-device-profile.schema.json`.
4. Dynamic binding linking BLE Device Information Service (DIS `0x2A24`) model number to the resolved profile.
5. Fallback diagnostic profile generation for unrecognized robot models ensuring zero connection roadblocks.

## Decisions
- **Storage Engine**: Use Hive (`hive_flutter`) storing JSON documents and calibration maps keyed by DIS model string. This provides instant startup, zero-cost schema evolution, and complete offline capability.
- **Dynamic Binding Trigger**: Automatic binding upon BLE GATT discovery when DIS model number (`0x2A24`) is read, while still allowing users to manually switch profiles via UI controls.
- **Resolution Priority Order**:
  1. *Tier 1 (Memory)*: Active cached in-memory profile.
  2. *Tier 2 (Local Storage)*: User customized profile in Hive (e.g. customized button sequences, calibrated servo trim).
  3. *Tier 3 (Bundled Asset)*: Pre-packaged profile JSON from `assets/profiles/` (e.g. `fabrica-devkit-v1.json`).
  4. *Tier 4 (Diagnostic Fallback)*: Dynamically generated generic profile with 16 channels, default opcodes, status banner, and E-Stop support.
- **JSON Schema Strictness**: All bundled and imported profiles must satisfy `assets/profiles/air-device-profile.schema.json`. Malformed profiles are rejected and fall back gracefully to Tier 4 without crashing the app.

## Constraints
- **Offline First**: All profile resolution and persistence must execute 100% locally without network connectivity.
- **Fast Startup**: Tier 1 and Tier 3 resolution must complete in $<50\text{ ms}$.
- **Zero OS Path Leaks**: Profile assets and Hive boxes must use standard Flutter package/asset URIs and platform application support directories without hardcoded user paths.
- **Test Isolation**: Headless tests must run using an in-memory or temporary Hive directory double so host tests never pollute persistent state.

## Non-goals
- **Server-Driven Dynamic UI Layout Rendering**: Dynamic rendering of screen widgets from profile `screens` arrays is scheduled for Phase 5.
- **2D Kinematic Canvas**: The interactive 2D flap grid visualizer canvas is scheduled for Phase 6.
- **Cloud Registry Sync**: Over-the-air profile downloading from `registry.air-robotics.org` is a Phase 7+ future expansion.

## Context
Phase 1 created the initial data models and schema validator. Phase 2 established BLE transport and DIS discovery. Phase 3 established real-time bidirectional telemetry and command pipeline. Phase 4 ties DIS model identification to declarative robot definitions, allowing the app to seamlessly adapt its capabilities to any AIR Robotics hardware.
