import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/profile/device_profile.dart';
import '../../core/profile/profile_providers.dart';
import '../../core/protocol/protocol_providers.dart';
import '../../core/protocol/telemetry_packet.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_tokens.dart';
import '../../l10n/app_localizations.dart';

/// Curated push-button colors users can assign to each preset button.
const List<Color> kPresetButtonPalette = [
  AppColors.cyan,
  Color(0xFF3B82F6), // Cobalt Blue
  AppColors.purple,
  AppColors.emerald,
  AppColors.amber,
  AppColors.crimson,
  Color(0xFFEC4899), // Pink
  Color(0xFFE2E8F0), // Silver
];

/// Grid widget displaying tactile square cards with round push buttons and custom colors.
class PresetGridWidget extends ConsumerWidget {
  final AirWidgetConfig config;

  const PresetGridWidget({super.key, required this.config});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final columns = (config.props['columns'] as num?)?.toInt() ?? 2;
    final activeProfile = ref.watch(activeProfileProvider);
    final customNames = ref.watch(presetNamesProvider);
    final customColors = ref.watch(presetColorsProvider);
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
          Text(
            AppLocalizations.of(context)?.presetButtonsTitle ??
                config.title.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.of(context).cyan,
              letterSpacing: 0.8,
            ),
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
            childAspectRatio: 1.0,
          ),
          itemCount: presets.length,
          itemBuilder: (context, index) {
            final preset = presets[index];
            final isActive = isRunning && (activeSlot == preset.id);
            final customName = customNames[preset.id] ?? '';
            final customColorValue = customColors[preset.id];
            final buttonColor = customColorValue != null
                ? Color(customColorValue)
                : AppColors.of(context).cyan;

            return _PresetCard(
              preset: preset,
              customName: customName,
              buttonColor: buttonColor,
              isActive: isActive,
              isMachineBusy: isRunning && !isActive,
              progressPct: isActive ? progressPct : 0,
              currentStep: isActive ? currentStep : 0,
              totalSteps: isActive ? totalSteps : 0,
              onCustomize: () => _showCustomizePresetDialog(
                context,
                ref,
                preset,
                customName,
                customColorValue,
              ),
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

  Future<void> _showCustomizePresetDialog(
    BuildContext context,
    WidgetRef ref,
    AirPreset preset,
    String currentName,
    int? currentColorValue,
  ) async {
    final result = await showDialog<_PresetCustomizationResult>(
      context: context,
      builder: (dialogContext) => _CustomizePresetDialog(
        presetLabel: preset.label,
        initialName: currentName,
        initialColorValue: currentColorValue,
      ),
    );
    if (result != null) {
      await ref
          .read(presetNamesProvider.notifier)
          .renamePreset(preset.id, result.name);
      await ref
          .read(presetColorsProvider.notifier)
          .setPresetColor(preset.id, result.colorValue);
    }
  }
}

class _PresetCustomizationResult {
  final String name;
  final int? colorValue;

  const _PresetCustomizationResult({
    required this.name,
    required this.colorValue,
  });
}

class _CustomizePresetDialog extends StatefulWidget {
  final String presetLabel;
  final String initialName;
  final int? initialColorValue;

  const _CustomizePresetDialog({
    required this.presetLabel,
    required this.initialName,
    required this.initialColorValue,
  });

  @override
  State<_CustomizePresetDialog> createState() => _CustomizePresetDialogState();
}

class _CustomizePresetDialogState extends State<_CustomizePresetDialog> {
  late final TextEditingController _controller;
  int? _selectedColorValue;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialName);
    _selectedColorValue = widget.initialColorValue;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.of(context).surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTokens.radiusLg),
        side: BorderSide(color: AppColors.of(context).border),
      ),
      title: Text(
        AppLocalizations.of(context)?.customizePresetTitle(widget.presetLabel) ??
            'Customize ${widget.presetLabel}',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              autofocus: true,
              style: TextStyle(color: AppColors.of(context).textPrimary),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)?.subtitleNameLabel ?? 'Subtitle Name',
                hintText: AppLocalizations.of(context)?.subtitleNameHint ?? 'e.g. Quick Fold, Shirts, Custom...',
                hintStyle: TextStyle(color: AppColors.of(context).textMuted),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppTokens.space16),
            Text(
              AppLocalizations.of(context)?.buttonColorLabel ?? 'Button Color',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.of(context).textSecondary,
              ),
            ),
            const SizedBox(height: AppTokens.space8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final color in kPresetButtonPalette)
                  _ColorSwatchOption(
                    color: color,
                    selected: _selectedColorValue == color.toARGB32() ||
                        (_selectedColorValue == null &&
                            color.toARGB32() == AppColors.of(context).cyan.toARGB32()),
                    onTap: () {
                      setState(() {
                        _selectedColorValue = color.toARGB32();
                      });
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            AppLocalizations.of(context)?.cancelButton ?? 'CANCEL',
            style: TextStyle(color: AppColors.of(context).textSecondary),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.of(context).cyan,
            foregroundColor: AppColors.of(context).textOnAccent,
          ),
          onPressed: () => Navigator.of(context).pop(
            _PresetCustomizationResult(
              name: _controller.text,
              colorValue: _selectedColorValue,
            ),
          ),
          child: Text(AppLocalizations.of(context)?.saveButton ?? 'SAVE'),
        ),
      ],
    );
  }
}

