import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/ble/ble_providers.dart';
import '../../core/ble/ble_transport_interface.dart';
import '../../core/profile/device_profile.dart';
import '../../core/profile/profile_providers.dart';
import '../../core/protocol/protocol_providers.dart';
import '../../core/protocol/routine_models.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_tokens.dart';
import '../../l10n/app_localizations.dart';
import '../../visualizers/fabrica/fabrica_arrangement_provider.dart';
import '../../visualizers/fabrica/fabrica_flap_canvas.dart';
import '../../visualizers/fabrica/sequencer_programming_provider.dart';

enum _UnsavedSwitchAction { cancel, discard, saveAndSwitch }

/// Multi-step folding timeline editor, stateless RAM previewer,
/// and direct NVS flash button programming interface for Fabrica.
///
/// When [fillViewport] is true (used in [DynamicScreenScaffold]'s Sequencer tab),
/// renders a fixed split workspace:
/// - Pinned top: 1×4 button selector (+ template menu) and optional compact flap map
/// - Scrollable middle: folding steps list + Add Step button
/// - Pinned bottom: Preview on Robot and 1-tap Save to Button N
class TimelineSequencerWidget extends ConsumerStatefulWidget {
  final AirWidgetConfig config;
  final bool showEmbeddedFlapMap;
  final bool fillViewport;

  const TimelineSequencerWidget({
    super.key,
    required this.config,
    this.showEmbeddedFlapMap = false,
    this.fillViewport = false,
  });

  @override
  ConsumerState<TimelineSequencerWidget> createState() =>
      _TimelineSequencerWidgetState();
}

