import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/profile/device_profile.dart';
import '../../core/protocol/protocol_providers.dart';
import '../../core/protocol/telemetry_packet.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_tokens.dart';
import '../../l10n/app_localizations.dart';
import 'fabrica_arrangement_provider.dart';
import 'sequencer_programming_provider.dart';

/// Interactive modular grid for arranging Fabrica flap panels.
///
/// Defaults to 4 rows x 3 columns (12 panels) numbered from the top of the grid.
/// When [isEditable] is false (Sequencer screen), the grid is read-only and
/// tapping Motorized panels directly programs steps into the Routine Builder.
/// Tapping `EDIT ARRANGEMENT` opens [FabricaArrangementEditorScreen] where
/// panels, columns, and rows can be added, dragged, or removed.
class FabricaFlapVisualizerWidget extends ConsumerStatefulWidget {
  final AirWidgetConfig config;
  final bool isEditable;

  const FabricaFlapVisualizerWidget({
    super.key,
    required this.config,
    this.isEditable = false,
  });

  @override
  ConsumerState<FabricaFlapVisualizerWidget> createState() =>
      _FabricaFlapVisualizerWidgetState();
}

class _FabricaFlapVisualizerWidgetState
    extends ConsumerState<FabricaFlapVisualizerWidget> {
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    final arrangement = ref.watch(fabricaArrangementProvider);
    final notifier = ref.read(fabricaArrangementProvider.notifier);
    final seqState = ref.watch(sequencerProgrammingProvider);
    final seqNotifier = ref.read(sequencerProgrammingProvider.notifier);
    final telemetryAsync = ref.watch(latestTelemetryProvider);
    final packet =
        telemetryAsync.value ?? ref.read(telemetryBusProvider).latestPacket;

    final title = AppLocalizations.of(context)?.fabricaArrangementTitle ??
        (widget.config.title.isNotEmpty
            ? widget.config.title.toUpperCase()
            : 'FABRICA ARRANGEMENT');

    final selectedPanel = widget.isEditable ? arrangement.selectedPanel : null;

    return Card(
      elevation: 3,
      child: Padding(
        padding: AppTokens.paddingCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row: Title and Big Add Panel Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.grid_view_rounded,
                          color: AppColors.of(context).cyan, size: 22),
                      const SizedBox(width: AppTokens.space8),
                      Flexible(
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.of(context).cyan,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.isEditable)
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.of(context).cyan.withValues(alpha: 0.16),
                      foregroundColor: AppColors.of(context).cyan,
                      side: BorderSide(color: AppColors.of(context).cyan),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.add, size: 18),
                    label: Text(
                      AppLocalizations.of(context)?.addPanel ?? 'ADD PANEL',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: arrangement.canAddPanel
                        ? () => _showAddPanelDialog(context, ref, arrangement)
                        : null,
                  )
                else
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.of(context).cyan,
                      side: BorderSide(color: AppColors.of(context).cyan),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.edit_outlined, size: 16),
                    label: Text(
                      AppLocalizations.of(context)?.editArrangement ??
                          'EDIT ARRANGEMENT',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => FabricaArrangementEditorScreen(
                            config: widget.config,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),

            const SizedBox(height: AppTokens.space8),

            // Legend
            Wrap(
              spacing: 12,
              runSpacing: 6,
              children: [
                _LegendChip(
                  label: AppLocalizations.of(context)?.legendMotorized ?? 'Motorized',
                  color: AppColors.of(context).cyan,
                ),
                _LegendChip(
                  label: AppLocalizations.of(context)?.legendFollower ?? 'Follower',
                  color: AppColors.of(context).purple,
                ),
                _LegendChip(
                  label: AppLocalizations.of(context)?.legendBase ?? 'Base',
                  color: AppColors.of(context).textMuted,
                ),
              ],
            ),

            const SizedBox(height: AppTokens.space8),

            if (widget.isEditable) ...[
              // Side-by-Side Columns & Rows Controls in One Line (6x6 max)
              Row(
                children: [
                  Expanded(
                    child: _GridDimensionControl(
                      label: AppLocalizations.of(context)?.colsLabel ?? 'Cols',
                      value: arrangement.gridColumns,
                      max: FabricaArrangementState.maxGridColumns,
                      decrementTooltip: 'Remove Column',
                      incrementTooltip: 'Add Column (Max 6)',
                      onDecrement: arrangement.gridColumns > 1
                          ? () => _confirmRemoveColumn(context, ref, arrangement)
                          : null,
                      onIncrement: arrangement.gridColumns <
                              FabricaArrangementState.maxGridColumns
                          ? () => notifier.addColumn()
                          : null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _GridDimensionControl(
                      label: AppLocalizations.of(context)?.rowsLabel ?? 'Rows',
                      value: arrangement.gridRows,
                      max: FabricaArrangementState.maxGridRows,
                      decrementTooltip: 'Remove Row',
                      incrementTooltip: 'Add Row (Max 6)',
                      onDecrement: arrangement.gridRows > 1
                          ? () => _confirmRemoveRow(context, ref, arrangement)
                          : null,
                      onIncrement: arrangement.gridRows <
                              FabricaArrangementState.maxGridRows
                          ? () => notifier.addRow()
                          : null,
                    ),
                  ),
                ],
              ),
            ] else ...[
              Text(
                AppLocalizations.of(context)
                        ?.stepSelectedHint(seqState.selectedStepIndex + 1) ??
                    'Step ${seqState.selectedStepIndex + 1} selected: Tap 1–2 Motorized panels on the grid',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.of(context).textSecondary,
                ),
              ),
            ],

            const SizedBox(height: AppTokens.space12),

            // Interactive Modular Grid (3x4 default, explicit row/col positions)
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = arrangement.gridColumns;
                final rows = arrangement.gridRows;
                const gap = 6.0;
                final showDropColumn = widget.isEditable &&
                    _isDragging &&
                    columns < FabricaArrangementState.maxGridColumns;
                final dropZoneWidth = showDropColumn ? 44.0 : 0.0;
                final gridWidth = constraints.maxWidth -
                    (showDropColumn ? dropZoneWidth + gap : 0.0);
                final cellWidth = (gridWidth + gap) / columns;
                const cellHeight = 62.0;
                final gridHeight =
                    math.max(cellHeight - gap, rows * cellHeight - gap);

                final showDropRow = widget.isEditable &&
                    _isDragging &&
                    rows < FabricaArrangementState.maxGridRows;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: gridWidth,
                      height: gridHeight,
                      child: Stack(
                        children: [
                          // Empty cell drop targets in edit mode only
                          if (widget.isEditable)
                            for (int r = 0; r < rows; r++)
                              for (int c = 0; c < columns; c++)
                                Positioned(
                                  left: c * cellWidth,
                                  top: r * cellHeight,
                                  width: cellWidth - gap,
                                  height: cellHeight - gap,
                                  child: DragTarget<int>(
                                    onWillAcceptWithDetails: (_) => true,
                                    onAcceptWithDetails: (details) {
                                      notifier.movePanelToCell(
                                          details.data, r, c);
                                      setState(() => _isDragging = false);
                                    },
                                    builder: (context, candidateData, _) {
                                      final hovered = candidateData.isNotEmpty;
                                      return InkWell(
                                        onTap: arrangement.canAddPanel
                                            ? () => _showAddPanelDialog(
                                                  context,
                                                  ref,
                                                  arrangement,
                                                  row: r,
                                                  col: c,
                                                )
                                            : null,
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: hovered
                                                ? AppColors.of(context).cyan
                                                    .withValues(alpha: 0.14)
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: hovered
                                                  ? AppColors.of(context).cyan
                                                  : AppColors.of(context).border
                                                      .withValues(alpha: 0.25),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                          // Placed panels at explicit (row, col) positions
                          for (final panel in arrangement.panels)
                            Positioned(
                              left: panel.col * cellWidth,
                              top: panel.row * cellHeight,
                              width: panel.colSpan * cellWidth - gap,
                              height: panel.rowSpan * cellHeight - gap,
                              child: () {
                                final isMotor =
                                    panel.type == FabricaPanelType.motorized &&
                                        panel.motorChannel != null;
                                final stepNums = (!widget.isEditable && isMotor)
                                    ? seqState.stepNumbersForChannel(
                                        panel.motorChannel!)
                                    : const <int>[];
                                final isStepHighlighted = !widget.isEditable &&
                                    isMotor &&
                                    seqState.isChannelHighlighted(
                                        panel.motorChannel!);

                                return _DraggableGridPanel(
                                  flapNumber:
                                      arrangement.flapNumberForPanel(panel.id),
                                  panel: panel,
                                  compact: columns >= 5,
                                  isEditable: widget.isEditable,
                                  isSelected: widget.isEditable &&
                                      arrangement.selectedPanelId == panel.id,
                                  isStepHighlighted: isStepHighlighted,
                                  stepNumbers: stepNums,
                                  liveAngle: _angleForPanel(panel, packet),
                                  onDragStarted: () =>
                                      setState(() => _isDragging = true),
                                  onDragEnd: () =>
                                      setState(() => _isDragging = false),
                                  onTap: () {
                                    if (widget.isEditable) {
                                      notifier.selectPanel(
                                        arrangement.selectedPanelId == panel.id
                                            ? null
                                            : panel.id,
                                      );
                                      return;
                                    }
                                    if (!isMotor) {
                                      ScaffoldMessenger.of(context)
                                        ..clearSnackBars()
                                        ..showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Only Motorized panels can be added to a routine.',
                                            ),
                                            duration: Duration(seconds: 2),
                                            backgroundColor: AppColors.of(context).amber,
                                          ),
                                        );
                                      return;
                                    }
                                    final msg =
                                        seqNotifier.tapMotorizedPanel(panel);
                                    if (msg != null) {
                                      ScaffoldMessenger.of(context)
                                        ..clearSnackBars()
                                        ..showSnackBar(
                                          SnackBar(
                                            content: Text(msg),
                                            duration:
                                                const Duration(seconds: 2),
                                            backgroundColor: AppColors.of(context).amber,
                                          ),
                                        );
                                    }
                                  },
                                  onDropSwap: (draggedPanelId) {
                                    notifier.swapPanels(
                                        draggedPanelId, panel.id);
                                  },
                                );
                              }(),
                            ),
                        ],
                      ),
                    ),
                    if (showDropColumn) ...[
                      const SizedBox(width: gap),
                      DragTarget<int>(
                        onWillAcceptWithDetails: (_) => true,
                        onAcceptWithDetails: (_) {
                          notifier.addColumn();
                          setState(() => _isDragging = false);
                        },
                        builder: (context, candidateData, _) {
                          final hovered = candidateData.isNotEmpty;
                          return Container(
                            width: dropZoneWidth,
                            height: gridHeight,
                            decoration: BoxDecoration(
                              color: hovered
                                  ? AppColors.of(context).cyan.withValues(alpha: 0.18)
                                  : AppColors.of(context).surfaceHighlight
                                      .withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: hovered
                                    ? AppColors.of(context).cyan
                                    : AppColors.of(context).border,
                              ),
                            ),
                            child: Center(
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  '+ COL (6×6)',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.of(context).cyan,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ],
                ),
                    if (showDropRow) ...[
                      const SizedBox(height: gap),
                      DragTarget<int>(
                        onWillAcceptWithDetails: (_) => true,
                        onAcceptWithDetails: (details) {
                          final dragged = arrangement.panels
                              .where((p) => p.id == details.data)
                              .firstOrNull;
                          notifier.addRow();
                          if (dragged != null) {
                            notifier.movePanelToCell(
                                dragged.id, rows, dragged.col);
                          }
                          setState(() => _isDragging = false);
                        },
                        builder: (context, candidateData, _) {
                          final hovered = candidateData.isNotEmpty;
                          return Container(
                            width: gridWidth,
                            height: 38,
                            decoration: BoxDecoration(
                              color: hovered
                                  ? AppColors.of(context).cyan.withValues(alpha: 0.18)
                                  : AppColors.of(context).surfaceHighlight
                                      .withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: hovered
                                    ? AppColors.of(context).cyan
                                    : AppColors.of(context).border,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '+ ROW (6×6)',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.of(context).cyan,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ],
                );
              },
            ),

            const SizedBox(height: 6),

            // Constant Centered 4-Button Controller (always sits near the last row)
            Center(
              child: _FabricaControllerModule(
                activeButtonId: packet?.activeButtonId ?? 0,
              ),
            ),

            // Selected Panel Editor Bar (Type, Remove)
            if (selectedPanel != null) ...[
              const SizedBox(height: AppTokens.space12),
              _SelectedPanelEditor(
                panel: selectedPanel,
                flapNumber: arrangement.flapNumberForPanel(selectedPanel.id),
                canSwitchToMotorized: arrangement.canAddMotorized ||
                    selectedPanel.type == FabricaPanelType.motorized,
                onChangeType: (newType) {
                  final err =
                      notifier.changePanelType(selectedPanel.id, newType);
                  if (err != null && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(err),
                        backgroundColor: AppColors.of(context).amber,
                      ),
                    );
                  }
                },
                onChangeChannel: (channel) {
                  final err =
                      notifier.setPanelMotorChannel(selectedPanel.id, channel);
                  if (err != null && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(err),
                        backgroundColor: AppColors.of(context).amber,
                      ),
                    );
                  }
                },
                onRemove: () => notifier.removePanel(selectedPanel.id),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _confirmRemoveColumn(
    BuildContext context,
    WidgetRef ref,
    FabricaArrangementState arrangement,
  ) async {
    final notifier = ref.read(fabricaArrangementProvider.notifier);
    final affected = arrangement.panelsInColumn(arrangement.gridColumns - 1);
    if (affected.isEmpty) {
      notifier.removeColumn();
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.of(context).surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusLg),
          side: BorderSide(color: AppColors.of(context).border),
        ),
        title: Text(
          'Remove Column ${arrangement.gridColumns}?',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: Text(
          '${affected.length} panel${affected.length == 1 ? '' : 's'} / module${affected.length == 1 ? '' : 's'} in column ${arrangement.gridColumns} will be deleted.\n\nDo you want to continue?',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.of(context).textSecondary,
            height: 1.4,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text('CANCEL',
                style: TextStyle(color: AppColors.of(context).textSecondary)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.of(context).crimson,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('DELETE & REMOVE'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      notifier.removeColumn();
    }
  }

  Future<void> _confirmRemoveRow(
    BuildContext context,
    WidgetRef ref,
    FabricaArrangementState arrangement,
  ) async {
    final notifier = ref.read(fabricaArrangementProvider.notifier);
    final affected = arrangement.panelsInRow(arrangement.gridRows - 1);
    if (affected.isEmpty) {
      notifier.removeRow();
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.of(context).surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusLg),
          side: BorderSide(color: AppColors.of(context).border),
        ),
        title: Text(
          'Remove Row ${arrangement.gridRows}?',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: Text(
          '${affected.length} panel${affected.length == 1 ? '' : 's'} / module${affected.length == 1 ? '' : 's'} in row ${arrangement.gridRows} will be deleted.\n\nDo you want to continue?',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.of(context).textSecondary,
            height: 1.4,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text('CANCEL',
                style: TextStyle(color: AppColors.of(context).textSecondary)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.of(context).crimson,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('DELETE & REMOVE'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      notifier.removeRow();
    }
  }

  int? _angleForPanel(FabricaPanel panel, TelemetryPacket? packet) {
    if (packet == null ||
        panel.type != FabricaPanelType.motorized ||
        panel.motorChannel == null) {
      return null;
    }
    final ch = panel.motorChannel!;
    if (ch >= 0 && ch < packet.channelAngles.length) {
      return packet.channelAngles[ch];
    }
    return null;
  }

  Future<void> _showAddPanelDialog(
    BuildContext context,
    WidgetRef ref,
    FabricaArrangementState arrangement, {
    int? row,
    int? col,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.of(context).surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusLg),
          side: BorderSide(color: AppColors.of(context).border),
        ),
        title: const Text(
          'Add Panel Assembly',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final type in FabricaPanelType.values)
              ListTile(
                enabled: type != FabricaPanelType.motorized ||
                    arrangement.canAddMotorized,
                leading: CircleAvatar(
                  radius: 14,
                  backgroundColor: _colorForType(context, type).withValues(alpha: 0.2),
                  child: Text(
                    type.badge,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: _colorForType(context, type),
                    ),
                  ),
                ),
                title: Text(type.displayName),
                subtitle: Text(
                  type == FabricaPanelType.motorized
                      ? 'Active servo actuator (${arrangement.motorizedCount}/${FabricaArrangementState.maxMotorizedPanels} used)'
                      : (type == FabricaPanelType.follower
                          ? 'Passive articulated follower flap'
                          : 'Stationary structural base plate'),
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.of(context).textSecondary,
                  ),
                ),
                onTap: () {
                  Navigator.of(dialogContext).pop();
                  final err = ref
                      .read(fabricaArrangementProvider.notifier)
                      .addPanel(type, row: row, col: col);
                  if (err != null && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(err),
                        backgroundColor: AppColors.of(context).amber,
                      ),
                    );
                  }
                },
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('CANCEL'),
          ),
        ],
      ),
    );
  }

  static Color _colorForType(BuildContext context, FabricaPanelType type) {
    switch (type) {
      case FabricaPanelType.motorized:
        return AppColors.of(context).cyan;
      case FabricaPanelType.follower:
        return AppColors.of(context).purple;
      case FabricaPanelType.base:
        return AppColors.of(context).textMuted;
    }
  }
}

