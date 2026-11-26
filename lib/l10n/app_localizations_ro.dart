// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Setări';

  @override
  String get appLanguageTitle => 'Limba aplicației';

  @override
  String get appVersionTitle => 'Versiunea aplicației';

  @override
  String get languageSectionTitle => 'Limbă';

  @override
  String get languageSystemDefault =>
      'Implicit de sistem (limba dispozitivului)';

  @override
  String get selectLanguageHint => 'Selectați o limbă';

  @override
  String get addDeviceTitle => 'ADĂUGAȚI NOUL ROBOT';

  @override
  String get addDeviceSubtitle => 'Asociați roboții AIR';

  @override
  String get yourRobots => 'ROBOȚII TĂI';

  @override
  String get discoveredRobots => 'ROBOȚII DEscopeRIT';

  @override
  String get noRobotsPairedYet => 'Niciun roboți împerecheați încă';

  @override
  String get noRobotsPairedSubtitle =>
      'Conectați-vă robotul pentru a vizualiza telemetria, a gestiona setările prestabilite și a controla operațiunile.';

  @override
  String get addYourFirstRobot => 'ADAUGĂ PRIMUL TĂU ROBOT';

  @override
  String get autoScanning => 'SCANARE AUTOMATĂ';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'Control';

  @override
  String get tabSequencer => 'Sequencer';

  @override
  String get tabCalibrator => 'Calibrator';

  @override
  String get tabDiagnostics => 'Diagnosticare';

  @override
  String get renameRobot => 'Redenumiți robotul';

  @override
  String get bleDiagnostics => 'Diagnosticare BLE';

  @override
  String get erasePresets => 'Ștergeți presetările salvate';

  @override
  String get disconnect => 'Deconectați-vă';

  @override
  String get unpairRobot => 'Deconectați robotul';

  @override
  String get factoryReset => 'Resetare din fabrică';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'ACASĂ TOATE';

  @override
  String get foldingTimeline => 'CRONOLOGIA DE PLIERE';

  @override
  String get addStep => 'ADAUGĂ PASUL';

  @override
  String get previewOnRobot => 'PREVIEW PE ROBOT';

  @override
  String get saveToButton => 'BUTON SALVARE';

  @override
  String get themeTitle => 'Temă';

  @override
  String get themeSystem => 'Dispozitiv';

  @override
  String get themeLight => 'Lumină';

  @override
  String get themeDark => 'Întuneric';

  @override
  String get connectedBadge => 'CONECTAT';

  @override
  String get inRangeBadge => 'ÎN GAME';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'DESCHIS';

  @override
  String get connectButton => 'CONECTAȚI';

  @override
  String get reconnectButton => 'RECONECTAȚI';

  @override
  String get pairAndConnect => 'împerechează și conectează';

  @override
  String get autoScanningForRobots => 'Scanare automată pentru roboți...';

  @override
  String get scanningIdle => 'Scanare inactiv';

  @override
  String get nearbyRobotsAppear =>
      'Roboții din apropiere vor apărea automat aici.';

  @override
  String get yourNearbyRobotsAppear =>
      'Roboții tăi din apropiere vor apărea aici automat.';

  @override
  String get signalStrong => 'Puternic';

  @override
  String get signalGood => 'Bun';

  @override
  String get signalWeak => 'Slab';

  @override
  String get addRobotIntro =>
      'Selectați un robot de mai jos pentru a asocia. Orice robot din apropiere în modul de asociere va fi descoperit automat în partea de sus.';

  @override
  String get autoDiscoveredRobot => 'ROBOT DEscoperit automat';

  @override
  String get autoDiscoveredRobots => 'ROBOȚI AUTO DECOPERIT';

  @override
  String readyCountBadge(Object count) {
    return '$count GATA';
  }

  @override
  String get supportedRobots => 'ROBOȚI SUPPORTAȚI';

  @override
  String get clothesFoldingRobot => 'Robot de pliere haine';

  @override
  String get fabricaDescription =>
      'Dosar automat pentru articole de îmbrăcăminte cu presetări pentru mai multe articole și operare tactilă cu un singur buton.';

  @override
  String get fabricaPairingHint =>
      'Modul de asociere: Apăsați și mențineți apăsat orice buton de pe panoul de control Fabrica timp de 3 secunde (LED-ul de stare va clipi rapid).';

  @override
  String get pairFabricaNow => 'PERECHEȚI ACUM ȚESA';

  @override
  String get backToHome => 'Înapoi la Acasă';

  @override
  String get connReady => 'GATA';

  @override
  String get connConnecting => 'CONECTAREA';

  @override
  String get connDiscovering => 'DEscoperirea';

  @override
  String get connBonding => 'LEGĂTURA';

  @override
  String get connScanning => 'SCANARE';

  @override
  String get connDisconnected => 'DECONECTAT';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Deconectați-vă de la $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Vă puteți reconecta oricând din ecranul de pornire.';

  @override
  String get cancelButton => 'ANULAREA';

  @override
  String get saveButton => 'SALVAȚI';

  @override
  String get customNickname => 'Pseudonim personalizat';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Deconectați $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Aceasta va elimina $name din roboții dvs. de pe acest telefon. Îl poți adăuga din nou oricând.\n\nNotă: Pentru a șterge complet memoria robotului și a restabili setările implicite din fabrică, utilizați „Resetare din fabrică”.';
  }

  @override
  String get unpairButton => 'DEPEREARE';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'ALLERARE';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'EROARE';

  @override
  String get machineCalibrating => 'CALIBRAREA';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'SALVAT';

  @override
  String get ledInputErr => 'ERORE DE INTRARE';

  @override
  String get ledPairing => 'PERECHIREA';

  @override
  String get ledConnected => 'CONECTAT';

  @override
  String get ledIdentify => 'IDENTIFICAȚI';

  @override
  String get identifyButton => 'IDENTIFICAȚI';

  @override
  String get identifyingToast =>
      'LED-ul robotului clipește timp de 3 secunde...';

  @override
  String get homingToast => 'Acasă toate clapele...';

  @override
  String get i2cFault => 'DEFECT I2C';

  @override
  String get storageFault => 'DEFECTĂ DE DEPOZITARE';

  @override
  String get estopLatched => 'E-STOP BLOCAT';

  @override
  String get presetButtonsTitle => 'BUTONE PRESETATE';

  @override
  String customizePresetTitle(Object label) {
    return 'Personalizați $label';
  }

  @override
  String get subtitleNameLabel => 'Nume subtitrare';

  @override
  String get subtitleNameHint =>
      'de ex. Pliere rapidă, cămăși, personalizate...';

  @override
  String get buttonColorLabel => 'Culoarea butonului';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Pasul $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'OPRIRE DE URGENȚĂ';

  @override
  String get clearEstop => 'Ștergeți și deblocați oprirea de urgență';

  @override
  String get clearEstopHint =>
      'Resetează oprirea de urgență și readuce robotul la Idle';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'ARANJAMENT FABRICA';

  @override
  String get editArrangement => 'EDITARE ARANJAMENT';

  @override
  String get addPanel => 'ADAUGĂ PANOUL';

  @override
  String get legendMotorized => 'Motorizat';

  @override
  String get legendFollower => 'Adept';

  @override
  String get legendBase => 'Baza';

  @override
  String get colsLabel => 'cols';

  @override
  String get rowsLabel => 'Rânduri';

  @override
  String stepSelectedHint(Object step) {
    return 'Pasul $step selectat: atingeți 1–2 panouri motorizate pe grilă';
  }

  @override
  String get tapPanelsHint => 'Atingeți 1–2 panouri de motor pe grilă';

  @override
  String get dualBadge => 'DUBLĂ';

  @override
  String get requiresMotorizedPanel =>
      'Necesită cel puțin 1 panou motorizat (maxim 2)';

  @override
  String get selectedChangePanelsHint =>
      'Selectat • Atingeți panourile grilă pentru a schimba (maxim 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Pasul $step din $total';
  }

  @override
  String get removeStepTooltip => 'Eliminați pasul';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutina necesită cel puțin un modul motorizat de la Fabrica Arrangement.';

  @override
  String get routineFull => 'RUTINA COMPLETĂ (16/16 PASI)';

  @override
  String addStepCount(Object count) {
    return 'ADAUGĂ PASUL ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Salvați rutina în Robot';

  @override
  String get selectButtonToProgram =>
      'Selectați un buton de robot fizic pentru a programa cu această rutină:';

  @override
  String buttonNumber(Object slot) {
    return 'Butonul $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Buton hardware $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Butonul $slot Subtitrare (Opțional)';
  }

  @override
  String get saveToRobotButton => 'SALVAȚI PE ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Butonul $slot ($count pași)';
  }

  @override
  String get adultTshirtTemplate => 'Șablon de tricou pentru adulți';

  @override
  String get longSleeveTemplate => 'Șablon cu mânecă lungă';

  @override
  String get dualSweepTemplate => 'Șablon Dual Sweep';

  @override
  String channelNumber(Object number) {
    return 'Canalul $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count împerecheat';
  }

  @override
  String get moreHardwareOptions => 'Mai multe opțiuni hardware';

  @override
  String get loadTemplate => 'Încărcare șablon';

  @override
  String get controllerLabel => 'CONTROLER';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'URMATĂ';

  @override
  String get baseBadge => 'BAZĂ';

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
