// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get appLanguageTitle => 'App-taal';

  @override
  String get appVersionTitle => 'App-versie';

  @override
  String get languageSectionTitle => 'Taal';

  @override
  String get languageSystemDefault => 'Systeemstandaard (apparaattaal)';

  @override
  String get selectLanguageHint => 'Selecteer een taal';

  @override
  String get addDeviceTitle => 'NIEUWE ROBOT TOEVOEGEN';

  @override
  String get addDeviceSubtitle => 'Koppel AIR-robots';

  @override
  String get yourRobots => 'JOUW ROBOTS';

  @override
  String get discoveredRobots => 'GEVONDEN ROBOTS';

  @override
  String get noRobotsPairedYet => 'Nog geen robots gekoppeld';

  @override
  String get noRobotsPairedSubtitle =>
      'Sluit uw robot aan om telemetrie te bekijken, voorinstellingen te beheren en handelingen te controleren.';

  @override
  String get addYourFirstRobot => 'VOEG UW EERSTE ROBOT TOE';

  @override
  String get autoScanning => 'AUTOMATISCH SCANNEN';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'Controle';

  @override
  String get tabSequencer => 'Sequencer';

  @override
  String get tabCalibrator => 'Kalibrator';

  @override
  String get tabDiagnostics => 'Diagnostiek';

  @override
  String get renameRobot => 'Hernoem Robot';

  @override
  String get bleDiagnostics => 'BLE-diagnostiek';

  @override
  String get erasePresets => 'Wis opgeslagen voorinstellingen';

  @override
  String get disconnect => 'Verbreek de verbinding';

  @override
  String get unpairRobot => 'Ontkoppel Robot';

  @override
  String get factoryReset => 'Fabrieksreset';

  @override
  String get servoManualJog => 'SERVO HANDMATIG JOG';

  @override
  String get homeAll => 'THUIS ALLEN';

  @override
  String get foldingTimeline => 'OPVOUWBARE TIJDLIJN';

  @override
  String get addStep => 'STAP TOEVOEGEN';

  @override
  String get previewOnRobot => 'VOORBEELD OP ROBOT';

  @override
  String get saveToButton => 'OPSLAAN IN KNOP';

  @override
  String get themeTitle => 'Thema';

  @override
  String get themeSystem => 'Apparaat';

  @override
  String get themeLight => 'Licht';

  @override
  String get themeDark => 'Donker';

  @override
  String get connectedBadge => 'VERBONDEN';

  @override
  String get inRangeBadge => 'BINNEN BEREIK';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'GEOPEND';

  @override
  String get connectButton => 'VERBINDEN';

  @override
  String get reconnectButton => 'OPNIEUW VERBINDEN';

  @override
  String get pairAndConnect => 'KOPPELEN EN VERBINDEN';

  @override
  String get autoScanningForRobots => 'Automatisch scannen voor robots...';

  @override
  String get scanningIdle => 'Scannen inactief';

  @override
  String get nearbyRobotsAppear =>
      'Robots in de buurt verschijnen hier automatisch.';

  @override
  String get yourNearbyRobotsAppear =>
      'Uw nabijgelegen robots verschijnen hier automatisch.';

  @override
  String get signalStrong => 'Sterk';

  @override
  String get signalGood => 'Goed';

  @override
  String get signalWeak => 'Zwak';

  @override
  String get addRobotIntro =>
      'Selecteer hieronder een robot om te koppelen. Elke robot in de buurt die in de koppelingsmodus staat, wordt automatisch bovenaan ontdekt.';

  @override
  String get autoDiscoveredRobot => 'AUTO ONTDEKTE ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTO ONTDEKTE ROBOTS';

  @override
  String readyCountBadge(Object count) {
    return '$count KLAAR';
  }

  @override
  String get supportedRobots => 'ONDERSTEUNDE ROBOTS';

  @override
  String get clothesFoldingRobot => 'Kleren vouwrobot';

  @override
  String get fabricaDescription =>
      'Geautomatiseerde kledingmap met voorinstellingen voor meerdere kledingstukken en voelbare bediening met één knop.';

  @override
  String get fabricaPairingHint =>
      'Koppelmodus: Houd een willekeurige knop op het Fabrica-bedieningspaneel gedurende 3 seconden ingedrukt (status-LED knippert snel).';

  @override
  String get pairFabricaNow => 'PAAR NU STOFFEN';

  @override
  String get backToHome => 'Terug naar Thuis';

  @override
  String get connReady => 'KLAAR';

  @override
  String get connConnecting => 'VERBINDEN';

  @override
  String get connDiscovering => 'ONTDEKKEN';

  @override
  String get connBonding => 'VERBINDING';

  @override
  String get connScanning => 'SCANNEN';

  @override
  String get connDisconnected => 'VERBONDEN';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Verbinding met $name verbreken?';
  }

  @override
  String get disconnectConfirmBody =>
      'U kunt op elk gewenst moment opnieuw verbinding maken vanaf het startscherm.';

  @override
  String get cancelButton => 'ANNULEREN';

  @override
  String get saveButton => 'OPSLAAN';

  @override
  String get customNickname => 'Aangepaste bijnaam';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name ontkoppelen?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Hiermee wordt $name van Your Robots op deze telefoon verwijderd. Je kunt het op elk gewenst moment opnieuw toevoegen.\n\nOpmerking: Om het robotgeheugen volledig te wissen en de fabrieksinstellingen te herstellen, gebruikt u \"Factory Reset\".';
  }

  @override
  String get unpairButton => 'ONTKOPPELEN';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'RENNEN';

  @override
  String get machineEstop => 'Noodstop';

  @override
  String get machineError => 'FOUT';

  @override
  String get machineCalibrating => 'KALIBREREN';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'OPGESLAGEN';

  @override
  String get ledInputErr => 'INVOERFOUT';

  @override
  String get ledPairing => 'KOPPELEN';

  @override
  String get ledConnected => 'VERBONDEN';

  @override
  String get ledIdentify => 'IDENTIFICEER';

  @override
  String get identifyButton => 'IDENTIFICEER';

  @override
  String get identifyingToast =>
      'Knipperende robot-LED gedurende 3 seconden...';

  @override
  String get homingToast => 'Alle flappen op de juiste plek...';

  @override
  String get i2cFault => 'I2C-FOUT';

  @override
  String get storageFault => 'OPSLAGFOUT';

  @override
  String get estopLatched => 'NOODSTOP VERGRENDELD';

  @override
  String get presetButtonsTitle => 'VOORAF INGESTELDE KNOPPEN';

  @override
  String customizePresetTitle(Object label) {
    return 'Pas $label aan';
  }

  @override
  String get subtitleNameLabel => 'Naam ondertitel';

  @override
  String get subtitleNameHint =>
      'bijv. Snelvouwen, overhemden, op maat gemaakte...';

  @override
  String get buttonColorLabel => 'Knopkleur';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Stap $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'NOODSTOP';

  @override
  String get clearEstop => 'DUIDELIJKE EN ONTGRENDELDE E-STOP';

  @override
  String get clearEstopHint =>
      'Reset de noodstop en zet de robot terug in de ruststand';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'STOFFEN ARRANGEMENT';

  @override
  String get editArrangement => 'REGELING BEWERKEN';

  @override
  String get addPanel => 'PANEEL TOEVOEGEN';

  @override
  String get legendMotorized => 'Gemotoriseerd';

  @override
  String get legendFollower => 'Volger';

  @override
  String get legendBase => 'Basis';

  @override
  String get colsLabel => 'Col';

  @override
  String get rowsLabel => 'Rijen';

  @override
  String stepSelectedHint(Object step) {
    return 'Stap $step geselecteerd: Tik op 1–2 Gemotoriseerde panelen op het raster';
  }

  @override
  String get tapPanelsHint => 'Tik op 1–2 motorpanelen op het raster';

  @override
  String get dualBadge => 'DUBBEL';

  @override
  String get requiresMotorizedPanel =>
      'Vereist minimaal 1 gemotoriseerd paneel (max. 2)';

  @override
  String get selectedChangePanelsHint =>
      'Geselecteerd • Tik op rasterpanelen om te wijzigen (max. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Stap $step van $total';
  }

  @override
  String get removeStepTooltip => 'Stap verwijderen';

  @override
  String get requiresMotorizedModuleWarning =>
      'Routine vereist minimaal één gemotoriseerde module van Fabrica Arrangement.';

  @override
  String get routineFull => 'ROUTINE VOLLEDIG (16/16 STAPPEN)';

  @override
  String addStepCount(Object count) {
    return 'STAP TOEVOEGEN ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Bewaar Routine naar Robot';

  @override
  String get selectButtonToProgram =>
      'Selecteer een fysieke robotknop om met deze routine te programmeren:';

  @override
  String buttonNumber(Object slot) {
    return 'Knop $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Hardwareknop $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Knop $slot Ondertiteling (optioneel)';
  }

  @override
  String get saveToRobotButton => 'OPSLAAN IN ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Knop $slot ($count stappen)';
  }

  @override
  String get adultTshirtTemplate => 'Sjabloon voor volwassen T-shirts';

  @override
  String get longSleeveTemplate => 'Sjabloon met lange mouwen';

  @override
  String get dualSweepTemplate => 'Dubbele sweep-sjabloon';

  @override
  String channelNumber(Object number) {
    return 'Kanaal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count GEKOPPELD';
  }

  @override
  String get moreHardwareOptions => 'Meer hardwareopties';

  @override
  String get loadTemplate => 'Sjabloon laden';

  @override
  String get controllerLabel => 'CONTROLLER';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'VOLGER';

  @override
  String get baseBadge => 'BASIS';

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
