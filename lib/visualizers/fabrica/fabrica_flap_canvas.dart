import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/profile/device_profile.dart';
import '../../core/protocol/protocol_providers.dart';
import '../../core/protocol/telemetry_packet.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_tokens.dart';
import 'fabrica_geometry.dart';

/// Interactive 2D Kinematic Canvas for the Fabrica Cloth Folding Robot.
///
/// Renders Left (Ch 0), Right (Ch 1), Bottom (Ch 2), and Top (Ch 3) articulating
/// panels using hardware-accelerated 2D planar projection at 60 fps, with
/// interactive touch-drag servo positioning in calibration mode.
class FabricaFlapVisualizerWidget extends ConsumerStatefulWidget {
  final AirWidgetConfig config;

  const FabricaFlapVisualizerWidget({super.key, required this.config});

  @override
  ConsumerState<FabricaFlapVisualizerWidget> createState() =>
      _FabricaFlapVisualizerWidgetState();
}

class _FabricaFlapVisualizerWidgetState
    extends ConsumerState<FabricaFlapVisualizerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _interpolator;
  final List<double> _currentDisplayAngles = [0.0, 0.0, 0.0, 0.0];
  final List<double> _targetAngles = [0.0, 0.0, 0.0, 0.0];
  final List<double> _startAngles = [0.0, 0.0, 0.0, 0.0];

  FabricaFlap? _activeDraggingFlap;
  Timer? _jogThrottleTimer;
  int? _pendingJogAngle;
  int _lastSeq = -1;

  @override
  void initState() {
    super.initState();
    _interpolator = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100), // Match 10 Hz interval
    )..addListener(_onInterpolationTick);
  }

  @override
  void dispose() {
    _interpolator.dispose();
    _jogThrottleTimer?.cancel();
    super.dispose();
  }

  void _onInterpolationTick() {
    final t = _interpolator.value;
    setState(() {
      for (int i = 0; i < 4; i++) {
        _currentDisplayAngles[i] =
            _startAngles[i] + (_targetAngles[i] - _startAngles[i]) * t;
      }
    });
  }

  void _updateTargetAngles(List<int> rawAngles) {
    if (_activeDraggingFlap != null) return; // Don't override while user drags

    bool changed = false;
    for (int i = 0; i < 4; i++) {
      final target = (i < rawAngles.length ? rawAngles[i] : 0).toDouble();
      if (_targetAngles[i] != target) {
        _startAngles[i] = _currentDisplayAngles[i];
        _targetAngles[i] = target;
        changed = true;
      }
    }

    if (changed) {
      _interpolator.forward(from: 0.0);
    }
  }

  void _onPanStart(DragStartDetails details, FabricaGeometry geometry) {
    final hit = geometry.hitTestFlap(details.localPosition);
    if (hit != null) {
      setState(() {
        _activeDraggingFlap = hit;
      });
      _onPanUpdate(
        DragUpdateDetails(
          globalPosition: details.globalPosition,
          localPosition: details.localPosition,
        ),
        geometry,
      );
    }
  }

  void _onPanUpdate(DragUpdateDetails details, FabricaGeometry geometry) {
    final flap = _activeDraggingFlap;
    if (flap == null) return;

    final targetAngle = geometry.computeAngleFromDrag(flap, details.localPosition);
    setState(() {
      _currentDisplayAngles[flap.channel] = targetAngle;
      _targetAngles[flap.channel] = targetAngle;
    });

    final angleInt = targetAngle.round();
    _pendingJogAngle = angleInt;

    if (_jogThrottleTimer?.isActive ?? false) {
      return;
    }

    _dispatchJog(flap.channel, angleInt);

    _jogThrottleTimer = Timer(const Duration(milliseconds: 50), () {
      final pending = _pendingJogAngle;
      if (pending != null && pending != angleInt) {
        _dispatchJog(flap.channel, pending);
      }
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      _activeDraggingFlap = null;
    });
  }

  void _dispatchJog(int channel, int angle) {
    try {
      ref.read(commandPipelineProvider).jogMotor(
            channel: channel,
            angleDeg: angle,
          );
    } catch (_) {
      // Ignore transient errors
    }
  }

  @override
  Widget build(BuildContext context) {
    final telemetryAsync = ref.watch(latestTelemetryProvider);
    final packet =
        telemetryAsync.value ?? ref.read(telemetryBusProvider).latestPacket;

    if (packet != null && packet.sequenceCounter != _lastSeq) {
      _lastSeq = packet.sequenceCounter;
      _updateTargetAngles(packet.channelAngles);
    }

    final isCalibrating = packet?.systemState == SystemState.calibrating;

    return Card(
      elevation: 3,
      child: Padding(
        padding: AppTokens.paddingCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row: Visualizer Title & Calibration Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.view_in_ar,
                        color: AppColors.cyan, size: 20),
                    const SizedBox(width: AppTokens.space8),
                    Text(
                      widget.config.title.isNotEmpty
                          ? widget.config.title.toUpperCase()
                          : 'KINEMATIC FLAP CANVAS',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cyan,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: isCalibrating
                        ? AppColors.amber.withValues(alpha: 0.15)
                        : AppColors.surfaceHighlight,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: isCalibrating ? AppColors.amber : AppColors.border,
                    ),
                  ),
                  child: Text(
                    isCalibrating ? 'CALIBRATION JOG ON' : 'LIVE 60 FPS',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: isCalibrating
                          ? AppColors.amber
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppTokens.space12),

            // Kinematic Interactive Canvas Area
            LayoutBuilder(
              builder: (context, constraints) {
                final canvasHeight = 240.0;
                final canvasSize = Size(constraints.maxWidth, canvasHeight);
                final geometry = FabricaGeometry(canvasSize: canvasSize);

                return GestureDetector(
                  onPanStart: (d) => _onPanStart(d, geometry),
                  onPanUpdate: (d) => _onPanUpdate(d, geometry),
                  onPanEnd: _onPanEnd,
                  child: Container(
                    height: canvasHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: CustomPaint(
                      size: canvasSize,
                      painter: _FabricaFlapPainter(
                        geometry: geometry,
                        angles: _currentDisplayAngles,
                        activeDraggingFlap: _activeDraggingFlap,
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: AppTokens.space8),

            // Live Angle Readout Badges
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFlapPill(
                    'LEFT (CH 0)', _currentDisplayAngles[0].round()),
                _buildFlapPill(
                    'RIGHT (CH 1)', _currentDisplayAngles[1].round()),
                _buildFlapPill(
                    'BOTTOM (CH 2)', _currentDisplayAngles[2].round()),
                _buildFlapPill(
                    'TOP (CH 3)', _currentDisplayAngles[3].round()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlapPill(String name, int angle) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 9, color: AppColors.textMuted),
        ),
        const SizedBox(height: 2),
        Text(
          '$angle°',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color: AppColors.cyan,
          ),
        ),
      ],
    );
  }
}

