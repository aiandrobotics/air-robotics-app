import 'dart:async';
import 'dart:typed_data';

import '../protocol/command_builder.dart';
import '../protocol/routine_models.dart';
import '../protocol/telemetry_packet.dart';
import 'ble_transport_interface.dart';

/// Full interactive virtual robot simulator implementing [BleTransport].
///
/// Simulates a physical Fabrica Cloth Folding Robot (`Fabrica-DevKit-v1`) with:
/// - Realistic 10 Hz telemetry during motion sweeps and 1 Hz during idle.
/// - Dynamic flap angular kinematics ($0^\circ \to 180^\circ \to 0^\circ$).
/// - Fast-path Emergency Stop abort (<50ms).
/// - Manual servo jogging in calibration mode.
/// - RAM sequence preview and NVS flash sequence storage with CRC32.
class SimulatedBleTransport implements BleTransport {
  BleConnectionState _state = BleConnectionState.disconnected;
  DiscoveredRobot? _connectedRobot;

  final StreamController<List<DiscoveredRobot>> _scanController =
      StreamController<List<DiscoveredRobot>>.broadcast();
  final StreamController<bool> _isScanningController =
      StreamController<bool>.broadcast();
  final StreamController<BleConnectionState> _connectionStateController =
      StreamController<BleConnectionState>.broadcast();
  final StreamController<Uint8List> _telemetryStreamController =
      StreamController<Uint8List>.broadcast();

  Timer? _telemetryTicker;
  Timer? _motionStepTimer;

  // Virtual robot internal state
  SystemState _systemState = SystemState.idle;
  LedState _ledState = LedState.idle;
  CmdStatus _lastCmdStatus = CmdStatus.ok;
  int _activeButtonId = 0;
  int _currentStepIdx = 0;
  int _totalSteps = 0;
  int _stepProgressPct = 0;
  int _elapsedStepTimeMs = 0;
  int _seqCounter = 0;
  int _idleTickCount = 0;

  final List<int> _currentAngles = List<int>.filled(16, 0);
  final Map<int, FoldRoutine> _savedSequences = {};

  SimulatedBleTransport() {
    _initializeDefaultPresets();
  }

  void _initializeDefaultPresets() {
    _savedSequences[1] = FoldRoutine.create([
      FoldStep.single(0), // Left Flap
      FoldStep.single(1), // Right Flap
      FoldStep.single(2), // Bottom Flap
    ]);
    _savedSequences[2] = FoldRoutine.create([
      FoldStep.single(0),
      FoldStep.single(1),
      FoldStep.single(2),
      FoldStep.single(3), // Top Flap
    ]);
    _savedSequences[3] = FoldRoutine.create([
      FoldStep.dual(0, 1), // Dual sweep
      FoldStep.single(2),
    ]);
    _savedSequences[4] = FoldRoutine.create([
      FoldStep.single(2),
      FoldStep.single(0),
      FoldStep.single(1),
    ]);
  }

  @override
  Stream<List<DiscoveredRobot>> get scanResultsStream => _scanController.stream;

  @override
  Stream<bool> get isScanningStream => _isScanningController.stream;

  @override
  Stream<BleConnectionState> get connectionStateStream =>
      _connectionStateController.stream;

  @override
  BleConnectionState get currentConnectionState => _state;

  @override
  DiscoveredRobot? get connectedRobot => _connectedRobot;

  static DiscoveredRobot get defaultSimulatedRobot => DiscoveredRobot(
        id: 'simulated-fabrica-devkit',
        name: 'Fabrica-DevKit-v1',
        rawRssi: -52,
        smoothedRssi: -52.0,
        isPairingMode: true,
        lastSeen: DateTime.now(),
      );

  @override
  Future<void> startScan({
    Duration timeout = const Duration(seconds: 15),
    List<String> namePrefixes = const ['Fabrica-', 'AIR-'],
  }) async {
    _isScanningController.add(true);
    _scanController.add([defaultSimulatedRobot]);
  }

  @override
  Future<void> stopScan() async {
    _isScanningController.add(false);
  }

  @override
  Future<void> connect(String deviceId,
      {Duration timeout = const Duration(seconds: 15)}) async {
    _connectedRobot = defaultSimulatedRobot;
    _updateState(BleConnectionState.connected);
    _startTelemetryTicker();
  }

