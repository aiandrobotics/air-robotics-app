// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Beállítások';

  @override
  String get appLanguageTitle => 'Alkalmazás nyelve';

  @override
  String get appVersionTitle => 'Alkalmazás verziója';

  @override
  String get languageSectionTitle => 'Nyelv';

  @override
  String get languageSystemDefault =>
      'Rendszer alapértelmezett (eszköz nyelve)';

  @override
  String get selectLanguageHint => 'Válasszon nyelvet';

  @override
  String get addDeviceTitle => 'ÚJ ROBOT HOZZÁADÁSA';

  @override
  String get addDeviceSubtitle => 'AIR robotok párosítása';

  @override
  String get yourRobots => 'AZ ÖN ROBOTAI';

  @override
  String get discoveredRobots => 'FELFEDEZETT ROBOTOK';

  @override
  String get noRobotsPairedYet => 'Még nincsenek robotok párosítva';

  @override
  String get noRobotsPairedSubtitle =>
      'Csatlakoztassa robotját a telemetria megtekintéséhez, az előre beállított értékek kezeléséhez és a műveletek vezérléséhez.';

  @override
  String get addYourFirstRobot => 'HOZZÁ AZ ELSŐ ROBOTÁT';

  @override
  String get autoScanning => 'AUTOMATIKUS SZKENNELÉS';

  @override
  String get idleStatus => 'TÉTLEN';

  @override
  String get tabControl => 'Ellenőrzés';

  @override
  String get tabSequencer => 'Szekvenáló';

  @override
  String get tabCalibrator => 'Kalibrátor';

  @override
  String get tabDiagnostics => 'Diagnosztika';

  @override
  String get renameRobot => 'Robot átnevezése';

  @override
  String get bleDiagnostics => 'BLE diagnosztika';

  @override
  String get erasePresets => 'Mentett előbeállítások törlése';

  @override
  String get disconnect => 'Leválasztás';

  @override
  String get unpairRobot => 'Robot párosításának megszüntetése';

  @override
  String get factoryReset => 'Gyári visszaállítás';

  @override
  String get servoManualJog => 'SZERVO KÉZI JOG';

  @override
  String get homeAll => 'OTTHON MINDEN';

  @override
  String get foldingTimeline => 'HAJTÁSI IDŐVONAL';

  @override
  String get addStep => 'LÉPÉS HOZZÁADÁSA';

  @override
  String get previewOnRobot => 'ELŐNÉZET A ROBOTON';

  @override
  String get saveToButton => 'MENTÉS A GOMBBA';

  @override
  String get themeTitle => 'Téma';

  @override
  String get themeSystem => 'Eszköz';

  @override
  String get themeLight => 'Fény';

  @override
  String get themeDark => 'Sötét';

  @override
  String get connectedBadge => 'CSATLAKOZTATVA';

  @override
  String get inRangeBadge => 'TARTOZÉKBAN';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'NYITOTT';

  @override
  String get connectButton => 'KAPCSOLAT';

  @override
  String get reconnectButton => 'ÚJRA KAPCSOLATOS';

  @override
  String get pairAndConnect => 'PÁROSÍTÁS ÉS CSATLAKOZÁS';

  @override
  String get autoScanningForRobots => 'Automatikus keresés robotok után...';

  @override
  String get scanningIdle => 'Szkennelés tétlen';

  @override
  String get nearbyRobotsAppear =>
      'Itt automatikusan megjelennek a közeli robotok.';

  @override
  String get yourNearbyRobotsAppear =>
      'A közelben lévő robotok automatikusan megjelennek itt.';

  @override
  String get signalStrong => 'Erős';

  @override
  String get signalGood => 'Jó';

  @override
  String get signalWeak => 'Gyenge';

  @override
  String get addRobotIntro =>
      'Válasszon ki egy robotot alább a párosításhoz. A párosítási módban lévő közeli robotokat a rendszer automatikusan észleli a tetején.';

  @override
  String get autoDiscoveredRobot => 'AUTOMATIKUS FELFEDEZETT ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTOMATIKUS FELFEDEZÉS ROBOTOK';

  @override
  String readyCountBadge(Object count) {
    return '$count KÉSZ';
  }

  @override
  String get supportedRobots => 'TÁMOGATOTT ROBOTOK';

  @override
  String get clothesFoldingRobot => 'Ruhahajtogató robot';

  @override
  String get fabricaDescription =>
      'Automatizált ruhamappa több ruhadarab előbeállításával és tapintható, egygombos működtetéssel.';

  @override
  String get fabricaPairingHint =>
      'Párosítási mód: Nyomja meg és tartsa lenyomva bármelyik gombot a Fabrica vezérlőpulton 3 másodpercig (az állapotjelző LED gyorsan villog).';

  @override
  String get pairFabricaNow => 'PÁROSÍTSA SZÖVET MOST';

  @override
  String get backToHome => 'Vissza a Kezdőlapra';

  @override
  String get connReady => 'KÉSZ';

  @override
  String get connConnecting => 'CSATLAKOZÁS';

  @override
  String get connDiscovering => 'FELFEDEZÉS';

  @override
  String get connBonding => 'RAGASZTÁS';

  @override
  String get connScanning => 'SZKENNELÉS';

  @override
  String get connDisconnected => 'SZÉTKAPCSOLT';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Megszakítja a kapcsolatot a következővel: $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'A kezdőképernyőről bármikor újracsatlakozhat.';

  @override
  String get cancelButton => 'MÉGSEM';

  @override
  String get saveButton => 'MEGTAKARÍTÁS';

  @override
  String get customNickname => 'Egyedi becenév';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Megszünteti a $name párosítását?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Ezzel eltávolítja a következőt: $name a saját robotjai közül ezen a telefonon. Bármikor újra hozzáadhatja.\n\nMegjegyzés: A robotmemória teljes törléséhez és a gyári alapértékek visszaállításához használja a „Gyári beállítások visszaállítását”.';
  }

  @override
  String get unpairButton => 'SZABADÍTÁS';

  @override
  String get machineIdle => 'TÉTLEN';

  @override
  String get machineRunning => 'FUTÁS';

  @override
  String get machineEstop => 'KIZÁR';

  @override
  String get machineError => 'HIBA';

  @override
  String get machineCalibrating => 'KALIBRÁLÁS';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'MENTÉS';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'PÁROSÍTÁS';

  @override
  String get ledConnected => 'CSATLAKOZTATVA';

  @override
  String get ledIdentify => 'AZONOSÍTÁS';

  @override
  String get identifyButton => 'AZONOSÍTÁS';

  @override
  String get identifyingToast => '3 másodpercig villogó robot LED...';

  @override
  String get homingToast => 'Az összes szárny behelyezése...';

  @override
  String get i2cFault => 'I2C HIBA';

  @override
  String get storageFault => 'TÁROLÁSI HIBA';

  @override
  String get estopLatched => 'E-STOP ZÁRVA';

  @override
  String get presetButtonsTitle => 'ELŐRE BEÁLLÍTOTT GOMBOK';

  @override
  String customizePresetTitle(Object label) {
    return '$label testreszabása';
  }

  @override
  String get subtitleNameLabel => 'Felirat neve';

  @override
  String get subtitleNameHint =>
      'például Gyorsan összecsukható, ingek, egyedi...';

  @override
  String get buttonColorLabel => 'Gomb színe';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return '$current/$total lépés ($pct%)';
  }

  @override
  String get emergencyStop => 'VÉSZLEÁLLÍTÁS';

  @override
  String get clearEstop => 'E-STOP TÖRLÉSE ÉS NYITÁSA';

  @override
  String get clearEstopHint =>
      'Visszaállítja a vészleállítást, és visszaállítja a robotot alapjáratra';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'SZÖVET ELHELYEZÉS';

  @override
  String get editArrangement => 'MEGJEGYZÉS SZERKESZTÉSE';

  @override
  String get addPanel => 'PANEL HOZZÁADÁSA';

  @override
  String get legendMotorized => 'Motorizált';

  @override
  String get legendFollower => 'Követő';

  @override
  String get legendBase => 'Bázis';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Sorok';

  @override
  String stepSelectedHint(Object step) {
    return '$step lépés kiválasztva: Érintse meg az 1–2 motoros panelt a rácson';
  }

  @override
  String get tapPanelsHint => 'Koppintson 1-2 motorpanelt a rácsra';

  @override
  String get dualBadge => 'KETTŐS';

  @override
  String get requiresMotorizedPanel =>
      'Legalább 1 motoros panel szükséges (maximum 2)';

  @override
  String get selectedChangePanelsHint =>
      'Kijelölve • Érintse meg a rácspaneleket a módosításhoz (max. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return '$total/$step. lépés';
  }

  @override
  String get removeStepTooltip => 'Távolítsa el a lépést';

  @override
  String get requiresMotorizedModuleWarning =>
      'A rutin legalább egy motorizált modult igényel a Fabrica Arrangementtől.';

  @override
  String get routineFull => 'RUTIN TELJES (16/16 LÉPÉS)';

  @override
  String addStepCount(Object count) {
    return 'LÉPÉS HOZZÁADÁSA ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Mentse el a rutint a robotba';

  @override
  String get selectButtonToProgram =>
      'Válasszon ki egy fizikai robotgombot a programozáshoz ezzel a rutinnal:';

  @override
  String buttonNumber(Object slot) {
    return '$slot gomb';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Hardver gomb $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Gomb $slot Felirat (opcionális)';
  }

  @override
  String get saveToRobotButton => 'MENTÉSE ROBOTBA';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return '$slot gomb ($count lépés)';
  }

  @override
  String get adultTshirtTemplate => 'Felnőtt póló sablon';

  @override
  String get longSleeveTemplate => 'Hosszú ujjú sablon';

  @override
  String get dualSweepTemplate => 'Dual Sweep sablon';

  @override
  String channelNumber(Object number) {
    return 'Csatorna $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PÁROSÍTVA';
  }

  @override
  String get moreHardwareOptions => 'További hardver opciók';

  @override
  String get loadTemplate => 'Sablon betöltése';

  @override
  String get controllerLabel => 'VEZÉRLŐ';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'KÖVETŐ';

  @override
  String get baseBadge => 'BÁZIS';

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
