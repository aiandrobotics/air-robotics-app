import 'dart:math' as math;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/profile/profile_providers.dart';

/// The 3 supported panel assembly types on the Fabrica modular grid.
enum FabricaPanelType {
  motorized('Motorized Assembly', 'MOTOR', 'M'),
  follower('Follower Assembly', 'FOLLOWER', 'F'),
  base('Base Assembly', 'BASE', 'B');

  final String displayName;
  final String shortLabel;
  final String badge;

  const FabricaPanelType(this.displayName, this.shortLabel, this.badge);
}

/// A single modular panel with explicit (row, col) coordinates in the grid.
class FabricaPanel {
  final int id;
  final FabricaPanelType type;
  final int row;
  final int col;
  final int colSpan;
  final int rowSpan;
  final int? motorChannel;

  const FabricaPanel({
    required this.id,
    required this.type,
    required this.row,
    required this.col,
    this.colSpan = 1,
    this.rowSpan = 1,
    this.motorChannel,
  });

  FabricaPanel copyWith({
    int? id,
    FabricaPanelType? type,
    int? row,
    int? col,
    int? colSpan,
    int? rowSpan,
    int? motorChannel,
    bool clearMotorChannel = false,
  }) {
    return FabricaPanel(
      id: id ?? this.id,
      type: type ?? this.type,
      row: row ?? this.row,
      col: col ?? this.col,
      colSpan: colSpan ?? this.colSpan,
      rowSpan: rowSpan ?? this.rowSpan,
      motorChannel:
          clearMotorChannel ? null : (motorChannel ?? this.motorChannel),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type.name,
        'row': row,
        'col': col,
        'colSpan': colSpan,
        'rowSpan': rowSpan,
        if (motorChannel != null) 'motorChannel': motorChannel,
      };

  factory FabricaPanel.fromJson(Map<String, dynamic> json) {
    final typeName = json['type'] as String? ?? 'follower';
    final panelType = FabricaPanelType.values.firstWhere(
      (t) => t.name == typeName,
      orElse: () => FabricaPanelType.follower,
    );
    return FabricaPanel(
      id: (json['id'] as num).toInt(),
      type: panelType,
      row: (json['row'] as num).toInt(),
      col: (json['col'] as num).toInt(),
      colSpan: (json['colSpan'] as num?)?.toInt() ?? 1,
      rowSpan: (json['rowSpan'] as num?)?.toInt() ?? 1,
      motorChannel: (json['motorChannel'] as num?)?.toInt(),
    );
  }
}

/// Immutable state for the Fabrica modular panel arrangement.
class FabricaArrangementState {
  static const int maxTotalPanels = 32;
  static const int maxMotorizedPanels = 16;
  static const int defaultGridColumns = 3;
  static const int defaultGridRows = 4;
  static const int maxGridColumns = 6;
  static const int maxGridRows = 6;

  final List<FabricaPanel> panels;
  final int gridColumns;
  final int gridRows;
  final int? selectedPanelId;
  final int nextId;

  const FabricaArrangementState({
    required this.panels,
    this.gridColumns = defaultGridColumns,
    this.gridRows = defaultGridRows,
    this.selectedPanelId,
    this.nextId = 13,
  });

  int get totalCount => panels.length;

  int get motorizedCount =>
      panels.where((p) => p.type == FabricaPanelType.motorized).length;

  bool get canAddPanel => totalCount < maxTotalPanels;

  bool get canAddMotorized =>
      canAddPanel && motorizedCount < maxMotorizedPanels;

  List<FabricaPanel> get motorizedPanels {
    final list =
        panels.where((p) => p.type == FabricaPanelType.motorized).toList();
    list.sort(_compareByPosition);
    return list;
  }

  /// Returns 0-based motor channels (0..15) not assigned to any other motor panel.
  ///
  /// When [forPanelId] is provided, that panel's current channel remains available.
  List<int> availableMotorChannels({int? forPanelId}) {
    final usedByOthers = panels
        .where((p) => p.type == FabricaPanelType.motorized && p.id != forPanelId)
        .map((p) => p.motorChannel)
        .whereType<int>()
        .toSet();
    return [
      for (int ch = 0; ch < maxMotorizedPanels; ch++)
        if (!usedByOthers.contains(ch)) ch,
    ];
  }

