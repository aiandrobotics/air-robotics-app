// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

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
  String get languageSystemDefault => 'Zadano sustavom (jezik uređaja)';

  @override
  String get selectLanguageHint => 'Odaberite jezik';

  @override
  String get addDeviceTitle => 'DODAJ NOVOG ROBOTA';

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
      'Povežite svog robota za pregled telemetrije, upravljanje unaprijed postavljenim postavkama i kontrolu operacija.';

  @override
  String get addYourFirstRobot => 'DODAJTE SVOG PRVOG ROBOTA';

  @override
  String get autoScanning => 'AUTOMATSKO SKENIRANJE';

  @override
  String get idleStatus => 'PRAZAN RAD';

  @override
  String get tabControl => 'Kontrolirati';

  @override
  String get tabSequencer => 'Sekvencer';

  @override
  String get tabCalibrator => 'Kalibrator';

  @override
  String get tabDiagnostics => 'Dijagnostika';

  @override
  String get renameRobot => 'Preimenuj robota';

  @override
  String get bleDiagnostics => 'BLE dijagnostika';

  @override
  String get erasePresets =>
      'Izbriši spremljene unaprijed postavljene postavke';

  @override
  String get disconnect => 'Prekini vezu';

  @override
  String get unpairRobot => 'Raskini par robota';

  @override
  String get factoryReset => 'Vraćanje na tvorničke postavke';

  @override
  String get servoManualJog => 'SERVO RUČNI JOG';

  @override
  String get homeAll => 'DOMA SVE';

  @override
  String get foldingTimeline => 'PREKLOPIVA VREMENSKA TRAKA';

  @override
  String get addStep => 'DODAJ KORAK';

  @override
  String get previewOnRobot => 'PREGLED NA ROBOTU';

  @override
  String get saveToButton => 'SPREMI NA GUMB';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Uređaj';

  @override
  String get themeLight => 'Svjetlo';

  @override
  String get themeDark => 'tamno';

  @override
  String get connectedBadge => 'POVEZAN';

  @override
  String get inRangeBadge => 'U DOMETU';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'OTVORITI';

  @override
  String get connectButton => 'POVEŽI SE';

  @override
  String get reconnectButton => 'PONOVO POVEŽI';

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
      'Vaši roboti u blizini automatski će se pojaviti ovdje.';

  @override
  String get signalStrong => 'Jaka';

  @override
  String get signalGood => 'Dobro';

  @override
  String get signalWeak => 'Slabo';

  @override
  String get addRobotIntro =>
      'U nastavku odaberite robota za uparivanje. Svaki robot u blizini u načinu uparivanja automatski će se otkriti na vrhu.';

  @override
  String get autoDiscoveredRobot => 'AUTO OTKRIO ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTOMATSKI OTKRIVENI ROBOTI';

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
      'Automatizirano savijanje odjevnih predmeta s unaprijed postavljenim postavkama za više odjevnih predmeta i taktilnim upravljanjem jednim gumbom.';

  @override
  String get fabricaPairingHint =>
      'Način uparivanja: Pritisnite i držite bilo koji gumb na upravljačkoj ploči Fabrica 3 sekunde (LED statusa će brzo treperiti).';

  @override
  String get pairFabricaNow => 'UPARI FABRICA ODMAH';

  @override
  String get backToHome => 'Povratak kući';

  @override
  String get connReady => 'SPREMAN';

  @override
  String get connConnecting => 'POVEZIVANJE';

  @override
  String get connDiscovering => 'OTKRIVANJE';

  @override
  String get connBonding => 'VIJEZIVANJE';

  @override
  String get connScanning => 'SKENIRANJE';

  @override
  String get connDisconnected => 'ISKLJUČEN';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Prekinuti vezu s $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Možete se ponovno povezati bilo kada s početnog zaslona.';

  @override
  String get cancelButton => 'OTKAZATI';

  @override
  String get saveButton => 'UŠTEDJETI';

  @override
  String get customNickname => 'Prilagođeni nadimak';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Raskinuti uparivanje $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Ovo će ukloniti $name iz vaših robota na ovom telefonu. Možete ga ponovno dodati u bilo kojem trenutku.\n\nNapomena: Za potpuno brisanje memorije robota i vraćanje tvorničkih postavki koristite \"Vraćanje na tvorničke postavke\".';
  }

  @override
  String get unpairButton => 'RASPARITI';

  @override
  String get machineIdle => 'PRAZAN RAD';

  @override
  String get machineRunning => 'TRČANJE';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'POGREŠKA';

  @override
  String get machineCalibrating => 'KALIBRIRANJE';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'SPAŠENO';

  @override
  String get ledInputErr => 'POGREŠKA UNOSA';

  @override
  String get ledPairing => 'UPARIVANJE';

  @override
  String get ledConnected => 'POVEZAN';

  @override
  String get ledIdentify => 'IDENTIFICIRATI';

  @override
  String get identifyButton => 'IDENTIFICIRATI';

  @override
  String get identifyingToast => 'Bljeskanje LED robota 3 sekunde...';

  @override
  String get homingToast => 'Postavljanje svih zakrilca...';

  @override
  String get i2cFault => 'KVAR I2C';

  @override
  String get storageFault => 'POGREŠKA POHRANE';

  @override
  String get estopLatched => 'E-STOP ZAKLJUČAN';

  @override
  String get presetButtonsTitle => 'PRESET TIPKE';

  @override
  String customizePresetTitle(Object label) {
    return 'Prilagodi $label';
  }

  @override
  String get subtitleNameLabel => 'Naziv podnaslova';

  @override
  String get subtitleNameHint => 'npr. Brzo sklapanje, košulje, po narudžbi...';

  @override
  String get buttonColorLabel => 'Boja gumba';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Korak $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'ZAUSTAVLJANJE U HITNOSTI';

  @override
  String get clearEstop => 'OČISTI I OTKLJUČI E-STOP';

  @override
  String get clearEstopHint =>
      'Resetira hitno zaustavljanje i vraća robota u mirovanje';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'ARANŽMAN TVARNICE';

  @override
  String get editArrangement => 'UREDI ARANŽMAN';

  @override
  String get addPanel => 'DODAJ PLOČU';

  @override
  String get legendMotorized => 'Motorizirana';

  @override
  String get legendFollower => 'Sljedbenik';

  @override
  String get legendBase => 'Baza';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Redovi';

  @override
  String stepSelectedHint(Object step) {
    return 'Odabran korak $step: dodirnite 1–2 motorizirane ploče na mreži';
  }

  @override
  String get tapPanelsHint => 'Dodirnite 1–2 ploče motora na mreži';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Zahtijeva najmanje 1 motoriziranu ploču (maksimalno 2)';

  @override
  String get selectedChangePanelsHint =>
      'Odabrano • Dodirnite rešetkaste ploče za promjenu (maksimalno 2)';

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
  String get routineFull => 'PUNA RUTINA (16/16 KORAKA)';

  @override
  String addStepCount(Object count) {
    return 'DODAJ KORAK ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Spremi rutinu u robot';

  @override
  String get selectButtonToProgram =>
      'Odaberite fizički gumb robota za programiranje ovom rutinom:';

  @override
  String buttonNumber(Object slot) {
    return 'Gumb $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Hardverska tipka $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Gumb $slot Podnaslov (izborno)';
  }

  @override
  String get saveToRobotButton => 'SPREMI U ROBOTA';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Gumb $slot ($count koraka)';
  }

  @override
  String get adultTshirtTemplate =>
      'Predložak majice kratkih rukava za odrasle';

  @override
  String get longSleeveTemplate => 'Šablona dugih rukava';

  @override
  String get dualSweepTemplate => 'Predložak dvostrukog čišćenja';

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
  String get controllerLabel => 'KONTROLOR';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'SLJEDBENIK';

  @override
  String get baseBadge => 'BAZA';

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
