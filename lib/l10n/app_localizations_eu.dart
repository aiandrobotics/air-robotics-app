// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class AppLocalizationsEu extends AppLocalizations {
  AppLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Ezarpenak';

  @override
  String get appLanguageTitle => 'Aplikazioaren hizkuntza';

  @override
  String get appVersionTitle => 'Aplikazioaren bertsioa';

  @override
  String get languageSectionTitle => 'Hizkuntza';

  @override
  String get languageSystemDefault =>
      'Sistemaren lehenetsia (gailuaren hizkuntza)';

  @override
  String get selectLanguageHint => 'Aukeratu hizkuntza bat';

  @override
  String get addDeviceTitle => 'GEHITU ROBOT BERRIA';

  @override
  String get addDeviceSubtitle => 'Parekatu AIR robotak';

  @override
  String get yourRobots => 'ZURE ROBOTAK';

  @override
  String get discoveredRobots => 'ROBOTS EZAGUTU';

  @override
  String get noRobotsPairedYet => 'Oraindik ez dago robotik parekatuta';

  @override
  String get noRobotsPairedSubtitle =>
      'Konektatu robota telemetria ikusteko, aurrezarpenak kudeatzeko eta eragiketak kontrolatzeko.';

  @override
  String get addYourFirstRobot => 'GEHITU ZURE LEHEN ROBOTA';

  @override
  String get autoScanning => 'AUTO-ESKANETA';

  @override
  String get idleStatus => 'NAGUSIA';

  @override
  String get tabControl => 'Kontrola';

  @override
  String get tabSequencer => 'Sekuentziatzailea';

  @override
  String get tabCalibrator => 'Kalibragailua';

  @override
  String get tabDiagnostics => 'Diagnostikoak';

  @override
  String get renameRobot => 'Aldatu izena Robot';

  @override
  String get bleDiagnostics => 'BLE Diagnostikoa';

  @override
  String get erasePresets => 'Ezabatu gordetako aurrezarpenak';

  @override
  String get disconnect => 'Deskonektatu';

  @override
  String get unpairRobot => 'Desparekatu robota';

  @override
  String get factoryReset => 'Fabrika berrezarri';

  @override
  String get servoManualJog => 'SERVO ESKULIBURUA JOG';

  @override
  String get homeAll => 'ETXERA GUZTIAK';

  @override
  String get foldingTimeline => 'KRONOLOGIA TOLESGARRIA';

  @override
  String get addStep => 'GEHITU URRATSA';

  @override
  String get previewOnRobot => 'AURRENTZIA ROBOTEAN';

  @override
  String get saveToButton => 'GORDE BOTOIAN';

  @override
  String get themeTitle => 'Gaia';

  @override
  String get themeSystem => 'Gailua';

  @override
  String get themeLight => 'Argia';

  @override
  String get themeDark => 'Iluna';

  @override
  String get connectedBadge => 'KONEKTATUTA';

  @override
  String get inRangeBadge => 'BARRUTAN';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'IREKI';

  @override
  String get connectButton => 'KONEKTATU';

  @override
  String get reconnectButton => 'BERRIZ KONEKTATU';

  @override
  String get pairAndConnect => 'PAREKATUA ETA KONEKTATU';

  @override
  String get autoScanningForRobots => 'Roboten bilatze automatikoa...';

  @override
  String get scanningIdle => 'Inaktibo eskaneatzen';

  @override
  String get nearbyRobotsAppear =>
      'Inguruko robotak automatikoki agertuko dira hemen.';

  @override
  String get yourNearbyRobotsAppear =>
      'Zure inguruko robotak automatikoki agertuko dira hemen.';

  @override
  String get signalStrong => 'Indartsua';

  @override
  String get signalGood => 'Ona';

  @override
  String get signalWeak => 'Ahul';

  @override
  String get addRobotIntro =>
      'Hautatu beheko robot bat parekatzeko. Parekatzeko moduan dagoen inguruko edozein robot automatikoki topatuko da goialdean.';

  @override
  String get autoDiscoveredRobot => 'AUTO AURKITU DUEN ROBOTA';

  @override
  String get autoDiscoveredRobots => 'AUTO AURKITU DUEN ROBOTS';

  @override
  String readyCountBadge(Object count) {
    return '$count PREST';
  }

  @override
  String get supportedRobots => 'LAGUNTZAKO ROBOTS';

  @override
  String get clothesFoldingRobot => 'Arropa Tolesteko Robota';

  @override
  String get fabricaDescription =>
      'Arropa karpeta automatizatua, arropa anitzeko aurrezarpenak eta ukipenezko botoi bakarreko funtzionamenduarekin.';

  @override
  String get fabricaPairingHint =>
      'Parekatzeko modua: Luze sakatu Fabricako kontrol-paneleko edozein botoi 3 segundoz (egoera LEDa azkar keinu egingo da).';

  @override
  String get pairFabricaNow => 'PAREKATZEN EGITEKO OIHALA ORAIN';

  @override
  String get backToHome => 'Itzuli hasierara';

  @override
  String get connReady => 'PREST';

  @override
  String get connConnecting => 'KONEKTATZEA';

  @override
  String get connDiscovering => 'EZAGUTU';

  @override
  String get connBonding => 'LOTURA';

  @override
  String get connScanning => 'ESKANEA';

  @override
  String get connDisconnected => 'DESKONECTUA';

  @override
  String disconnectConfirmTitle(Object name) {
    return '${name}tik deskonektatu?';
  }

  @override
  String get disconnectConfirmBody =>
      'Hasierako pantailatik edonoiz konekta zaitezke berriro.';

  @override
  String get cancelButton => 'Utzi';

  @override
  String get saveButton => 'GORDE';

  @override
  String get customNickname => 'Ezizen pertsonalizatua';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name desparekatu?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Honek $name kenduko du telefono honetako Zure Robotetatik. Edonoiz gehitu dezakezu berriro.\n\nOharra: robotaren memoria guztiz ezabatzeko eta fabrikako lehenetsiak berrezartzeko, erabili \"Factory Berrezarri\".';
  }

  @override
  String get unpairButton => 'DESPAREKATUA';

  @override
  String get machineIdle => 'NAGUSIA';

  @override
  String get machineRunning => 'KORRIKA';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'ERROREA';

  @override
  String get machineCalibrating => 'KALIBRATZEA';

  @override
  String ledLabel(Object state) {
    return 'LEDa: $state';
  }

  @override
  String get ledSaved => 'GORDETU';

  @override
  String get ledInputErr => 'SARRERA ERROREA';

  @override
  String get ledPairing => 'PAREKETA';

  @override
  String get ledConnected => 'KONEKTATUTA';

  @override
  String get ledIdentify => 'IDENTIFIKATU';

  @override
  String get identifyButton => 'IDENTIFIKATU';

  @override
  String get identifyingToast => 'Robot LED keinukaria 3 segundoz...';

  @override
  String get homingToast => 'Flap guztiak etxeratzen...';

  @override
  String get i2cFault => 'I2C ERROREA';

  @override
  String get storageFault => 'BILTEGIRATZEKO AKATSA';

  @override
  String get estopLatched => 'E-STOP LATCHADA';

  @override
  String get presetButtonsTitle => 'PRESET BOTOIAK';

  @override
  String customizePresetTitle(Object label) {
    return 'Pertsonalizatu $label';
  }

  @override
  String get subtitleNameLabel => 'Azpitituluen izena';

  @override
  String get subtitleNameHint =>
      'adib. Tolestu azkarra, kamisetak, pertsonalizatuak...';

  @override
  String get buttonColorLabel => 'Botoiaren kolorea';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return '$current/$total urratsa ($pct%)';
  }

  @override
  String get emergencyStop => 'LARRIALDI GEDALDIA';

  @override
  String get clearEstop => 'GARBITU ETA DESKERTATUTAKO E-STOP';

  @override
  String get clearEstopHint =>
      'Larrialdi-geldialdia berrezartzen du eta robota inaktibora itzultzen du';

  @override
  String get stopButton => 'GELDITU';

  @override
  String get fabricaArrangementTitle => 'OIHILAREN MANTAKETA';

  @override
  String get editArrangement => 'EDIZIOA ANTOLAMENDUA';

  @override
  String get addPanel => 'GEHITU PANELA';

  @override
  String get legendMotorized => 'Motorizatua';

  @override
  String get legendFollower => 'Jarraitzailea';

  @override
  String get legendBase => 'Oinarria';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Errenkadak';

  @override
  String stepSelectedHint(Object step) {
    return 'Aukeratutako $step urratsa: sakatu 1–2 panel motorizatu saretan';
  }

  @override
  String get tapPanelsHint => 'Sakatu 1-2 motor panel sarean';

  @override
  String get dualBadge => 'DUALA';

  @override
  String get requiresMotorizedPanel =>
      'Motordun panel bat behar du gutxienez (gehienez 2)';

  @override
  String get selectedChangePanelsHint =>
      'Hautatutako • Sakatu sareta panelak aldatzeko (gehienez 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return '$step/$total urratsa';
  }

  @override
  String get removeStepTooltip => 'Kendu urratsa';

  @override
  String get requiresMotorizedModuleWarning =>
      'Errutinak Fabrica Arrangement-en Motorizatutako modulu bat behar du gutxienez.';

  @override
  String get routineFull => 'ERRUTINA BETEA (16/16 URRATSA)';

  @override
  String addStepCount(Object count) {
    return 'GEHITU URRATSA ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Gorde errutina Robotean';

  @override
  String get selectButtonToProgram =>
      'Hautatu robot fisikoaren botoi bat errutina honekin programatzeko:';

  @override
  String buttonNumber(Object slot) {
    return '$slot botoia';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Hardware botoia $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Botoia $slot Azpititulua (aukerakoa)';
  }

  @override
  String get saveToRobotButton => 'GORDE ROBOTEAN';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return '$slot botoia ($count urrats)';
  }

  @override
  String get adultTshirtTemplate => 'Helduentzako kamiseta txantiloia';

  @override
  String get longSleeveTemplate => 'Manga luzeko txantiloia';

  @override
  String get dualSweepTemplate => 'Miaketa bikoitzeko txantiloia';

  @override
  String channelNumber(Object number) {
    return '$number kanala';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PAREKATUA';
  }

  @override
  String get moreHardwareOptions => 'Hardware aukera gehiago';

  @override
  String get loadTemplate => 'Kargatu txantiloia';

  @override
  String get controllerLabel => 'KONTROLATZAILEA';

  @override
  String get motorBadge => 'MOTORRA';

  @override
  String get followerBadge => 'JARRAILEA';

  @override
  String get baseBadge => 'OINARRIA';

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
