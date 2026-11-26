// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Nastavitve';

  @override
  String get appLanguageTitle => 'Jezik aplikacije';

  @override
  String get appVersionTitle => 'Različica aplikacije';

  @override
  String get languageSectionTitle => 'Jezik';

  @override
  String get languageSystemDefault => 'Sistemsko privzeto (jezik naprave)';

  @override
  String get selectLanguageHint => 'Izberite jezik';

  @override
  String get addDeviceTitle => 'DODAJ NOVEGA ROBOTA';

  @override
  String get addDeviceSubtitle => 'Združi robote AIR';

  @override
  String get yourRobots => 'VAŠI ROBOTI';

  @override
  String get discoveredRobots => 'ODKRITI ROBOTI';

  @override
  String get noRobotsPairedYet => 'Noben robot še ni seznanjen';

  @override
  String get noRobotsPairedSubtitle =>
      'Povežite svojega robota za ogled telemetrije, upravljanje prednastavitev in nadzor operacij.';

  @override
  String get addYourFirstRobot => 'DODAJTE SVOJEGA PRVEGA ROBOTA';

  @override
  String get autoScanning => 'SAMODEJNO SKENIRANJE';

  @override
  String get idleStatus => 'PRAZNEGA DELA';

  @override
  String get tabControl => 'Nadzor';

  @override
  String get tabSequencer => 'Sekvencer';

  @override
  String get tabCalibrator => 'Kalibrator';

  @override
  String get tabDiagnostics => 'Diagnostika';

  @override
  String get renameRobot => 'Preimenuj robota';

  @override
  String get bleDiagnostics => 'Diagnostika BLE';

  @override
  String get erasePresets => 'Izbriši shranjene prednastavitve';

  @override
  String get disconnect => 'Prekini povezavo';

  @override
  String get unpairRobot => 'Razdruži robota';

  @override
  String get factoryReset => 'Ponastavitev na tovarniške nastavitve';

  @override
  String get servoManualJog => 'SERVO ROČNI JOG';

  @override
  String get homeAll => 'DOM VSI';

  @override
  String get foldingTimeline => 'ZLOŽLJIVA ČASOVNICA';

  @override
  String get addStep => 'DODAJ KORAK';

  @override
  String get previewOnRobot => 'PREDOGLED NA ROBOTU';

  @override
  String get saveToButton => 'SHRANI NA GUMB';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Naprava';

  @override
  String get themeLight => 'Svetloba';

  @override
  String get themeDark => 'Temno';

  @override
  String get connectedBadge => 'POVEZAN';

  @override
  String get inRangeBadge => 'V DOSEGU';

  @override
  String get offlineBadge => 'BREZ POVEZAVE';

  @override
  String get openButton => 'ODPRTO';

  @override
  String get connectButton => 'POVEŽI';

  @override
  String get reconnectButton => 'ZNOVA POVEŽI';

  @override
  String get pairAndConnect => 'PAR IN POVEŽI';

  @override
  String get autoScanningForRobots => 'Samodejno skeniranje za robote ...';

  @override
  String get scanningIdle => 'Skeniranje v mirovanju';

  @override
  String get nearbyRobotsAppear =>
      'Roboti v bližini se bodo tukaj samodejno prikazali.';

  @override
  String get yourNearbyRobotsAppear =>
      'Vaši bližnji roboti se bodo tukaj samodejno prikazali.';

  @override
  String get signalStrong => 'Močna';

  @override
  String get signalGood => 'Dobro';

  @override
  String get signalWeak => 'Šibko';

  @override
  String get addRobotIntro =>
      'Spodaj izberite robota za seznanitev. Vsi bližnji roboti v načinu seznanjanja bodo samodejno odkriti na vrhu.';

  @override
  String get autoDiscoveredRobot => 'SAMODEJNO ODKRIT ROBOT';

  @override
  String get autoDiscoveredRobots => 'SAMODEJNO ODKRITI ROBOTI';

  @override
  String readyCountBadge(Object count) {
    return '$count PRIPRAVLJENO';
  }

  @override
  String get supportedRobots => 'PODPRTI ROBOTI';

  @override
  String get clothesFoldingRobot => 'Robot za zlaganje oblačil';

  @override
  String get fabricaDescription =>
      'Avtomatizirano zlaganje oblačil s prednastavitvami za več oblačil in otipljivim upravljanjem z enim gumbom.';

  @override
  String get fabricaPairingHint =>
      'Način seznanjanja: Pritisnite in držite kateri koli gumb na nadzorni plošči Fabrica 3 sekunde (LED stanja bo hitro utripala).';

  @override
  String get pairFabricaNow => 'PARITE FABRICA ZDAJ';

  @override
  String get backToHome => 'Nazaj na dom';

  @override
  String get connReady => 'PRIPRAVLJEN';

  @override
  String get connConnecting => 'POVEZOVANJE';

  @override
  String get connDiscovering => 'ODKRIVANJE';

  @override
  String get connBonding => 'LEPLJENJE';

  @override
  String get connScanning => 'SKENIRANJE';

  @override
  String get connDisconnected => 'ODKLOPLJENO';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Prekiniti povezavo z $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Kadar koli se lahko znova povežete z začetnega zaslona.';

  @override
  String get cancelButton => 'PREKLIC';

  @override
  String get saveButton => 'SHRANI';

  @override
  String get customNickname => 'Vzdevek po meri';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Razdružiti $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'S tem boste odstranili $name iz vaših robotov v tem telefonu. Kadar koli ga lahko znova dodate.\n\nOpomba: Če želite popolnoma izbrisati pomnilnik robota in obnoviti tovarniške nastavitve, uporabite »Ponastavitev na tovarniške nastavitve«.';
  }

  @override
  String get unpairButton => 'RAZPAJ';

  @override
  String get machineIdle => 'PRAZNEGA DELA';

  @override
  String get machineRunning => 'TEKA';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'NAPAKA';

  @override
  String get machineCalibrating => 'KALIBRIRANJE';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'SHRANJENO';

  @override
  String get ledInputErr => 'NAPAKA PRI VNOSU';

  @override
  String get ledPairing => 'PARING';

  @override
  String get ledConnected => 'POVEZAN';

  @override
  String get ledIdentify => 'IDENTIFICIRAJ';

  @override
  String get identifyButton => 'IDENTIFICIRAJ';

  @override
  String get identifyingToast => 'LED robota utripa 3 sekunde ...';

  @override
  String get homingToast => 'Nastavljanje vseh loput ...';

  @override
  String get i2cFault => 'NAPAKA I2C';

  @override
  String get storageFault => 'NAPAKA SHRANJEVANJA';

  @override
  String get estopLatched => 'E-STOP ZAKLOP';

  @override
  String get presetButtonsTitle => 'PREDNASTAVLJENI GUMBI';

  @override
  String customizePresetTitle(Object label) {
    return 'Prilagodi $label';
  }

  @override
  String get subtitleNameLabel => 'Ime podnapisa';

  @override
  String get subtitleNameHint => 'npr. Hitro zlaganje, srajce, po meri ...';

  @override
  String get buttonColorLabel => 'Barva gumba';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Korak $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'USTAVITEV V SILI';

  @override
  String get clearEstop => 'POČISTITE IN ODKLOPITE E-STOP';

  @override
  String get clearEstopHint =>
      'Ponastavi zaustavitev v sili in vrne robota v stanje mirovanja';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'UREDITEV TKANINE';

  @override
  String get editArrangement => 'UREDI ARANŽMA';

  @override
  String get addPanel => 'DODAJ PLOŠČO';

  @override
  String get legendMotorized => 'Motoriziran';

  @override
  String get legendFollower => 'Sledilec';

  @override
  String get legendBase => 'Osnova';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Vrstice';

  @override
  String stepSelectedHint(Object step) {
    return 'Izbran korak $step: tapnite 1–2 motoriziranih plošč na mreži';
  }

  @override
  String get tapPanelsHint => 'Dotaknite se 1–2 motornih plošč na mrežo';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Zahteva vsaj 1 motorizirano ploščo (največ 2)';

  @override
  String get selectedChangePanelsHint =>
      'Izbrano • Tapnite mrežne plošče za spremembo (največ 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Korak $step od $total';
  }

  @override
  String get removeStepTooltip => 'Odstrani korak';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutina zahteva vsaj en motoriziran modul iz Fabrica Arrangement.';

  @override
  String get routineFull => 'RUTINA POLNA (16/16 KORAKOV)';

  @override
  String addStepCount(Object count) {
    return 'DODAJ KORAK ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Shrani rutino v robota';

  @override
  String get selectButtonToProgram =>
      'Izberite fizični robotski gumb za programiranje s to rutino:';

  @override
  String buttonNumber(Object slot) {
    return 'Gumb $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Gumb strojne opreme $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Gumb $slot Podnaslov (izbirno)';
  }

  @override
  String get saveToRobotButton => 'SHRANI V ROBOTA';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Gumb $slot ($count korakov)';
  }

  @override
  String get adultTshirtTemplate => 'Predloga majice za odrasle';

  @override
  String get longSleeveTemplate => 'Šablona z dolgimi rokavi';

  @override
  String get dualSweepTemplate => 'Predloga dvojnega pometanja';

  @override
  String channelNumber(Object number) {
    return 'Kanal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PARED';
  }

  @override
  String get moreHardwareOptions => 'Več možnosti strojne opreme';

  @override
  String get loadTemplate => 'Naloži predlogo';

  @override
  String get controllerLabel => 'KRMILNIK';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'SPREMLJEVALEC';

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
