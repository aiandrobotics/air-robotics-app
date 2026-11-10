import 'dart:typed_data';

/// Active system state of the robot.
enum SystemState {
  idle(0),
  runningMotion(1),
  estop(2),
  error(3),
  calibrating(4);

  final int value;
  const SystemState(this.value);

  static SystemState fromValue(int val) {
    return SystemState.values.firstWhere(
      (s) => s.value == val,
      orElse: () => SystemState.error,
    );
  }
}

/// Active LED pattern of the robot hardware indicator.
enum LedState {
  idle(0),
  running(1),
  saveSuccess(2),
  inputError(3),
  estop(4),
  pairing(5),
  connected(6),
  identify(7);

  final int value;
  const LedState(this.value);

  static LedState fromValue(int val) {
    return LedState.values.firstWhere(
      (s) => s.value == val,
      orElse: () => LedState.idle,
    );
  }
}

/// Execution status of the last processed remote command.
enum CmdStatus {
  ok(0),
  errBusy(1),
  errInvalidStep(2),
  errMotorBounds(3),
  errRoutineFull(4),
  errCrcMismatch(5),
  errInvalidArg(6);

  final int value;
  const CmdStatus(this.value);

  static CmdStatus fromValue(int val) {
    return CmdStatus.values.firstWhere(
      (s) => s.value == val,
      orElse: () => CmdStatus.errInvalidArg,
    );
  }
}

/// Zero-allocation, typed representation of the packed 31-byte binary
/// telemetry frame emitted periodically by the robot on FAB2.
///
/// Wire layout (31 bytes, Little-Endian):
/// ```
/// Offset: 0  1  2  3  4  5 [6-7] [8 .. 23] 24 [25-26] 27 28 [29-30]
/// Field: [S][L][B][I][T][P][ELAP] [ANGLES] [ST] [HEAP] [R][E] [SEQ ]
/// ```
class TelemetryPacket {
  static const int packetLength = 31;
  static const int channelCount = 16;

  // Fault bitmask constants matching firmware
  static const int faultBitI2c = 0x01;
  static const int faultBitNvs = 0x02;
  static const int faultBitEstop = 0x04;

  final SystemState systemState;
  final LedState ledState;
  final int activeButtonId;
  final int currentStepIdx;
  final int totalSteps;
  final int stepProgressPct;
  final int elapsedStepTimeMs;
  final List<int> channelAngles;
  final CmdStatus lastCmdStatus;
  final int freeHeapKb;
  final int bleRssiDbm;
  final int errorCode;
  final int sequenceCounter;

  const TelemetryPacket({
    required this.systemState,
    required this.ledState,
    required this.activeButtonId,
    required this.currentStepIdx,
    required this.totalSteps,
    required this.stepProgressPct,
    required this.elapsedStepTimeMs,
    required this.channelAngles,
    required this.lastCmdStatus,
    required this.freeHeapKb,
    required this.bleRssiDbm,
    required this.errorCode,
    required this.sequenceCounter,
  });

  /// Ingests a packed 31-byte binary notification from characteristic FAB2.
  ///
  /// Uses [ByteData.sublistView] to unpack Little-Endian binary values with
  /// zero intermediate memory allocations.
  factory TelemetryPacket.fromBytes(Uint8List bytes) {
    if (bytes.length != packetLength) {
      throw ArgumentError(
        'Invalid telemetry packet length: expected $packetLength bytes, got ${bytes.length}',
      );
    }

    final data = ByteData.sublistView(bytes);

    final sysStateVal = data.getUint8(0);
    final ledStateVal = data.getUint8(1);
    final activeBtn = data.getUint8(2);
    final stepIdx = data.getUint8(3);
    final totSteps = data.getUint8(4);
    final progress = data.getUint8(5);
    final elapsedMs = data.getUint16(6, Endian.little);

    // Channels 0 to 15 (16 bytes starting at offset 8)
    final angles = List<int>.generate(
      channelCount,
      (i) => data.getUint8(8 + i),
      growable: false,
    );

    final cmdStatusVal = data.getUint8(24);
    final heapKb = data.getUint16(25, Endian.little);
    final rssiDbm = data.getInt8(27);
    final errCode = data.getUint8(28);
    final seqCounter = data.getUint16(29, Endian.little);

    return TelemetryPacket(
      systemState: SystemState.fromValue(sysStateVal),
      ledState: LedState.fromValue(ledStateVal),
      activeButtonId: activeBtn,
      currentStepIdx: stepIdx,
      totalSteps: totSteps,
      stepProgressPct: progress,
      elapsedStepTimeMs: elapsedMs,
      channelAngles: angles,
      lastCmdStatus: CmdStatus.fromValue(cmdStatusVal),
      freeHeapKb: heapKb,
      bleRssiDbm: rssiDbm,
      errorCode: errCode,
      sequenceCounter: seqCounter,
    );
  }

  /// Encodes this packet into a 31-byte Little-Endian wire array.
  ///
  /// Primary use: synthetic host tests and simulation harnesses.
  Uint8List toBytes() {
    final buffer = Uint8List(packetLength);
    final data = ByteData.sublistView(buffer);

    data.setUint8(0, systemState.value);
    data.setUint8(1, ledState.value);
    data.setUint8(2, activeButtonId & 0xFF);
    data.setUint8(3, currentStepIdx & 0xFF);
    data.setUint8(4, totalSteps & 0xFF);
    data.setUint8(5, stepProgressPct & 0xFF);
    data.setUint16(6, elapsedStepTimeMs, Endian.little);

    for (var i = 0; i < channelCount; i++) {
      data.setUint8(8 + i, i < channelAngles.length ? channelAngles[i] : 0);
    }

    data.setUint8(24, lastCmdStatus.value);
    data.setUint16(25, freeHeapKb, Endian.little);
    data.setInt8(27, bleRssiDbm);
    data.setUint8(28, errorCode & 0xFF);
    data.setUint16(29, sequenceCounter, Endian.little);

    return buffer;
  }

  // Convenience safety & telemetry getters
  bool get isEstopActive =>
      (errorCode & faultBitEstop) != 0 || systemState == SystemState.estop;
  bool get isI2cFault => (errorCode & faultBitI2c) != 0;
  bool get isNvsFault => (errorCode & faultBitNvs) != 0;
  bool get isMotionActive => systemState == SystemState.runningMotion;
  bool get isIdle => systemState == SystemState.idle;
  bool get isCalibrating => systemState == SystemState.calibrating;

  /// Returns flap angle for the standard Fabrica channel mapping:
  /// Left (0), Right (1), Bottom (2), Top (3).
  int get leftFlapAngle => channelAngles.isNotEmpty ? channelAngles[0] : 0;
  int get rightFlapAngle => channelAngles.length > 1 ? channelAngles[1] : 0;
  int get bottomFlapAngle => channelAngles.length > 2 ? channelAngles[2] : 0;
  int get topFlapAngle => channelAngles.length > 3 ? channelAngles[3] : 0;

  @override
  String toString() {
    return 'TelemetryPacket(seq: $sequenceCounter, state: ${systemState.name}, '
        'led: ${ledState.name}, btn: $activeButtonId, step: $currentStepIdx/$totalSteps ($stepProgressPct%), '
        'elapsed: ${elapsedStepTimeMs}ms, heap: ${freeHeapKb}KB, rssi: ${bleRssiDbm}dBm, err: 0x${errorCode.toRadixString(16)})';
  }
}
