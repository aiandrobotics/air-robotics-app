import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/profile/device_profile.dart';
import '../../core/profile/profile_providers.dart';
import '../../core/protocol/protocol_providers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_tokens.dart';
import '../../l10n/app_localizations.dart';
import '../../visualizers/fabrica/fabrica_arrangement_provider.dart';

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

    final isFabrica = activeProfile.modelNumber.toLowerCase().contains('fabrica');
    final arrangement = ref.watch(fabricaArrangementProvider);
    final profileByChannel = {
      for (final a in activeProfile.actuators) a.channel: a,
    };
    final actuators = (isFabrica
            ? arrangement.motorizedPanels.map((p) {
                final ch = p.motorChannel ?? 0;
                final base = profileByChannel[ch];
                final flapNum = arrangement.flapNumberForPanel(p.id);
                return AirActuator(
                  channel: ch,
                  name: '#$flapNum',
                  role: base?.role ?? 'motorized_flap',
                  minLimit: base?.minLimit ?? 0.0,
                  maxLimit: base?.maxLimit ?? 180.0,
                  defaultAngle: base?.defaultAngle ?? 0.0,
                  inverted: base?.inverted ?? false,
                );
              }).toList()
            : List<AirActuator>.from(activeProfile.actuators))
        ..sort((a, b) => a.channel.compareTo(b.channel));
    final actualAngles = packet?.channelAngles ?? List<int>.filled(16, 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)?.servoManualJog ??
                  (widget.config.title.isNotEmpty
                      ? widget.config.title.toUpperCase()
                      : 'SERVO MANUAL JOG'),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.of(context).cyan,
                letterSpacing: 0.8,
              ),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
                foregroundColor: AppColors.of(context).amber,
              ),
              icon: const Icon(Icons.home, size: 14),
              label: Text(
                AppLocalizations.of(context)?.homeAll ?? 'HOME ALL',
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
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
        const SizedBox(height: AppTokens.space8),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: actuators.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final actuator = actuators[index];
            final channel = actuator.channel;
            final actualAngle = channel < actualAngles.length
                ? actualAngles[channel]
                : 0;
            final commandedAngle = _localAngles[channel] ??
                actuator.defaultAngle;

            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: AppColors.of(context).surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.of(context).border.withValues(alpha: 0.7),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.of(context).surfaceHighlight,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                AppLocalizations.of(context)
                                        ?.channelNumber(channel + 1) ??
                                    'Channel ${channel + 1}',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'monospace',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.of(context).cyan,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppTokens.space8),
                            Flexible(
                              child: Text(
                                actuator.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${commandedAngle.round()}°',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.bold,
                              color: AppColors.of(context).cyan,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '($actualAngle°)',
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'monospace',
                              color: AppColors.of(context).textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        '0°',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.of(context).textSecondary,
                        ),
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: AppColors.of(context).cyan,
                            inactiveTrackColor: AppColors.of(context).surfaceHighlight,
                            thumbColor: AppColors.of(context).isDark
                                ? Colors.white
                                : AppColors.of(context).cyan,
                            overlayColor:
                                AppColors.of(context).cyan.withValues(alpha: 0.2),
                            trackHeight: 10,
                            trackShape: const RoundedRectSliderTrackShape(),
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 9,
                            ),
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
                      ),
                      Text(
                        '180°',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.of(context).textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
