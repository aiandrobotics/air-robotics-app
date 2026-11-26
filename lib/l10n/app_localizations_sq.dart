// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Cilësimet';

  @override
  String get appLanguageTitle => 'Gjuha e aplikacionit';

  @override
  String get appVersionTitle => 'Versioni i aplikacionit';

  @override
  String get languageSectionTitle => 'Gjuha';

  @override
  String get languageSystemDefault =>
      'Parazgjedhja e sistemit (Gjuha e pajisjes)';

  @override
  String get selectLanguageHint => 'Zgjidhni një gjuhë';

  @override
  String get addDeviceTitle => 'SHTO ROBOT I RI';

  @override
  String get addDeviceSubtitle => 'Çiftoni robotët AIR';

  @override
  String get yourRobots => 'ROBOTËT TUAJ';

  @override
  String get discoveredRobots => 'ROBOTËT E ZBULUAR';

  @override
  String get noRobotsPairedYet => 'Asnjë robot nuk është çiftuar ende';

  @override
  String get noRobotsPairedSubtitle =>
      'Lidhni robotin tuaj për të parë telemetrinë, për të menaxhuar paracaktimet dhe për të kontrolluar operacionet.';

  @override
  String get addYourFirstRobot => 'SHTO ROBOTIN TUAJ TË PARË';

  @override
  String get autoScanning => 'AUTO-SKANIM';

  @override
  String get idleStatus => 'PATARE';

  @override
  String get tabControl => 'Kontrolli';

  @override
  String get tabSequencer => 'Sekuencer';

  @override
  String get tabCalibrator => 'Kalibrator';

  @override
  String get tabDiagnostics => 'Diagnostifikimi';

  @override
  String get renameRobot => 'Riemërto robotin';

  @override
  String get bleDiagnostics => 'Diagnostikimi BLE';

  @override
  String get erasePresets => 'Fshini paracaktimet e ruajtura';

  @override
  String get disconnect => 'Shkëputeni';

  @override
  String get unpairRobot => 'Ççiftoje robotin';

  @override
  String get factoryReset => 'Rivendosja e fabrikës';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'SHTËPI TË GJITHA';

  @override
  String get foldingTimeline => 'KONTROLLI I PALOSUR';

  @override
  String get addStep => 'SHTO HAPI';

  @override
  String get previewOnRobot => 'PARAPRAKE NE ROBOT';

  @override
  String get saveToButton => 'RUAJTJE TE BUTONIN';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Pajisja';

  @override
  String get themeLight => 'Drita';

  @override
  String get themeDark => 'E errët';

  @override
  String get connectedBadge => 'I LIDHUR';

  @override
  String get inRangeBadge => 'NË GAME';

  @override
  String get offlineBadge => 'JONLINE';

  @override
  String get openButton => 'HAPUR';

  @override
  String get connectButton => 'LIDHJE';

  @override
  String get reconnectButton => 'RILIDHET';

  @override
  String get pairAndConnect => 'CIFITO DHE LIDH';

  @override
  String get autoScanningForRobots => 'Skanim automatik për robotët...';

  @override
  String get scanningIdle => 'Skanimi është i papunë';

  @override
  String get nearbyRobotsAppear =>
      'Robotët në afërsi do të shfaqen këtu automatikisht.';

  @override
  String get yourNearbyRobotsAppear =>
      'Robotët tuaj në afërsi do të shfaqen këtu automatikisht.';

  @override
  String get signalStrong => 'I forte';

  @override
  String get signalGood => 'Mirë';

  @override
  String get signalWeak => 'I dobët';

  @override
  String get addRobotIntro =>
      'Zgjidhni një robot më poshtë për ta çiftuar. Çdo robot afër në modalitetin e çiftimit do të zbulohet automatikisht në krye.';

  @override
  String get autoDiscoveredRobot => 'ROBOTI I ZBULUAR AUTO';

  @override
  String get autoDiscoveredRobots => 'ROBOTËT E ZBULUAR AUTO';

  @override
  String readyCountBadge(Object count) {
    return '$count GATI';
  }

  @override
  String get supportedRobots => 'ROBOTË TË MBËSHTETUR';

  @override
  String get clothesFoldingRobot => 'Robot me palosje rrobash';

  @override
  String get fabricaDescription =>
      'Dosja e automatizuar e veshjeve me paravendosje me shumë veshje dhe funksionim i prekshëm me një buton.';

  @override
  String get fabricaPairingHint =>
      'Modaliteti i çiftimit: Shtypni dhe mbani çdo buton në panelin e kontrollit Fabrica për 3 sekonda (LED-ja e statusit do të pulsojë me shpejtësi).';

  @override
  String get pairFabricaNow => 'PAQET Pëlhura TANI';

  @override
  String get backToHome => 'Kthehu në shtëpi';

  @override
  String get connReady => 'GATI';

  @override
  String get connConnecting => 'LIDHJE';

  @override
  String get connDiscovering => 'ZBULOJA';

  @override
  String get connBonding => 'LIDHJA';

  @override
  String get connScanning => 'Skanimi';

  @override
  String get connDisconnected => 'SHKYQET';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Shkëputeni nga $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Mund të rilidhesh në çdo kohë nga ekrani bazë.';

  @override
  String get cancelButton => 'ANULON';

  @override
  String get saveButton => 'RUAJ';

  @override
  String get customNickname => 'Pseudonimi i personalizuar';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Të anulohet çiftimi $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Kjo do të heqë $name nga robotët tuaj në këtë telefon. Mund ta ri-shtosh në çdo kohë.\n\nShënim: Për të fshirë plotësisht kujtesën e robotit dhe për të rivendosur standardet e fabrikës, përdorni \"Rivendosja e fabrikës\".';
  }

  @override
  String get unpairButton => 'ÇÇIFTROJ';

  @override
  String get machineIdle => 'PATARE';

  @override
  String get machineRunning => 'Vrapimi';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'GABIM';

  @override
  String get machineCalibrating => 'KALIBRIMI';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'RUAJTUR';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'CIFTIMI';

  @override
  String get ledConnected => 'I LIDHUR';

  @override
  String get ledIdentify => 'IDENTIFIKONI';

  @override
  String get identifyButton => 'Identifikimi';

  @override
  String get identifyingToast => 'Roboti LED ndezës për 3 sekonda...';

  @override
  String get homingToast => 'Mbështetja e të gjitha pallateve...';

  @override
  String get i2cFault => 'FAJI I2C';

  @override
  String get storageFault => 'FAJI RUAJTJES';

  @override
  String get estopLatched => 'E-STOP E MBLEDHUR';

  @override
  String get presetButtonsTitle => 'BUTONAT PARAPRAKUR';

  @override
  String customizePresetTitle(Object label) {
    return 'Personalizo $label';
  }

  @override
  String get subtitleNameLabel => 'Emri i titrave';

  @override
  String get subtitleNameHint =>
      'p.sh. Palosja e shpejtë, këmisha, me porosi...';

  @override
  String get buttonColorLabel => 'Ngjyra e butonit';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Hapi $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'STOP EMERGJENCE';

  @override
  String get clearEstop => 'E-STOP CLEAR & SHKELQE';

  @override
  String get clearEstopHint =>
      'Rivendos ndalimin e urgjencës dhe e kthen robotin në gjendje të papunë';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'RREGULLIM FABRICA';

  @override
  String get editArrangement => 'EDIT ARANGEMENT';

  @override
  String get addPanel => 'SHTO PANELI';

  @override
  String get legendMotorized => 'I motorizuar';

  @override
  String get legendFollower => 'Ndjekësi';

  @override
  String get legendBase => 'Baza';

  @override
  String get colsLabel => 'Kolonat';

  @override
  String get rowsLabel => 'Rreshtat';

  @override
  String stepSelectedHint(Object step) {
    return 'Hapi $step i zgjedhur: Prekni 1–2 Panele të motorizuara në rrjet';
  }

  @override
  String get tapPanelsHint => 'Prekni 1–2 panele motorike në rrjet';

  @override
  String get dualBadge => 'DYFISHTE';

  @override
  String get requiresMotorizedPanel =>
      'Kërkon të paktën 1 panel të motorizuar (maksimumi 2)';

  @override
  String get selectedChangePanelsHint =>
      'Zgjedhur • Prekni panelet e rrjetës për të ndryshuar (maksimumi 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Hapi $step nga $total';
  }

  @override
  String get removeStepTooltip => 'Hiq hapin';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutina kërkon të paktën një modul të motorizuar nga Fabrica Arrangement.';

  @override
  String get routineFull => 'RUTINA E PLOTË (16/16 HAPA)';

  @override
  String addStepCount(Object count) {
    return 'SHTO HAPI ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Ruani rutinën në robot';

  @override
  String get selectButtonToProgram =>
      'Zgjidhni një buton robot fizik për të programuar me këtë rutinë:';

  @override
  String buttonNumber(Object slot) {
    return 'Butoni $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Butoni i harduerit $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Butoni $slot Titra (opsionale)';
  }

  @override
  String get saveToRobotButton => 'RUAJI NË ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Butoni $slot ($count hapa)';
  }

  @override
  String get adultTshirtTemplate => 'Shablloni i bluzave për të rritur';

  @override
  String get longSleeveTemplate => 'Modeli me mëngë të gjata';

  @override
  String get dualSweepTemplate => 'Modeli i fshirjes së dyfishtë';

  @override
  String channelNumber(Object number) {
    return 'Kanali $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count CILETUAR';
  }

  @override
  String get moreHardwareOptions => 'Më shumë opsione harduerike';

  @override
  String get loadTemplate => 'Ngarko shabllonin';

  @override
  String get controllerLabel => 'KONTROLLUESI';

  @override
  String get motorBadge => 'MOTORIKE';

  @override
  String get followerBadge => 'NDJEKES';

  @override
  String get baseBadge => 'BAZË';

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