  @override
  Future<void> disconnect() async {
    _stopMotion();
    _telemetryTicker?.cancel();
    _telemetryTicker = null;
    _connectedRobot = null;
    _updateState(BleConnectionState.disconnected);
  }

  @override
  Future<int> requestMtu(int desiredMtu) async => 517;

  @override
  Future<bool> createBond() async => true;

  @override
  Future<BleGattInfo> discoverServices() async {
    return const BleGattInfo(
      modelNumber: 'Fabrica-DevKit-v1',
      firmwareRevision: 'v1.13.0',
      manufacturer: 'AIR Robotics',
      hasControlPoint: true,
      hasTelemetryStream: true,
      hasConfiguration: true,
      negotiatedMtu: 517,
    );
  }

  @override
  Future<void> writeControlPoint(Uint8List bytes,
      {bool withoutResponse = false}) async {
    if (bytes.isEmpty) return;

    final opcode = bytes[0];

    if (opcode == BleOpcode.emergencyStop.value) {
      // Fast-path immediate abort
      _handleEmergencyStop();
      return;
    }

    if (opcode == BleOpcode.runPreset.value) {
      final slot = bytes.length > 1 ? bytes[1] : 1;
      final routine = _savedSequences[slot] ?? _savedSequences[1]!;
      _activeButtonId = slot;
      _startRoutineSimulation(routine);
    } else if (opcode == BleOpcode.runRawSequence.value) {
      _activeButtonId = 0;
      try {
        final routineBytes = bytes.sublist(1);
        final routine = FoldRoutine.fromBytes(Uint8List.fromList(routineBytes));
        _startRoutineSimulation(routine);
      } catch (e) {
        _lastCmdStatus = CmdStatus.errInvalidStep;
        _emitTelemetry();
      }
    } else if (opcode == BleOpcode.stopSequence.value) {
      _stopMotion();
      _systemState = SystemState.idle;
      _ledState = LedState.idle;
      _emitTelemetry();
    } else if (opcode == BleOpcode.setButtonSequence.value) {
      final slot = bytes.length > 1 ? bytes[1] : 1;
      try {
        final routineBytes = bytes.sublist(2);
        final routine = FoldRoutine.fromBytes(Uint8List.fromList(routineBytes));
        _savedSequences[slot] = routine;
        _ledState = LedState.saveSuccess;
        _lastCmdStatus = CmdStatus.ok;
      } catch (e) {
        _lastCmdStatus = CmdStatus.errInvalidStep;
      }
      _emitTelemetry();
    } else if (opcode == BleOpcode.restoreFactoryPresets.value) {
      _initializeDefaultPresets();
      _lastCmdStatus = CmdStatus.ok;
      _emitTelemetry();
    } else if (opcode == BleOpcode.jogMotorAngle.value) {
      final ch = bytes.length > 1 ? bytes[1] : 0;
      final angle = bytes.length > 2 ? bytes[2] : 0;
      if (ch >= 0 && ch < 16) {
        _currentAngles[ch] = angle.clamp(0, 180);
      }
      _systemState = SystemState.calibrating;
      _lastCmdStatus = CmdStatus.ok;
      _emitTelemetry();
    }
  }

  void _handleEmergencyStop() {
    _stopMotion();
    for (int i = 0; i < 16; i++) {
      _currentAngles[i] = 0;
    }
    _systemState = SystemState.idle;
    _ledState = LedState.estop;
    _lastCmdStatus = CmdStatus.ok;
    _emitTelemetry();
  }

  void _startRoutineSimulation(FoldRoutine routine) {
    _stopMotion();
    _systemState = SystemState.runningMotion;
    _ledState = LedState.running;
    _lastCmdStatus = CmdStatus.ok;
    _totalSteps = routine.stepCount;
    _currentStepIdx = 1;

    final steps = routine.steps.take(routine.stepCount).toList();
    if (steps.isEmpty) {
      _systemState = SystemState.idle;
      _ledState = LedState.idle;
      _emitTelemetry();
      return;
    }

    _executeStepIndex(steps, 0);
  }