class _FabricaControllerModule extends StatelessWidget {
  final int activeButtonId;

  const _FabricaControllerModule({required this.activeButtonId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.of(context).surfaceHighlight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.of(context).cyan.withValues(alpha: 0.6)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)?.controllerLabel ?? 'CONTROLLER',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
              color: AppColors.of(context).cyan,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) {
              final btnNum = index + 1;
              final isActive = activeButtonId == btnNum;
              return Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? AppColors.of(context).cyan : AppColors.of(context).surface,
                  border: Border.all(
                    color: isActive ? AppColors.of(context).cyan : AppColors.of(context).border,
                  ),
                ),
                child: Center(
                  child: Text(
                    '$btnNum',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: isActive
                          ? AppColors.of(context).textOnAccent
                          : AppColors.of(context).textPrimary,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _DraggableGridPanel extends StatelessWidget {
  final int flapNumber;
  final FabricaPanel panel;
  final bool compact;
  final bool isEditable;
  final bool isSelected;
  final bool isStepHighlighted;
  final List<int> stepNumbers;
  final int? liveAngle;
  final VoidCallback onDragStarted;
  final VoidCallback onDragEnd;
  final VoidCallback onTap;
  final ValueChanged<int> onDropSwap;

  const _DraggableGridPanel({
    required this.flapNumber,
    required this.panel,
    required this.compact,
    required this.isEditable,
    required this.isSelected,
    required this.isStepHighlighted,
    required this.stepNumbers,
    required this.liveAngle,
    required this.onDragStarted,
    required this.onDragEnd,
    required this.onTap,
    required this.onDropSwap,
  });

  @override
  Widget build(BuildContext context) {
    if (!isEditable) {
      return _buildTile(context, isHovered: false);
    }
    return DragTarget<int>(
      onWillAcceptWithDetails: (details) => details.data != panel.id,
      onAcceptWithDetails: (details) => onDropSwap(details.data),
      builder: (context, candidateData, rejectedData) {
        final isHovered = candidateData.isNotEmpty;
        final card = _buildTile(context, isHovered: isHovered);
        return LongPressDraggable<int>(
          data: panel.id,
          onDragStarted: onDragStarted,
          onDragEnd: (_) => onDragEnd(),
          onDraggableCanceled: (_, _) => onDragEnd(),
          feedback: Material(
            color: Colors.transparent,
            child: SizedBox(
              width: 84,
              height: 58,
              child: Opacity(opacity: 0.85, child: _buildTile(context, isHovered: true)),
            ),
          ),
          childWhenDragging: Opacity(opacity: 0.35, child: card),
          child: card,
        );
      },
    );
  }

  Widget _buildTile(BuildContext context, {required bool isHovered}) {
    final accent = _FabricaFlapVisualizerWidgetState._colorForType(context, panel.type);
    final borderColor = isHovered
        ? AppColors.of(context).amber
        : (isSelected || isStepHighlighted
            ? AppColors.of(context).textPrimary
            : accent.withValues(alpha: 0.55));

    return Material(
      color: accent.withValues(
        alpha: (isSelected || isStepHighlighted) ? 0.24 : 0.10,
      ),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 4 : 6,
            vertical: compact ? 4 : 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: borderColor,
              width: isSelected || isHovered || isStepHighlighted ? 2 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '#$flapNumber',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: compact ? 11 : 13,
                            fontWeight: FontWeight.w800,
                            color: accent == AppColors.of(context).textMuted
                                ? AppColors.of(context).textPrimary
                                : accent,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: compact ? 3 : 4,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: accent.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  _iconForType(panel.type),
                                  size: compact ? 8 : 10,
                                  color: accent == AppColors.of(context).textMuted
                                      ? AppColors.of(context).textSecondary
                                      : accent,
                                ),
                                const SizedBox(width: 2),
                                Flexible(
                                  child: Text(
                                    compact
                                        ? panel.type.badge
                                        : panel.type.shortLabel,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: compact ? 7 : 9,
                                      fontWeight: FontWeight.bold,
                                      color: accent == AppColors.of(context).textMuted
                                          ? AppColors.of(context).textSecondary
                                          : accent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (stepNumbers.isNotEmpty) ...[
                    const SizedBox(width: 3),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppColors.of(context).emerald.withValues(alpha: 0.22),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        stepNumbers.length <= 2
                            ? stepNumbers.join(',')
                            : '${stepNumbers.take(2).join(',')}+',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: AppColors.of(context).emerald,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              Row(
                children: [
                  if (panel.type == FabricaPanelType.motorized) ...[
                    Icon(
                      Icons.electric_bolt,
                      size: compact ? 9 : 11,
                      color: AppColors.of(context).cyan,
                    ),
                    const SizedBox(width: 2),
                  ],
                  Expanded(
                    child: Text(
                      panel.type == FabricaPanelType.motorized &&
                              panel.motorChannel != null
                          ? (AppLocalizations.of(context)
                                  ?.channelNumber(panel.motorChannel! + 1) ??
                              'Channel ${panel.motorChannel! + 1}')
                          : (panel.type == FabricaPanelType.motorized
                              ? (AppLocalizations.of(context)?.motorBadge ??
                                  panel.type.shortLabel)
                              : (panel.type == FabricaPanelType.follower
                                  ? (AppLocalizations.of(context)?.followerBadge ??
                                      panel.type.shortLabel)
                                  : (AppLocalizations.of(context)?.baseBadge ??
                                      panel.type.shortLabel))),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: compact ? 8 : 10,
                        fontWeight: FontWeight.w600,
                        color: AppColors.of(context).textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static IconData _iconForType(FabricaPanelType type) {
    switch (type) {
      case FabricaPanelType.motorized:
        return Icons.electric_bolt;
      case FabricaPanelType.base:
        return Icons.foundation;
      case FabricaPanelType.follower:
        return Icons.link;
    }
  }
}

class _SelectedPanelEditor extends StatelessWidget {
  final FabricaPanel panel;
  final int flapNumber;
  final bool canSwitchToMotorized;
  final ValueChanged<FabricaPanelType> onChangeType;
  final ValueChanged<int> onChangeChannel;
  final VoidCallback onRemove;

  const _SelectedPanelEditor({
    required this.panel,
    required this.flapNumber,
    required this.canSwitchToMotorized,
    required this.onChangeType,
    required this.onChangeChannel,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTokens.space8),
      decoration: BoxDecoration(
        color: AppColors.of(context).background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.of(context).border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FLAP #$flapNumber • ${panel.type.displayName.toUpperCase()}',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.of(context).cyan,
                ),
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  foregroundColor: AppColors.of(context).crimson,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                ),
                icon: const Icon(Icons.delete_outline, size: 16),
                label: const Text('REMOVE', style: TextStyle(fontSize: 10)),
                onPressed: onRemove,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final type in FabricaPanelType.values)
                ChoiceChip(
                  label: Text(
                    type.shortLabel,
                    style: const TextStyle(fontSize: 10),
                  ),
                  selected: panel.type == type,
                  onSelected: (type == FabricaPanelType.motorized &&
                          !canSwitchToMotorized)
                      ? null
                      : (_) => onChangeType(type),
                ),
            ],
          ),
          if (panel.type == FabricaPanelType.motorized) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'CHANNEL',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.of(context).textSecondary,
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.of(context).surfaceElevated,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.of(context).border),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      key: const Key('motor_channel_dropdown'),
                      value: (panel.motorChannel != null &&
                              panel.motorChannel! >= 0 &&
                              panel.motorChannel! <
                                  FabricaArrangementState.maxMotorizedPanels)
                          ? panel.motorChannel
                          : 0,
                      isDense: true,
                      dropdownColor: AppColors.of(context).surfaceElevated,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.of(context).cyan,
                      ),
                      items: [
                        for (int ch = 0;
                            ch < FabricaArrangementState.maxMotorizedPanels;
                            ch++)
                          DropdownMenuItem<int>(
                            value: ch,
                            child: Text('Channel ${ch + 1}'),
                          ),
                      ],
                      onChanged: (ch) {
                        if (ch != null) onChangeChannel(ch);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _GridDimensionControl extends StatelessWidget {
  final String label;
  final int value;
  final int max;
  final String decrementTooltip;
  final String incrementTooltip;
  final VoidCallback? onDecrement;
  final VoidCallback? onIncrement;

  const _GridDimensionControl({
    required this.label,
    required this.value,
    required this.max,
    required this.decrementTooltip,
    required this.incrementTooltip,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.of(context).surfaceHighlight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.of(context).border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.of(context).textSecondary,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: OutlinedButton(
                  onPressed: onDecrement,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: BorderSide(color: AppColors.of(context).border),
                    foregroundColor: AppColors.of(context).textPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Tooltip(
                    message: decrementTooltip,
                    child: const Icon(Icons.remove, size: 17),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  '$value/$max',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace',
                    color: AppColors.of(context).cyan,
                  ),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: OutlinedButton(
                  onPressed: onIncrement,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: BorderSide(color: AppColors.of(context).cyan),
                    foregroundColor: AppColors.of(context).cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Tooltip(
                    message: incrementTooltip,
                    child: const Icon(Icons.add, size: 17),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegendChip extends StatelessWidget {
  final String label;
  final Color color;

  const _LegendChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
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
          label,
          style: TextStyle(fontSize: 10, color: AppColors.of(context).textSecondary),
        ),
      ],
    );
  }
}

/// Dedicated full-screen page for editing the Fabrica modular grid layout.
class FabricaArrangementEditorScreen extends StatelessWidget {
  final AirWidgetConfig config;

  const FabricaArrangementEditorScreen({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)?.editFabricaArrangementTitle ??
              'Edit Fabrica Arrangement',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              AppLocalizations.of(context)?.doneButton ?? 'DONE',
              style: TextStyle(
                color: AppColors.of(context).cyan,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppTokens.paddingScreen,
          child: FabricaFlapVisualizerWidget(
            config: config,
            isEditable: true,
          ),
        ),
      ),
    );
  }
}
