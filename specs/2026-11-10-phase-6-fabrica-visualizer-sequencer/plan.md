# Plan — Phase 6: Fabrica Reference Implementation: 2D Flap Canvas, Sequencer & E2E Validation

## Task Group 1: Fabrica 2D Flap Kinematic Canvas & Interactive Painter
1. **Flap Geometry & Kinematics Engine** (`lib/visualizers/fabrica/fabrica_geometry.dart`):
   - Model 2D planar projection for Left (Ch 0), Right (Ch 1), Bottom (Ch 2), and Top (Ch 3) flaps surrounding a fixed center base plate.
   - Calculate fold perspective geometry: projection width/height as a function of fold angle $\theta \in [0^\circ, 180^\circ]$ (projected span $= \text{span} \cdot \cos(\theta)$, depth shadowing $= \sin(\theta)$).
   - Touch hit-testing to identify which flap panel is being touched or dragged.
2. **Smooth 60 fps Telemetry Interpolator** (`lib/visualizers/fabrica/flap_interpolator.dart`):
   - Smoothly interpolate between incoming 10 Hz telemetry packets using `SingleTickerProviderStateMixin` / `AnimationController` or rolling LERP, eliminating visual stepping.
3. **Interactive 2D Flap CustomPainter Canvas** (`lib/visualizers/fabrica/fabrica_flap_canvas.dart`):
   - Render Fabrica's 4 articulating panels using hardware-accelerated Flutter `CustomPainter`.
   - Distinct color coding matching AppColors: Precision Cyan for active flap, Amber for moving, Muted Blue/Grey for resting.
   - Support interactive touch-drag gestures in calibration mode: drag flaps directly to command physical servo positions via `commandPipeline.jogMotor` (throttled to 50ms).

## Task Group 2: Timeline Sequence Builder & NVS Flash Programmer
1. **Timeline Sequencer Widget** (`lib/ui_engine/widget_catalog/timeline_sequencer_widget.dart`):
   - Visual timeline displaying up to 16 steps with step number, flap targets (Left, Right, Bottom, Top, or Dual combinations), and delete/reorder handles.
   - Step Editor Dialog/Sheet to configure single-motor (`FoldStep.single`) or dual-motor simultaneous motion (`FoldStep.dual`).
   - "Add Step" button (enforcing maximum 16 steps matching firmware `FoldRoutine.maxSteps`).
2. **Stateless Preview & NVS Flash Programming Operations**:
   - **Preview on Robot**: Button to dispatch unsaved sequence directly to ESP32 RAM via `CMD_RUN_RAW_SEQUENCE` (`0x01`) without writing to flash.
   - **Save to Preset Button**: Modal dialog allowing user to choose target button slot (Button 1 to 4) and dispatch `CMD_SET_BUTTON_SEQUENCE` (`0x0A`) with deterministic IEEE 802.3 CRC32 verification.
   - **Restore Factory Presets**: Safety button dispatching `CMD_RESTORE_FACTORY_PRESETS` (`0x0C`) with confirmation prompt.

## Task Group 3: WidgetRegistry Integration, Full Test Suite & E2E Validation
1. **Connect Visualizer & Sequencer in WidgetRegistry** (`lib/ui_engine/widget_registry.dart`):
   - Replace placeholder cards for `visualizer` (targeting `fabrica-flap-grid`) and `timeline-sequencer` with live production implementations.
2. **Comprehensive Unit & Widget Tests**:
   - `test/visualizers/fabrica_geometry_test.dart`: Test fold perspective math, projection bounds, and touch hit-testing.
   - `test/visualizers/fabrica_flap_canvas_test.dart`: Test 2D canvas rendering, angle interpolation, and drag interaction.
   - `test/ui_engine/timeline_sequencer_widget_test.dart`: Test step editing, sequence validation, raw preview dispatch (0x01), and NVS flash programming (0x0A).
3. **Static Analysis & Test Suite**:
   - Run `flutter analyze` (0 issues).
   - Run `flutter test` (all 85+ tests passing).
4. **End-to-End Live Hardware Validation**:
   - Run on Pixel 8 connected to physical Fabrica ESP32 DevKit hardware.
   - Verify smooth 60 fps flap canvas articulation matching physical flaps.
   - Verify sequence creation, preview, and flash commit to Button 2.
