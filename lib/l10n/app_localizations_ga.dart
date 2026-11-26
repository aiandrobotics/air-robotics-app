// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Irish (`ga`).
class AppLocalizationsGa extends AppLocalizations {
  AppLocalizationsGa([String locale = 'ga']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Socruithe';

  @override
  String get appLanguageTitle => 'Teanga App';

  @override
  String get appVersionTitle => 'Leagan App';

  @override
  String get languageSectionTitle => 'Teanga';

  @override
  String get languageSystemDefault =>
      'Réamhshocrú an Chórais (Teanga an Ghléis)';

  @override
  String get selectLanguageHint => 'Roghnaigh teanga';

  @override
  String get addDeviceTitle => 'CUIR robot NUA';

  @override
  String get addDeviceSubtitle => 'Péire robots AIR';

  @override
  String get yourRobots => 'DO róbait';

  @override
  String get discoveredRobots => 'RÓBAIS A CHUIREADH';

  @override
  String get noRobotsPairedYet => 'Uimh Robots Péireáilte Fós';

  @override
  String get noRobotsPairedSubtitle =>
      'Ceangail do róbat chun teiliméadracht a fheiceáil, réamhshocruithe a bhainistiú agus oibríochtaí a rialú.';

  @override
  String get addYourFirstRobot => 'Cuir DO CHÉAD robot leis';

  @override
  String get autoScanning => 'Uath-scanadh';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'Rialú';

  @override
  String get tabSequencer => 'seicheamhóir';

  @override
  String get tabCalibrator => 'Calabraitheoir';

  @override
  String get tabDiagnostics => 'Diagnóisic';

  @override
  String get renameRobot => 'Athainmnigh Robot';

  @override
  String get bleDiagnostics => 'Diagnóisic BLE';

  @override
  String get erasePresets => 'Scrios Réamhshocruithe Sábháilte';

  @override
  String get disconnect => 'Dícheangail';

  @override
  String get unpairRobot => 'Robot gan phéire';

  @override
  String get factoryReset => 'Athshocrú Monarcha';

  @override
  String get servoManualJog => 'SERVO LÁMHLEABHAR Jog';

  @override
  String get homeAll => 'BAILE GACH';

  @override
  String get foldingTimeline => 'AMHRÁN FHOSTAITHE';

  @override
  String get addStep => 'CUIR CÉIM';

  @override
  String get previewOnRobot => 'RÉAMHRÁ FAOI ROBOT';

  @override
  String get saveToButton => 'SÁBHÁIL CHUIG CNAIPÍ';

  @override
  String get themeTitle => 'Téama';

  @override
  String get themeSystem => 'Gléas';

  @override
  String get themeLight => 'Solas';

  @override
  String get themeDark => 'Dorcha';

  @override
  String get connectedBadge => 'NASCADH';

  @override
  String get inRangeBadge => 'I RAON';

  @override
  String get offlineBadge => 'AS-LÍNE';

  @override
  String get openButton => 'OSCAILTE';

  @override
  String get connectButton => 'CONNECT';

  @override
  String get reconnectButton => 'REONNECT';

  @override
  String get pairAndConnect => 'PAIR & CONNECT';

  @override
  String get autoScanningForRobots => 'Auto-scanadh le haghaidh robots. .';

  @override
  String get scanningIdle => 'Scanadh díomhaoin';

  @override
  String get nearbyRobotsAppear =>
      'Beidh robots in aice láimhe le feiceáil anseo go huathoibríoch.';

  @override
  String get yourNearbyRobotsAppear =>
      'Beidh do róbait in aice láimhe le feiceáil anseo go huathoibríoch.';

  @override
  String get signalStrong => 'Láidir';

  @override
  String get signalGood => 'Maith';

  @override
  String get signalWeak => 'Lag';

  @override
  String get addRobotIntro =>
      'Roghnaigh róbat thíos le péireáil. Gheobhaidh tú amach go huathoibríoch ag an mbarr aon róbat in aice láimhe atá i mód péireála.';

  @override
  String get autoDiscoveredRobot => 'Uathfhaighte robot';

  @override
  String get autoDiscoveredRobots => 'Uathfhaighte róbait';

  @override
  String readyCountBadge(Object count) {
    return '$count LÉACHT';
  }

  @override
  String get supportedRobots => 'Robots TACAITHE';

  @override
  String get clothesFoldingRobot => 'Robot Fillte Éadaí';

  @override
  String get fabricaDescription =>
      'Fillteán éadaigh uathoibrithe le réamhshocruithe il-éadaigh agus oibríocht aon-chnaipe tadhlach.';

  @override
  String get fabricaPairingHint =>
      'Modh péireála: Brúigh agus coinnigh aon chnaipe ar phainéal rialaithe Fabrica ar feadh 3 soicind (beidh Stádas LED ag caochadh go tapa).';

  @override
  String get pairFabricaNow => 'PAIR FABRICA ANOIS';

  @override
  String get backToHome => 'Ar Ais go Baile';

  @override
  String get connReady => 'LÉACHT';

  @override
  String get connConnecting => 'AG CEANGAL';

  @override
  String get connDiscovering => 'AG FAISNÉISIÚ';

  @override
  String get connBonding => 'NASCADH';

  @override
  String get connScanning => 'SCANNÁN';

  @override
  String get connDisconnected => 'DÍCHEARTAITHE';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Dícheangail ó $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Is féidir leat athcheangal am ar bith ón scáileán baile.';

  @override
  String get cancelButton => 'CEAL';

  @override
  String get saveButton => 'SAVE';

  @override
  String get customNickname => 'Leasainm Saincheaptha';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Gan péire $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Bainfidh sé seo $name de Your Robots ar an bhfón seo. Is féidir leat é a athchur ag am ar bith.\n\nNóta: Chun cuimhne róbait a ghlanadh go hiomlán agus mainneachtainí monarchan a athbhunú, bain úsáid as \"Athshocraigh Monarcha\".';
  }