class _TimelineSequencerWidgetState
    extends ConsumerState<TimelineSequencerWidget> {
  final ScrollController _stepsScrollController = ScrollController();
  bool _isBusy = false;
  int _loadRequestId = 0;
  String? _statusMessage;
  Color _statusColor = AppColors.cyan;

  List<FoldStep> get _steps => ref.read(sequencerProgrammingProvider).steps;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final seqState = ref.read(sequencerProgrammingProvider);
      if (!seqState.isDirty) {
        _loadButtonRoutine(seqState.selectedButtonId, silent: true);
      }
    });
  }

  @override
  void dispose() {
    _stepsScrollController.dispose();
    super.dispose();
  }

  Map<int, int> _moduleNumbersForArrangement(
    FabricaArrangementState arrangement,
  ) {
    final map = <int, int>{};
    for (final panel in arrangement.motorizedPanels) {
      final ch = panel.motorChannel;
      if (ch != null) {
        map[ch] = arrangement.flapNumberForPanel(panel.id);
      }
    }
    return map;
  }

  String _formatStepChannel(
    BuildContext context,
    int channel,
    Map<int, int> moduleNumbers,
  ) {
    final l10n = AppLocalizations.of(context);
    final chLabel = l10n?.channelNumber(channel + 1) ?? 'Channel ${channel + 1}';
    final modNum = moduleNumbers[channel];
    if (modNum != null && modNum > 0) {
      final modLabel = l10n?.moduleNumber(modNum) ?? 'Module #$modNum';
      return '$modLabel • $chLabel';
    }
    return chLabel;
  }

  bool _hasAtLeastOneMotorizedModule(FabricaArrangementState arrangement) {
    final activeChannels = arrangement.motorizedPanels
        .map((p) => p.motorChannel)
        .whereType<int>()
        .toSet();
    if (activeChannels.isEmpty) return false;
    return _steps.any(
      (step) => step.motorIds.any((id) => activeChannels.contains(id)),
    );
  }

  void _setStatus(String message, {Color? color}) {
    setState(() {
      _statusMessage = message;
      _statusColor = color ?? AppColors.of(context).cyan;
    });
  }

  void _addStep() {
    final added = ref
        .read(sequencerProgrammingProvider.notifier)
        .addEmptyStep(maxSteps: FoldRoutine.maxSteps);
    if (added && widget.fillViewport) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_stepsScrollController.hasClients) return;
        _stepsScrollController.animateTo(
          _stepsScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
        );
      });
    }
  }

  void _removeStep(int index) {
    final removed =
        ref.read(sequencerProgrammingProvider.notifier).removeStep(index);
    if (!removed) {
      _setStatus(
        'Routine must contain at least 1 step',
        color: AppColors.of(context).amber,
      );
    }
  }

  List<FoldStep> _extractActiveSteps(FoldRoutine? routine) {
    if (routine == null) return const [];
    return routine.steps
        .take(routine.stepCount.clamp(0, routine.steps.length))
        .where((s) => s.motorCount > 0)
        .toList();
  }

  String _buttonDisplayName(
    int slot,
    Map<int, AirPreset> presetsById,
    Map<int, String> customNames,
    AppLocalizations? l10n,
  ) {
    final custom = (customNames[slot] ?? '').trim();
    if (custom.isNotEmpty) return custom;
    final desc = (presetsById[slot]?.description ?? '').trim();
    if (desc.isNotEmpty) return desc;
    return l10n?.buttonNumber(slot) ?? 'Button $slot';
  }

  Color _buttonColor(
    BuildContext context,
    int slot,
    Map<int, int> customColors,
  ) {
    final value = customColors[slot];
    return value != null ? Color(value) : AppColors.of(context).cyan;
  }

  Future<void> _loadButtonRoutine(
    int buttonId, {
    bool silent = false,
  }) async {
    final slot = buttonId.clamp(1, 4);
    final requestId = ++_loadRequestId;

    var liveRoutine = ref.read(savedButtonRoutinesProvider)[slot] ??
        ref.read(buttonConfigProvider).value?.routines[slot];

    if (liveRoutine == null) {
      final connState = ref.read(bleConnectionStateProvider).value ??
          ref.read(bleConnectionManagerProvider).currentState;
      if (connState == BleConnectionState.ready) {
        try {
          final bytes = await ref
              .read(bleTransportProvider)
              .readCharacteristic(BleUuids.charButtonConfig);
          if (bytes.length >= ButtonConfigTable.totalBytes) {
            liveRoutine = ButtonConfigTable.fromBytes(bytes).routines[slot];
          }
        } catch (_) {}
      }
    }

    if (!mounted || requestId != _loadRequestId) return;
    if (silent) {
      final current = ref.read(sequencerProgrammingProvider);
      if (current.selectedButtonId != slot || current.isDirty) {
        return;
      }
    }

    final activeSteps = _extractActiveSteps(liveRoutine);
    ref.read(sequencerProgrammingProvider.notifier).loadButtonSteps(
          slot,
          activeSteps.isNotEmpty
              ? activeSteps
              : SequencerProgrammingNotifier.defaultStepsForButton(slot),
        );

    if (!silent && mounted) {
      _setStatus('Loaded Button $slot routine');
    }
  }

  Future<void> _onSelectButton(int targetSlot) async {
    if (_isBusy) return;
    final seqState = ref.read(sequencerProgrammingProvider);
    if (targetSlot == seqState.selectedButtonId) return;

    if (!seqState.isDirty) {
      await _loadButtonRoutine(targetSlot);
      return;
    }

    final l10n = AppLocalizations.of(context);
    final presets = ref.read(activeProfileProvider).presets;
    final presetsById = {for (final p in presets) p.id: p};
    final customNames = ref.read(presetNamesProvider);
    final currentSlot = seqState.selectedButtonId;
    final currentName =
        _buttonDisplayName(currentSlot, presetsById, customNames, l10n);
    final currentTitle =
        currentName == (l10n?.buttonNumber(currentSlot) ?? 'Button $currentSlot')
            ? 'Button $currentSlot'
            : 'Button $currentSlot ($currentName)';

    final action = await showDialog<_UnsavedSwitchAction>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.of(context).surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusLg),
          side: BorderSide(color: AppColors.of(context).border),
        ),
        title: Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: AppColors.of(context).amber,
              size: 22,
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'Unsaved Changes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: Text(
          '$currentTitle has unsaved changes. Save before switching to Button $targetSlot?',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.of(context).textSecondary,
            height: 1.4,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.of(dialogContext).pop(_UnsavedSwitchAction.cancel),
            child: Text(
              l10n?.cancelButton ?? 'CANCEL',
              style: TextStyle(color: AppColors.of(context).textSecondary),
            ),
          ),
          TextButton(
            onPressed: () =>
                Navigator.of(dialogContext).pop(_UnsavedSwitchAction.discard),
            child: Text(
              'DISCARD',
              style: TextStyle(
                color: AppColors.of(context).crimson,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.of(context).cyan,
              foregroundColor: AppColors.of(context).textOnAccent,
            ),
            onPressed: () => Navigator.of(dialogContext)
                .pop(_UnsavedSwitchAction.saveAndSwitch),
            child: const Text('SAVE & SWITCH'),
          ),
        ],
      ),
    );

    if (!mounted || action == null || action == _UnsavedSwitchAction.cancel) {
      return;
    }

    if (action == _UnsavedSwitchAction.discard) {
      await _loadButtonRoutine(targetSlot);
      return;
    }

    final saved = await _saveSelectedButton();
    if (saved && mounted) {
      await _loadButtonRoutine(targetSlot);
    }
  }

  void _loadTemplate(String templateName) {
    final notifier = ref.read(sequencerProgrammingProvider.notifier);
    final selectedSlot =
        ref.read(sequencerProgrammingProvider).selectedButtonId;
    final l10n = AppLocalizations.of(context);
    final nextSteps = <FoldStep>[];
    String templateLabel = templateName;

    switch (templateName) {
      case 'adult_tshirt':
        nextSteps.addAll([
          FoldStep.single(0),
          FoldStep.single(1),
          FoldStep.single(2),
        ]);
        templateLabel = l10n?.adultTshirtTemplate ?? 'Adult T-Shirt Template';
        break;
      case 'long_sleeve':
        nextSteps.addAll([
          FoldStep.single(0),
          FoldStep.single(1),
          FoldStep.single(2),
          FoldStep.single(3),
        ]);
        templateLabel = l10n?.longSleeveTemplate ?? 'Long Sleeve Template';
        break;
      case 'dual_sweep':
        nextSteps.addAll([
          FoldStep.dual(0, 1),
          FoldStep.single(2),
        ]);
        templateLabel = l10n?.dualSweepTemplate ?? 'Dual Sweep Template';
        break;
      default:
        return;
    }

    notifier.loadTemplateSteps(nextSteps);
    _setStatus('Loaded $templateLabel into Button $selectedSlot');
  }

  bool _validateBeforeDispatch() {
    final seqState = ref.read(sequencerProgrammingProvider);
    final badIdx = seqState.firstInvalidStepIndex();
    if (badIdx != null) {
      ref.read(sequencerProgrammingProvider.notifier).selectStep(badIdx);
      _setStatus(
        'Step ${badIdx + 1} must have at least 1 motorized panel.',
        color: AppColors.of(context).amber,
      );
      return false;
    }
    final arrangement = ref.read(fabricaArrangementProvider);
    if (!_hasAtLeastOneMotorizedModule(arrangement)) {
      _setStatus(
        'Routine must include at least one Motorized module',
        color: AppColors.of(context).amber,
      );
      return false;
    }
    return true;
  }

  Future<void> _previewOnRobot() async {
    if (!_validateBeforeDispatch()) return;

    setState(() => _isBusy = true);
    _setStatus('Starting routine preview on robot...');

    try {
      final routine = FoldRoutine.fromSteps(_steps);
      final pipeline = ref.read(commandPipelineProvider);
      await pipeline.runRawSequence(routine);
      if (!mounted) return;
      _setStatus(
        'Preview running on robot...',
        color: AppColors.of(context).emerald,
      );
    } catch (e) {
      if (!mounted) return;
      _setStatus(
        'Preview dispatch error: $e',
        color: AppColors.of(context).crimson,
      );
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  Future<bool> _saveSelectedButton() async {
    if (!_validateBeforeDispatch()) return false;
    final slot = ref.read(sequencerProgrammingProvider).selectedButtonId;
    return _commitToFlash(slot);
  }

  Future<bool> _commitToFlash(int slot) async {
    setState(() => _isBusy = true);
    _setStatus('Saving routine to Button $slot...');

    try {
      final routine = FoldRoutine.fromSteps(_steps);
      final pipeline = ref.read(commandPipelineProvider);
      await pipeline.setButtonSequence(slot, routine);
      ref.read(savedButtonRoutinesProvider.notifier).setRoutine(slot, routine);
      ref.read(sequencerProgrammingProvider.notifier).markCurrentAsSaved();
      if (!mounted) return true;
      _setStatus(
        'Saved successfully to Button $slot',
        color: AppColors.of(context).emerald,
      );
      return true;
    } catch (e) {
      if (!mounted) return false;
      _setStatus(
        'Failed to save to robot: $e',
        color: AppColors.of(context).crimson,
      );
      return false;
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  Widget _buildHeaderRow(
    BuildContext context,
    AppLocalizations? l10n,
    SequencerProgrammingState seqState,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(Icons.tune, color: AppColors.of(context).cyan, size: 18),
              const SizedBox(width: AppTokens.space8),
              Flexible(
                child: Text(
                  l10n?.foldingTimeline ??
                      (widget.config.title.isNotEmpty
                          ? widget.config.title.toUpperCase()
                          : 'TIMELINE SEQUENCER'),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.of(context).cyan,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              if (seqState.isDirty) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.of(context).amber.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: AppColors.of(context).amber.withValues(alpha: 0.6),
                    ),
                  ),
                  child: Text(
                    'UNSAVED',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: AppColors.of(context).amber,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        PopupMenuButton<String>(
          tooltip: l10n?.loadTemplate ?? 'Load Template',
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          icon: const Icon(Icons.more_vert, size: 20),
          onSelected: _loadTemplate,
          itemBuilder: (context) {
            final menuL10n = AppLocalizations.of(context);
            return [
              PopupMenuItem(
                value: 'adult_tshirt',
                child: Text(
                  menuL10n?.adultTshirtTemplate ?? 'Adult T-Shirt Template',
                ),
              ),
              PopupMenuItem(
                value: 'long_sleeve',
                child: Text(
                  menuL10n?.longSleeveTemplate ?? 'Long Sleeve Template',
                ),
              ),
              PopupMenuItem(
                value: 'dual_sweep',
                child: Text(
                  menuL10n?.dualSweepTemplate ?? 'Dual Sweep Template',
                ),
              ),
            ];
          },
        ),
      ],
    );
  }

  Widget _buildButtonSelectorBar(
    BuildContext context,
    Map<int, AirPreset> presetsById,
    Map<int, String> customNames,
    Map<int, int> customColors,
    AppLocalizations? l10n,
    SequencerProgrammingState seqState,
  ) {
    final selectedSlot = seqState.selectedButtonId;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int slot = 1; slot <= 4; slot++) ...[
            if (slot > 1) const SizedBox(width: 6),
            Expanded(
              child: _SequencerButtonTile(
                key: Key('sequencer_button_$slot'),
                slot: slot,
                name: _buttonDisplayName(slot, presetsById, customNames, l10n),
                buttonColor: _buttonColor(context, slot, customColors),
                isSelected: selectedSlot == slot,
                isDirty: selectedSlot == slot && seqState.isDirty,
                enabled: !_isBusy,
                onTap: () => _onSelectButton(slot),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStepTile(
    BuildContext context,
    int index,
    List<List<int>> draftSteps,
    SequencerProgrammingState seqState,
    SequencerProgrammingNotifier seqNotifier,
    Map<int, int> moduleNumbers,
    AppLocalizations? l10n,
  ) {
    final channels = draftSteps[index];
    final isDual = channels.length > 1;
    final isEmpty = channels.isEmpty;
    final isSelected = seqState.selectedStepIndex == index;
    final flap1 = channels.isNotEmpty
        ? _formatStepChannel(context, channels[0], moduleNumbers)
        : '';
    final flap2 =
        isDual ? _formatStepChannel(context, channels[1], moduleNumbers) : '';

    return Material(
      color: isSelected
          ? (isEmpty
                  ? AppColors.of(context).amber
                  : AppColors.of(context).cyan)
              .withValues(alpha: 0.08)
          : AppColors.of(context).surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isSelected
              ? (isEmpty
                  ? AppColors.of(context).amber
                  : AppColors.of(context).cyan)
              : AppColors.of(context).border.withValues(alpha: 0.6),
          width: isSelected ? 1.5 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        dense: true,
        visualDensity: const VisualDensity(vertical: -2),
        selected: isSelected,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        onTap: () => seqNotifier.selectStep(index),
        leading: Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: isSelected
                ? (isEmpty
                        ? AppColors.of(context).amber
                        : AppColors.of(context).cyan)
                    .withValues(alpha: 0.25)
                : AppColors.of(context).surfaceHighlight,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: isSelected
                  ? (isEmpty
                      ? AppColors.of(context).amber
                      : AppColors.of(context).cyan)
                  : AppColors.of(context).border,
            ),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isEmpty
                    ? AppColors.of(context).amber
                    : AppColors.of(context).cyan,
              ),
            ),
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: isDual
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          flap1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.of(context).textPrimary,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          flap2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.of(context).textPrimary,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      isEmpty
                          ? (l10n?.tapPanelsHint ??
                              'Tap 1–2 motor panels on grid')
                          : flap1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: isEmpty
                            ? AppColors.of(context).amber
                            : AppColors.of(context).textPrimary,
                      ),
                    ),
            ),
            if (isDual) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 1,
                ),
                decoration: BoxDecoration(
                  color: AppColors.of(context).purple.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  l10n?.dualBadge ?? 'DUAL',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: AppColors.of(context).purple,
                  ),
                ),
              ),
            ],
          ],
        ),
        subtitle: Text(
          isEmpty
              ? (l10n?.requiresMotorizedPanel ??
                  'Requires at least 1 motorized panel (max 2)')
              : (isSelected
                  ? (l10n?.selectedChangePanelsHint ??
                      'Selected • Tap grid panels to change (max 2)')
                  : (l10n?.stepOfTotal(
                            index + 1,
                            draftSteps.length,
                          ) ??
                      'Step ${index + 1} of ${draftSteps.length}')),
          style: TextStyle(
            fontSize: 10,
            color: isEmpty
                ? AppColors.of(context).amber
                : (isSelected
                    ? AppColors.of(context).cyan
                    : AppColors.of(context).textMuted),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.close, size: 18),
          tooltip: l10n?.removeStepTooltip ?? 'Remove Step',
          onPressed: () => _removeStep(index),
        ),
      ),
    );
  }

  Widget _buildNoMotorizedWarning(
    BuildContext context,
    AppLocalizations? l10n,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppTokens.space8),
      decoration: BoxDecoration(
        color: AppColors.of(context).amber.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColors.of(context).amber.withValues(alpha: 0.5),
        ),
      ),
      child: Text(
        l10n?.requiresMotorizedModuleWarning ??
            'Routine requires at least one Motorized module from Fabrica Arrangement.',
        style: TextStyle(
          fontSize: 11,
          color: AppColors.of(context).amber,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildAddStepButton(
    BuildContext context,
    List<List<int>> draftSteps,
    Map<int, int> moduleNumbers,
    AppLocalizations? l10n,
  ) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.of(context).cyan,
        backgroundColor: AppColors.of(context).cyan.withValues(alpha: 0.08),
        side: BorderSide(color: AppColors.of(context).cyan, width: 1.5),
        minimumSize: const Size(double.infinity, 46),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: const Icon(Icons.add_circle_outline, size: 20),
      label: Text(
        draftSteps.length >= FoldRoutine.maxSteps
            ? (l10n?.routineFull ?? 'ROUTINE FULL (16/16 STEPS)')
            : (l10n?.addStepCount(draftSteps.length) ??
                'ADD STEP (${draftSteps.length}/16)'),
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.6,
        ),
      ),
      onPressed:
          draftSteps.length >= FoldRoutine.maxSteps || moduleNumbers.isEmpty
              ? null
              : _addStep,
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    int selectedSlot,
    Color selectedButtonColor,
    Color saveTextColor,
    AppLocalizations? l10n,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.of(context).surfaceHighlight,
              foregroundColor: AppColors.of(context).cyan,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 11,
              ),
            ),
            icon: const Icon(Icons.play_arrow, size: 18),
            label: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                l10n?.previewOnRobot ?? 'PREVIEW ON ROBOT',
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
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
              backgroundColor: selectedButtonColor,
              foregroundColor: saveTextColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 11,
              ),
            ),
            icon: const Icon(Icons.save, size: 18),
            label: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${l10n?.saveToButton ?? 'SAVE TO BUTTON'} $selectedSlot',
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: _isBusy ? null : _saveSelectedButton,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(buttonConfigProvider);
    ref.listen<AsyncValue<ButtonConfigTable>>(buttonConfigProvider,
        (prev, next) {
      next.whenData((table) {
        final current = ref.read(sequencerProgrammingProvider);
        if (current.isDirty) return;
        if (ref
            .read(savedButtonRoutinesProvider)
            .containsKey(current.selectedButtonId)) {
          return;
        }
        final activeSteps =
            _extractActiveSteps(table.routines[current.selectedButtonId]);
        if (activeSteps.isNotEmpty) {
          ref
              .read(sequencerProgrammingProvider.notifier)
              .loadButtonSteps(current.selectedButtonId, activeSteps);
        }
      });
    });

    final l10n = AppLocalizations.of(context);
    final activeProfile = ref.watch(activeProfileProvider);
    final customNames = ref.watch(presetNamesProvider);
    final customColors = ref.watch(presetColorsProvider);
    final arrangement = ref.watch(fabricaArrangementProvider);
    final seqState = ref.watch(sequencerProgrammingProvider);
    final seqNotifier = ref.read(sequencerProgrammingProvider.notifier);

    final presetsById = {for (final p in activeProfile.presets) p.id: p};
    final selectedSlot = seqState.selectedButtonId;
    final selectedButtonColor = _buttonColor(context, selectedSlot, customColors);
    final saveTextColor = selectedButtonColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;

    final draftSteps = seqState.draftSteps;
    final moduleNumbers = _moduleNumbersForArrangement(arrangement);
    final hasMotorized = _hasAtLeastOneMotorizedModule(arrangement);

    if (widget.fillViewport) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final mapMaxHeight =
              (constraints.maxHeight * 0.28).clamp(124.0, 188.0).toDouble();
          return Column(
            children: [
              // Pinned top section: Button selector + template menu + compact Flap Map
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderRow(context, l10n, seqState),
                    const SizedBox(height: 6),
                    _buildButtonSelectorBar(
                      context,
                      presetsById,
                      customNames,
                      customColors,
                      l10n,
                      seqState,
                    ),
                    if (_statusMessage != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        _statusMessage!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'monospace',
                          color: _statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    if (widget.showEmbeddedFlapMap) ...[
                      const SizedBox(height: 8),
                      FabricaCompactFlapMap(maxGridHeight: mapMaxHeight),
                    ],
                  ],
                ),
              ),
              Divider(height: 1, color: AppColors.of(context).border),

              // Scrollable middle section: Steps list + Add Step button
              Expanded(
                child: ListView(
                  key: const Key('sequencer_steps_scroll_view'),
                  controller: _stepsScrollController,
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                  children: [
                    for (int i = 0; i < draftSteps.length; i++) ...[
                      if (i > 0) const SizedBox(height: 6),
                      _buildStepTile(
                        context,
                        i,
                        draftSteps,
                        seqState,
                        seqNotifier,
                        moduleNumbers,
                        l10n,
                      ),
                    ],
                    if (!hasMotorized) ...[
                      const SizedBox(height: AppTokens.space8),
                      _buildNoMotorizedWarning(context, l10n),
                    ],
                    const SizedBox(height: AppTokens.space12),
                    _buildAddStepButton(context, draftSteps, moduleNumbers, l10n),
                  ],
                ),
              ),

              // Pinned bottom bar: Preview & Save to Button N
              Container(
                key: const Key('sequencer_pinned_action_bar'),
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
                decoration: BoxDecoration(
                  color: AppColors.of(context).surface,
                  border: Border(
                    top: BorderSide(color: AppColors.of(context).border),
                  ),
                ),
                child: _buildActionButtons(
                  context,
                  selectedSlot,
                  selectedButtonColor,
                  saveTextColor,
                  l10n,
                ),
              ),
            ],
          );
        },
      );
    }

    // Standalone card layout (used when embedded inside an outer scrollable container)
    return Card(
      child: Padding(
        padding: AppTokens.paddingCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderRow(context, l10n, seqState),
            const SizedBox(height: AppTokens.space8),
            _buildButtonSelectorBar(
              context,
              presetsById,
              customNames,
              customColors,
              l10n,
              seqState,
            ),
            if (_statusMessage != null) ...[
              const SizedBox(height: 8),
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
            if (widget.showEmbeddedFlapMap) ...[
              const SizedBox(height: AppTokens.space8),
              const FabricaCompactFlapMap(),
            ],
            const SizedBox(height: AppTokens.space12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: draftSteps.length,
              separatorBuilder: (context, index) => const SizedBox(height: 6),
              itemBuilder: (context, index) => _buildStepTile(
                context,
                index,
                draftSteps,
                seqState,
                seqNotifier,
                moduleNumbers,
                l10n,
              ),
            ),
            if (!hasMotorized) ...[
              const SizedBox(height: AppTokens.space8),
              _buildNoMotorizedWarning(context, l10n),
            ],
            const SizedBox(height: AppTokens.space12),
            _buildAddStepButton(context, draftSteps, moduleNumbers, l10n),
            const SizedBox(height: AppTokens.space12),
            _buildActionButtons(
              context,
              selectedSlot,
              selectedButtonColor,
              saveTextColor,
              l10n,
            ),
          ],
        ),
      ),
    );
  }
}

