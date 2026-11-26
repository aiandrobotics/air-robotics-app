// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Asetukset';

  @override
  String get appLanguageTitle => 'Sovelluksen kieli';

  @override
  String get appVersionTitle => 'Sovelluksen versio';

  @override
  String get languageSectionTitle => 'Kieli';

  @override
  String get languageSystemDefault => 'Järjestelmän oletus (laitteen kieli)';

  @override
  String get selectLanguageHint => 'Valitse kieli';

  @override
  String get addDeviceTitle => 'LISÄÄ UUSI ROBOTI';

  @override
  String get addDeviceSubtitle => 'Yhdistä AIR-robotit';

  @override
  String get yourRobots => 'SINUN ROBOTTIT';

  @override
  String get discoveredRobots => 'LÖYDYT ROBOTEJA';

  @override
  String get noRobotsPairedYet => 'Robotteja ei ole vielä yhdistetty';

  @override
  String get noRobotsPairedSubtitle =>
      'Liitä robottisi tarkastellaksesi telemetriaa, hallitaksesi esiasetuksia ja ohjataksesi toimintoja.';

  @override
  String get addYourFirstRobot => 'LISÄÄ ENSIMMÄINEN ROBOTISI';

  @override
  String get autoScanning => 'AUTOMAATTINEN SKANNAUS';

  @override
  String get idleStatus => 'Tyhjäkäynti';

  @override
  String get tabControl => 'Ohjaus';

  @override
  String get tabSequencer => 'Sekvensoija';

  @override
  String get tabCalibrator => 'Kalibraattori';

  @override
  String get tabDiagnostics => 'Diagnostiikka';

  @override
  String get renameRobot => 'Nimeä robotti uudelleen';

  @override
  String get bleDiagnostics => 'BLE-diagnostiikka';

  @override
  String get erasePresets => 'Poista tallennetut esiasetukset';

  @override
  String get disconnect => 'Katkaise yhteys';

  @override
  String get unpairRobot => 'Pura robottipari';

  @override
  String get factoryReset => 'Tehdasasetusten palautus';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'KOTI KAIKKI';

  @override
  String get foldingTimeline => 'TAITTAVA AIKAJALA';

  @override
  String get addStep => 'LISÄÄ VAIHE';

  @override
  String get previewOnRobot => 'ESIKATSELU ROBOTTISSA';

  @override
  String get saveToButton => 'TALLENNA PAINIKKEEN';

  @override
  String get themeTitle => 'Teema';

  @override
  String get themeSystem => 'Laite';

  @override
  String get themeLight => 'Kevyt';

  @override
  String get themeDark => 'Tumma';

  @override
  String get connectedBadge => 'YHDISTETTY';

  @override
  String get inRangeBadge => 'ALUSSA';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'AUKI';

  @override
  String get connectButton => 'Yhdistä';

  @override
  String get reconnectButton => 'Yhdistä UUDELLEEN';

  @override
  String get pairAndConnect => 'Yhdistä ja yhdistä';

  @override
  String get autoScanningForRobots => 'Automaattinen haku robottien varalta...';

  @override
  String get scanningIdle => 'Skannaus tyhjäkäynnillä';

  @override
  String get nearbyRobotsAppear =>
      'Läheiset robotit näkyvät täällä automaattisesti.';

  @override
  String get yourNearbyRobotsAppear =>
      'Lähellä olevat robotit näkyvät täällä automaattisesti.';

  @override
  String get signalStrong => 'Vahva';

  @override
  String get signalGood => 'Hyvä';

  @override
  String get signalWeak => 'Heikko';

  @override
  String get addRobotIntro =>
      'Valitse pariliitos alta. Kaikki lähellä olevat pariliitostilassa olevat robotit löydetään automaattisesti yläreunasta.';

  @override
  String get autoDiscoveredRobot => 'AUTOMAATTISESTI LÖYDYTTY ROBOTI';

  @override
  String get autoDiscoveredRobots => 'AUTOMAATTISESTI LÖYDYTTYJÄ ROBOTEJA';

  @override
  String readyCountBadge(Object count) {
    return '$count VALMIS';
  }

  @override
  String get supportedRobots => 'TUETTUJA ROBOTEJA';

  @override
  String get clothesFoldingRobot => 'Vaatteiden taittorobotti';

  @override
  String get fabricaDescription =>
      'Automaattinen vaatekansio, jossa on usean vaatteen esiasetukset ja kosketusnäyttö yhdellä painikkeella.';

  @override
  String get fabricaPairingHint =>
      'Pariliitostila: Paina ja pidä painettuna mitä tahansa Fabrica-ohjauspaneelin painiketta 3 sekunnin ajan (tilan merkkivalo vilkkuu nopeasti).';

  @override
  String get pairFabricaNow => 'Yhdistä KANKAS NYT';

  @override
  String get backToHome => 'Takaisin etusivulle';

  @override
  String get connReady => 'VALMIS';

  @override
  String get connConnecting => 'YHTEYTTÄ';

  @override
  String get connDiscovering => 'LÖYDYTTÄMINEN';

  @override
  String get connBonding => 'SIDOSTUS';

  @override
  String get connScanning => 'SKANNAUS';

  @override
  String get connDisconnected => 'YHTEYS IRTI';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Katkaisetko yhteyden $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Voit muodostaa yhteyden uudelleen milloin tahansa aloitusnäytöstä.';

  @override
  String get cancelButton => 'PERUUTA';

  @override
  String get saveButton => 'TALLENNA';

  @override
  String get customNickname => 'Mukautettu lempinimi';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Pura laitepari $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Tämä poistaa $name tämän puhelimen roboteistasi. Voit lisätä sen uudelleen milloin tahansa.\n\nHuomautus: Voit tyhjentää robotin muistin kokonaan ja palauttaa tehdasasetukset käyttämällä Tehdasasetusten palautusta.';
  }

  @override
  String get unpairButton => 'POISTA PARI';

  @override
  String get machineIdle => 'Tyhjäkäynti';

  @override
  String get machineRunning => 'JUOKSEN';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'VIRHE';

  @override
  String get machineCalibrating => 'KALIBROINTI';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'TALLENNETTU';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'PARITUS';

  @override
  String get ledConnected => 'YHDISTETTY';

  @override
  String get ledIdentify => 'TUNNISTAA';

  @override
  String get identifyButton => 'TUNNISTAA';

  @override
  String get identifyingToast => 'Robotti-LED vilkkuu 3 sekuntia...';

  @override
  String get homingToast => 'Kaikkien läppien kotiuttaminen...';

  @override
  String get i2cFault => 'I2C VIKA';

  @override
  String get storageFault => 'SÄILYTYSVIKA';

  @override
  String get estopLatched => 'E-STOP LUKITTU';

  @override
  String get presetButtonsTitle => 'PRESET PAINIKKEET';

  @override
  String customizePresetTitle(Object label) {
    return 'Mukauta $label';
  }

  @override
  String get subtitleNameLabel => 'Tekstityksen nimi';

  @override
  String get subtitleNameHint => 'esim. Pikataitto, Paidat, Räätälöidyt...';

  @override
  String get buttonColorLabel => 'Painikkeen väri';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Vaihe $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'HÄTÄSEIS';

  @override
  String get clearEstop => 'TYHJENNÄ JA AVAA E-STOP';

  @override
  String get clearEstopHint =>
      'Nollaa hätäpysäytystoiminnon ja palauttaa robotin tyhjäkäynnille';

  @override
  String get stopButton => 'LOPETA';

  @override
  String get fabricaArrangementTitle => 'KANKASJÄRJESTELY';

  @override
  String get editArrangement => 'MUOKKAUSJÄRJESTELY';

  @override
  String get addPanel => 'LISÄÄ PANEELI';

  @override
  String get legendMotorized => 'Motorisoitu';

  @override
  String get legendFollower => 'Seuraaja';

  @override
  String get legendBase => 'Pohja';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Rivit';

  @override
  String stepSelectedHint(Object step) {
    return 'Vaihe $step valittu: Napauta 1–2 moottoroitua paneelia ruudukossa';
  }

  @override
  String get tapPanelsHint => 'Napauta 1–2 moottoripaneelia verkkoon';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Vaatii vähintään 1 moottoroidun paneelin (max 2)';

  @override
  String get selectedChangePanelsHint =>
      'Valittu • Muuta napauttamalla ruudukkopaneeleja (enintään 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Vaihe $step / $total';
  }

  @override
  String get removeStepTooltip => 'Poista vaihe';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutiini vaatii vähintään yhden moottoroidun moduulin Fabrica Arrangementilta.';

  @override
  String get routineFull => 'RUTINI TÄYNNÄ (16/16 ASKELTA)';

  @override
  String addStepCount(Object count) {
    return 'LISÄÄ VAIHE ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Tallenna rutiini robottiin';

  @override
  String get selectButtonToProgram =>
      'Valitse fyysinen robottipainike ohjelmoitavaksi tällä rutiinilla:';

  @override
  String buttonNumber(Object slot) {
    return 'Painike $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Laitteistopainike $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Painike $slot Tekstitys (valinnainen)';
  }

  @override
  String get saveToRobotButton => 'TALLENNA ROBOTTILLE';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Painike $slot ($count vaiheet)';
  }

  @override
  String get adultTshirtTemplate => 'Aikuisten T-paitamalli';

  @override
  String get longSleeveTemplate => 'Pitkähihainen malli';

  @override
  String get dualSweepTemplate => 'Dual Sweep -malli';

  @override
  String channelNumber(Object number) {
    return 'Kanava $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PARITEETTI';
  }

  @override
  String get moreHardwareOptions => 'Lisää laitteistovaihtoehtoja';

  @override
  String get loadTemplate => 'Lataa malli';

  @override
  String get controllerLabel => 'OHJAIN';

  @override
  String get motorBadge => 'MOOTTORI';

  @override
  String get followerBadge => 'SEURAAJA';

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