class _FabricaFlapPainter extends CustomPainter {
  final FabricaGeometry geometry;
  final List<double> angles;
  final FabricaFlap? activeDraggingFlap;

  _FabricaFlapPainter({
    required this.geometry,
    required this.angles,
    required this.activeDraggingFlap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Draw Central Base Plate (where the garment rests)
    final baseRect = geometry.basePlateRect;
    final basePaint = Paint()
      ..color = AppColors.surfaceElevated
      ..style = PaintingStyle.fill;
    final baseBorderPaint = Paint()
      ..color = AppColors.border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawRRect(
      RRect.fromRectAndRadius(baseRect, const Radius.circular(6)),
      basePaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(baseRect, const Radius.circular(6)),
      baseBorderPaint,
    );

    // Subtle garment folding alignment guidelines
    final guidePaint = Paint()
      ..color = AppColors.border.withValues(alpha: 0.4)
      ..strokeWidth = 1.0;
    canvas.drawLine(
      Offset(baseRect.left + baseRect.width * 0.25, baseRect.top + 8),
      Offset(baseRect.left + baseRect.width * 0.25, baseRect.bottom - 8),
      guidePaint,
    );
    canvas.drawLine(
      Offset(baseRect.right - baseRect.width * 0.25, baseRect.top + 8),
      Offset(baseRect.right - baseRect.width * 0.25, baseRect.bottom - 8),
      guidePaint,
    );

    // 2. Draw Each Flap Panel with Perspective Projection & Shadow
    for (final flap in FabricaFlap.values) {
      final angle = flap.channel < angles.length ? angles[flap.channel] : 0.0;
      final flapRect = geometry.getFlapRect(flap, angle);
      final elevation = geometry.getElevationFactor(angle);
      final isDragging = activeDraggingFlap == flap;

      // Draw elevation shadow when panel is raised off the table
      if (elevation > 0.05) {
        final shadowPaint = Paint()
          ..color = Colors.black.withValues(alpha: elevation * 0.5)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, elevation * 8.0);
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            flapRect.translate(0, elevation * 4),
            const Radius.circular(6),
          ),
          shadowPaint,
        );
      }

      // Panel Fill
      Color panelColor = AppColors.cyan.withValues(
        alpha: isDragging ? 0.45 : (0.20 + elevation * 0.15),
      );
      if (angle >= 165.0) {
        panelColor = AppColors.emerald.withValues(alpha: 0.35); // Fully folded
      } else if (isDragging) {
        panelColor = AppColors.amber.withValues(alpha: 0.40);
      }

      final panelPaint = Paint()
        ..color = panelColor
        ..style = PaintingStyle.fill;

      final panelStrokePaint = Paint()
        ..color = isDragging
            ? AppColors.amber
            : (angle > 10.0 ? AppColors.cyan : AppColors.border)
        ..style = PaintingStyle.stroke
        ..strokeWidth = isDragging ? 2.0 : 1.2;

      final rrect = RRect.fromRectAndRadius(flapRect, const Radius.circular(5));
      canvas.drawRRect(rrect, panelPaint);
      canvas.drawRRect(rrect, panelStrokePaint);

      // Label on the flap
      if (flapRect.width > 24 && flapRect.height > 18) {
        final textSpan = TextSpan(
          text: _shortLabel(flap),
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: isDragging ? AppColors.amber : AppColors.textPrimary,
          ),
        );
        final tp = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            flapRect.center.dx - tp.width / 2,
            flapRect.center.dy - tp.height / 2,
          ),
        );
      }
    }
  }

  String _shortLabel(FabricaFlap flap) {
    switch (flap) {
      case FabricaFlap.left:
        return 'LEFT';
      case FabricaFlap.right:
        return 'RIGHT';
      case FabricaFlap.bottom:
        return 'BOTTOM';
      case FabricaFlap.top:
        return 'TOP';
    }
  }

  @override
  bool shouldRepaint(covariant _FabricaFlapPainter oldDelegate) {
    return true;
  }
}