class _SequencerButtonTile extends StatelessWidget {
  final int slot;
  final String name;
  final Color buttonColor;
  final bool isSelected;
  final bool isDirty;
  final bool enabled;
  final VoidCallback onTap;

  const _SequencerButtonTile({
    super.key,
    required this.slot,
    required this.name,
    required this.buttonColor,
    required this.isSelected,
    required this.isDirty,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final darkerShade =
        Color.lerp(buttonColor, Colors.black, 0.32) ?? buttonColor;
    final numberColor =
        buttonColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    final borderColor =
        isSelected ? buttonColor : AppColors.of(context).border;

    return Semantics(
      button: true,
      selected: isSelected,
      label: 'Button $slot, $name',
      child: Material(
        color: isSelected
            ? buttonColor.withValues(alpha: 0.14)
            : AppColors.of(context).surface,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: enabled ? onTap : null,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: borderColor,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (isDirty)
                  Positioned(
                    top: 0,
                    right: 2,
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.of(context).amber,
                      ),
                    ),
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.of(context).surfaceHighlight,
                        border: Border.all(
                          color: isSelected
                              ? buttonColor
                              : buttonColor.withValues(alpha: 0.45),
                          width: isSelected ? 2 : 1.2,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: buttonColor.withValues(alpha: 0.45),
                                  blurRadius: 8,
                                  spreadRadius: 0.5,
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
                              buttonColor,
                              darkerShade,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.35),
                              blurRadius: 3,
                              offset: const Offset(0, 1.5),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '$slot',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: numberColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.5,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w600,
                        height: 1.15,
                        color: isSelected
                            ? AppColors.of(context).textPrimary
                            : AppColors.of(context).textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