  /// Panels occupying [col] (0-based).
  List<FabricaPanel> panelsInColumn(int col) => panels
      .where((p) => col >= p.col && col < p.col + p.colSpan)
      .toList();

  /// Panels occupying [row] (0-based).
  List<FabricaPanel> panelsInRow(int row) => panels
      .where((p) => row >= p.row && row < p.row + p.rowSpan)
      .toList();

  FabricaPanel? get selectedPanel {
    if (selectedPanelId == null) return null;
    for (final p in panels) {
      if (p.id == selectedPanelId) return p;
    }
    return null;
  }

  static int _compareByPosition(FabricaPanel a, FabricaPanel b) {
    // Number from controller (bottom row first, left to right)
    final rowCmp = b.row.compareTo(a.row);
    if (rowCmp != 0) return rowCmp;
    return a.col.compareTo(b.col);
  }

  /// 1-based flap number ordered bottom-to-top (from controller), left-to-right.
  int flapNumberForPanel(int panelId) {
    final sorted = List<FabricaPanel>.from(panels)..sort(_compareByPosition);
    final idx = sorted.indexWhere((p) => p.id == panelId);
    return idx >= 0 ? idx + 1 : 0;
  }

  /// Display label used in both the arrangement grid and Routine Builder.
  String moduleDisplayName(FabricaPanel panel) {
    final num = flapNumberForPanel(panel.id);
    if (panel.type == FabricaPanelType.motorized &&
        panel.motorChannel != null) {
      return 'Flap #$num (Motorized • Ch ${panel.motorChannel})';
    }
    return 'Flap #$num (${panel.type.shortLabel})';
  }

  FabricaArrangementState copyWith({
    List<FabricaPanel>? panels,
    int? gridColumns,
    int? gridRows,
    int? selectedPanelId,
    bool clearSelection = false,
    int? nextId,
  }) {
    return FabricaArrangementState(
      panels: panels ?? this.panels,
      gridColumns: gridColumns ?? this.gridColumns,
      gridRows: gridRows ?? this.gridRows,
      selectedPanelId:
          clearSelection ? null : (selectedPanelId ?? this.selectedPanelId),
      nextId: nextId ?? this.nextId,
    );
  }

  Map<String, dynamic> toJson() => {
        'panels': panels.map((p) => p.toJson()).toList(),
        'gridColumns': gridColumns,
        'gridRows': gridRows,
        'nextId': nextId,
      };

  factory FabricaArrangementState.fromJson(Map<String, dynamic> json) {
    final rawPanels = json['panels'] as List<dynamic>? ?? const [];
    final panels = rawPanels
        .whereType<Map<String, dynamic>>()
        .map(FabricaPanel.fromJson)
        .toList();
    return FabricaArrangementState(
      panels: panels,
      gridColumns: ((json['gridColumns'] as num?)?.toInt() ?? defaultGridColumns)
          .clamp(1, maxGridColumns),
      gridRows: ((json['gridRows'] as num?)?.toInt() ?? defaultGridRows)
          .clamp(1, maxGridRows),
      nextId: (json['nextId'] as num?)?.toInt() ?? (panels.length + 1),
    );
  }
}

/// Riverpod notifier managing the Fabrica 3x4 (4 rows x 3 columns) modular panel arrangement.
class FabricaArrangementNotifier extends Notifier<FabricaArrangementState> {
  @override
  FabricaArrangementState build() {
    final modelNumber = ref.watch(activeProfileProvider).modelNumber;
    final storage = ref.read(profileStorageProvider);

    Future.microtask(() async {
      try {
        final saved = await storage.getArrangement(modelNumber);
        if (ref.mounted && saved != null) {
          state = FabricaArrangementState.fromJson(saved);
        }
      } catch (_) {
        // Headless widget tests without Hive initialization use default 3x4 state.
      }
    });

    return _default3x4State();
  }

