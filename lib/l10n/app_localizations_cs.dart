// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Nastavení';

  @override
  String get appLanguageTitle => 'Jazyk aplikace';

  @override
  String get appVersionTitle => 'Verze aplikace';

  @override
  String get languageSectionTitle => 'Jazyk';

  @override
  String get languageSystemDefault =>
      'Výchozí nastavení systému (jazyk zařízení)';

  @override
  String get selectLanguageHint => 'Vyberte jazyk';

  @override
  String get addDeviceTitle => 'PŘIDAT NOVÉHO ROBOTA';

  @override
  String get addDeviceSubtitle => 'Spárujte roboty AIR';

  @override
  String get yourRobots => 'VAŠI ROBOTI';

  @override
  String get discoveredRobots => 'OBJEVENÍ ROBOTŮ';

  @override
  String get noRobotsPairedYet => 'Zatím nejsou spárováni žádní roboti';

  @override
  String get noRobotsPairedSubtitle =>
      'Připojte svého robota k zobrazení telemetrie, správě předvoleb a ovládání operací.';

  @override
  String get addYourFirstRobot => 'PŘIDEJ SVÉHO PRVNÍHO ROBOTA';

  @override
  String get autoScanning => 'AUTOMATICKÉ SKENOVÁNÍ';

  @override
  String get idleStatus => 'NEČINNÁ';

  @override
  String get tabControl => 'Ovládání';

  @override
  String get tabSequencer => 'Sekvencer';

  @override
  String get tabCalibrator => 'Kalibrátor';

  @override
  String get tabDiagnostics => 'Diagnostika';

  @override
  String get renameRobot => 'Přejmenovat robota';

  @override
  String get bleDiagnostics => 'Diagnostika BLE';

  @override
  String get erasePresets => 'Vymazat uložené předvolby';

  @override
  String get disconnect => 'Odpojit';

  @override
  String get unpairRobot => 'Zrušit párování robota';

  @override
  String get factoryReset => 'Obnovení továrního nastavení';

  @override
  String get servoManualJog => 'SERVOMANUÁLNÍ JOG';

  @override
  String get homeAll => 'DOMA VŠECHNY';

  @override
  String get foldingTimeline => 'SKLÁDÁNÍ ČASOVÉ OSY';

  @override
  String get addStep => 'PŘIDAT KROK';

  @override
  String get previewOnRobot => 'NÁHLED NA ROBOTU';

  @override
  String get saveToButton => 'ULOŽIT DO TLAČÍTKA';

  @override
  String get themeTitle => 'téma';

  @override
  String get themeSystem => 'Zařízení';

  @override
  String get themeLight => 'Světlo';

  @override
  String get themeDark => 'Tmavý';

  @override
  String get connectedBadge => 'PŘIPOJENO';

  @override
  String get inRangeBadge => 'V ROZSAHU';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'OTEVŘENO';

  @override
  String get connectButton => 'PŘIPOJIT';

  @override
  String get reconnectButton => 'ZNOVU PŘIPOJIT';

  @override
  String get pairAndConnect => 'PÁROVAT A PŘIPOJIT';

  @override
  String get autoScanningForRobots => 'Automatické vyhledávání robotů...';

  @override
  String get scanningIdle => 'Skenování nečinné';

  @override
  String get nearbyRobotsAppear => 'Roboti v okolí se zde objeví automaticky.';

  @override
  String get yourNearbyRobotsAppear =>
      'Vaši okolní roboti se zde objeví automaticky.';

  @override
  String get signalStrong => 'Silný';

  @override
  String get signalGood => 'Dobře';

  @override
  String get signalWeak => 'slabý';

  @override
  String get addRobotIntro =>
      'Níže vyberte robota ke spárování. Jakýkoli blízký robot v režimu párování bude automaticky objeven nahoře.';

  @override
  String get autoDiscoveredRobot => 'AUTO OBJEVNÝ ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTO OBJEVIL ROBOTY';

  @override
  String readyCountBadge(Object count) {
    return '$count PŘIPRAVENO';
  }

  @override
  String get supportedRobots => 'PODPOROVANÉ ROBOTY';

  @override
  String get clothesFoldingRobot => 'Robot na skládání oblečení';

  @override
  String get fabricaDescription =>
      'Automatizovaná složka na oděvy s předvolbami pro více oděvů a dotykovým ovládáním jedním tlačítkem.';

  @override
  String get fabricaPairingHint =>
      'Režim párování: Stiskněte a podržte libovolné tlačítko na ovládacím panelu Fabrica po dobu 3 sekund (LED dioda stavu bude rychle blikat).';

  @override
  String get pairFabricaNow => 'PÁROVAT FABRICA HNED';

  @override
  String get backToHome => 'Zpět na domovskou stránku';

  @override
  String get connReady => 'PŘIPRAVEN';

  @override
  String get connConnecting => 'PŘIPOJENÍ';

  @override
  String get connDiscovering => 'OBJEVOVÁNÍ';

  @override
  String get connBonding => 'LEPENÍ';

  @override
  String get connScanning => 'SKENOVÁNÍ';

  @override
  String get connDisconnected => 'ODPOJENO';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Odpojit od $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Z domovské obrazovky se můžete kdykoli znovu připojit.';

  @override
  String get cancelButton => 'ZRUŠIT';

  @override
  String get saveButton => 'ULOŽIT';

  @override
  String get customNickname => 'Vlastní přezdívka';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Zrušit párování $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Tímto odeberete $name z vašich robotů v tomto telefonu. Kdykoli jej můžete znovu přidat.\n\nPoznámka: Chcete-li zcela vymazat paměť robota a obnovit výchozí tovární nastavení, použijte „Factory Reset“.';
  }

  @override
  String get unpairButton => 'NESPÁROVAT';

  @override
  String get machineIdle => 'NEČINNÁ';

  @override
  String get machineRunning => 'BĚH';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'CHYBA';

  @override
  String get machineCalibrating => 'KALIBRACE';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'ULOŽENO';

  @override
  String get ledInputErr => 'CHYBA VSTUPU';

  @override
  String get ledPairing => 'PÁROVÁNÍ';

  @override
  String get ledConnected => 'PŘIPOJENO';

  @override
  String get ledIdentify => 'IDENTIFIKOVAT';

  @override
  String get identifyButton => 'IDENTIFIKOVAT';

  @override
  String get identifyingToast => 'Blikající LED robota po dobu 3 sekund...';

  @override
  String get homingToast => 'Nasměrování všech klapek...';

  @override
  String get i2cFault => 'I2C FAULT';

  @override
  String get storageFault => 'CHYBA SKLADOVÁNÍ';

  @override
  String get estopLatched => 'E-STOP ZABLOKOVANÝ';

  @override
  String get presetButtonsTitle => 'TLAČÍTKA PŘEDNASTAVENÍ';

  @override
  String customizePresetTitle(Object label) {
    return 'Přizpůsobit $label';
  }

  @override
  String get subtitleNameLabel => 'Název titulku';

  @override
  String get subtitleNameHint => 'např. Rychlé skládání, Košile, Vlastní...';

  @override
  String get buttonColorLabel => 'Barva tlačítka';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Krok $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'NOUZOVÉ ZASTAVENÍ';

  @override
  String get clearEstop => 'VYMAZEJTE A ODEJTE E-STOP';

  @override
  String get clearEstopHint =>
      'Resetuje nouzové zastavení a vrátí robota do stavu nečinnosti';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'USPOŘÁDÁNÍ LÁTKY';

  @override
  String get editArrangement => 'UPRAVIT USPOŘÁDÁNÍ';

  @override
  String get addPanel => 'PŘIDAT PANEL';

  @override
  String get legendMotorized => 'Motorizované';

  @override
  String get legendFollower => 'Následovník';

  @override
  String get legendBase => 'Základna';

  @override
  String get colsLabel => 'plk';

  @override
  String get rowsLabel => 'Řádky';

  @override
  String stepSelectedHint(Object step) {
    return 'Zvolený krok $step: Klepněte na 1–2 motorizované panely na mřížce';
  }

  @override
  String get tapPanelsHint => 'Klepněte na 1–2 panely motoru na mřížku';

  @override
  String get dualBadge => 'DUÁLNÍ';

  @override
  String get requiresMotorizedPanel =>
      'Vyžaduje alespoň 1 motorizovaný panel (max 2)';

  @override
  String get selectedChangePanelsHint =>
      'Vybráno • Klepnutím na panely mřížky je změníte (max. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Krok $step z $total';
  }

  @override
  String get removeStepTooltip => 'Odebrat krok';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutina vyžaduje alespoň jeden motorizovaný modul od společnosti Fabrica Arrangement.';

  @override
  String get routineFull => 'RUTINA PLNÁ (16/16 KROKŮ)';

  @override
  String addStepCount(Object count) {
    return 'PŘIDAT KROK ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Uložit rutinu do robota';

  @override
  String get selectButtonToProgram =>
      'Vyberte tlačítko fyzického robota, které chcete naprogramovat pomocí této rutiny:';

  @override
  String buttonNumber(Object slot) {
    return 'Tlačítko $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Hardwarové tlačítko $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Tlačítko $slot Titulky (volitelné)';
  }

  @override
  String get saveToRobotButton => 'ULOŽIT DO ROBOTA';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Tlačítko $slot ($count kroků)';
  }

  @override
  String get adultTshirtTemplate => 'Šablona trička pro dospělé';

  @override
  String get longSleeveTemplate => 'Šablona s dlouhým rukávem';

  @override
  String get dualSweepTemplate => 'Šablona dvojitého zametání';

  @override
  String channelNumber(Object number) {
    return 'Kanál $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PÁROVÁNO';
  }

  @override
  String get moreHardwareOptions => 'Další možnosti hardwaru';

  @override
  String get loadTemplate => 'Načíst šablonu';

  @override
  String get controllerLabel => 'OVLADAČ';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'SLEDUJTE';

  @override
  String get baseBadge => 'ZÁKLADNA';

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