  void _executeStepIndex(List<FoldStep> steps, int index) {
    if (index >= steps.length || _systemState != SystemState.runningMotion) {
      _stopMotion();
      _systemState = SystemState.idle;
      _ledState = LedState.idle;
      _currentStepIdx = 0;
      _totalSteps = 0;
      _stepProgressPct = 0;
      _emitTelemetry();
      return;
    }

    _currentStepIdx = index + 1;
    final step = steps[index];
    final activeMotors = step.motorCount > 1
        ? [step.motorIds[0], step.motorIds[1]]
        : [step.motorIds[0]];

    int tick = 0;
    const totalTicks = 12; // 12 * 100ms = 1.2s per step

    _motionStepTimer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      tick++;
      _elapsedStepTimeMs = tick * 100;
      _stepProgressPct = ((tick / totalTicks) * 100).round().clamp(0, 100);

      // Trajectory: 0 -> 6 ticks (0° to 180°), 6 -> 12 ticks (180° back to 0°)
      double angle;
      if (tick <= 6) {
        angle = (tick / 6) * 180.0;
      } else {
        angle = (1.0 - ((tick - 6) / 6)) * 180.0;
      }

      for (final m in activeMotors) {
        if (m >= 0 && m < 16) {
          _currentAngles[m] = angle.round().clamp(0, 180);
        }
      }

      _emitTelemetry();

      if (tick >= totalTicks) {
        t.cancel();
        for (final m in activeMotors) {
          if (m >= 0 && m < 16) _currentAngles[m] = 0;
        }
        _executeStepIndex(steps, index + 1);
      }
    });
  }

  void _stopMotion() {
    _motionStepTimer?.cancel();
    _motionStepTimer = null;
    for (int i = 0; i < 4; i++) {
      _currentAngles[i] = 0;
    }
  }

  void _startTelemetryTicker() {
    _telemetryTicker?.cancel();
    // 100ms interval = 10 Hz capability
    _telemetryTicker =
        Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_systemState == SystemState.runningMotion) {
        // Active motion: emit every 100ms (10 Hz)
        _emitTelemetry();
      } else {
        // Idle/Calibrating: emit every 1000ms (1 Hz)
        _idleTickCount++;
        if (_idleTickCount >= 10) {
          _idleTickCount = 0;
          _emitTelemetry();
        }
      }
    });
  }

  void _emitTelemetry() {
    _seqCounter = (_seqCounter + 1) & 0xFFFF;
    final packet = TelemetryPacket(
      systemState: _systemState,
      ledState: _ledState,
      activeButtonId: _activeButtonId,
      currentStepIdx: _currentStepIdx,
      totalSteps: _totalSteps,
      stepProgressPct: _stepProgressPct,
      elapsedStepTimeMs: _elapsedStepTimeMs,
      channelAngles: List<int>.from(_currentAngles),
      lastCmdStatus: _lastCmdStatus,
      freeHeapKb: 215,
      bleRssiDbm: -52,
      errorCode: 0,
      sequenceCounter: _seqCounter,
    );

    if (!_telemetryStreamController.isClosed) {
      _telemetryStreamController.add(packet.toBytes());
    }
  }

  @override
  Future<Uint8List> readCharacteristic(String characteristicUuid) async {
    return Uint8List.fromList([0x00]);
  }

  @override
  Future<void> writeCharacteristic(
    String characteristicUuid,
    Uint8List bytes, {
    bool withoutResponse = false,
  }) async {
    if (characteristicUuid.toLowerCase() ==
        BleUuids.charControlPoint.toLowerCase()) {
      await writeControlPoint(bytes, withoutResponse: withoutResponse);
    }
  }

  @override
  Stream<Uint8List> subscribeCharacteristic(String characteristicUuid) {
    return _telemetryStreamController.stream;
  }

  @override
  Stream<Uint8List> subscribeTelemetry() =>
      subscribeCharacteristic(BleUuids.charTelemetryStream);

  void _updateState(BleConnectionState newState) {
    _state = newState;
    if (!_connectionStateController.isClosed) {
      _connectionStateController.add(newState);
    }
  }

  @override
  void dispose() {
    _stopMotion();
    _telemetryTicker?.cancel();
    _telemetryTicker = null;
    _scanController.close();
    _isScanningController.close();
    _connectionStateController.close();
    _telemetryStreamController.close();
  }
}
