// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Innstillinger';

  @override
  String get appLanguageTitle => 'Appspråk';

  @override
  String get appVersionTitle => 'Appversjon';

  @override
  String get languageSectionTitle => 'Språk';

  @override
  String get languageSystemDefault => 'Systemstandard (enhetsspråk)';

  @override
  String get selectLanguageHint => 'Velg et språk';

  @override
  String get addDeviceTitle => 'LEGG TIL NY ROBOT';

  @override
  String get addDeviceSubtitle => 'Par AIR-roboter';

  @override
  String get yourRobots => 'DINE ROBOTER';

  @override
  String get discoveredRobots => 'OPPDATE ROBOTER';

  @override
  String get noRobotsPairedYet => 'Ingen roboter paret ennå';

  @override
  String get noRobotsPairedSubtitle =>
      'Koble til roboten din for å se telemetri, administrere forhåndsinnstillinger og kontrollere operasjoner.';

  @override
  String get addYourFirstRobot => 'LEGG TIL DIN FØRSTE ROBOT';

  @override
  String get autoScanning => 'AUTO-SKANNING';

  @override
  String get idleStatus => 'TOMGANG';

  @override
  String get tabControl => 'Kontroll';

  @override
  String get tabSequencer => 'Sekvenser';

  @override
  String get tabCalibrator => 'Kalibrator';

  @override
  String get tabDiagnostics => 'Diagnostikk';

  @override
  String get renameRobot => 'Gi nytt navn til robot';

  @override
  String get bleDiagnostics => 'BLE Diagnostikk';

  @override
  String get erasePresets => 'Slett lagrede forhåndsinnstillinger';

  @override
  String get disconnect => 'Koble fra';

  @override
  String get unpairRobot => 'Koble fra robot';

  @override
  String get factoryReset => 'Fabrikkinnstilling';

  @override
  String get servoManualJog => 'SERVO MANUELL JOG';

  @override
  String get homeAll => 'HJEM ALLE';

  @override
  String get foldingTimeline => 'TIDSLINJE FOR BLADE';

  @override
  String get addStep => 'LEGG TIL TRINN';

  @override
  String get previewOnRobot => 'FORHÅNDSVISNING PÅ ROBOT';

  @override
  String get saveToButton => 'LAGRE TIL-KNAPP';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Enhet';

  @override
  String get themeLight => 'Lys';

  @override
  String get themeDark => 'Mørkt';

  @override
  String get connectedBadge => 'TILKOBLET';

  @override
  String get inRangeBadge => 'I REKKEVIDDE';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'ÅPEN';

  @override
  String get connectButton => 'KOBLE TIL';

  @override
  String get reconnectButton => 'KOBLE TIL PÅ';

  @override
  String get pairAndConnect => 'PAR OG KOBLE TIL';

  @override
  String get autoScanningForRobots => 'Automatisk skanning for roboter...';

  @override
  String get scanningIdle => 'Skanning inaktiv';

  @override
  String get nearbyRobotsAppear => 'Roboter i nærheten vises her automatisk.';

  @override
  String get yourNearbyRobotsAppear =>
      'Robotene dine i nærheten vises her automatisk.';

  @override
  String get signalStrong => 'Sterk';

  @override
  String get signalGood => 'Bra';

  @override
  String get signalWeak => 'Svak';

  @override
  String get addRobotIntro =>
      'Velg en robot nedenfor for å pare. Enhver robot i nærheten i sammenkoblingsmodus vil automatisk bli oppdaget øverst.';

  @override
  String get autoDiscoveredRobot => 'AUTOOPPDAGET ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTOOPPDATE ROBOTER';

  @override
  String readyCountBadge(Object count) {
    return '$count KLAR';
  }

  @override
  String get supportedRobots => 'STØTTE ROBOTER';

  @override
  String get clothesFoldingRobot => 'Klær sammenleggbar robot';

  @override
  String get fabricaDescription =>
      'Automatisert klesmappe med forhåndsinnstillinger for flere plagg og taktil enkeltknappsbetjening.';

  @override
  String get fabricaPairingHint =>
      'Paringsmodus: Trykk og hold inne en hvilken som helst knapp på Fabrica-kontrollpanelet i 3 sekunder (Status-LED vil blinke raskt).';

  @override
  String get pairFabricaNow => 'PAR STOFF NÅ';

  @override
  String get backToHome => 'Tilbake til Hjemmet';

  @override
  String get connReady => 'KLAR';

  @override
  String get connConnecting => 'KOBLER TIL';

  @override
  String get connDiscovering => 'OPPDATER';

  @override
  String get connBonding => 'BINDING';

  @override
  String get connScanning => 'SKANNING';

  @override
  String get connDisconnected => 'FRAKOBLET';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Koble fra $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Du kan koble til igjen når som helst fra startskjermen.';

  @override
  String get cancelButton => 'AVBRYT';

  @override
  String get saveButton => 'SPAR';

  @override
  String get customNickname => 'Egendefinert kallenavn';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Vil du koble fra $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Dette vil fjerne $name fra Your Robots på denne telefonen. Du kan legge den til på nytt når som helst.\n\nMerk: For å slette robotminnet fullstendig og gjenopprette fabrikkinnstillingene, bruk \"Tilbakestill til fabrikk\".';
  }

  @override
  String get unpairButton => 'UPARER';

  @override
  String get machineIdle => 'TOMGANG';

  @override
  String get machineRunning => 'LØPER';

  @override
  String get machineEstop => 'E-STOPP';

  @override
  String get machineError => 'FEIL';

  @override
  String get machineCalibrating => 'KALIBRERING';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'LAGRET';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'SAMMENKOBLING';

  @override
  String get ledConnected => 'TILKOBLET';

  @override
  String get ledIdentify => 'IDENTIFISERE';

  @override
  String get identifyButton => 'IDENTIFISERE';

  @override
  String get identifyingToast => 'Blinker robot LED i 3 sekunder...';

  @override
  String get homingToast => 'Måler alle klaffer...';

  @override
  String get i2cFault => 'I2C FEIL';

  @override
  String get storageFault => 'LAGRINGSFEIL';

  @override
  String get estopLatched => 'E-STOPP LÅST';

  @override
  String get presetButtonsTitle => 'FORHÅNDSINNSTILLING KNAPPER';

  @override
  String customizePresetTitle(Object label) {
    return 'Tilpass $label';
  }

  @override
  String get subtitleNameLabel => 'Navn på undertekst';

  @override
  String get subtitleNameHint => 'f.eks. Hurtigfolding, skjorter, tilpasset...';

  @override
  String get buttonColorLabel => 'Knappefarge';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Trinn $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'NØDSTOPP';

  @override
  String get clearEstop => 'SLETT OG LØS NØDSTOPP';

  @override
  String get clearEstopHint =>
      'Nullstiller nødstopp og setter roboten tilbake til tomgang';

  @override
  String get stopButton => 'STOPP';

  @override
  String get fabricaArrangementTitle => 'FABRICA ORDNING';

  @override
  String get editArrangement => 'REDIGER ORDNING';

  @override
  String get addPanel => 'LEGG TIL PANEL';

  @override
  String get legendMotorized => 'Motorisert';

  @override
  String get legendFollower => 'Følger';

  @override
  String get legendBase => 'Base';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Rader';

  @override
  String stepSelectedHint(Object step) {
    return 'Trinn $step valgt: Trykk på 1–2 motoriserte paneler på rutenettet';
  }

  @override
  String get tapPanelsHint => 'Trykk på 1–2 motorpaneler på rutenettet';

  @override
  String get dualBadge => 'DOBBELT';

  @override
  String get requiresMotorizedPanel =>
      'Krever minst 1 motorisert panel (maks 2)';

  @override
  String get selectedChangePanelsHint =>
      'Valgt • Trykk på rutenettpaneler for å endre (maks 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Trinn $step av $total';
  }

  @override
  String get removeStepTooltip => 'Fjern trinn';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutine krever minst én motorisert modul fra Fabrica Arrangement.';

  @override
  String get routineFull => 'RUTINE FULL (16/16 TRINN)';

  @override
  String addStepCount(Object count) {
    return 'LEGG TIL TRINN ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Lagre rutine til robot';

  @override
  String get selectButtonToProgram =>
      'Velg en fysisk robotknapp for å programmere med denne rutinen:';

  @override
  String buttonNumber(Object slot) {
    return 'Knapp $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Maskinvareknapp $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Knapp $slot Undertekst (valgfritt)';
  }

  @override
  String get saveToRobotButton => 'LAGRE TIL ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Knapp $slot ($count trinn)';
  }

  @override
  String get adultTshirtTemplate => 'Voksen T-skjorte mal';

  @override
  String get longSleeveTemplate => 'Langermet mal';

  @override
  String get dualSweepTemplate => 'Dual Sweep-mal';

  @override
  String channelNumber(Object number) {
    return 'Kanal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PARET';
  }

  @override
  String get moreHardwareOptions => 'Flere maskinvarealternativer';

  @override
  String get loadTemplate => 'Last inn mal';

  @override
  String get controllerLabel => 'KONTROLLER';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'FØLGER';

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
