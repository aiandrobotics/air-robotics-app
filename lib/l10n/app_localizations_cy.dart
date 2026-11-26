// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Welsh (`cy`).
class AppLocalizationsCy extends AppLocalizations {
  AppLocalizationsCy([String locale = 'cy']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Gosodiadau';

  @override
  String get appLanguageTitle => 'Iaith Ap';

  @override
  String get appVersionTitle => 'Fersiwn App';

  @override
  String get languageSectionTitle => 'Iaith';

  @override
  String get languageSystemDefault => 'System ddiofyn (Iaith Dyfais)';

  @override
  String get selectLanguageHint => 'Dewiswch iaith';

  @override
  String get addDeviceTitle => 'YCHWANEGU ROBOT NEWYDD';

  @override
  String get addDeviceSubtitle => 'Pâr o robotiaid AIR';

  @override
  String get yourRobots => 'EICH ROBOTS';

  @override
  String get discoveredRobots => 'DARGANFOD ROBOTAU';

  @override
  String get noRobotsPairedYet => 'Dim Robotiaid wedi\'u Pâr Eto';

  @override
  String get noRobotsPairedSubtitle =>
      'Cysylltwch eich robot i weld telemetreg, rheoli rhagosodiadau, a rheoli gweithrediadau.';

  @override
  String get addYourFirstRobot => 'YCHWANEGWCH EICH ROBOT CYNTAF';

  @override
  String get autoScanning => 'Awto-Sganio';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'Rheolaeth';

  @override
  String get tabSequencer => 'dilyniannwr';

  @override
  String get tabCalibrator => 'Calibradwr';

  @override
  String get tabDiagnostics => 'Diagnosteg';

  @override
  String get renameRobot => 'Ailenwi Robot';

  @override
  String get bleDiagnostics => 'Diagnosteg BLE';

  @override
  String get erasePresets => 'Dileu Rhagosodiadau Cadw';

  @override
  String get disconnect => 'Datgysylltu';

  @override
  String get unpairRobot => 'Robot Unpar';

  @override
  String get factoryReset => 'Ailosod Ffatri';

  @override
  String get servoManualJog => 'JOG LLAWLYFR SERVO';

  @override
  String get homeAll => 'CARTREF PAWB';

  @override
  String get foldingTimeline => 'AMSER PLWYO';

  @override
  String get addStep => 'YCHWANEGU CAM';

  @override
  String get previewOnRobot => 'RHAGOLWG AR ROBOT';

  @override
  String get saveToButton => 'ARBED I\'R BOTWM';

  @override
  String get themeTitle => 'Thema';

  @override
  String get themeSystem => 'Dyfais';

  @override
  String get themeLight => 'Ysgafn';

  @override
  String get themeDark => 'Tywyll';

  @override
  String get connectedBadge => 'CYSYLLTIEDIG';

  @override
  String get inRangeBadge => 'YN YSTOD';

  @override
  String get offlineBadge => 'AR-LEIN';

  @override
  String get openButton => 'AGORED';

  @override
  String get connectButton => 'CYSYLLTU';

  @override
  String get reconnectButton => 'ADGYFODIAD';

  @override
  String get pairAndConnect => 'PAIR & CYSYLLTIAD';

  @override
  String get autoScanningForRobots => 'Sganio awtomatig am robotiaid...';

  @override
  String get scanningIdle => 'Sganio yn segur';

  @override
  String get nearbyRobotsAppear =>
      'Bydd robotiaid cyfagos yn ymddangos yma yn awtomatig.';

  @override
  String get yourNearbyRobotsAppear =>
      'Bydd eich robotiaid cyfagos yn ymddangos yma yn awtomatig.';

  @override
  String get signalStrong => 'Cryf';

  @override
  String get signalGood => 'Da';

  @override
  String get signalWeak => 'Gwan';

  @override
  String get addRobotIntro =>
      'Dewiswch robot isod i baru. Bydd unrhyw robot cyfagos yn y modd paru yn cael ei ddarganfod yn awtomatig ar y brig.';

  @override
  String get autoDiscoveredRobot => 'AUTO DARGANFOD ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTO DARGANFOD ROBOTS';

  @override
  String readyCountBadge(Object count) {
    return '$count BAROD';
  }

  @override
  String get supportedRobots => 'ROBOTAU CEFNOGAETHOL';

  @override
  String get clothesFoldingRobot => 'Robot Plygu Dillad';

  @override
  String get fabricaDescription =>
      'Ffolder dilledyn awtomataidd gyda rhagosodiadau aml-ddilledyn a gweithrediad un botwm cyffyrddol.';

  @override
  String get fabricaPairingHint =>
      'Modd paru: Pwyswch a daliwch unrhyw fotwm ar banel rheoli Fabrica am 3 eiliad (bydd Statws LED yn blincio\'n gyflym).';

  @override
  String get pairFabricaNow => 'PAIR FABRICA YN AWR';

  @override
  String get backToHome => 'Yn ôl i Gartref';

  @override
  String get connReady => 'BAROD';

  @override
  String get connConnecting => 'CYSYLLTU';

  @override
  String get connDiscovering => 'DARGANFOD';

  @override
  String get connBonding => 'BONDIO';

  @override
  String get connScanning => 'SGANIO';

  @override
  String get connDisconnected => 'DATGUDDEDIG';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Datgysylltu o $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Gallwch ailgysylltu unrhyw bryd o\'r sgrin gartref.';

  @override
  String get cancelButton => 'CANSLO';

  @override
  String get saveButton => 'ARBED';

  @override
  String get customNickname => 'Llysenw Personol';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Di-bâr $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Bydd hyn yn tynnu $name o Your Robots ar y ffôn hwn. Gallwch ei ail-ychwanegu unrhyw bryd.\n\nNodyn: I sychu cof robot yn llwyr ac adfer rhagosodiadau ffatri, defnyddiwch \"Ailosod Ffatri\".';
  }

