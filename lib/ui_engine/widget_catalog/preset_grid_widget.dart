import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/profile/device_profile.dart';
import '../../core/profile/profile_providers.dart';
import '../../core/protocol/protocol_providers.dart';
import '../../core/protocol/telemetry_packet.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_tokens.dart';

/// Grid widget displaying tactile routine preset triggers with live progress sweeps.
class PresetGridWidget extends ConsumerWidget {
  final AirWidgetConfig config;

  const PresetGridWidget({super.key, required this.config});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final columns = (config.props['columns'] as num?)?.toInt() ?? 2;
    final activeProfile = ref.watch(activeProfileProvider);
    final telemetryAsync = ref.watch(latestTelemetryProvider);
    final packet =
        telemetryAsync.value ?? ref.read(telemetryBusProvider).latestPacket;

    final presets = activeProfile.presets;
    final isRunning = packet?.systemState == SystemState.runningMotion;
    final activeSlot = packet?.activeButtonId ?? 0;
    final progressPct = packet?.stepProgressPct ?? 0;
    final currentStep = (packet?.currentStepIdx ?? 0) + 1;
    final totalSteps = packet?.totalSteps ?? 0;

    if (presets.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (config.title.isNotEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                config.title.toUpperCase(),
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
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  foregroundColor: AppColors.crimson,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
                icon: const Icon(Icons.delete_sweep, size: 14),
                label: const Text(
                  'ERASE PRESETS',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
                onPressed: () => _confirmErasePresets(context, ref),
              ),
            ],
          ),
          const SizedBox(height: AppTokens.space8),
        ],
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: AppTokens.space12,
            mainAxisSpacing: AppTokens.space12,
            childAspectRatio: 1.4,
          ),
          itemCount: presets.length,
          itemBuilder: (context, index) {
            final preset = presets[index];
            final isActive = isRunning && (activeSlot == preset.id);

            return _PresetCard(
              preset: preset,
              isActive: isActive,
              isMachineBusy: isRunning && !isActive,
              progressPct: isActive ? progressPct : 0,
              currentStep: isActive ? currentStep : 0,
              totalSteps: isActive ? totalSteps : 0,
              onTap: () async {
                try {
                  if (isActive) {
                    // If tapping active routine, issue soft stop
                    await ref.read(commandPipelineProvider).stopSequence();
                  } else if (!isRunning) {
                    await ref
                        .read(commandPipelineProvider)
                        .runPreset(preset.id);
                  }
                } catch (_) {
                  // Handle transient radio disconnection or timeout
                }
              },
            );
          },
        ),
      ],
    );
  }

  Future<void> _confirmErasePresets(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTokens.radiusLg),
            side: const BorderSide(color: AppColors.border),
          ),
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: AppColors.amber, size: 24),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Erase All Presets in Firmware?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          content: const Text(
            'This will erase all custom routine sequences from memory and reset all button presets back to factory defaults.\n\nAre you sure you want to proceed?',
            style: TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.4),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('CANCEL', style: TextStyle(color: AppColors.textSecondary)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.crimson,
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('ERASE IN FIRMWARE'),
            ),
          ],
        );
      },
    );

    if (confirmed == true && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Restoring factory presets...'),
          duration: Duration(seconds: 1),
        ),
      );

      try {
        await ref.read(commandPipelineProvider).restoreFactoryPresets();
        if (context.mounted) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('All presets successfully erased and restored to factory defaults.'),
              backgroundColor: AppColors.emerald,
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to erase presets in firmware: $e'),
              backgroundColor: AppColors.crimson,
            ),
          );
        }
      }
    }
  }
}

class _PresetCard extends StatelessWidget {
  final AirPreset preset;
  final bool isActive;
  final bool isMachineBusy;
  final int progressPct;
  final int currentStep;
  final int totalSteps;
  final VoidCallback onTap;

  const _PresetCard({
    required this.preset,
    required this.isActive,
    required this.isMachineBusy,
    required this.progressPct,
    required this.currentStep,
    required this.totalSteps,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isActive
        ? AppColors.cyan
        : (isMachineBusy ? AppColors.border.withValues(alpha: 0.3) : AppColors.border);

    return Material(
      color: isActive
          ? AppColors.cyan.withValues(alpha: 0.12)
          : AppColors.surface,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: isMachineBusy ? null : onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(AppTokens.space12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: borderColor,
              width: isActive ? 2 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    _iconForName(preset.icon),
                    color: isActive
                        ? AppColors.cyan
                        : (isMachineBusy
                            ? AppColors.textMuted
                            : AppColors.textPrimary),
                    size: 24,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.cyan.withValues(alpha: 0.2)
                          : AppColors.surfaceHighlight,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '#${preset.id}',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color:
                            isActive ? AppColors.cyan : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    preset.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: isMachineBusy
                          ? AppColors.textMuted
                          : AppColors.textPrimary,
                    ),
                  ),
                  if (isActive) ...[
                    const SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: progressPct / 100.0,
                        backgroundColor: AppColors.surfaceHighlight,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.cyan),
                        minHeight: 4,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Step $currentStep/$totalSteps ($progressPct%)',
                      style: const TextStyle(
                        fontSize: 9,
                        fontFamily: 'monospace',
                        color: AppColors.cyan,
                      ),
                    ),
                  ] else if (preset.description.isNotEmpty) ...[
                    Text(
                      preset.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _iconForName(String icon) {
    switch (icon.toLowerCase()) {
      case 'tshirt':
      case 'shirt':
        return Icons.dry_cleaning;
      case 'sweater':
        return Icons.checkroom;
      case 'pants':
      case 'trousers':
        return Icons.view_column;
      case 'towel':
      case 'towels':
        return Icons.layers;
      default:
        return Icons.play_circle_outline;
    }
  }
}
