import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/profile/device_profile.dart';
import '../../core/profile/profile_providers.dart';
import '../../core/protocol/protocol_providers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_tokens.dart';

/// Bank of throttled actuator calibration sliders commanding physical servos
/// with 50ms rate-limiting to prevent radio link congestion.
class JogSliderBankWidget extends ConsumerStatefulWidget {
  final AirWidgetConfig config;

  const JogSliderBankWidget({super.key, required this.config});

  @override
  ConsumerState<JogSliderBankWidget> createState() =>
      _JogSliderBankWidgetState();
}

class _JogSliderBankWidgetState extends ConsumerState<JogSliderBankWidget> {
  final Map<int, double> _localAngles = {};
  final Map<int, Timer?> _throttleTimers = {};
  final Map<int, int> _pendingCommands = {};

  @override
  void dispose() {
    for (final timer in _throttleTimers.values) {
      timer?.cancel();
    }
    _throttleTimers.clear();
    super.dispose();
  }

  void _onSliderChanged(int channel, double value, int throttleMs) {
    setState(() {
      _localAngles[channel] = value;
    });

    final targetInt = value.round();
    _pendingCommands[channel] = targetInt;

    if (_throttleTimers[channel]?.isActive ?? false) {
      // Throttle timer active; pending command will be sent on next tick
      return;
    }

    // Dispatch immediately and schedule throttle window
    _dispatchJog(channel, targetInt);

    _throttleTimers[channel] = Timer(Duration(milliseconds: throttleMs), () {
      final latestPending = _pendingCommands[channel];
      if (latestPending != null && latestPending != targetInt) {
        _dispatchJog(channel, latestPending);
      }
    });
  }

  void _dispatchJog(int channel, int angle) {
    try {
      final pipeline = ref.read(commandPipelineProvider);
      pipeline.jogMotor(channel: channel, angleDeg: angle);
    } catch (_) {
      // Ignore transient connection errors during drag
    }
  }

  @override
  Widget build(BuildContext context) {
    final throttleMs =
        (widget.config.props['drag_throttle_ms'] as num?)?.toInt() ?? 50;
    final activeProfile = ref.watch(activeProfileProvider);
    final telemetryAsync = ref.watch(latestTelemetryProvider);
    final packet =
        telemetryAsync.value ?? ref.read(telemetryBusProvider).latestPacket;

    final actuators = activeProfile.actuators;
    final actualAngles = packet?.channelAngles ?? List<int>.filled(16, 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.config.title.isNotEmpty
                  ? widget.config.title.toUpperCase()
                  : 'SERVO MANUAL JOG',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.cyan,
                letterSpacing: 0.8,
              ),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
                foregroundColor: AppColors.amber,
              ),
              icon: const Icon(Icons.home, size: 14),
              label: const Text(
                'HOME ALL (0x02)',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                try {
                  await ref.read(commandPipelineProvider).stopSequence();
                  setState(() {
                    for (final a in actuators) {
                      _localAngles[a.channel] = 0.0;
                    }
                  });
                } catch (_) {}
              },
            ),
          ],
        ),
        const SizedBox(height: AppTokens.space4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.surfaceHighlight,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.border),
          ),
          child: const Row(
            children: [
              Icon(Icons.thermostat, size: 14, color: AppColors.cyan),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Thermal safety: 10s PWM idle cutoff • 15s inactivity auto-home',
                  style: TextStyle(fontSize: 10, color: AppColors.textMuted),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppTokens.space8),
        Card(
          child: Padding(
            padding: AppTokens.paddingCard,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: actuators.length,
              separatorBuilder: (context, index) => const Divider(height: 16),
              itemBuilder: (context, index) {
                final actuator = actuators[index];
                final channel = actuator.channel;
                final actualAngle = channel < actualAngles.length
                    ? actualAngles[channel]
                    : 0;
                final commandedAngle = _localAngles[channel] ??
                    actuator.defaultAngle;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceHighlight,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'CH $channel',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'monospace',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.cyan,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppTokens.space8),
                            Text(
                              actuator.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '${commandedAngle.round()}°',
                              style: const TextStyle(
                                fontSize: 13,
                                fontFamily: 'monospace',
                                fontWeight: FontWeight.bold,
                                color: AppColors.cyan,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '($actualAngle°)',
                              style: const TextStyle(
                                fontSize: 11,
                                fontFamily: 'monospace',
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(width: AppTokens.space8),
                            InkWell(
                              onTap: () {
                                _onSliderChanged(
                                  channel,
                                  actuator.defaultAngle,
                                  throttleMs,
                                );
                              },
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceHighlight,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: AppColors.border),
                                ),
                                child: const Text(
                                  'HOME',
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: AppColors.cyan,
                        inactiveTrackColor: AppColors.surfaceHighlight,
                        thumbColor: AppColors.cyan,
                        overlayColor: AppColors.cyan.withValues(alpha: 0.2),
                        trackHeight: 4,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 7),
                      ),
                      child: Slider(
                        value: commandedAngle.clamp(
                          actuator.minLimit,
                          actuator.maxLimit,
                        ),
                        min: actuator.minLimit,
                        max: actuator.maxLimit,
                        onChanged: (val) =>
                            _onSliderChanged(channel, val, throttleMs),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
