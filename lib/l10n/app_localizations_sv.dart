// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Inställningar';

  @override
  String get appLanguageTitle => 'Appens språk';

  @override
  String get appVersionTitle => 'Appversion';

  @override
  String get languageSectionTitle => 'Språk';

  @override
  String get languageSystemDefault => 'Systemstandard (enhetsspråk)';

  @override
  String get selectLanguageHint => 'Välj ett språk';

  @override
  String get addDeviceTitle => 'LÄGG TILL NY ROBOT';

  @override
  String get addDeviceSubtitle => 'Para ihop AIR-robotar';

  @override
  String get yourRobots => 'DINA ROBOTER';

  @override
  String get discoveredRobots => 'UPPTÄCKTA ROBOTER';

  @override
  String get noRobotsPairedYet => 'Inga robotar parade än';

  @override
  String get noRobotsPairedSubtitle =>
      'Anslut din robot för att se telemetri, hantera förinställningar och styra operationer.';

  @override
  String get addYourFirstRobot => 'LÄGG TILL DIN FÖRSTA ROBOT';

  @override
  String get autoScanning => 'AUTO-SCANNING';

  @override
  String get idleStatus => 'TOMGÅNG';

  @override
  String get tabControl => 'Kontroll';

  @override
  String get tabSequencer => 'Sekvenserare';

  @override
  String get tabCalibrator => 'Kalibrator';

  @override
  String get tabDiagnostics => 'Diagnostik';

  @override
  String get renameRobot => 'Byt namn på robot';

  @override
  String get bleDiagnostics => 'BLE Diagnostik';

  @override
  String get erasePresets => 'Radera sparade förinställningar';

  @override
  String get disconnect => 'Koppla från';

  @override
  String get unpairRobot => 'Koppla bort robot';

  @override
  String get factoryReset => 'Fabriksåterställning';

  @override
  String get servoManualJog => 'SERVO MANUELL JOG';

  @override
  String get homeAll => 'HEM ALLA';

  @override
  String get foldingTimeline => 'VIKNING TIDSLINJE';

  @override
  String get addStep => 'LÄGG TILL STEG';

  @override
  String get previewOnRobot => 'FÖRHANDSVISNING PÅ ROBOT';

  @override
  String get saveToButton => 'SPARA TILL-KNAPPEN';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Enhet';

  @override
  String get themeLight => 'Ljus';

  @override
  String get themeDark => 'Mörkt';

  @override
  String get connectedBadge => 'ANSLUTEN';

  @override
  String get inRangeBadge => 'I RÄCKVIDD';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'ÖPPEN';

  @override
  String get connectButton => 'ANSLUTA';

  @override
  String get reconnectButton => 'ANSLUTA ÅTER';

  @override
  String get pairAndConnect => 'PAR OCH ANSLUTA';

  @override
  String get autoScanningForRobots => 'Automatisk skanning för robotar...';

  @override
  String get scanningIdle => 'Skanning inaktiv';

  @override
  String get nearbyRobotsAppear => 'Närliggande robotar visas här automatiskt.';

  @override
  String get yourNearbyRobotsAppear =>
      'Dina robotar i närheten visas här automatiskt.';

  @override
  String get signalStrong => 'Stark';

  @override
  String get signalGood => 'Bra';

  @override
  String get signalWeak => 'Svag';

  @override
  String get addRobotIntro =>
      'Välj en robot nedan att para ihop. Alla närliggande robotar i parningsläge kommer automatiskt att upptäckas överst.';

  @override
  String get autoDiscoveredRobot => 'AUTO UPPTÄCKT ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTOUPTAKTADE ROBOTER';

  @override
  String readyCountBadge(Object count) {
    return '$count KLAR';
  }

  @override
  String get supportedRobots => 'STÖDDE ROBOTER';

  @override
  String get clothesFoldingRobot => 'Kläder Vikbar Robot';

  @override
  String get fabricaDescription =>
      'Automatiserad plaggmapp med förinställningar för flera plagg och taktil manövrering med en knapp.';

  @override
  String get fabricaPairingHint =>
      'Parningsläge: Tryck och håll ned valfri knapp på Fabricas kontrollpanel i 3 sekunder (statuslampan blinkar snabbt).';

  @override
  String get pairFabricaNow => 'PAR TYG NU';

  @override
  String get backToHome => 'Tillbaka till hemmet';

  @override
  String get connReady => 'KLAR';

  @override
  String get connConnecting => 'ANSLUTER';

  @override
  String get connDiscovering => 'UPPTÄCKANDE';

  @override
  String get connBonding => 'BINDNING';

  @override
  String get connScanning => 'SKANNING';

  @override
  String get connDisconnected => 'KOPPLAD';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Koppla bort från $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Du kan återansluta när som helst från startskärmen.';

  @override
  String get cancelButton => 'AVBRYT';

  @override
  String get saveButton => 'SPARA';

  @override
  String get customNickname => 'Anpassat smeknamn';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Ta bort parkopplingen $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Detta tar bort $name från Your Robots på den här telefonen. Du kan lägga till den igen när som helst.\n\nObs: För att helt torka robotens minne och återställa fabriksinställningarna, använd \"Factory Reset\".';
  }

  @override
  String get unpairButton => 'UPPARERA';

  @override
  String get machineIdle => 'TOMGÅNG';

  @override
  String get machineRunning => 'LÖRNING';

  @override
  String get machineEstop => 'E-STOPP';

  @override
  String get machineError => 'FEL';

  @override
  String get machineCalibrating => 'KALIBRERING';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'SPARAD';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'PARANDE';

  @override
  String get ledConnected => 'ANSLUTEN';

  @override
  String get ledIdentify => 'IDENTIFIERA';

  @override
  String get identifyButton => 'IDENTIFIERA';

  @override
  String get identifyingToast => 'Robot LED blinkar i 3 sekunder...';

  @override
  String get homingToast => 'Söker alla klaffar...';

  @override
  String get i2cFault => 'I2C FEL';

  @override
  String get storageFault => 'FÖRVARINGSFEL';

  @override
  String get estopLatched => 'NÖDSTOPP LÅST';

  @override
  String get presetButtonsTitle => 'FÖRINSTÄLLDA KNAPPAR';

  @override
  String customizePresetTitle(Object label) {
    return 'Anpassa $label';
  }

  @override
  String get subtitleNameLabel => 'Undertextens namn';

  @override
  String get subtitleNameHint => 't.ex. Snabbvikning, skjortor, anpassade...';

  @override
  String get buttonColorLabel => 'Knapp färg';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Steg $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'NÖDSTOPP';

  @override
  String get clearEstop => 'RENSA OCH LÅS NÖDSTOPP';

  @override
  String get clearEstopHint =>
      'Återställer nödstopp och återställer roboten till tomgång';

  @override
  String get stopButton => 'STOPP';

  @override
  String get fabricaArrangementTitle => 'FABRICA ARrangemang';

  @override
  String get editArrangement => 'REDIGERA ARrangemang';

  @override
  String get addPanel => 'LÄGG TILL PANEL';

  @override
  String get legendMotorized => 'Motoriserad';

  @override
  String get legendFollower => 'Följare';

  @override
  String get legendBase => 'Bas';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Rader';

  @override
  String stepSelectedHint(Object step) {
    return 'Steg $step valt: Tryck på 1–2 motoriserade paneler på rutnätet';
  }

  @override
  String get tapPanelsHint => 'Tryck på 1–2 motorpaneler på gallret';

  @override
  String get dualBadge => 'DUBBEL';

  @override
  String get requiresMotorizedPanel =>
      'Kräver minst 1 motoriserad panel (max 2)';

  @override
  String get selectedChangePanelsHint =>
      'Valda • Tryck på rutnätspanelerna för att ändra (max 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Steg $step av $total';
  }

  @override
  String get removeStepTooltip => 'Ta bort steg';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutin kräver minst en motoriserad modul från Fabrica Arrangement.';

  @override
  String get routineFull => 'RUTIN FULL (16/16 STEG)';

  @override
  String addStepCount(Object count) {
    return 'LÄGG TILL STEG ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Spara rutin till robot';

  @override
  String get selectButtonToProgram =>
      'Välj en fysisk robotknapp att programmera med denna rutin:';

  @override
  String buttonNumber(Object slot) {
    return 'Knapp $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Hårdvaruknapp $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Knapp $slot Undertext (valfritt)';
  }

  @override
  String get saveToRobotButton => 'SPARA TILL ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Knapp $slot ($count steg)';
  }

  @override
  String get adultTshirtTemplate => 'Vuxen T-shirt mall';

  @override
  String get longSleeveTemplate => 'Långärmad mall';

  @override
  String get dualSweepTemplate => 'Dubbla svep-mall';

  @override
  String channelNumber(Object number) {
    return 'Kanal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PARAD';
  }

  @override
  String get moreHardwareOptions => 'Fler maskinvarualternativ';

  @override
  String get loadTemplate => 'Ladda mall';

  @override
  String get controllerLabel => 'KONTROLLARE';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'FÖLJARE';

  @override
  String get baseBadge => 'BAS';

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
