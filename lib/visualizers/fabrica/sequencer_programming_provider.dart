import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/ble/ble_providers.dart';
import '../../core/ble/ble_transport_interface.dart';
import '../../core/protocol/routine_models.dart';
import 'fabrica_arrangement_provider.dart';

/// Shared state synchronizing the read-only Fabrica grid and Routine Builder.
class SequencerProgrammingState {
  /// Currently selected physical robot button slot (1..4).
  final int selectedButtonId;

  /// Per-step list of motor channels (0, 1, or 2 channels per step).
  final List<List<int>> draftSteps;

  /// Snapshot of the last loaded/saved steps for [selectedButtonId].
  final List<List<int>> savedBaselineSteps;

  /// Currently selected step index that receives panel taps from the grid.
  final int selectedStepIndex;

  const SequencerProgrammingState({
    this.selectedButtonId = 1,
    required this.draftSteps,
    List<List<int>>? savedBaselineSteps,
    this.selectedStepIndex = 0,
  }) : savedBaselineSteps = savedBaselineSteps ?? draftSteps;

  /// True when [draftSteps] differs from [savedBaselineSteps].
  bool get isDirty => !_stepsEqual(draftSteps, savedBaselineSteps);

  /// Validated [FoldStep] list for steps that have 1 or 2 motor channels.
  List<FoldStep> get steps => [
        for (final chs in draftSteps)
          if (chs.length == 1)
            FoldStep.single(chs[0])
          else if (chs.length >= 2)
            FoldStep.dual(chs[0], chs[1]),
      ];

  /// Index of the first step that violates the 1–2 motorized panel rule, or null.
  int? firstInvalidStepIndex() {
    for (int i = 0; i < draftSteps.length; i++) {
      if (draftSteps[i].isEmpty || draftSteps[i].length > 2) {
        return i;
      }
    }
    return null;
  }

  /// 1-based step numbers in [draftSteps] that actuate [channel].
  List<int> stepNumbersForChannel(int channel) {
    final result = <int>[];
    for (int i = 0; i < draftSteps.length; i++) {
      if (draftSteps[i].contains(channel)) {
        result.add(i + 1);
      }
    }
    return result;
  }

  /// True if [channel] belongs to the currently selected step.
  bool isChannelHighlighted(int channel) {
    if (selectedStepIndex < 0 || selectedStepIndex >= draftSteps.length) {
      return false;
    }
    return draftSteps[selectedStepIndex].contains(channel);
  }

  SequencerProgrammingState copyWith({
    int? selectedButtonId,
    List<List<int>>? draftSteps,
    List<List<int>>? savedBaselineSteps,
    int? selectedStepIndex,
  }) {
    return SequencerProgrammingState(
      selectedButtonId: selectedButtonId ?? this.selectedButtonId,
      draftSteps: draftSteps ?? this.draftSteps,
      savedBaselineSteps: savedBaselineSteps ?? this.savedBaselineSteps,
      selectedStepIndex: selectedStepIndex ?? this.selectedStepIndex,
    );
  }

  static bool _stepsEqual(List<List<int>> a, List<List<int>> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i].length != b[i].length) return false;
      for (int j = 0; j < a[i].length; j++) {
        if (a[i][j] != b[i][j]) return false;
      }
    }
    return true;
  }
}

/// Manages active button selection, dirty tracking, step selection,
/// and tap-to-assign grid interactions for Routine Builder.
class SequencerProgrammingNotifier extends Notifier<SequencerProgrammingState> {
  /// Factory default folding sequences matching firmware `storage.c`.
  static List<FoldStep> defaultStepsForButton(int buttonId) {
    switch (buttonId) {
      case 1:
        // Adult T-Shirt: Left -> Right -> Bottom -> Top
        return [
          FoldStep.single(0),
          FoldStep.single(1),
          FoldStep.single(2),
          FoldStep.single(3),
        ];
      case 2:
        // Long-Sleeve Shirt: Dual sleeves -> Top -> Left -> Right -> Bottom
        return [
          FoldStep.dual(0, 1),
          FoldStep.single(3),
          FoldStep.single(0),
          FoldStep.single(1),
          FoldStep.single(2),
        ];
      case 3:
        // Trousers / Jeans: Left -> Bottom -> Top
        return [
          FoldStep.single(0),
          FoldStep.single(2),
          FoldStep.single(3),
        ];
      case 4:
      default:
        // Towel / Linen: Left -> Right -> Bottom -> Top
        return [
          FoldStep.single(0),
          FoldStep.single(1),
          FoldStep.single(2),
          FoldStep.single(3),
        ];
    }
  }

