# Requirements — Phase 6: Fabrica Reference Implementation: 2D Flap Canvas, Sequencer & E2E Validation

## Scope
Phase 6 delivers the specialized reference hardware integration for the **Fabrica Cloth Folding Robot** (`fabrica-devkit-v1`), completing all primary capabilities of the AIR Robotics companion application:
1. **Interactive 2D Flap Visualizer Canvas**:
   - Hardware-accelerated `CustomPainter` rendering Left (Ch 0), Right (Ch 1), Bottom (Ch 2), and Top (Ch 3) panels.
   - Smooth 60 fps angle interpolation from 10 Hz / 1 Hz `channel_angles` telemetry.
   - Interactive touch gestures allowing direct drag-to-jog in calibration mode.
2. **Timeline Sequencer Widget & Flash Programmer**:
   - Multi-step routine creator (1 to 16 steps) supporting single and dual simultaneous flap flips.
   - Stateless "Preview on Robot" executing directly in ESP32 RAM via `CMD_RUN_RAW_SEQUENCE` (`0x01`).
   - NVS Flash Programmer persisting routines into physical hardware buttons 1–4 via `CMD_SET_BUTTON_SEQUENCE` (`0x0A`) with IEEE 802.3 CRC32 verification.
   - Factory default preset recovery (`CMD_RESTORE_FACTORY_PRESETS` / `0x0C`).
3. **Pluggable Integration**:
   - Registered into `WidgetRegistry` under `visualizer` (matching profile `visualizer_id: fabrica-flap-grid`) and `timeline-sequencer`.

## Decisions
1. **Kinematic Projection Model**:
   - Flaps project outwards from a central base plate.
   - At $0^\circ$ (flat/open), flaps are drawn at full extension.
   - As angle $\theta$ increases towards $180^\circ$ (folded inward), the projected panel length scales with $\cos(\theta)$ while elevation/shadow depth scales with $\sin(\theta)$, providing intuitive planar 2.5D perspective.
2. **Interactive Calibration Mode Dragging**:
   - In Calibration mode, touching and dragging a virtual flap commands `commandPipeline.jogMotor` (throttled to 50ms) to move the physical servo, providing direct physical-digital synchrony.
3. **Firmware Struct Alignment**:
   - All sequence data models strictly follow the binary wire formats of `firmware/main/storage.h` and `storage.c`:
     - 3-byte `FoldStep` (`motor_count` + 2 `motor_ids`).
     - 53-byte `FoldRoutine` (`step_count` + 48 step bytes + 4-byte CRC32).
4. **Safety Interlock**:
   - While a sequence is previewing or running on the robot, the E-Stop button remains instantly accessible on screen to abort in $<50\text{ ms}$.

## Constraints
1. **Performance**: Flap canvas must maintain steady 60 fps during active telemetry reception without UI frame jitter or memory allocations in `paint()`.
2. **Maximum Steps**: Routine builder must enforce $1 \le \text{stepCount} \le 16$, matching ESP32 firmware buffer limits.
3. **100% Offline Autonomy**: Canvas rendering, step serialization, and CRC32 calculation must function completely offline.

## Non-goals
- 3D WebGL / OpenGL mesh rendering (the lightweight 2D `CustomPainter` canvas was chosen for zero-dependency cross-platform reliability and battery efficiency).
- Cloud sequence sharing or synchronization (reserved for Phase 7+).

## Context & Authoritative Firmware Mapping
- **Kinematics & Channel Mapping**: `firmware/main/motion.c` & `pca9685.c` (Ch 0: Left, Ch 1: Right, Ch 2: Bottom, Ch 3: Top).
- **Sequence Storage & CRC32**: `firmware/main/storage.h` & `storage.c` (53-byte `routine_t`, IEEE 802.3 polynomial `0xEDB88320`).
- **Control Point Opcodes**: `firmware/main/command.h`:
  - `0x01` (`CMD_RUN_RAW_SEQUENCE`)
  - `0x0A` (`CMD_SET_BUTTON_SEQUENCE`)
  - `0x0C` (`CMD_RESTORE_FACTORY_PRESETS`)
