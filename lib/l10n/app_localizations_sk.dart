// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Nastavenia';

  @override
  String get appLanguageTitle => 'Jazyk aplikácie';

  @override
  String get appVersionTitle => 'Verzia aplikácie';

  @override
  String get languageSectionTitle => 'Jazyk';

  @override
  String get languageSystemDefault => 'Predvolené systémom (jazyk zariadenia)';

  @override
  String get selectLanguageHint => 'Vyberte jazyk';

  @override
  String get addDeviceTitle => 'PRIDAŤ NOVÉHO ROBOTA';

  @override
  String get addDeviceSubtitle => 'Spárujte roboty AIR';

  @override
  String get yourRobots => 'VAŠE ROBOTY';

  @override
  String get discoveredRobots => 'OBJATÉ ROBOTY';

  @override
  String get noRobotsPairedYet => 'Zatiaľ nie sú spárovaní žiadni roboti';

  @override
  String get noRobotsPairedSubtitle =>
      'Pripojte svoj robot, aby ste mohli sledovať telemetriu, spravovať predvoľby a ovládať operácie.';

  @override
  String get addYourFirstRobot => 'PRIDAJ SVOJHO PRVÉHO ROBOTA';

  @override
  String get autoScanning => 'AUTOMATICKÉ SKENOVANIE';

  @override
  String get idleStatus => 'NEČINNOSŤ';

  @override
  String get tabControl => 'Kontrola';

  @override
  String get tabSequencer => 'Sekvenátor';

  @override
  String get tabCalibrator => 'Kalibrátor';

  @override
  String get tabDiagnostics => 'Diagnostika';

  @override
  String get renameRobot => 'Premenovať robota';

  @override
  String get bleDiagnostics => 'Diagnostika BLE';

  @override
  String get erasePresets => 'Vymazať uložené predvoľby';

  @override
  String get disconnect => 'Odpojiť';

  @override
  String get unpairRobot => 'Zrušiť párovanie robota';

  @override
  String get factoryReset => 'Obnovenie továrenských nastavení';

  @override
  String get servoManualJog => 'SERVOMANUÁLNY JOG';

  @override
  String get homeAll => 'DOMOV VŠETCI';

  @override
  String get foldingTimeline => 'SKLÁDANIE ČASOVEJ osi';

  @override
  String get addStep => 'PRIDAŤ KROK';

  @override
  String get previewOnRobot => 'NÁHĽAD NA ROBOT';

  @override
  String get saveToButton => 'ULOŽIŤ DO TLAČIDLA';

  @override
  String get themeTitle => 'Téma';

  @override
  String get themeSystem => 'Zariadenie';

  @override
  String get themeLight => 'Svetlo';

  @override
  String get themeDark => 'Tmavý';

  @override
  String get connectedBadge => 'PRIPOJENÉ';

  @override
  String get inRangeBadge => 'V ROZSAHU';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'OPEN';

  @override
  String get connectButton => 'PRIPOJIŤ';

  @override
  String get reconnectButton => 'ZNOVU PRIPOJIŤ';

  @override
  String get pairAndConnect => 'PÁROVANIE A SPOJENIE';

  @override
  String get autoScanningForRobots => 'Automatické vyhľadávanie robotov...';

  @override
  String get scanningIdle => 'Skenovanie je nečinné';

  @override
  String get nearbyRobotsAppear => 'Roboty v okolí sa tu objavia automaticky.';

  @override
  String get yourNearbyRobotsAppear =>
      'Vaši roboti v okolí sa tu zobrazia automaticky.';

  @override
  String get signalStrong => 'Silný';

  @override
  String get signalGood => 'Dobre';

  @override
  String get signalWeak => 'slabý';

  @override
  String get addRobotIntro =>
      'Nižšie vyberte robota, ktorý chcete spárovať. Akýkoľvek robot v blízkosti v režime párovania bude automaticky objavený v hornej časti.';

  @override
  String get autoDiscoveredRobot => 'AUTO OBJAVNÝ ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTO OBJAVIL ROBOTY';

  @override
  String readyCountBadge(Object count) {
    return '$count PRIPRAVENÉ';
  }

  @override
  String get supportedRobots => 'PODPOROVANÉ ROBOTY';

  @override
  String get clothesFoldingRobot => 'Robot na skladanie odevov';

  @override
  String get fabricaDescription =>
      'Automatizovaný priečinok na odevy s predvoľbami pre viacero odevov a dotykovým ovládaním jedným tlačidlom.';

  @override
  String get fabricaPairingHint =>
      'Režim párovania: Stlačte a podržte akékoľvek tlačidlo na ovládacom paneli Fabrica na 3 sekundy (LED dióda stavu bude rýchlo blikať).';

  @override
  String get pairFabricaNow => 'SPÁROVAŤ FABRICA TERAZ';

  @override
  String get backToHome => 'Späť na Domov';

  @override
  String get connReady => 'PRIPRAVENÝ';

  @override
  String get connConnecting => 'PRIPOJENIE';

  @override
  String get connDiscovering => 'OBJAVOVAŤ';

  @override
  String get connBonding => 'BONDING';

  @override
  String get connScanning => 'SKENOVANIE';

  @override
  String get connDisconnected => 'ODPOJENÉ';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Odpojiť od $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Z domovskej obrazovky sa môžete kedykoľvek znova pripojiť.';

  @override
  String get cancelButton => 'ZRUŠIŤ';

  @override
  String get saveButton => 'ULOŽIŤ';

  @override
  String get customNickname => 'Vlastná prezývka';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Zrušiť párovanie $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Týmto sa odstráni $name z vašich robotov v tomto telefóne. Kedykoľvek ho môžete znova pridať.\n\nPoznámka: Ak chcete úplne vymazať pamäť robota a obnoviť predvolené výrobné nastavenia, použite „Obnovenie továrenských nastavení“.';
  }

  @override
  String get unpairButton => 'NEPÁROVAŤ';

  @override
  String get machineIdle => 'NEČINNOSŤ';

  @override
  String get machineRunning => 'BEHAŤ';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'CHYBA';

  @override
  String get machineCalibrating => 'KALIBRÁCIA';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'ULOŽENÉ';

  @override
  String get ledInputErr => 'CHYBA VSTUPU';

  @override
  String get ledPairing => 'PÁROVANIE';

  @override
  String get ledConnected => 'PRIPOJENÉ';

  @override
  String get ledIdentify => 'IDENTIFIKOVAŤ';

  @override
  String get identifyButton => 'IDENTIFIKOVAŤ';

  @override
  String get identifyingToast => 'Blikanie LED robota na 3 sekundy...';

  @override
  String get homingToast => 'Nasmerovanie všetkých klapiek...';

  @override
  String get i2cFault => 'I2C FAULT';

  @override
  String get storageFault => 'CHYBA SKLADOVANIA';

  @override
  String get estopLatched => 'E-STOP ZABLOKOVANÝ';

  @override
  String get presetButtonsTitle => 'TLAČIDLÁ PREDVOĽBY';

  @override
  String customizePresetTitle(Object label) {
    return 'Prispôsobiť $label';
  }

  @override
  String get subtitleNameLabel => 'Názov titulkov';

  @override
  String get subtitleNameHint => 'napr. Rýchle skladanie, košele, vlastné...';

  @override
  String get buttonColorLabel => 'Farba tlačidla';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Krok $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'NÚDZOVÉ ZASTAVENIE';

  @override
  String get clearEstop => 'VYMAZAJTE A ODPOJTE E-STOP';

  @override
  String get clearEstopHint =>
      'Resetuje núdzové zastavenie a vráti robota do stavu nečinnosti';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'USPORIADANIE LÁTKY';

  @override
  String get editArrangement => 'UPRAVIŤ USPORIADANIE';

  @override
  String get addPanel => 'PRIDAŤ PANEL';

  @override
  String get legendMotorized => 'Motorizované';

  @override
  String get legendFollower => 'Nasledovateľ';

  @override
  String get legendBase => 'Základňa';

  @override
  String get colsLabel => 'plk';

  @override
  String get rowsLabel => 'Riadky';

  @override
  String stepSelectedHint(Object step) {
    return 'Zvolený krok $step: Klepnite na 1–2 motorizované panely na mriežke';
  }

  @override
  String get tapPanelsHint => 'Klepnite na 1–2 panely motora na mriežku';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Vyžaduje aspoň 1 motorizovaný panel (max 2)';

  @override
  String get selectedChangePanelsHint =>
      'Vybrané • Klepnutím na panely mriežky zmeníte (max. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Krok $step z $total';
  }

  @override
  String get removeStepTooltip => 'Odstrániť krok';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutina vyžaduje aspoň jeden motorizovaný modul od spoločnosti Fabrica Arrangement.';

  @override
  String get routineFull => 'PLNÁ rutina (16/16 KROKOV)';

  @override
  String addStepCount(Object count) {
    return 'PRIDAŤ KROK ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Uložiť rutinu do robota';

  @override
  String get selectButtonToProgram =>
      'Vyberte tlačidlo fyzického robota, ktoré chcete naprogramovať pomocou tejto rutiny:';

  @override
  String buttonNumber(Object slot) {
    return 'Tlačidlo $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Hardvérové tlačidlo $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Tlačidlo $slot Titulky (voliteľné)';
  }

  @override
  String get saveToRobotButton => 'ULOŽIŤ DO ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Tlačidlo $slot ($count krokov)';
  }

  @override
  String get adultTshirtTemplate => 'Šablóna tričiek pre dospelých';

  @override
  String get longSleeveTemplate => 'Šablóna s dlhým rukávom';

  @override
  String get dualSweepTemplate => 'Šablóna dvojitého zametania';

  @override
  String channelNumber(Object number) {
    return 'Kanál $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PÁROVANÉ';
  }

  @override
  String get moreHardwareOptions => 'Ďalšie možnosti hardvéru';

  @override
  String get loadTemplate => 'Načítať šablónu';

  @override
  String get controllerLabel => 'OVLÁDAČ';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'NASLEDOVATEĽ';

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