  static List<List<int>> _toChannelLists(List<FoldStep> foldSteps) {
    final loaded = <List<int>>[
      for (final step in foldSteps)
        if (step.motorCount > 1)
          [step.motorIds[0], step.motorIds[1]]
        else if (step.motorCount == 1)
          [step.motorIds[0]],
    ];
    if (loaded.isEmpty) {
      loaded.add(<int>[]);
    }
    return loaded;
  }

  static List<List<int>> _cloneSteps(List<List<int>> steps) =>
      [for (final s in steps) List<int>.from(s)];

  static SequencerProgrammingState _initialState() {
    final initial = _toChannelLists(defaultStepsForButton(1));
    return SequencerProgrammingState(
      selectedButtonId: 1,
      draftSteps: initial,
      savedBaselineSteps: _cloneSteps(initial),
      selectedStepIndex: 0,
    );
  }

  @override
  SequencerProgrammingState build() {
    ref.listen<AsyncValue<BleConnectionState>>(bleConnectionStateProvider,
        (prev, next) {
      if (prev?.value != null &&
          prev?.value != BleConnectionState.disconnected &&
          next.value == BleConnectionState.disconnected) {
        state = _initialState();
      }
    });
    return _initialState();
  }

  void selectStep(int index) {
    if (index < 0 || index >= state.draftSteps.length) return;
    state = state.copyWith(selectedStepIndex: index);
  }

  /// Toggles [panel.motorChannel] on the currently selected step.
  /// Returns a validation warning message if a constraint is hit, or null.
  String? tapMotorizedPanel(FabricaPanel panel) {
    final ch = panel.motorChannel;
    if (ch == null || state.draftSteps.isEmpty) return null;

    final idx = state.selectedStepIndex.clamp(0, state.draftSteps.length - 1);
    final current = List<int>.from(state.draftSteps[idx]);

    if (current.contains(ch)) {
      current.remove(ch);
      final next = [
        for (int i = 0; i < state.draftSteps.length; i++)
          if (i == idx) current else state.draftSteps[i],
      ];
      state = state.copyWith(draftSteps: next, selectedStepIndex: idx);
      if (current.isEmpty) {
        return 'Step ${idx + 1} needs at least 1 motorized panel.';
      }
      return null;
    }

    if (current.length >= 2) {
      return 'Each step can have at most 2 motorized panels.';
    }

    current.add(ch);
    final next = [
      for (int i = 0; i < state.draftSteps.length; i++)
        if (i == idx) current else state.draftSteps[i],
    ];
    state = state.copyWith(draftSteps: next, selectedStepIndex: idx);
    return null;
  }

  /// Appends a new empty step and selects it so the user can tap 1–2 motors.
  bool addEmptyStep({int maxSteps = 16}) {
    if (state.draftSteps.length >= maxSteps) return false;
    final next = [...state.draftSteps, <int>[]];
    state = state.copyWith(
      draftSteps: next,
      selectedStepIndex: next.length - 1,
    );
    return true;
  }

  bool removeStep(int index) {
    if (state.draftSteps.length <= 1 ||
        index < 0 ||
        index >= state.draftSteps.length) {
      return false;
    }
    final next = List<List<int>>.from(state.draftSteps)..removeAt(index);
    final nextSelected = state.selectedStepIndex >= next.length
        ? next.length - 1
        : state.selectedStepIndex;
    state = state.copyWith(
      draftSteps: next,
      selectedStepIndex: nextSelected,
    );
    return true;
  }

  /// Selects [buttonId] (1..4) and loads its saved [steps] as a clean baseline.
  void loadButtonSteps(int buttonId, List<FoldStep> steps) {
    final slot = buttonId.clamp(1, 4);
    final loaded = _toChannelLists(steps);
    state = SequencerProgrammingState(
      selectedButtonId: slot,
      draftSteps: loaded,
      savedBaselineSteps: _cloneSteps(loaded),
      selectedStepIndex: 0,
    );
  }

  /// Loads preset template [newSteps] into the currently selected button draft
  /// without changing [SequencerProgrammingState.selectedButtonId] or the saved baseline.
  void loadTemplateSteps(List<FoldStep> newSteps) {
    final loaded = _toChannelLists(newSteps);
    state = state.copyWith(
      draftSteps: loaded,
      selectedStepIndex: 0,
    );
  }

  /// Alias for [loadTemplateSteps].
  void loadSteps(List<FoldStep> newSteps) => loadTemplateSteps(newSteps);

  /// Updates the saved baseline to match the current draft steps after committing to flash.
  void markCurrentAsSaved() {
    state = state.copyWith(
      savedBaselineSteps: _cloneSteps(state.draftSteps),
    );
  }

  /// Resets the sequencer back to Button 1 factory defaults.
  void resetToDefaults() {
    state = _initialState();
  }
}

final sequencerProgrammingProvider =
    NotifierProvider<SequencerProgrammingNotifier, SequencerProgrammingState>(
  SequencerProgrammingNotifier.new,
);
