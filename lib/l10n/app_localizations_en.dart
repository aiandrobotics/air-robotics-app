// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get appLanguageTitle => 'App Language';

  @override
  String get appVersionTitle => 'App Version';

  @override
  String get languageSectionTitle => 'Language';

  @override
  String get languageSystemDefault => 'System Default (Device Language)';

  @override
  String get selectLanguageHint => 'Select a language';

  @override
  String get addDeviceTitle => 'ADD NEW ROBOT';

  @override
  String get addDeviceSubtitle => 'Pair AIR robots';

  @override
  String get yourRobots => 'YOUR ROBOTS';

  @override
  String get discoveredRobots => 'DISCOVERED ROBOTS';

  @override
  String get noRobotsPairedYet => 'No Robots Paired Yet';

  @override
  String get noRobotsPairedSubtitle =>
      'Connect your robot to view telemetry, manage presets, and control operations.';

  @override
  String get addYourFirstRobot => 'ADD YOUR FIRST ROBOT';

  @override
  String get autoScanning => 'AUTO-SCANNING';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'Control';

  @override
  String get tabSequencer => 'Sequencer';

  @override
  String get tabCalibrator => 'Calibrator';

  @override
  String get tabDiagnostics => 'Diagnostics';

  @override
  String get renameRobot => 'Rename Robot';

  @override
  String get bleDiagnostics => 'BLE Diagnostics';

  @override
  String get erasePresets => 'Erase Saved Presets';

  @override
  String get disconnect => 'Disconnect';

  @override
  String get unpairRobot => 'Unpair Robot';

  @override
  String get factoryReset => 'Factory Reset';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'HOME ALL';

  @override
  String get foldingTimeline => 'FOLDING TIMELINE';

  @override
  String get addStep => 'ADD STEP';

  @override
  String get previewOnRobot => 'PREVIEW ON ROBOT';

  @override
  String get saveToButton => 'SAVE TO BUTTON';

  @override
  String get themeTitle => 'Theme';

  @override
  String get themeSystem => 'Device';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get connectedBadge => 'CONNECTED';

  @override
  String get inRangeBadge => 'IN RANGE';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'OPEN';

  @override
  String get connectButton => 'CONNECT';

  @override
  String get reconnectButton => 'RECONNECT';

  @override
  String get pairAndConnect => 'PAIR & CONNECT';

  @override
  String get autoScanningForRobots => 'Auto-scanning for robots...';

  @override
  String get scanningIdle => 'Scanning idle';

  @override
  String get nearbyRobotsAppear =>
      'Nearby robots will appear here automatically.';

  @override
  String get yourNearbyRobotsAppear =>
      'Your nearby robots will appear here automatically.';

  @override
  String get signalStrong => 'Strong';

  @override
  String get signalGood => 'Good';

  @override
  String get signalWeak => 'Weak';

  @override
  String get addRobotIntro =>
      'Select a robot below to pair. Any nearby robot in pairing mode will be automatically discovered at the top.';

  @override
  String get autoDiscoveredRobot => 'AUTO DISCOVERED ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTO DISCOVERED ROBOTS';

  @override
  String readyCountBadge(Object count) {
    return '$count READY';
  }

  @override
  String get supportedRobots => 'SUPPORTED ROBOTS';

  @override
  String get clothesFoldingRobot => 'Clothes Folding Robot';

  @override
  String get fabricaDescription =>
      'Automated garment folder with multi-garment presets and tactile single-button operation.';

  @override
  String get fabricaPairingHint =>
      'Pairing mode: Press and hold any button on the Fabrica control panel for 3 seconds (Status LED will blink rapidly).';

  @override
  String get pairFabricaNow => 'PAIR FABRICA NOW';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get connReady => 'READY';

  @override
  String get connConnecting => 'CONNECTING';

  @override
  String get connDiscovering => 'DISCOVERING';

  @override
  String get connBonding => 'BONDING';

  @override
  String get connScanning => 'SCANNING';

  @override
  String get connDisconnected => 'DISCONNECTED';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Disconnect from $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'You can reconnect anytime from the home screen.';

  @override
  String get cancelButton => 'CANCEL';

  @override
  String get saveButton => 'SAVE';

  @override
  String get customNickname => 'Custom Nickname';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Unpair $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'This will remove $name from Your Robots on this phone. You can re-add it at any time.\n\nNote: To completely wipe robot memory and restore factory defaults, use \"Factory Reset\".';
  }

  @override
  String get unpairButton => 'UNPAIR';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'RUNNING';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'ERROR';

  @override
  String get machineCalibrating => 'CALIBRATING';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'SAVED';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'PAIRING';

  @override
  String get ledConnected => 'CONNECTED';

  @override
  String get ledIdentify => 'IDENTIFY';

  @override
  String get identifyButton => 'IDENTIFY';

  @override
  String get identifyingToast => 'Flashing robot LED for 3 seconds...';

  @override
  String get homingToast => 'Homing all flaps...';

  @override
  String get i2cFault => 'I2C FAULT';

  @override
  String get storageFault => 'STORAGE FAULT';

  @override
  String get estopLatched => 'E-STOP LATCHED';

  @override
  String get presetButtonsTitle => 'PRESET BUTTONS';

  @override
  String customizePresetTitle(Object label) {
    return 'Customize $label';
  }

  @override
  String get subtitleNameLabel => 'Subtitle Name';

  @override
  String get subtitleNameHint => 'e.g. Quick Fold, Shirts, Custom...';

  @override
  String get buttonColorLabel => 'Button Color';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Step $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'EMERGENCY STOP';

  @override
  String get clearEstop => 'CLEAR & UNLATCH E-STOP';

  @override
  String get clearEstopHint =>
      'Resets emergency stop and returns robot to Idle';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'FABRICA ARRANGEMENT';

  @override
  String get editArrangement => 'EDIT ARRANGEMENT';

  @override
  String get addPanel => 'ADD PANEL';

  @override
  String get legendMotorized => 'Motorized';

  @override
  String get legendFollower => 'Follower';

  @override
  String get legendBase => 'Base';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Rows';

  @override
  String stepSelectedHint(Object step) {
    return 'Step $step selected: Tap 1–2 Motorized panels on the grid';
  }

  @override
  String get tapPanelsHint => 'Tap 1–2 motor panels on grid';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Requires at least 1 motorized panel (max 2)';

  @override
  String get selectedChangePanelsHint =>
      'Selected • Tap grid panels to change (max 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Step $step of $total';
  }

  @override
  String get removeStepTooltip => 'Remove Step';

  @override
  String get requiresMotorizedModuleWarning =>
      'Routine requires at least one Motorized module from Fabrica Arrangement.';

  @override
  String get routineFull => 'ROUTINE FULL (16/16 STEPS)';

  @override
  String addStepCount(Object count) {
    return 'ADD STEP ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Save Routine to Robot';

  @override
  String get selectButtonToProgram =>
      'Select a physical robot button to program with this routine:';

  @override
  String buttonNumber(Object slot) {
    return 'Button $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Hardware Button $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Button $slot Subtitle (Optional)';
  }

  @override
  String get saveToRobotButton => 'SAVE TO ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Button $slot ($count steps)';
  }

  @override
  String get adultTshirtTemplate => 'Adult T-Shirt Template';

  @override
  String get longSleeveTemplate => 'Long Sleeve Template';

  @override
  String get dualSweepTemplate => 'Dual Sweep Template';

  @override
  String channelNumber(Object number) {
    return 'Channel $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PAIRED';
  }

  @override
  String get moreHardwareOptions => 'More Hardware Options';

  @override
  String get loadTemplate => 'Load Template';

  @override
  String get controllerLabel => 'CONTROLLER';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'FOLLOWER';

  @override
  String get baseBadge => 'BASE';

  @override
  String pairModelTitle(Object model) {
    return 'PAIR $model';
  }

  @override
  String get stopScan => 'Stop Scan';

  @override
  String get rescan => 'Rescan';

  @override
  String searchingForNearby(Object model) {
    return 'SEARCHING FOR NEARBY $model...';
  }

  @override
  String get scanPaused => 'SCAN PAUSED';

  @override
  String filteringForBle(Object prefix) {
    return 'Filtering for \"$prefix*\" BLE advertisements';
  }

  @override
  String get tapRefreshToRestart =>
      'Tap the refresh button in the top bar to restart scan';

  @override
  String get fabricaPairingInstructions => 'FABRICA PAIRING INSTRUCTIONS';

  @override
  String get pairingProcedure => 'PAIRING PROCEDURE';

  @override
  String get pairStep1Fabrica => 'Power on your Fabrica robot.';

  @override
  String get pairStep2Fabrica =>
      'Press and hold any button on the Fabrica control panel for 3 seconds to enter pairing mode.';

  @override
  String get pairStep3Fabrica =>
      'The status LED will blink rapidly to confirm pairing mode is active.';

  @override
  String pairStep1Generic(Object model) {
    return 'Power on your $model robot.';
  }

  @override
  String get pairStep2Generic =>
      'Ensure Bluetooth pairing mode is active on the robot.';

  @override
  String searchingForModel(Object model) {
    return 'Searching for $model...';
  }

  @override
  String get noMatchingRobotsYet => 'No matching robots discovered yet';

  @override
  String get makeSureRobotPowered =>
      'Make sure your robot is powered on and within range.';

  @override
  String get checkPowerSwitch =>
      'Check power switch and tap the top right icon to restart scan.';

  @override
  String failedToConnect(Object error, Object name) {
    return 'Failed to connect to $name: $error';
  }

  @override
  String get restoreDefaultPresetsTitle => 'Restore Default Button Presets?';

  @override
  String get restoreDefaultPresetsBody =>
      'This will erase all custom button routines on the robot and reset Buttons 1–4 back to their default presets.\n\nAre you sure you want to proceed?';

  @override
  String get presetsRestoredToast =>
      'All button presets on the robot have been restored to defaults.';

  @override
  String get eraseAllPresetsButton => 'ERASE ALL PRESETS ON ROBOT';

  @override
  String get factoryResetTitle => 'Fabrica Factory Reset?';

  @override
  String get factoryResetBody =>
      'This will reset Fabrica to factory defaults:\n\n• Wipes all custom routines in memory & restores factory defaults.\n• Returns all flaps flat to home position (0°).\n• Clears saved Bluetooth pairing keys.\n• Disconnects Bluetooth and restarts pairing mode.\n\nThe robot will be removed from Your Devices on this phone.';

  @override
  String get executingFactoryReset => 'Executing Fabrica Factory Reset...';

  @override
  String get resetEverythingButton => 'RESET EVERYTHING';

  @override
  String get editFabricaArrangementTitle => 'Edit Fabrica Arrangement';

  @override
  String get doneButton => 'DONE';

  @override
  String moduleNumber(Object number) {
    return 'Module #$number';
  }

  @override
  String pairingModeHintError(Object name) {
    return 'Could not pair with $name. Make sure the robot is in pairing mode (hold any button for 3 seconds until the LED blinks rapidly) and try again.';
  }
}
