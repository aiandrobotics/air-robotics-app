// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Seaded';

  @override
  String get appLanguageTitle => 'Rakenduse keel';

  @override
  String get appVersionTitle => 'Rakenduse versioon';

  @override
  String get languageSectionTitle => 'Keel';

  @override
  String get languageSystemDefault => 'Süsteemi vaikekeel (seadme keel)';

  @override
  String get selectLanguageHint => 'Valige keel';

  @override
  String get addDeviceTitle => 'LISA UUS ROBOT';

  @override
  String get addDeviceSubtitle => 'Paarige AIR-robotid';

  @override
  String get yourRobots => 'SINU ROBOTID';

  @override
  String get discoveredRobots => 'AVASTATUD ROBOTID';

  @override
  String get noRobotsPairedYet => 'Robotid pole veel paaritud';

  @override
  String get noRobotsPairedSubtitle =>
      'Ühendage oma robot, et vaadata telemeetriat, hallata eelseadeid ja juhtida toiminguid.';

  @override
  String get addYourFirstRobot => 'LISAGE OMA ESIMESE ROBOT';

  @override
  String get autoScanning => 'AUTOMAATNE SKANNIMINE';

  @override
  String get idleStatus => 'TÜÜDKÄIK';

  @override
  String get tabControl => 'Kontrolli';

  @override
  String get tabSequencer => 'Järjestus';

  @override
  String get tabCalibrator => 'Kalibraator';

  @override
  String get tabDiagnostics => 'Diagnostika';

  @override
  String get renameRobot => 'Nimeta Robot ümber';

  @override
  String get bleDiagnostics => 'BLE diagnostika';

  @override
  String get erasePresets => 'Salvestatud eelseadete kustutamine';

  @override
  String get disconnect => 'Katkesta ühendus';

  @override
  String get unpairRobot => 'Katkestage roboti sidumine';

  @override
  String get factoryReset => 'Tehaseseaded';

  @override
  String get servoManualJog => 'SERVO KÄSITSI JOG';

  @override
  String get homeAll => 'KODU KÕIK';

  @override
  String get foldingTimeline => 'KOKKUVÕTT AJASKAA';

  @override
  String get addStep => 'LISA SAMM';

  @override
  String get previewOnRobot => 'EELVAATE ROBOTIL';

  @override
  String get saveToButton => 'SALVESTA NUPP';

  @override
  String get themeTitle => 'Teema';

  @override
  String get themeSystem => 'Seade';

  @override
  String get themeLight => 'Valgus';

  @override
  String get themeDark => 'Tume';

  @override
  String get connectedBadge => 'ÜHENDATUD';

  @override
  String get inRangeBadge => 'VALIKUS';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'AVATUD';

  @override
  String get connectButton => 'ÜHENDA';

  @override
  String get reconnectButton => 'ÜHENDA TAAS';

  @override
  String get pairAndConnect => 'PAIDU JA ÜHENDA';

  @override
  String get autoScanningForRobots => 'Automaatne robotite otsimine...';

  @override
  String get scanningIdle => 'Skannimine tühikäigul';

  @override
  String get nearbyRobotsAppear =>
      'Läheduses olevad robotid ilmuvad siia automaatselt.';

  @override
  String get yourNearbyRobotsAppear =>
      'Teie läheduses olevad robotid kuvatakse siin automaatselt.';

  @override
  String get signalStrong => 'Tugev';

  @override
  String get signalGood => 'Hea';

  @override
  String get signalWeak => 'Nõrk';

  @override
  String get addRobotIntro =>
      'Valige sidumiseks allpool robot. Kõik läheduses olevad sidumisrežiimis olevad robotid tuvastatakse automaatselt ülaosas.';

  @override
  String get autoDiscoveredRobot => 'AUTOMAATSELT AVASTATUD ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTOMAATSELT AVASTATUD ROBOTID';

  @override
  String readyCountBadge(Object count) {
    return '$count VALMIS';
  }

  @override
  String get supportedRobots => 'TOETATUD ROBOTID';

  @override
  String get clothesFoldingRobot => 'Rõivaste voltimisrobot';

  @override
  String get fabricaDescription =>
      'Automaatne rõivakaust mitme rõiva eelseadetega ja puutetundliku ühe nupuvajutusega.';

  @override
  String get fabricaPairingHint =>
      'Sidumisrežiim: vajutage ja hoidke 3 sekundit all suvalist nuppu Fabrica juhtpaneelil (oleku LED vilgub kiiresti).';

  @override
  String get pairFabricaNow => 'PAIDU KANGA KOHE';

  @override
  String get backToHome => 'Tagasi avalehele';

  @override
  String get connReady => 'VALMIS';

  @override
  String get connConnecting => 'ÜHENDAMINE';

  @override
  String get connDiscovering => 'AVASTAMINE';

  @override
  String get connBonding => 'LIIDEMINE';

  @override
  String get connScanning => 'SKANNERIMINE';

  @override
  String get connDisconnected => 'ÜHENDUS LAHTI';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Kas katkestada ühendus võrguga $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Saate avakuval igal ajal uuesti ühenduse luua.';

  @override
  String get cancelButton => 'TÜHISTA';

  @override
  String get saveButton => 'SALVESTA';

  @override
  String get customNickname => 'Kohandatud hüüdnimi';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Kas katkestada $name sidumine?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'See eemaldab selle telefoni teie robotitest $name. Saate selle igal ajal uuesti lisada.\n\nMärkus. Roboti mälu täielikuks tühjendamiseks ja tehase vaikesätete taastamiseks kasutage tehaseseadete lähtestamist.';
  }

  @override
  String get unpairButton => 'LAHENDADA PAARID';

  @override
  String get machineIdle => 'TÜÜDKÄIK';

  @override
  String get machineRunning => 'JOOKSEMAS';

  @override
  String get machineEstop => 'E-STOPP';

  @override
  String get machineError => 'VIGA';

  @override
  String get machineCalibrating => 'KALIBREERIMINE';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'SALVESTATUD';

  @override
  String get ledInputErr => 'SISEND ERR';

  @override
  String get ledPairing => 'SIDUMINE';

  @override
  String get ledConnected => 'ÜHENDATUD';

  @override
  String get ledIdentify => 'TUNNISTAGE';

  @override
  String get identifyButton => 'TUNNISTAGE';

  @override
  String get identifyingToast => 'Roboti LED-tuli vilgub 3 sekundit...';

  @override
  String get homingToast => 'Kõigi klappide paigutamine...';

  @override
  String get i2cFault => 'I2C VIGA';

  @override
  String get storageFault => 'SALVESTAMISVIGA';

  @override
  String get estopLatched => 'E-PEATUS LÜHIS';

  @override
  String get presetButtonsTitle => 'EELSEADETUD NUPPID';

  @override
  String customizePresetTitle(Object label) {
    return 'Kohanda $label';
  }

  @override
  String get subtitleNameLabel => 'Alapealkirja nimi';

  @override
  String get subtitleNameHint => 'nt. Kiire voltimine, särgid, kohandatud...';

  @override
  String get buttonColorLabel => 'Nupu värv';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Samm $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'HÄdapeatus';

  @override
  String get clearEstop => 'TÜHJENDAGE JA AVATAGE E-STOPP';

  @override
  String get clearEstopHint =>
      'Lähtestab hädaseiskamise ja tagastab roboti jõudeolekusse';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'KANGA KOKKUVÕTE';

  @override
  String get editArrangement => 'TÖÖKORRALDUS';

  @override
  String get addPanel => 'LISA PANEEL';

  @override
  String get legendMotorized => 'Motoriseeritud';

  @override
  String get legendFollower => 'Jälgija';

  @override
  String get legendBase => 'Alus';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'read';

  @override
  String stepSelectedHint(Object step) {
    return 'Valitud samm $step: puudutage ruudustikus 1–2 mootoriga paneeli';
  }

  @override
  String get tapPanelsHint => 'Puudutage 1–2 mootoripaneeli võrku';

  @override
  String get dualBadge => 'KAKS';

  @override
  String get requiresMotorizedPanel =>
      'Nõuab vähemalt 1 mootoriga paneeli (max 2)';

  @override
  String get selectedChangePanelsHint =>
      'Valitud • Puudutage muutmiseks ruudustiku paneele (max 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Samm $step/$total';
  }

  @override
  String get removeStepTooltip => 'Eemalda samm';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutiin nõuab vähemalt ühte Fabrica Arrangementi mootoriga moodulit.';

  @override
  String get routineFull => 'RUTINE TÄIS (16/16 SAMMU)';

  @override
  String addStepCount(Object count) {
    return 'LISA SAMM ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Salvestage rutiin robotisse';

  @override
  String get selectButtonToProgram =>
      'Valige selle rutiiniga programmeerimiseks füüsiline roboti nupp:';

  @override
  String buttonNumber(Object slot) {
    return 'Nupp $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Riistvara nupp $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Nupp $slot Subtiitrid (valikuline)';
  }

  @override
  String get saveToRobotButton => 'SALVESTA ROBOTISSE';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Nupp $slot ($count sammu)';
  }

  @override
  String get adultTshirtTemplate => 'Täiskasvanute T-särgi mall';

  @override
  String get longSleeveTemplate => 'Pikkade varrukatega mall';

  @override
  String get dualSweepTemplate => 'Kahekordne pühkimismall';

  @override
  String channelNumber(Object number) {
    return 'Kanal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PAIRUD';
  }

  @override
  String get moreHardwareOptions => 'Rohkem riistvaravalikuid';

  @override
  String get loadTemplate => 'Laadi mall';

  @override
  String get controllerLabel => 'KONTROLLER';

  @override
  String get motorBadge => 'MOOTOR';

  @override
  String get followerBadge => 'JÄLGIJA';

  @override
  String get baseBadge => 'ALUS';

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
