// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class AppLocalizationsAf extends AppLocalizations {
  AppLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Instellings';

  @override
  String get appLanguageTitle => 'Toepassingstaal';

  @override
  String get appVersionTitle => 'Toepassingweergawe';

  @override
  String get languageSectionTitle => 'Taal';

  @override
  String get languageSystemDefault => 'Stelselverstek (Toesteltaal)';

  @override
  String get selectLanguageHint => 'Kies \'n taal';

  @override
  String get addDeviceTitle => 'VOEG NUWE ROBOT BY';

  @override
  String get addDeviceSubtitle => 'Koppel AIR-robotte';

  @override
  String get yourRobots => 'JOU ROBOTE';

  @override
  String get discoveredRobots => 'ONTDEKDE ROBOTE';

  @override
  String get noRobotsPairedYet => 'Nog geen robotte gekoppel nie';

  @override
  String get noRobotsPairedSubtitle =>
      'Koppel jou robot om telemetrie te sien, voorafinstellings te bestuur en bedrywighede te beheer.';

  @override
  String get addYourFirstRobot => 'VOEG JOU EERSTE ROBOT BY';

  @override
  String get autoScanning => 'OUTOSEKANDE';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'Beheer';

  @override
  String get tabSequencer => 'Volgorder';

  @override
  String get tabCalibrator => 'Kalibreerder';

  @override
  String get tabDiagnostics => 'Diagnostiek';

  @override
  String get renameRobot => 'Hernoem Robot';

  @override
  String get bleDiagnostics => 'BLE Diagnostiek';

  @override
  String get erasePresets => 'Vee gestoorde voorafinstellings uit';

  @override
  String get disconnect => 'Ontkoppel';

  @override
  String get unpairRobot => 'Ontkoppel robot';

  @override
  String get factoryReset => 'Fabrieksterugstelling';

  @override
  String get servoManualJog => 'SERVO HANDLEIDING DRAP';

  @override
  String get homeAll => 'TUIS ALMAL';

  @override
  String get foldingTimeline => 'VOU TYDLYN';

  @override
  String get addStep => 'VOEG STAP BY';

  @override
  String get previewOnRobot => 'VOORSIEN OP ROBOT';

  @override
  String get saveToButton => 'STAAR NA KNOP';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Toestel';

  @override
  String get themeLight => 'Lig';

  @override
  String get themeDark => 'Donker';

  @override
  String get connectedBadge => 'VERBIND';

  @override
  String get inRangeBadge => 'IN REKKE';

  @override
  String get offlineBadge => 'VANlyn';

  @override
  String get openButton => 'OOP';

  @override
  String get connectButton => 'VERBIND';

  @override
  String get reconnectButton => 'KOPPEL OP';

  @override
  String get pairAndConnect => 'PAAR EN VERBIND';

  @override
  String get autoScanningForRobots => 'Outo-skandering vir robotte...';

  @override
  String get scanningIdle => 'Skandeer ledig';

  @override
  String get nearbyRobotsAppear =>
      'Nabygeleë robots sal outomaties hier verskyn.';

  @override
  String get yourNearbyRobotsAppear =>
      'Jou nabygeleë robots sal outomaties hier verskyn.';

  @override
  String get signalStrong => 'Sterk';

  @override
  String get signalGood => 'Goed';

  @override
  String get signalWeak => 'Swak';

  @override
  String get addRobotIntro =>
      'Kies \'n robot hieronder om saam te koppel. Enige nabygeleë robot in saambindmodus sal outomaties aan die bokant ontdek word.';

  @override
  String get autoDiscoveredRobot => 'AUTO ONTDEKTE ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTO ONTDEKTE ROBOTE';

  @override
  String readyCountBadge(Object count) {
    return '$count GEREED';
  }

  @override
  String get supportedRobots => 'ONDERSTEUN ROBOTE';

  @override
  String get clothesFoldingRobot => 'Klere vou robot';

  @override
  String get fabricaDescription =>
      'Outomatiese kledingstukvouer met multi-kledingstukvoorinstellings en tasbare enkelknoppie-werking.';

  @override
  String get fabricaPairingHint =>
      'Koppelmodus: Druk en hou enige knoppie op die Fabrica-beheerpaneel vir 3 sekondes (Status-LED sal vinnig flikker).';

  @override
  String get pairFabricaNow => 'PAAR STOF NOU';

  @override
  String get backToHome => 'Terug na die huis';

  @override
  String get connReady => 'GEREED';

  @override
  String get connConnecting => 'VERBINDING';

  @override
  String get connDiscovering => 'ONTDEK';

  @override
  String get connBonding => 'VERBINDING';

  @override
  String get connScanning => 'SKANDEER';

  @override
  String get connDisconnected => 'ONTKOEKEL';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Ontkoppel van $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Jy kan enige tyd weer koppel vanaf die tuisskerm.';

  @override
  String get cancelButton => 'KANSELLEER';

  @override
  String get saveButton => 'SPAAR';

  @override
  String get customNickname => 'Gepasmaakte bynaam';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Ontkoppel $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Dit sal $name van Your Robots op hierdie foon verwyder. Jy kan dit enige tyd weer byvoeg.\n\nLet wel: Om robotgeheue heeltemal uit te vee en fabrieksinstellings te herstel, gebruik \"Fabrieksterugstelling\".';
  }

  @override
  String get unpairButton => 'ONSPAAR';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'HARDLOOP';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'FOUT';

  @override
  String get machineCalibrating => 'KALIBREER';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'GERED';

  @override
  String get ledInputErr => 'INSETFOUT';

  @override
  String get ledPairing => 'PAARPAAR';

  @override
  String get ledConnected => 'VERBIND';

  @override
  String get ledIdentify => 'IDENTIFISEER';

  @override
  String get identifyButton => 'IDENTIFISEER';

  @override
  String get identifyingToast => 'Flitsende robot LED vir 3 sekondes...';

  @override
  String get homingToast => 'Plaas alle kleppe...';

  @override
  String get i2cFault => 'I2C FOUT';

  @override
  String get storageFault => 'BERGINGSFOUT';

  @override
  String get estopLatched => 'E-STOP VERGRENDEL';

  @override
  String get presetButtonsTitle => 'VOORINSTELKNOPPE';

  @override
  String customizePresetTitle(Object label) {
    return 'Pasmaak $label';
  }

  @override
  String get subtitleNameLabel => 'Subtitel Naam';

  @override
  String get subtitleNameHint => 'bv. Vinnige vou, hemde, pasgemaakte...';

  @override
  String get buttonColorLabel => 'Knoppie Kleur';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Stap $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'NOODSTOP';

  @override
  String get clearEstop => 'MAAK E-STOP OP EN ONTSPAN';

  @override
  String get clearEstopHint =>
      'Stel noodstop terug en stuur robot terug na Idle';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'FABRICA REËLING';

  @override
  String get editArrangement => 'EDIT REËLING';

  @override
  String get addPanel => 'VOEG PANEEL BY';

  @override
  String get legendMotorized => 'Gemotoriseerd';

  @override
  String get legendFollower => 'Volger';

  @override
  String get legendBase => 'Basis';

  @override
  String get colsLabel => 'Kol';

  @override
  String get rowsLabel => 'Rye';

  @override
  String stepSelectedHint(Object step) {
    return 'Stap $step gekies: Tik 1–2 gemotoriseerde panele op die rooster';
  }

  @override
  String get tapPanelsHint => 'Tik 1–2 motorpanele op rooster';

  @override
  String get dualBadge => 'DUBBEL';

  @override
  String get requiresMotorizedPanel =>
      'Vereis ten minste 1 gemotoriseerde paneel (maks 2)';

  @override
  String get selectedChangePanelsHint =>
      'Gekies • Tik roosterpanele om te verander (maks. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Stap $step van $total';
  }

  @override
  String get removeStepTooltip => 'Verwyder Stap';

  @override
  String get requiresMotorizedModuleWarning =>
      'Roetine vereis ten minste een gemotoriseerde module van Fabrica Reëling.';

  @override
  String get routineFull => 'ROETINE VOL (16/16 STAPPE)';

  @override
  String addStepCount(Object count) {
    return 'VOEG STAP BY ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Stoor roetine na robot';

  @override
  String get selectButtonToProgram =>
      'Kies \'n fisiese robotknoppie om met hierdie roetine te programmeer:';

  @override
  String buttonNumber(Object slot) {
    return 'Knoppie $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Hardeware-knoppie $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Knoppie $slot Ondertitel (opsioneel)';
  }

  @override
  String get saveToRobotButton => 'STAAR NA ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Knoppie $slot ($count stappe)';
  }

  @override
  String get adultTshirtTemplate => 'Volwasse T-hemp sjabloon';

  @override
  String get longSleeveTemplate => 'Langmou sjabloon';

  @override
  String get dualSweepTemplate => 'Dubbele Sweep-sjabloon';

  @override
  String channelNumber(Object number) {
    return 'Kanaal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count GEPAARD';
  }

  @override
  String get moreHardwareOptions => 'Meer hardeware-opsies';

  @override
  String get loadTemplate => 'Laai sjabloon';

  @override
  String get controllerLabel => 'BEHEERDER';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'VOLGING';

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
