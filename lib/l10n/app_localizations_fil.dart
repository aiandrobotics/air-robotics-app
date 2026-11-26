// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Mga Setting';

  @override
  String get appLanguageTitle => 'Wika ng App';

  @override
  String get appVersionTitle => 'Bersyon ng App';

  @override
  String get languageSectionTitle => 'Wika';

  @override
  String get languageSystemDefault => 'Default ng System (Wika ng Device)';

  @override
  String get selectLanguageHint => 'Pumili ng wika';

  @override
  String get addDeviceTitle => 'MAGDAGDAG NG BAGONG ROBOT';

  @override
  String get addDeviceSubtitle => 'Ipares ang AIR robots';

  @override
  String get yourRobots => 'IYONG MGA ROBOTS';

  @override
  String get discoveredRobots => 'NATUKLAS NA ROBOTS';

  @override
  String get noRobotsPairedYet => 'Wala pang Ipinares na Robot';

  @override
  String get noRobotsPairedSubtitle =>
      'Ikonekta ang iyong robot upang tingnan ang telemetry, pamahalaan ang mga preset, at kontrolin ang mga operasyon.';

  @override
  String get addYourFirstRobot => 'ADD IYONG UNANG ROBOT';

  @override
  String get autoScanning => 'AUTO-SCANNING';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'Kontrolin';

  @override
  String get tabSequencer => 'Sequencer';

  @override
  String get tabCalibrator => 'Calibrator';

  @override
  String get tabDiagnostics => 'Mga diagnostic';

  @override
  String get renameRobot => 'Palitan ang pangalan ng Robot';

  @override
  String get bleDiagnostics => 'BLE Diagnostics';

  @override
  String get erasePresets => 'Burahin ang mga Naka-save na Preset';

  @override
  String get disconnect => 'Idiskonekta';

  @override
  String get unpairRobot => 'I-unpair ang Robot';

  @override
  String get factoryReset => 'Factory Reset';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'HOME LAHAT';

  @override
  String get foldingTimeline => 'FOLDING TIMELINE';

  @override
  String get addStep => 'MAGDAGDAG NG HAKBANG';

  @override
  String get previewOnRobot => 'PREVIEW SA ROBOT';

  @override
  String get saveToButton => 'I-SAVE SA BUTTON';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Device';

  @override
  String get themeLight => 'Liwanag';

  @override
  String get themeDark => 'Madilim';

  @override
  String get connectedBadge => 'KONEKTADO';

  @override
  String get inRangeBadge => 'SA HANAY';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'BUKAS';

  @override
  String get connectButton => 'KONEKTA';

  @override
  String get reconnectButton => 'MULI';

  @override
  String get pairAndConnect => 'PAIR & CONNECT';

  @override
  String get autoScanningForRobots => 'Auto-scan para sa mga robot...';

  @override
  String get scanningIdle => 'Idle ang pag-scan';

  @override
  String get nearbyRobotsAppear =>
      'Awtomatikong lalabas dito ang mga kalapit na robot.';

  @override
  String get yourNearbyRobotsAppear =>
      'Awtomatikong lalabas dito ang iyong mga kalapit na robot.';

  @override
  String get signalStrong => 'Malakas';

  @override
  String get signalGood => 'Mabuti';

  @override
  String get signalWeak => 'Mahina';

  @override
  String get addRobotIntro =>
      'Pumili ng robot sa ibaba upang ipares. Awtomatikong matutuklasan sa itaas ang anumang kalapit na robot sa mode ng pagpapares.';

  @override
  String get autoDiscoveredRobot => 'AUTO DISCOVERED ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTO DISCOVERED ROBOTS';

  @override
  String readyCountBadge(Object count) {
    return '$count HANDA';
  }

  @override
  String get supportedRobots => 'SUPPORTED ROBOTS';

  @override
  String get clothesFoldingRobot => 'Robot na natitiklop ng damit';

  @override
  String get fabricaDescription =>
      'Naka-automate na folder ng damit na may mga multi-garment preset at tactile single-button na operasyon.';

  @override
  String get fabricaPairingHint =>
      'Mode ng pagpapares: Pindutin nang matagal ang anumang button sa control panel ng Fabrica sa loob ng 3 segundo (Mabilis na kumukurap ang LED ng Status).';

  @override
  String get pairFabricaNow => 'Ipares ang FABRICA NGAYON';

  @override
  String get backToHome => 'Bumalik sa Bahay';

  @override
  String get connReady => 'HANDA';

  @override
  String get connConnecting => 'PAGKUWENTO';

  @override
  String get connDiscovering => 'PAGTUKLAS';

  @override
  String get connBonding => 'PAGBABALIK';

  @override
  String get connScanning => 'PAG-SCAN';

  @override
  String get connDisconnected => 'DISCONNECTED';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Idiskonekta mula sa $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Maaari kang muling kumonekta anumang oras mula sa home screen.';

  @override
  String get cancelButton => 'KANSELAHIN';

  @override
  String get saveButton => 'MAGTIPID';

  @override
  String get customNickname => 'Custom na Palayaw';

  @override
  String unpairConfirmTitle(Object name) {
    return 'I-unpair ang $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Aalisin nito ang $name mula sa Iyong Mga Robot sa teleponong ito. Maaari mo itong muling idagdag anumang oras.\n\nTandaan: Upang ganap na punasan ang memorya ng robot at ibalik ang mga default ng pabrika, gamitin ang \"Factory Reset\".';
  }

  @override
  String get unpairButton => 'UNPAS';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'TAKBO';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'ERROR';

  @override
  String get machineCalibrating => 'PAG-CALIBRATING';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'NA-SAVE';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'PAGPAPASAMA';

  @override
  String get ledConnected => 'KONEKTADO';

  @override
  String get ledIdentify => 'MAKILALA';

  @override
  String get identifyButton => 'MAKILALA';

  @override
  String get identifyingToast =>
      'Kumikislap na robot LED sa loob ng 3 segundo...';

  @override
  String get homingToast => 'Homing lahat ng flaps...';

  @override
  String get i2cFault => 'I2C FAULT';

  @override
  String get storageFault => 'KASALANAN SA Imbakan';

  @override
  String get estopLatched => 'E-STOP LATCHED';

  @override
  String get presetButtonsTitle => 'PRESET BUTTONS';

  @override
  String customizePresetTitle(Object label) {
    return 'I-customize ang $label';
  }

  @override
  String get subtitleNameLabel => 'Pangalan ng Subtitle';

  @override
  String get subtitleNameHint => 'hal. Quick Fold, Shirts, Custom...';

  @override
  String get buttonColorLabel => 'Kulay ng Pindutan';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Hakbang $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'EMERGENCY STOP';

  @override
  String get clearEstop => 'CLEAR & UNLATCH E-STOP';

  @override
  String get clearEstopHint =>
      'Nire-reset ang emergency stop at ibinalik ang robot sa Idle';

  @override
  String get stopButton => 'TUMIGIL';

  @override
  String get fabricaArrangementTitle => 'FABRICA ARRANGEMENT';

  @override
  String get editArrangement => 'EDIT ARRANGEMENT';

  @override
  String get addPanel => 'MAGDAGDAG NG PANELO';

  @override
  String get legendMotorized => 'Nakamotor';

  @override
  String get legendFollower => 'Tagasunod';

  @override
  String get legendBase => 'Base';

  @override
  String get colsLabel => 'Sinabi ni Cols';

  @override
  String get rowsLabel => 'Mga hilera';

  @override
  String stepSelectedHint(Object step) {
    return 'Hakbang $step pinili: I-tap ang 1–2 Motorized panel sa grid';
  }

  @override
  String get tapPanelsHint => 'I-tap ang 1–2 motor panel sa grid';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Nangangailangan ng hindi bababa sa 1 motorized panel (max 2)';

  @override
  String get selectedChangePanelsHint =>
      'Napili • I-tap ang mga grid panel para baguhin (max 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Hakbang $step ng $total';
  }

  @override
  String get removeStepTooltip => 'Alisin ang Hakbang';

  @override
  String get requiresMotorizedModuleWarning =>
      'Ang gawain ay nangangailangan ng kahit isang Motorized module mula sa Fabrica Arrangement.';

  @override
  String get routineFull => 'BUONG ROUTINE (16/16 STEPS)';

  @override
  String addStepCount(Object count) {
    return 'MAGDAGDAG NG HAKBANG ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'I-save ang Routine sa Robot';

  @override
  String get selectButtonToProgram =>
      'Pumili ng isang pisikal na robot na pindutan upang iprograma gamit ang gawaing ito:';

  @override
  String buttonNumber(Object slot) {
    return 'Button $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Button ng Hardware $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Button $slot Subtitle (Opsyonal)';
  }

  @override
  String get saveToRobotButton => 'I-SAVE SA ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Button $slot ($count hakbang)';
  }

  @override
  String get adultTshirtTemplate => 'Template ng Pang-adultong T-Shirt';

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
    return '$count IPAres';
  }

  @override
  String get moreHardwareOptions => 'Higit pang Mga Opsyon sa Hardware';

  @override
  String get loadTemplate => 'I-load ang Template';

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