  @override
  String get unpairButton => 'ANGHYWIR';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'RHEDEG';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'GWALL';

  @override
  String get machineCalibrating => 'CALIBRAU';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'ARBED';

  @override
  String get ledInputErr => 'Mewnbynnu ERR';

  @override
  String get ledPairing => 'PARU';

  @override
  String get ledConnected => 'CYSYLLTIEDIG';

  @override
  String get ledIdentify => 'ADNABOD';

  @override
  String get identifyButton => 'ADNABOD';

  @override
  String get identifyingToast => 'Robot LED sy\'n fflachio am 3 eiliad...';

  @override
  String get homingToast => 'Cartrefu pob fflap...';

  @override
  String get i2cFault => 'I2C FAINT';

  @override
  String get storageFault => 'FFYDD STORIO';

  @override
  String get estopLatched => 'E-STOP LATCHED';

  @override
  String get presetButtonsTitle => 'BOTYMAU RHAGOSOD';

  @override
  String customizePresetTitle(Object label) {
    return 'Addasu $label';
  }

  @override
  String get subtitleNameLabel => 'Enw Isdeitl';

  @override
  String get subtitleNameHint => 'e.e. Plygiad Cyflym, Crysau, Custom ...';

  @override
  String get buttonColorLabel => 'Lliw Botwm';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Cam $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'AROS ARGYFWNG';

  @override
  String get clearEstop => 'E-STOP GLIR A DATGELU';

  @override
  String get clearEstopHint =>
      'Yn ailosod stop brys ac yn dychwelyd robot i Idle';

  @override
  String get stopButton => 'AROS';

  @override
  String get fabricaArrangementTitle => 'TREFN FABRICA';

  @override
  String get editArrangement => 'TREFN GOLWG';

  @override
  String get addPanel => 'YCHWANEGU PANEL';

  @override
  String get legendMotorized => 'Modurol';

  @override
  String get legendFollower => 'Dilynwr';

  @override
  String get legendBase => 'Sylfaen';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Rhesi';

  @override
  String stepSelectedHint(Object step) {
    return 'Cam $step a ddewiswyd: Tapiwch 1–2 banel Modur ar y grid';
  }

  @override
  String get tapPanelsHint => 'Tapiwch 1–2 banel modur ar y grid';

  @override
  String get dualBadge => 'DUW';

  @override
  String get requiresMotorizedPanel =>
      'Angen o leiaf 1 panel modur (2 ar y mwyaf)';

  @override
  String get selectedChangePanelsHint =>
      'Wedi\'i ddewis • Tapiwch baneli grid i\'w newid (2 ar y mwyaf)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Cam $step o $total';
  }

  @override
  String get removeStepTooltip => 'Dileu Step';

  @override
  String get requiresMotorizedModuleWarning =>
      'Mae arferol yn gofyn am o leiaf un modiwl Modur o Fabrica Arrangement.';

  @override
  String get routineFull => 'ARFEROL LLAWN (16/16 CAMAU)';

  @override
  String addStepCount(Object count) {
    return 'YCHWANEGU CAM ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Arbed Arferol i Robot';

  @override
  String get selectButtonToProgram =>
      'Dewiswch fotwm robot corfforol i raglennu gyda\'r drefn hon:';

  @override
  String buttonNumber(Object slot) {
    return 'Botwm $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Botwm Caledwedd $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Botwm $slot Is-deitl (Dewisol)';
  }

  @override
  String get saveToRobotButton => 'ARBED I ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Botwm $slot ($count camau)';
  }

  @override
  String get adultTshirtTemplate => 'Templed Crys T Oedolion';

  @override
  String get longSleeveTemplate => 'Templed Llawes Hir';

  @override
  String get dualSweepTemplate => 'Templed Ysgubo Deuol';

  @override
  String channelNumber(Object number) {
    return 'Sianel $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PAIRI';
  }

  @override
  String get moreHardwareOptions => 'Mwy o Opsiynau Caledwedd';

  @override
  String get loadTemplate => 'Llwytho Templed';

  @override
  String get controllerLabel => 'RHEOLWR';

  @override
  String get motorBadge => 'MODUR';

  @override
  String get followerBadge => 'DILYNYDD';

  @override
  String get baseBadge => 'SAIL';

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
