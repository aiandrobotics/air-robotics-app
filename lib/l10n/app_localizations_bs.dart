// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bosnian (`bs`).
class AppLocalizationsBs extends AppLocalizations {
  AppLocalizationsBs([String locale = 'bs']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Postavke';

  @override
  String get appLanguageTitle => 'Jezik aplikacije';

  @override
  String get appVersionTitle => 'Verzija aplikacije';

  @override
  String get languageSectionTitle => 'Jezik';

  @override
  String get languageSystemDefault => 'Zadani sistem (jezik uređaja)';

  @override
  String get selectLanguageHint => 'Odaberite jezik';

  @override
  String get addDeviceTitle => 'DODAJTE NOVOG ROBOTA';

  @override
  String get addDeviceSubtitle => 'Uparite AIR robote';

  @override
  String get yourRobots => 'VAŠI ROBOTI';

  @override
  String get discoveredRobots => 'OTKRIVENI ROBOTI';

  @override
  String get noRobotsPairedYet => 'Još nema uparenih robota';

  @override
  String get noRobotsPairedSubtitle =>
      'Povežite svog robota da biste vidjeli telemetriju, upravljali unaprijed postavljenima i kontrolirali operacije.';

  @override
  String get addYourFirstRobot => 'DODAJTE SVOG PRVOG ROBOTA';

  @override
  String get autoScanning => 'AUTO-SKENIRANJE';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'Kontrola';

  @override
  String get tabSequencer => 'Sequencer';

  @override
  String get tabCalibrator => 'Kalibrator';

  @override
  String get tabDiagnostics => 'Dijagnostika';

  @override
  String get renameRobot => 'Preimenuj robota';

  @override
  String get bleDiagnostics => 'BLE Diagnostics';

  @override
  String get erasePresets => 'Obrišite sačuvane postavke';

  @override
  String get disconnect => 'Prekini vezu';

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
  String get addStep => 'DODAJ KORAK';

  @override
  String get previewOnRobot => 'PREGLED NA ROBOTU';

  @override
  String get saveToButton => 'SAČUVAJ NA DUGME';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Uređaj';

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
  String get openButton => 'OTVOREN';

  @override
  String get connectButton => 'CONNECT';

  @override
  String get reconnectButton => 'RECONNECT';

  @override
  String get pairAndConnect => 'UPARI I POVEŽI';

  @override
  String get autoScanningForRobots => 'Automatsko skeniranje za robote...';

  @override
  String get scanningIdle => 'Skeniranje u mirovanju';

  @override
  String get nearbyRobotsAppear =>
      'Ovdje će se automatski pojaviti roboti u blizini.';

  @override
  String get yourNearbyRobotsAppear =>
      'Vaši roboti u blizini će se automatski pojaviti ovdje.';

  @override
  String get signalStrong => 'Jaka';

  @override
  String get signalGood => 'Dobro';

  @override
  String get signalWeak => 'Slabo';

  @override
  String get addRobotIntro =>
      'Odaberite robota ispod za uparivanje. Svaki robot u blizini u načinu uparivanja bit će automatski otkriven na vrhu.';

  @override
  String get autoDiscoveredRobot => 'AUTO OTKRIVENI ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTO OTKRIVENI ROBOTI';

  @override
  String readyCountBadge(Object count) {
    return '$count SPREMNO';
  }

  @override
  String get supportedRobots => 'PODRŽANI ROBOTI';

  @override
  String get clothesFoldingRobot => 'Robot za sklapanje odjeće';

  @override
  String get fabricaDescription =>
      'Automatska fascikla za odeću sa unapred podešenim delovima odeće i taktilnim upravljanjem jednim dugmetom.';

  @override
  String get fabricaPairingHint =>
      'Režim uparivanja: Pritisnite i držite bilo koje dugme na Fabrica kontrolnoj tabli 3 sekunde (LED statusa će brzo treptati).';

  @override
  String get pairFabricaNow => 'PAIR FABRICA SADA';

  @override
  String get backToHome => 'Povratak kući';

  @override
  String get connReady => 'READY';

  @override
  String get connConnecting => 'CONNECTING';

  @override
  String get connDiscovering => 'OTKRIVANJE';

  @override
  String get connBonding => 'BONDING';

  @override
  String get connScanning => 'SCENIRANJE';

  @override
  String get connDisconnected => 'ISKLJUČEN';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Prekinuti vezu s $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Možete se ponovo povezati bilo kada sa početnog ekrana.';

  @override
  String get cancelButton => 'OTKAZI';

  @override
  String get saveButton => 'SAVE';

  @override
  String get customNickname => 'Prilagođeni nadimak';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Prekinuti uparivanje $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Ovo će ukloniti $name iz vaših robota na ovom telefonu. Možete ga ponovo dodati u bilo koje vrijeme.\n\nNapomena: Za potpuno brisanje robotske memorije i vraćanje na tvorničke postavke, koristite \"Factory Reset\".';
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
  String get machineError => 'GREŠKA';

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
  String get ledIdentify => 'IDENTIFIKOVATI';

  @override
  String get identifyButton => 'IDENTIFIKOVATI';

  @override
  String get identifyingToast => 'LED robota treperi 3 sekunde...';

  @override
  String get homingToast => 'Pokretanje svih zakrilaca...';

  @override
  String get i2cFault => 'I2C GREŠKA';

  @override
  String get storageFault => 'STORAGE FAULT';

  @override
  String get estopLatched => 'E-STOP LATCHED';

  @override
  String get presetButtonsTitle => 'PRESET DUGME';

  @override
  String customizePresetTitle(Object label) {
    return 'Prilagodite $label';
  }

  @override
  String get subtitleNameLabel => 'Naziv titla';

  @override
  String get subtitleNameHint => 'npr. Brzo sklapanje, košulje, prilagođene...';

  @override
  String get buttonColorLabel => 'Boja dugmeta';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Korak $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'HITNO STUPANJE';

  @override
  String get clearEstop => 'OČISTITE I OTKLJUČITE E-STOP';

  @override
  String get clearEstopHint =>
      'Resetuje zaustavljanje u nuždi i vraća robota u stanje mirovanja';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'ARANŽMAN TKANINE';

  @override
  String get editArrangement => 'EDIT ARRANGEMENT';

  @override
  String get addPanel => 'ADD PANEL';

  @override
  String get legendMotorized => 'Motorizovano';

  @override
  String get legendFollower => 'Follower';

  @override
  String get legendBase => 'Baza';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Redovi';

  @override
  String stepSelectedHint(Object step) {
    return 'Korak $step odabran: Dodirnite 1–2 motorizirane ploče na mreži';
  }

  @override
  String get tapPanelsHint => 'Dodirnite 1–2 panela motora na mreži';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Zahtijeva najmanje 1 motoriziranu ploču (maks. 2)';

  @override
  String get selectedChangePanelsHint =>
      'Odabrano • Dodirnite rešetkaste ploče za promjenu (maks. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Korak $step od $total';
  }

  @override
  String get removeStepTooltip => 'Ukloni korak';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutina zahtijeva najmanje jedan motorizirani modul iz Fabrica Arrangementa.';

  @override
  String get routineFull => 'RUTINA PUNA (16/16 KORAKA)';

  @override
  String addStepCount(Object count) {
    return 'DODAJ KORAK ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Sačuvaj rutinu u robota';

  @override
  String get selectButtonToProgram =>
      'Odaberite dugme fizičkog robota za programiranje ovom rutinom:';

  @override
  String buttonNumber(Object slot) {
    return 'Dugme $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Hardversko dugme $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Dugme $slot titl (opciono)';
  }

  @override
  String get saveToRobotButton => 'SAČUVAJ U ROBOTA';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Dugme $slot ($count koraka)';
  }

  @override
  String get adultTshirtTemplate => 'Predložak majice za odrasle';

  @override
  String get longSleeveTemplate => 'Šablon dugih rukava';

  @override
  String get dualSweepTemplate => 'Dual Sweep Template';

  @override
  String channelNumber(Object number) {
    return 'Kanal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count UPAREN';
  }

  @override
  String get moreHardwareOptions => 'Više hardverskih opcija';

  @override
  String get loadTemplate => 'Učitaj predložak';

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
