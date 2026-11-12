import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/profile/device_profile.dart';
import '../../core/protocol/protocol_providers.dart';
import '../../core/protocol/routine_models.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_tokens.dart';

/// Multi-step folding timeline editor, stateless RAM previewer,
/// and NVS flash button programming interface for Fabrica.
class TimelineSequencerWidget extends ConsumerStatefulWidget {
  final AirWidgetConfig config;

  const TimelineSequencerWidget({super.key, required this.config});

  @override
  ConsumerState<TimelineSequencerWidget> createState() =>
      _TimelineSequencerWidgetState();
}

class _TimelineSequencerWidgetState
    extends ConsumerState<TimelineSequencerWidget> {
  final List<FoldStep> _steps = [
    FoldStep.single(0), // Step 1: Left Flap
    FoldStep.single(1), // Step 2: Right Flap
    FoldStep.single(2), // Step 3: Bottom Flap
  ];

  bool _isBusy = false;
  String? _statusMessage;
  Color _statusColor = AppColors.cyan;

  static const Map<int, String> _channelNames = {
    0: 'Left Flap (Ch 0)',
    1: 'Right Flap (Ch 1)',
    2: 'Bottom Flap (Ch 2)',
    3: 'Top Flap (Ch 3)',
  };

  void _setStatus(String message, {Color color = AppColors.cyan}) {
    setState(() {
      _statusMessage = message;
      _statusColor = color;
    });
  }

  void _addStep(int motor1, [int? motor2]) {
    if (_steps.length >= FoldRoutine.maxSteps) {
      _setStatus('Maximum 16 steps allowed by firmware', color: AppColors.amber);
      return;
    }
    setState(() {
      if (motor2 != null && motor2 != motor1) {
        _steps.add(FoldStep.dual(motor1, motor2));
      } else {
        _steps.add(FoldStep.single(motor1));
      }
    });
  }

  void _removeStep(int index) {
    if (_steps.length <= 1) {
      _setStatus('Routine must contain at least 1 step', color: AppColors.amber);
      return;
    }
    setState(() {
      _steps.removeAt(index);
    });
  }

  void _loadTemplate(String templateName) {
    setState(() {
      _steps.clear();
      switch (templateName) {
        case 'adult_tshirt':
          _steps.addAll([
            FoldStep.single(0),
            FoldStep.single(1),
            FoldStep.single(2),
          ]);
          break;
        case 'long_sleeve':
          _steps.addAll([
            FoldStep.single(0),
            FoldStep.single(1),
            FoldStep.single(2),
            FoldStep.single(3),
          ]);
          break;
        case 'dual_sweep':
          _steps.addAll([
            FoldStep.dual(0, 1),
            FoldStep.single(2),
          ]);
          break;
      }
    });
    _setStatus('Loaded template: $templateName');
  }

  Future<void> _previewOnRobot() async {
    setState(() => _isBusy = true);
    _setStatus('Dispatching stateless preview (0x01)...');

    try {
      final routine = FoldRoutine.fromSteps(_steps);
      final pipeline = ref.read(commandPipelineProvider);
      await pipeline.runRawSequence(routine);
      _setStatus(
        'Preview running in RAM (CRC: 0x${routine.checksum.toRadixString(16).toUpperCase()})',
        color: AppColors.emerald,
      );
    } catch (e) {
      _setStatus('Preview dispatch error: $e', color: AppColors.crimson);
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  Future<void> _showSavePresetDialog() async {
    int selectedSlot = 1;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: AppColors.surface,
              title: const Text('Program Hardware Preset Button'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select physical button slot in ESP32 NVS flash to program with current sequence:',
                    style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: AppTokens.space12),
                  ...List.generate(4, (index) {
                    final slot = index + 1;
                    final isSelected = selectedSlot == slot;
                    return ListTile(
                      dense: true,
                      leading: Icon(
                        isSelected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: isSelected
                            ? AppColors.cyan
                            : AppColors.textSecondary,
                      ),
                      title: Text('Button $slot'),
                      subtitle: Text('Slot $slot (Opcode 0x0A $slot)'),
                      onTap: () {
                        setDialogState(() => selectedSlot = slot);
                      },
                    );
                  }),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('CANCEL'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.cyan,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('COMMIT TO FLASH'),
                ),
              ],
            );
          },
        );
      },
    );

    if (confirmed == true) {
      await _commitToFlash(selectedSlot);
    }
  }

  Future<void> _commitToFlash(int slot) async {
    setState(() => _isBusy = true);
    _setStatus('Flashing Button $slot in NVS...');

    try {
      final routine = FoldRoutine.fromSteps(_steps);
      final pipeline = ref.read(commandPipelineProvider);
      await pipeline.setButtonSequence(slot, routine);
      _setStatus(
        'OK: Programmed Button $slot (CRC32: 0x${routine.checksum.toRadixString(16).toUpperCase()})',
        color: AppColors.emerald,
      );
    } catch (e) {
      _setStatus('Flash commit error: $e', color: AppColors.crimson);
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  Future<void> _restoreFactoryPresets() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          title: const Text('Restore Factory Presets?'),
          content: const Text(
            'This will reset all 4 physical button routines in NVS flash back to factory defaults.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('CANCEL'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.crimson,
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('RESTORE DEFAULTS'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      setState(() => _isBusy = true);
      _setStatus('Restoring factory presets (0x0C)...');
      try {
        final pipeline = ref.read(commandPipelineProvider);
        await pipeline.restoreFactoryPresets();
        _setStatus('OK: Factory presets restored successfully',
            color: AppColors.emerald);
      } catch (e) {
        _setStatus('Restore error: $e', color: AppColors.crimson);
      } finally {
        if (mounted) setState(() => _isBusy = false);
      }
    }
  }

  Future<void> _syncFromRobot() async {
    setState(() => _isBusy = true);
    _setStatus('Requesting sequence sync (0x0B)...');
    try {
      final pipeline = ref.read(commandPipelineProvider);
      await pipeline.getButtonConfig();
      _setStatus('Sync requested: FAB3 212-byte table emitted',
          color: AppColors.emerald);
    } catch (e) {
      _setStatus('Sync error: $e', color: AppColors.crimson);
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  void _showAddStepDialog() {
    int flap1 = 0;
    int? flap2;
    bool isDual = false;

    showDialog<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: AppColors.surface,
              title: const Text('Add Motion Step'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<int>(
                    initialValue: flap1,
                    decoration: const InputDecoration(labelText: 'Primary Flap'),
                    items: _channelNames.entries.map((e) {
                      return DropdownMenuItem(
                        value: e.key,
                        child: Text(e.value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setDialogState(() => flap1 = val ?? 0);
                    },
                  ),
                  const SizedBox(height: AppTokens.space8),
                  CheckboxListTile(
                    title: const Text('Simultaneous Dual Motion'),
                    value: isDual,
                    activeColor: AppColors.cyan,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (val) {
                      setDialogState(() {
                        isDual = val ?? false;
                        if (isDual && flap2 == null) {
                          flap2 = (flap1 + 1) % 4;
                        }
                      });
                    },
                  ),
                  if (isDual)
                    DropdownButtonFormField<int>(
                      initialValue: flap2 ?? 1,
                      decoration:
                          const InputDecoration(labelText: 'Secondary Flap'),
                      items: _channelNames.entries.map((e) {
                        return DropdownMenuItem(
                          value: e.key,
                          child: Text(e.value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setDialogState(() => flap2 = val ?? 1);
                      },
                    ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('CANCEL'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.cyan,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    _addStep(flap1, isDual ? flap2 : null);
                    Navigator.of(context).pop();
                  },
                  child: const Text('ADD'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppTokens.paddingCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header & Template Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.tune, color: AppColors.cyan, size: 20),
                    const SizedBox(width: AppTokens.space8),
                    Text(
                      widget.config.title.isNotEmpty
                          ? widget.config.title.toUpperCase()
                          : 'TIMELINE SEQUENCER',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cyan,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  tooltip: 'Load Template',
                  icon: const Icon(Icons.more_vert, size: 20),
                  onSelected: _loadTemplate,
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'adult_tshirt',
                      child: Text('Adult T-Shirt Template'),
                    ),
                    const PopupMenuItem(
                      value: 'long_sleeve',
                      child: Text('Long Sleeve Template'),
                    ),
                    const PopupMenuItem(
                      value: 'dual_sweep',
                      child: Text('Dual Sweep Template'),
                    ),
                  ],
                ),
              ],
            ),

            if (_statusMessage != null) ...[
              const SizedBox(height: 6),
              Text(
                _statusMessage!,
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'monospace',
                  color: _statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],

            const SizedBox(height: AppTokens.space12),

            // Step List Display
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _steps.length,
              separatorBuilder: (context, index) => const Divider(height: 8),
              itemBuilder: (context, index) {
                final step = _steps[index];
                final isDual = step.motorCount > 1;
                final flap1 = _channelNames[step.motorIds[0]] ?? 'Ch ${step.motorIds[0]}';
                final flap2 = isDual
                    ? (_channelNames[step.motorIds[1]] ?? 'Ch ${step.motorIds[1]}')
                    : '';

                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceHighlight,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppColors.cyan,
                        ),
                      ),
                    ),
                  ),
                  title: Row(
                    children: [
                      Flexible(
                        child: Text(
                          isDual ? '$flap1 + $flap2' : flap1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (isDual) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 1),
                          decoration: BoxDecoration(
                            color: AppColors.purple.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const Text(
                            'DUAL',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: AppColors.purple,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  subtitle: Text(
                    'Step ${index + 1} of ${_steps.length}',
                    style: const TextStyle(fontSize: 10, color: AppColors.textMuted),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.close, size: 18),
                    tooltip: 'Remove Step',
                    onPressed: () => _removeStep(index),
                  ),
                );
              },
            ),

            const SizedBox(height: AppTokens.space8),

            // Add Step Button
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.cyan,
                side: const BorderSide(color: AppColors.border),
                minimumSize: const Size(double.infinity, 38),
              ),
              icon: const Icon(Icons.add, size: 18),
              label: Text(
                _steps.length >= FoldRoutine.maxSteps
                    ? 'ROUTINE FULL (16/16 STEPS)'
                    : 'ADD MOTION STEP (${_steps.length}/16)',
                style: const TextStyle(fontSize: 12),
              ),
              onPressed: _steps.length >= FoldRoutine.maxSteps
                  ? null
                  : _showAddStepDialog,
            ),

            const SizedBox(height: AppTokens.space12),

            // Operation Action Buttons
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.surfaceHighlight,
                      foregroundColor: AppColors.cyan,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    icon: const Icon(Icons.play_arrow, size: 18),
                    label: const Text(
                      'PREVIEW ON ROBOT',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _isBusy ? null : _previewOnRobot,
                  ),
                ),
                const SizedBox(width: AppTokens.space8),
                Expanded(
                  flex: 3,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.cyan,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    icon: const Icon(Icons.save, size: 18),
                    label: const Text(
                      'SAVE TO BUTTON',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _isBusy ? null : _showSavePresetDialog,
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppTokens.space8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.cyan,
                  ),
                  icon: const Icon(Icons.sync, size: 16),
                  label: const Text(
                    'SYNC FROM ROBOT (0x0B)',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  onPressed: _isBusy ? null : _syncFromRobot,
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                  ),
                  icon: const Icon(Icons.restore, size: 16),
                  label: const Text(
                    'RESTORE FACTORY PRESETS',
                    style: TextStyle(fontSize: 10),
                  ),
                  onPressed: _isBusy ? null : _restoreFactoryPresets,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