  void _setStateAndPersist(FabricaArrangementState next) {
    state = next;
    try {
      final modelNumber = ref.read(activeProfileProvider).modelNumber;
      ref
          .read(profileStorageProvider)
          .saveArrangement(modelNumber, next.toJson());
    } catch (_) {}
  }

  static FabricaArrangementState _default3x4State() {
    // 4 rows x 3 columns (12 panels) numbered #1..#12 from bottom-left (controller).
    // Motorized: #1->C1(0), #7->C2(1), #6->C3(2), #12->C4(3), #11->C5(4), #8->C6(5)
    // Base: #2, #5
    // Follower: #3, #4, #9, #10
    const motorizedChannelsByNumber = <int, int>{
      1: 0,
      7: 1,
      6: 2,
      12: 3,
      11: 4,
      8: 5,
    };
    const baseNumbers = {2, 5};
    final panels = <FabricaPanel>[];

    for (int num = 1; num <= 12; num++) {
      final zeroIdx = num - 1;
      final row = (FabricaArrangementState.defaultGridRows - 1) - (zeroIdx ~/ 3);
      final col = zeroIdx % 3;
      final motorChannel = motorizedChannelsByNumber[num];
      if (motorChannel != null) {
        panels.add(
          FabricaPanel(
            id: num,
            type: FabricaPanelType.motorized,
            row: row,
            col: col,
            motorChannel: motorChannel,
          ),
        );
      } else if (baseNumbers.contains(num)) {
        panels.add(
          FabricaPanel(
            id: num,
            type: FabricaPanelType.base,
            row: row,
            col: col,
          ),
        );
      } else {
        panels.add(
          FabricaPanel(
            id: num,
            type: FabricaPanelType.follower,
            row: row,
            col: col,
          ),
        );
      }
    }

    return FabricaArrangementState(
      panels: panels,
      gridColumns: FabricaArrangementState.defaultGridColumns,
      gridRows: FabricaArrangementState.defaultGridRows,
      nextId: 13,
    );
  }

  bool _isCellOccupied(
    int r,
    int c, {
    int? ignorePanelId,
  }) {
    for (final p in state.panels) {
      if (p.id == ignorePanelId) continue;
      if (r >= p.row &&
          r < p.row + p.rowSpan &&
          c >= p.col &&
          c < p.col + p.colSpan) {
        return true;
      }
    }
    return false;
  }

  (int, int)? _firstFreeCell({int? rows, int? cols}) {
    final maxR = rows ?? state.gridRows;
    final maxC = cols ?? state.gridColumns;
    for (int r = 0; r < maxR; r++) {
      for (int c = 0; c < maxC; c++) {
        if (!_isCellOccupied(r, c)) {
          return (r, c);
        }
      }
    }
    return null;
  }

  /// Adds a column up to [FabricaArrangementState.maxGridColumns] (6).
  String? addColumn() {
    if (state.gridColumns >= FabricaArrangementState.maxGridColumns) {
      return 'Maximum ${FabricaArrangementState.maxGridColumns} columns (6×6) reached';
    }
    _setStateAndPersist(state.copyWith(gridColumns: state.gridColumns + 1));
    return null;
  }

  /// Removes the rightmost column down to 1, deleting any panels in that column.
  void removeColumn() {
    if (state.gridColumns <= 1) return;
    final nextCols = state.gridColumns - 1;
    final updated = <FabricaPanel>[];
    bool selectionRemoved = false;
    for (final p in state.panels) {
      if (p.col >= nextCols) {
        if (p.id == state.selectedPanelId) selectionRemoved = true;
        continue;
      }
      final newSpan = p.colSpan.clamp(1, nextCols - p.col).toInt();
      updated.add(p.copyWith(colSpan: newSpan));
    }
    _setStateAndPersist(state.copyWith(
      panels: updated,
      gridColumns: nextCols,
      clearSelection: selectionRemoved,
    ));
  }

  /// Adds a row up to [FabricaArrangementState.maxGridRows] (6).
  String? addRow() {
    if (state.gridRows >= FabricaArrangementState.maxGridRows) {
      return 'Maximum ${FabricaArrangementState.maxGridRows} rows (6×6) reached';
    }
    _setStateAndPersist(state.copyWith(gridRows: state.gridRows + 1));
    return null;
  }

