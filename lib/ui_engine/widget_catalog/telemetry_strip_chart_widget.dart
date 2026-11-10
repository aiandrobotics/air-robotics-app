import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/profile/device_profile.dart';
import '../../core/profile/profile_providers.dart';
import '../../core/protocol/protocol_providers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_tokens.dart';

/// Real-time time-series rolling chart plotting active servo channel angles.
class TelemetryStripChartWidget extends ConsumerStatefulWidget {
  final AirWidgetConfig config;

  const TelemetryStripChartWidget({super.key, required this.config});

  @override
  ConsumerState<TelemetryStripChartWidget> createState() =>
      _TelemetryStripChartWidgetState();
}

class _TelemetryStripChartWidgetState
    extends ConsumerState<TelemetryStripChartWidget> {
  // Circular ring buffer of timestamped channel angle samples
  final List<_ChartSample> _samples = [];
  int _lastSampleSeq = -1;

  static const List<Color> _channelColors = [
    AppColors.cyan,
    AppColors.amber,
    AppColors.emerald,
    AppColors.purple,
    Colors.deepOrange,
    Colors.tealAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final windowSeconds =
        (widget.config.props['window_seconds'] as num?)?.toInt() ?? 10;
    final activeProfile = ref.watch(activeProfileProvider);
    final telemetryAsync = ref.watch(latestTelemetryProvider);
    final packet =
        telemetryAsync.value ?? ref.read(telemetryBusProvider).latestPacket;

    if (packet != null && packet.sequenceCounter != _lastSampleSeq) {
      _lastSampleSeq = packet.sequenceCounter;
      final now = DateTime.now();
      _samples.add(_ChartSample(time: now, angles: packet.channelAngles));

      final cutoff = now.subtract(Duration(seconds: windowSeconds));
      _samples.removeWhere((s) => s.time.isBefore(cutoff));
    }

    final actuatorCount = math.min(activeProfile.actuators.length, 6);

    return Card(
      child: Padding(
        padding: AppTokens.paddingCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.show_chart,
                        color: AppColors.cyan, size: 20),
                    const SizedBox(width: AppTokens.space8),
                    Text(
                      widget.config.title.isNotEmpty
                          ? widget.config.title.toUpperCase()
                          : 'TRAJECTORY STRIP CHART',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cyan,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${windowSeconds}s window',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTokens.space8),

            // Actuator Legend
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: List.generate(actuatorCount, (i) {
                final color = _channelColors[i % _channelColors.length];
                final name = activeProfile.actuators[i].name;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Ch $i: $name',
                      style: TextStyle(
                        fontSize: 10,
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }),
            ),

            const SizedBox(height: AppTokens.space12),

            // Canvas Chart
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.border),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CustomPaint(
                  painter: _StripChartPainter(
                    samples: _samples,
                    channelCount: actuatorCount,
                    channelColors: _channelColors,
                    windowDuration: Duration(seconds: windowSeconds),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartSample {
  final DateTime time;
  final List<int> angles;

  _ChartSample({required this.time, required this.angles});
}

class _StripChartPainter extends CustomPainter {
  final List<_ChartSample> samples;
  final int channelCount;
  final List<Color> channelColors;
  final Duration windowDuration;

  _StripChartPainter({
    required this.samples,
    required this.channelCount,
    required this.channelColors,
    required this.windowDuration,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Draw Grid Lines (0°, 45°, 90°, 135°, 180°)
    final gridPaint = Paint()
      ..color = AppColors.border.withValues(alpha: 0.3)
      ..strokeWidth = 1.0;

    for (int deg = 0; deg <= 180; deg += 45) {
      final y = size.height - (deg / 180.0 * size.height);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    if (samples.length < 2) return;

    final now = DateTime.now();
    final windowMs = windowDuration.inMilliseconds.toDouble();

    // 2. Draw Channel Angle Trajectories
    for (int ch = 0; ch < channelCount; ch++) {
      final linePaint = Paint()
        ..color = channelColors[ch % channelColors.length]
        ..strokeWidth = 2.0
        ..style = PaintingStyle.stroke;

      final path = Path();
      bool isFirst = true;

      for (final sample in samples) {
        final elapsedMs = now.difference(sample.time).inMilliseconds;
        final x = size.width - (elapsedMs / windowMs * size.width);
        if (x < 0) continue;

        final angle = ch < sample.angles.length ? sample.angles[ch] : 0;
        final y = size.height - (angle.clamp(0, 180) / 180.0 * size.height);

        if (isFirst) {
          path.moveTo(x, y);
          isFirst = false;
        } else {
          path.lineTo(x, y);
        }
      }

      canvas.drawPath(path, linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _StripChartPainter oldDelegate) => true;
}