  @override
  String get unpairButton => 'UNPAIR';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'REATHA';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'EARRÁID';

  @override
  String get machineCalibrating => 'CALIBRATING';

  @override
  String ledLabel(Object state) {
    return 'stiúir: $state';
  }

  @override
  String get ledSaved => 'SÁBHÁILTE';

  @override
  String get ledInputErr => 'IONCHUR ERR';

  @override
  String get ledPairing => 'PÁIRTEACHT';

  @override
  String get ledConnected => 'NASCADH';

  @override
  String get ledIdentify => 'AITHEANTA';

  @override
  String get identifyButton => 'AITHEANTA';

  @override
  String get identifyingToast => 'Robot gealánach LED ar feadh 3 soicind...';

  @override
  String get homingToast => 'Ag fanacht le gach flap...';

  @override
  String get i2cFault => 'I2C LAOIDH';

  @override
  String get storageFault => 'LUCHT STÓRTHA';

  @override
  String get estopLatched => 'E-STOP LATCHED';

  @override
  String get presetButtonsTitle => 'Cnaipí réamhshocraithe';

  @override
  String customizePresetTitle(Object label) {
    return 'Saincheap $label';
  }

  @override
  String get subtitleNameLabel => 'Ainm Fotheideal';

  @override
  String get subtitleNameHint => 'e.g. Fill Tapa, Léinte, Saincheaptha...';

  @override
  String get buttonColorLabel => 'Dath Cnaipe';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Céim $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'STOP ÉIGEANDÁLA';

  @override
  String get clearEstop => 'GLÉAR & DÍOLAIGH E-STOP';

  @override
  String get clearEstopHint =>
      'Athshocraigh stad éigeandála agus filleann róbat go Díomhaoin';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'RIARACHÁN FABRICA';

  @override
  String get editArrangement => 'SOCRÚ Eagar';

  @override
  String get addPanel => 'CUIR PAINÉAL';

  @override
  String get legendMotorized => 'Mótaraithe';

  @override
  String get legendFollower => 'Leantóir';

  @override
  String get legendBase => 'Bonn';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Sraitheanna';

  @override
  String stepSelectedHint(Object step) {
    return 'Céim $step roghnaithe: Tapáil 1–2 phainéal mótair ar an eangach';
  }

  @override
  String get tapPanelsHint => 'Tapáil 1–2 phainéal mótair ar an ngreille';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Teastaíonn 1 phainéal mótair ar a laghad (2 ar a mhéad)';

  @override
  String get selectedChangePanelsHint =>
      'Roghnaithe • Tapáil painéil ghreille le hathrú (2 ar a mhéad)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Céim $step de $total';
  }

  @override
  String get removeStepTooltip => 'Bain Céim';

  @override
  String get requiresMotorizedModuleWarning =>
      'Éilíonn gnáthamh modúl Mótaraithe amháin ar a laghad ó Shocrú Fabrica.';

  @override
  String get routineFull => 'GNÓTHACH IOMLÁN (16/16 CÉIMEANNA)';

  @override
  String addStepCount(Object count) {
    return 'CUIR CÉIM ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Sábháil Gnáthamh a Robot';

  @override
  String get selectButtonToProgram =>
      'Roghnaigh cnaipe fisiciúil róbait le ríomhchlárú leis an ngnáthamh seo:';

  @override
  String buttonNumber(Object slot) {
    return 'Cnaipe $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Cnaipe Crua-earraí $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Cnaipe $slot Fotheideal (Roghnach)';
  }

  @override
  String get saveToRobotButton => 'SAVE GO ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Cnaipe $slot (céimeanna $count)';
  }

  @override
  String get adultTshirtTemplate => 'Teimpléad T-léine Aosach';

  @override
  String get longSleeveTemplate => 'Teimpléad Muinchille Fada';

  @override
  String get dualSweepTemplate => 'Teimpléad Scuab Dual';

  @override
  String channelNumber(Object number) {
    return 'Cainéal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PÁIRTITHE';
  }

  @override
  String get moreHardwareOptions => 'Tuilleadh Roghanna Crua-earraí';

  @override
  String get loadTemplate => 'Luchtaigh Teimpléad';

  @override
  String get controllerLabel => 'RIALUITHEOIR';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'Leantóir';

  @override
  String get baseBadge => 'BÁS';

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