  /// Removes the bottom row down to 1, deleting any panels in that row.
  void removeRow() {
    if (state.gridRows <= 1) return;
    final nextRows = state.gridRows - 1;
    final updated = <FabricaPanel>[];
    bool selectionRemoved = false;
    for (final p in state.panels) {
      if (p.row >= nextRows) {
        if (p.id == state.selectedPanelId) selectionRemoved = true;
        continue;
      }
      final newSpan = p.rowSpan.clamp(1, nextRows - p.row).toInt();
      updated.add(p.copyWith(rowSpan: newSpan));
    }
    _setStateAndPersist(state.copyWith(
      panels: updated,
      gridRows: nextRows,
      clearSelection: selectionRemoved,
    ));
  }

  void selectPanel(int? panelId) {
    state = state.copyWith(
      selectedPanelId: panelId,
      clearSelection: panelId == null,
    );
  }

  int _nextAvailableMotorChannel(List<FabricaPanel> currentPanels) {
    final used = currentPanels
        .where((p) => p.type == FabricaPanelType.motorized)
        .map((p) => p.motorChannel)
        .whereType<int>()
        .toSet();
    for (int ch = 0; ch < FabricaArrangementState.maxMotorizedPanels; ch++) {
      if (!used.contains(ch)) return ch;
    }
    return 0;
  }

  /// Adds a new panel of [type] into the first free cell (or [row], [col]).
  String? addPanel(FabricaPanelType type, {int? row, int? col}) {
    if (!state.canAddPanel) {
      return 'Maximum ${FabricaArrangementState.maxTotalPanels} assemblies allowed';
    }
    if (type == FabricaPanelType.motorized && !state.canAddMotorized) {
      return 'Maximum ${FabricaArrangementState.maxMotorizedPanels} motorized assemblies allowed';
    }

    var nextGridColumns = state.gridColumns;
    var nextGridRows = state.gridRows;
    var slot = (row != null && col != null) ? (row, col) : _firstFreeCell();
    if (slot == null && row == null && col == null) {
      if (nextGridRows < FabricaArrangementState.maxGridRows) {
        slot = (nextGridRows, 0);
        nextGridRows++;
      } else if (nextGridColumns < FabricaArrangementState.maxGridColumns) {
        slot = (0, nextGridColumns);
        nextGridColumns++;
      }
    }
    if (slot == null) {
      return 'No free cells in ${state.gridColumns}×${state.gridRows} grid.';
    }

    final newPanel = FabricaPanel(
      id: state.nextId,
      type: type,
      row: slot.$1,
      col: slot.$2,
      motorChannel: type == FabricaPanelType.motorized
          ? _nextAvailableMotorChannel(state.panels)
          : null,
    );

    _setStateAndPersist(state.copyWith(
      panels: [...state.panels, newPanel],
      gridColumns: nextGridColumns,
      gridRows: nextGridRows,
      selectedPanelId: newPanel.id,
      nextId: state.nextId + 1,
    ));
    return null;
  }

  /// Removes a panel by [panelId] without rearranging other panels.
  void removePanel(int panelId) {
    final updated = state.panels.where((p) => p.id != panelId).toList();
    _setStateAndPersist(state.copyWith(
      panels: updated,
      clearSelection: state.selectedPanelId == panelId,
    ));
  }

  /// Changes the assembly type of [panelId]. Returns error message if limit hit.
  String? changePanelType(int panelId, FabricaPanelType newType) {
    final idx = state.panels.indexWhere((p) => p.id == panelId);
    if (idx < 0) return null;
    final current = state.panels[idx];
    if (current.type == newType) return null;

    if (newType == FabricaPanelType.motorized &&
        state.motorizedCount >= FabricaArrangementState.maxMotorizedPanels) {
      return 'Maximum ${FabricaArrangementState.maxMotorizedPanels} motorized assemblies allowed';
    }

    final updated = List<FabricaPanel>.from(state.panels);
    updated[idx] = current.copyWith(
      type: newType,
      motorChannel: newType == FabricaPanelType.motorized
          ? _nextAvailableMotorChannel(state.panels)
          : null,
      clearMotorChannel: newType != FabricaPanelType.motorized,
    );
    _setStateAndPersist(state.copyWith(panels: updated));
    return null;
  }

