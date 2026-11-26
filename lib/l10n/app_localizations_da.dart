// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Indstillinger';

  @override
  String get appLanguageTitle => 'App-sprog';

  @override
  String get appVersionTitle => 'App-version';

  @override
  String get languageSectionTitle => 'Sprog';

  @override
  String get languageSystemDefault => 'Systemstandard (enhedssprog)';

  @override
  String get selectLanguageHint => 'Vælg et sprog';

  @override
  String get addDeviceTitle => 'TILFØJ NY ROBOT';

  @override
  String get addDeviceSubtitle => 'Par AIR-robotter';

  @override
  String get yourRobots => 'DINE ROBOTTER';

  @override
  String get discoveredRobots => 'OPDAGTE ROBOTER';

  @override
  String get noRobotsPairedYet => 'Ingen robotter parret endnu';

  @override
  String get noRobotsPairedSubtitle =>
      'Tilslut din robot for at se telemetri, administrere forudindstillinger og styre operationer.';

  @override
  String get addYourFirstRobot => 'TILFØJ DIN FØRSTE ROBOT';

  @override
  String get autoScanning => 'AUTO-SCANNING';

  @override
  String get idleStatus => 'TOMGANG';

  @override
  String get tabControl => 'Kontrol';

  @override
  String get tabSequencer => 'Sekvenser';

  @override
  String get tabCalibrator => 'Kalibrator';

  @override
  String get tabDiagnostics => 'Diagnostik';

  @override
  String get renameRobot => 'Omdøb robot';

  @override
  String get bleDiagnostics => 'BLE Diagnostik';

  @override
  String get erasePresets => 'Slet gemte forudindstillinger';

  @override
  String get disconnect => 'Afbryd forbindelsen';

  @override
  String get unpairRobot => 'Fjern parring af robot';

  @override
  String get factoryReset => 'Fabriksindstilling';

  @override
  String get servoManualJog => 'SERVO MANUEL JOG';

  @override
  String get homeAll => 'HJEM ALLE';

  @override
  String get foldingTimeline => 'FOLDNING TIDSLINJE';

  @override
  String get addStep => 'TILFØJ TRIN';

  @override
  String get previewOnRobot => 'FORBINDELSE PÅ ROBOT';

  @override
  String get saveToButton => 'GEM TIL KNAPPEN';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Enhed';

  @override
  String get themeLight => 'Lys';

  @override
  String get themeDark => 'Mørk';

  @override
  String get connectedBadge => 'FORBUNDET';

  @override
  String get inRangeBadge => 'I Rækkevidde';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'ÅBEN';

  @override
  String get connectButton => 'FORBIND';

  @override
  String get reconnectButton => 'FORBIND GEN';

  @override
  String get pairAndConnect => 'PAR OG FORBIND';

  @override
  String get autoScanningForRobots => 'Automatisk scanning for robotter...';

  @override
  String get scanningIdle => 'Scanning inaktiv';

  @override
  String get nearbyRobotsAppear => 'Robotter i nærheden vises automatisk her.';

  @override
  String get yourNearbyRobotsAppear =>
      'Dine robotter i nærheden vises automatisk her.';

  @override
  String get signalStrong => 'Stærk';

  @override
  String get signalGood => 'Godt';

  @override
  String get signalWeak => 'Svag';

  @override
  String get addRobotIntro =>
      'Vælg en robot nedenfor for at parre. Enhver robot i nærheden i parringstilstand vil automatisk blive opdaget øverst.';

  @override
  String get autoDiscoveredRobot => 'AUTOOPDAGT ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTOOPDANNDE ROBOTER';

  @override
  String readyCountBadge(Object count) {
    return '$count KLAR';
  }

  @override
  String get supportedRobots => 'UNDERSTØTTEDE ROBOTER';

  @override
  String get clothesFoldingRobot => 'Tøj folderobot';

  @override
  String get fabricaDescription =>
      'Automatiseret beklædningsmappe med forudindstillinger til flere beklædningsgenstande og taktil betjening med en enkelt knap.';

  @override
  String get fabricaPairingHint =>
      'Parringstilstand: Tryk og hold en vilkårlig knap på Fabrica-kontrolpanelet nede i 3 sekunder (Status-LED blinker hurtigt).';

  @override
  String get pairFabricaNow => 'PAR STOF NU';

  @override
  String get backToHome => 'Tilbage til Hjemmet';

  @override
  String get connReady => 'KLAR';

  @override
  String get connConnecting => 'FORBINDELSE';

  @override
  String get connDiscovering => 'OPDAGELSE';

  @override
  String get connBonding => 'FORBINDELSE';

  @override
  String get connScanning => 'SCANNING';

  @override
  String get connDisconnected => 'AFBRYDET';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Vil du afbryde forbindelsen til $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Du kan til enhver tid oprette forbindelse igen fra startskærmen.';

  @override
  String get cancelButton => 'ANNULLER';

  @override
  String get saveButton => 'GEM';

  @override
  String get customNickname => 'Brugerdefineret kaldenavn';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Vil du fjerne parringen $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Dette vil fjerne $name fra Your Robots på denne telefon. Du kan til enhver tid tilføje den igen.\n\nBemærk: For at slette robothukommelsen fuldstændigt og gendanne fabriksindstillingerne skal du bruge \"Fabriksindstilling\".';
  }

  @override
  String get unpairButton => 'UPARER';

  @override
  String get machineIdle => 'TOMGANG';

  @override
  String get machineRunning => 'LØB';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'FEJL';

  @override
  String get machineCalibrating => 'KALIBRERING';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'GEMT';

  @override
  String get ledInputErr => 'INPUT FEJL';

  @override
  String get ledPairing => 'PARRING';

  @override
  String get ledConnected => 'FORBUNDET';

  @override
  String get ledIdentify => 'IDENTIFICER';

  @override
  String get identifyButton => 'IDENTIFICER';

  @override
  String get identifyingToast => 'Blinker robot LED i 3 sekunder...';

  @override
  String get homingToast => 'Søger alle klapper...';

  @override
  String get i2cFault => 'I2C FEJL';

  @override
  String get storageFault => 'OPBEVARINGSFEJL';

  @override
  String get estopLatched => 'E-STOP LÅST';

  @override
  String get presetButtonsTitle => 'FORUDINDSTILLE KNAPPER';

  @override
  String customizePresetTitle(Object label) {
    return 'Tilpas $label';
  }

  @override
  String get subtitleNameLabel => 'Undertekst navn';

  @override
  String get subtitleNameHint =>
      'f.eks. Hurtig foldning, skjorter, brugerdefinerede...';

  @override
  String get buttonColorLabel => 'Knap farve';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Trin $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'NØDSTOP';

  @override
  String get clearEstop => 'RYD OG LØS NØDSTOP';

  @override
  String get clearEstopHint =>
      'Nulstiller nødstop og returnerer robot til tomgang';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'FABRICA ORDNING';

  @override
  String get editArrangement => 'REDIGER ARRANGEMENT';

  @override
  String get addPanel => 'TILFØJ PANEL';

  @override
  String get legendMotorized => 'Motoriseret';

  @override
  String get legendFollower => 'Følger';

  @override
  String get legendBase => 'Base';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Rækker';

  @override
  String stepSelectedHint(Object step) {
    return 'Trin $step valgt: Tryk på 1–2 motoriserede paneler på gitteret';
  }

  @override
  String get tapPanelsHint => 'Tryk på 1–2 motorpaneler på gitteret';

  @override
  String get dualBadge => 'DOBBELT';

  @override
  String get requiresMotorizedPanel =>
      'Kræver mindst 1 motoriseret panel (max 2)';

  @override
  String get selectedChangePanelsHint =>
      'Valgt • Tryk på gitterpaneler for at ændre (maks. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Trin $step af $total';
  }

  @override
  String get removeStepTooltip => 'Fjern trin';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutine kræver mindst ét motoriseret modul fra Fabrica Arrangement.';

  @override
  String get routineFull => 'RUTINE FULD (16/16 TRIN)';

  @override
  String addStepCount(Object count) {
    return 'TILFØJ TRIN ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Gem rutine til robot';

  @override
  String get selectButtonToProgram =>
      'Vælg en fysisk robotknap for at programmere med denne rutine:';

  @override
  String buttonNumber(Object slot) {
    return 'Knap $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Hardwareknap $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Knap $slot Undertekst (valgfrit)';
  }

  @override
  String get saveToRobotButton => 'GEM TIL ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Knap $slot ($count trin)';
  }

  @override
  String get adultTshirtTemplate => 'Voksen T-shirt skabelon';

  @override
  String get longSleeveTemplate => 'Langærmet skabelon';

  @override
  String get dualSweepTemplate => 'Dual Sweep skabelon';

  @override
  String channelNumber(Object number) {
    return 'Kanal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PARRING';
  }

  @override
  String get moreHardwareOptions => 'Flere hardwaremuligheder';

  @override
  String get loadTemplate => 'Indlæs skabelon';

  @override
  String get controllerLabel => 'KONTROLLER';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'FØLGENDE';

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