class _ColorSwatchOption extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const _ColorSwatchOption({
    required this.color,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final checkColor =
        color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: selected
                ? AppColors.of(context).textPrimary
                : Colors.transparent,
            width: 2.5,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.55),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: selected
            ? Icon(Icons.check, size: 18, color: checkColor)
            : null,
      ),
    );
  }
}

class _PresetCard extends StatelessWidget {
  final AirPreset preset;
  final String customName;
  final Color buttonColor;
  final bool isActive;
  final bool isMachineBusy;
  final int progressPct;
  final int currentStep;
  final int totalSteps;
  final VoidCallback onCustomize;
  final VoidCallback onTap;

  const _PresetCard({
    required this.preset,
    required this.customName,
    required this.buttonColor,
    required this.isActive,
    required this.isMachineBusy,
    required this.progressPct,
    required this.currentStep,
    required this.totalSteps,
    required this.onCustomize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isActive
        ? buttonColor
        : (isMachineBusy
            ? AppColors.of(context).border.withValues(alpha: 0.3)
            : AppColors.of(context).border);

    final subtitle = customName.isNotEmpty ? customName : preset.description;
    final effectiveButtonColor = isMachineBusy
        ? buttonColor.withValues(alpha: 0.25)
        : buttonColor;
    final darkerShade =
        Color.lerp(effectiveButtonColor, Colors.black, 0.32) ??
            effectiveButtonColor;
    final numberColor = isMachineBusy
        ? AppColors.of(context).textMuted
        : (effectiveButtonColor.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white);

    return Material(
      color: isActive
          ? buttonColor.withValues(alpha: 0.12)
          : AppColors.of(context).surface,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: isMachineBusy ? null : onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(AppTokens.space12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: borderColor,
              width: isActive ? 2 : 1,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 28,
                    minHeight: 28,
                  ),
                  icon: Icon(
                    Icons.edit_outlined,
                    size: 16,
                    color: AppColors.of(context).textSecondary,
                  ),
                  tooltip: AppLocalizations.of(context)?.customizePresetTitle(preset.label) ??
                      'Customize ${preset.label}',
                  onPressed: onCustomize,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 6),
                  Expanded(
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 74,
                            maxHeight: 74,
                          ),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.of(context).surfaceHighlight,
                            border: Border.all(
                              color: isActive
                                  ? buttonColor
                                  : effectiveButtonColor.withValues(alpha: 0.45),
                              width: isActive ? 2.5 : 1.5,
                            ),
                            boxShadow: isActive
                                ? [
                                    BoxShadow(
                                      color: buttonColor.withValues(alpha: 0.45),
                                      blurRadius: 12,
                                      spreadRadius: 1,
                                    ),
                                  ]
                                : null,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                center: const Alignment(-0.25, -0.3),
                                radius: 0.9,
                                colors: [
                                  effectiveButtonColor,
                                  darkerShade,
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.4),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '${preset.id}',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900,
                                  color: numberColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (isActive) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: progressPct / 100.0,
                        backgroundColor: AppColors.of(context).surfaceHighlight,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(buttonColor),
                        minHeight: 4,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppLocalizations.of(context)?.stepProgressLabel(
                            currentStep,
                            totalSteps,
                            progressPct,
                          ) ??
                          'Step $currentStep/$totalSteps ($progressPct%)',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w600,
                        color: buttonColor,
                      ),
                    ),
                  ] else if (subtitle.isNotEmpty) ...[
                    Text(
                      subtitle,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        height: 1.15,
                        color: isMachineBusy
                            ? AppColors.of(context).textMuted
                            : AppColors.of(context).textPrimary,
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
}
