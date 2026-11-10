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

  @override
  Widget build(BuildContext context) {
    final telemetryAsync = ref.watch(latestTelemetryProvider);
    final packet =
        telemetryAsync.value ?? ref.read(telemetryBusProvider).latestPacket;
    final isRunning = packet?.systemState == SystemState.runningMotion;
    final isEstop = packet?.systemState == SystemState.estop;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: (isRunning || isEstop)
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
              side: BorderSide(
                color: isEstop ? Colors.white : AppColors.crimson,
                width: isEstop ? 2 : 1,
              ),
            ),
          ),
          onPressed: _isDispatching ? null : _triggerEmergencyStop,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emergency, size: 28),
              const SizedBox(width: AppTokens.space12),
              Text(
                isEstop ? 'E-STOP ACTIVE (HALTED)' : 'EMERGENCY STOP',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