  /// Assigns a 0-based motor [channel] (0..15) to [panelId].
  ///
  /// If another motorized panel already uses [channel], swaps channels with it
  /// so that each channel remains assigned to at most one motor panel.
  String? setPanelMotorChannel(int panelId, int channel) {
    if (channel < 0 || channel >= FabricaArrangementState.maxMotorizedPanels) {
      return 'Channel must be between 1 and ${FabricaArrangementState.maxMotorizedPanels}';
    }
    final idx = state.panels.indexWhere((p) => p.id == panelId);
    if (idx < 0) return null;
    final current = state.panels[idx];
    if (current.type != FabricaPanelType.motorized) return null;
    if (current.motorChannel == channel) return null;

    final updated = List<FabricaPanel>.from(state.panels);
    final otherIdx = updated.indexWhere(
      (p) =>
          p.id != panelId &&
          p.type == FabricaPanelType.motorized &&
          p.motorChannel == channel,
    );

    updated[idx] = current.copyWith(motorChannel: channel);
    if (otherIdx >= 0) {
      final other = updated[otherIdx];
      final fallbackChannel =
          current.motorChannel ?? _nextAvailableMotorChannel(updated);
      updated[otherIdx] = other.copyWith(motorChannel: fallbackChannel);
    }

    _setStateAndPersist(state.copyWith(panels: updated));
    return null;
  }

  /// Updates the grid span (size) of [panelId].
  void resizePanel(int panelId, {int? colSpan, int? rowSpan}) {
    final idx = state.panels.indexWhere((p) => p.id == panelId);
    if (idx < 0) return;
    final current = state.panels[idx];
    final maxColSpan = state.gridColumns - current.col;
    final maxRowSpan = state.gridRows - current.row;
    final updated = List<FabricaPanel>.from(state.panels);
    updated[idx] = current.copyWith(
      colSpan: colSpan?.clamp(1, math.max(1, maxColSpan)),
      rowSpan: rowSpan?.clamp(1, math.max(1, maxRowSpan)),
    );
    _setStateAndPersist(state.copyWith(panels: updated));
  }

  /// Moves [panelId] to an empty cell ([targetRow], [targetCol]) without shifting others.
  void movePanelToCell(int panelId, int targetRow, int targetCol) {
    final idx = state.panels.indexWhere((p) => p.id == panelId);
    if (idx < 0) return;
    final panel = state.panels[idx];
    final clampedCol = targetCol
        .clamp(0, math.max(0, state.gridColumns - panel.colSpan))
        .toInt();
    final clampedRow = targetRow
        .clamp(0, math.max(0, state.gridRows - panel.rowSpan))
        .toInt();

    final updated = List<FabricaPanel>.from(state.panels);
    updated[idx] = panel.copyWith(row: clampedRow, col: clampedCol);
    _setStateAndPersist(state.copyWith(panels: updated));
  }

  /// Swaps the grid positions of two panels without shifting any other panels.
  void swapPanels(int panelIdA, int panelIdB) {
    if (panelIdA == panelIdB) return;
    final idxA = state.panels.indexWhere((p) => p.id == panelIdA);
    final idxB = state.panels.indexWhere((p) => p.id == panelIdB);
    if (idxA < 0 || idxB < 0) return;

    final a = state.panels[idxA];
    final b = state.panels[idxB];
    final updated = List<FabricaPanel>.from(state.panels);
    updated[idxA] = a.copyWith(row: b.row, col: b.col);
    updated[idxB] = b.copyWith(row: a.row, col: a.col);
    _setStateAndPersist(state.copyWith(panels: updated));
  }

  /// Resets the arrangement back to the default 3x4 (4 rows x 3 columns) grid.
  void resetDefault3x4() {
    _setStateAndPersist(_default3x4State());
  }
}

final fabricaArrangementProvider =
    NotifierProvider<FabricaArrangementNotifier, FabricaArrangementState>(
  FabricaArrangementNotifier.new,
);
