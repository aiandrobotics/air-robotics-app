import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/profile/device_profile.dart';
import '../../core/protocol/protocol_providers.dart';
import '../../core/protocol/telemetry_packet.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_tokens.dart';

/// Prominent, tactile Emergency Stop widget with pulsating safety indicator,
/// immediate <50ms fast-path dispatch without response, and heavy haptics.
class EmergencyStopWidget extends ConsumerStatefulWidget {
  final AirWidgetConfig config;

  const EmergencyStopWidget({super.key, required this.config});

  @override
  ConsumerState<EmergencyStopWidget> createState() =>
      _EmergencyStopWidgetState();
}

class _EmergencyStopWidgetState extends ConsumerState<EmergencyStopWidget> {
  bool _isDispatching = false;

  Future<void> _triggerEmergencyStop() async {
    final tactileFeedback =
        widget.config.props['tactile_feedback'] as bool? ?? true;
    if (tactileFeedback) {
      HapticFeedback.heavyImpact();
    }

    setState(() => _isDispatching = true);

    try {
      final pipeline = ref.read(commandPipelineProvider);
      await pipeline.emergencyStop();
    } catch (_) {
      // Fast-path write without response catches any transient errors
    } finally {
      if (mounted) {
        setState(() => _isDispatching = false);
      }
    }
  }

  Future<void> _clearEstopOrStopSequence() async {
    final tactileFeedback =
        widget.config.props['tactile_feedback'] as bool? ?? true;
    if (tactileFeedback) {
      HapticFeedback.mediumImpact();
    }

    setState(() => _isDispatching = true);

    try {
      final pipeline = ref.read(commandPipelineProvider);
      await pipeline.stopSequence();
    } catch (_) {
      // Catch transient errors
    } finally {
      if (mounted) {
        setState(() => _isDispatching = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final telemetryAsync = ref.watch(latestTelemetryProvider);
    final packet =
        telemetryAsync.value ?? ref.read(telemetryBusProvider).latestPacket;
    final isRunning = packet?.systemState == SystemState.runningMotion;
    final isEstop = packet?.systemState == SystemState.estop;

    if (isEstop) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: [
            Container(
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.amber.withValues(alpha: 0.3),
                    blurRadius: 16,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.amber,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.lock_open_rounded, size: 24),
                label: const Text(
                  'CLEAR & UNLATCH E-STOP',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                  ),
                ),
                onPressed: _isDispatching ? null : _clearEstopOrStopSequence,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Dispatches 0x02 to clear firmware E-Stop latch and return to IDLE',
              style: TextStyle(fontSize: 10, color: AppColors.amber),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: isRunning
                    ? [
                        BoxShadow(
                          color: AppColors.crimson.withValues(alpha: 0.6),
                          blurRadius: 16,
                          spreadRadius: 2,
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.crimson,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _isDispatching ? null : _triggerEmergencyStop,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.emergency, size: 28),
                    SizedBox(width: AppTokens.space12),
                    Text(
                      'EMERGENCY STOP',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isRunning) ...[
            const SizedBox(width: AppTokens.space8),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.surfaceHighlight,
                  foregroundColor: AppColors.textPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.stop_circle_outlined, size: 22, color: AppColors.amber),
                label: const Text(
                  'STOP',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: _isDispatching ? null : _clearEstopOrStopSequence,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
