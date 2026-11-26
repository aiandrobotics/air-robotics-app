// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swiss German Alemannic Alsatian (`gsw`).
class AppLocalizationsGsw extends AppLocalizations {
  AppLocalizationsGsw([String locale = 'gsw']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get appLanguageTitle => 'App-Sprache';

  @override
  String get appVersionTitle => 'App-Version';

  @override
  String get languageSectionTitle => 'Sprache';

  @override
  String get languageSystemDefault => 'Systemstandard (Gerätesprache)';

  @override
  String get selectLanguageHint => 'Wählen Sie eine Sprache aus';

  @override
  String get addDeviceTitle => 'NEUEN ROBOTER HINZUFÜGEN';

  @override
  String get addDeviceSubtitle => 'Koppeln Sie AIR-Roboter';

  @override
  String get yourRobots => 'IHRE ROBOTER';

  @override
  String get discoveredRobots => 'ENTDECKTE ROBOTER';

  @override
  String get noRobotsPairedYet => 'Noch keine Roboter gepaart';

  @override
  String get noRobotsPairedSubtitle =>
      'Schließen Sie Ihren Roboter an, um Telemetriedaten anzuzeigen, Voreinstellungen zu verwalten und Vorgänge zu steuern.';

  @override
  String get addYourFirstRobot => 'FÜGEN SIE IHREN ERSTEN ROBOTER HINZU';

  @override
  String get autoScanning => 'AUTOMATISCHES SCANNEN';

  @override
  String get idleStatus => 'LEERLAUF';

  @override
  String get tabControl => 'Kontrolle';

  @override
  String get tabSequencer => 'Sequenzer';

  @override
  String get tabCalibrator => 'Kalibrator';

  @override
  String get tabDiagnostics => 'Diagnose';

  @override
  String get renameRobot => 'Roboter umbenennen';

  @override
  String get bleDiagnostics => 'BLE-Diagnose';

  @override
  String get erasePresets => 'Gespeicherte Voreinstellungen löschen';

  @override
  String get disconnect => 'Trennen';

  @override
  String get unpairRobot => 'Roboter entkoppeln';

  @override
  String get factoryReset => 'Werksreset';

  @override
  String get servoManualJog => 'SERVO MANUELLER JOG';

  @override
  String get homeAll => 'ALLES ZU HAUSE';

  @override
  String get foldingTimeline => 'FALTENDE ZEITLEISTE';

  @override
  String get addStep => 'SCHRITT HINZUFÜGEN';

  @override
  String get previewOnRobot => 'VORSCHAU AUF ROBOTER';

  @override
  String get saveToButton => 'SPEICHERN AUF TASTE';

  @override
  String get themeTitle => 'Thema';

  @override
  String get themeSystem => 'Gerät';

  @override
  String get themeLight => 'Licht';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get connectedBadge => 'VERBUNDEN';

  @override
  String get inRangeBadge => 'IN REICHWEITE';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'OFFEN';

  @override
  String get connectButton => 'VERBINDEN';

  @override
  String get reconnectButton => 'WIEDER VERBINDEN';

  @override
  String get pairAndConnect => 'KOPPELN & VERBINDEN';

  @override
  String get autoScanningForRobots => 'Automatisches Scannen nach Robotern...';

  @override
  String get scanningIdle => 'Scannen im Leerlauf';

  @override
  String get nearbyRobotsAppear =>
      'Roboter in der Nähe werden hier automatisch angezeigt.';

  @override
  String get yourNearbyRobotsAppear =>
      'Ihre Roboter in der Nähe werden hier automatisch angezeigt.';

  @override
  String get signalStrong => 'Stark';

  @override
  String get signalGood => 'Gut';

  @override
  String get signalWeak => 'Schwach';

  @override
  String get addRobotIntro =>
      'Wählen Sie unten einen Roboter zum Koppeln aus. Jeder in der Nähe befindliche Roboter im Kopplungsmodus wird oben automatisch erkannt.';

  @override
  String get autoDiscoveredRobot => 'AUTOMATISCH ENTDECKTER ROBOTER';

  @override
  String get autoDiscoveredRobots => 'AUTOMATISCH ENTDECKTE ROBOTER';

  @override
  String readyCountBadge(Object count) {
    return '$count BEREIT';
  }

  @override
  String get supportedRobots => 'UNTERSTÜTZTE ROBOTER';

  @override
  String get clothesFoldingRobot => 'Kleiderfaltroboter';

  @override
  String get fabricaDescription =>
      'Automatischer Kleidungsstückordner mit Voreinstellungen für mehrere Kleidungsstücke und taktiler Ein-Knopf-Bedienung.';

  @override
  String get fabricaPairingHint =>
      'Kopplungsmodus: Halten Sie eine beliebige Taste auf dem Fabrica-Bedienfeld 3 Sekunden lang gedrückt (die Status-LED blinkt schnell).';

  @override
  String get pairFabricaNow => 'JETZT FABRICA PAAR';

  @override
  String get backToHome => 'Zurück nach Hause';

  @override
  String get connReady => 'BEREIT';

  @override
  String get connConnecting => 'VERBINDEN';

  @override
  String get connDiscovering => 'ENTDECKEN';

  @override
  String get connBonding => 'VERBINDUNG';

  @override
  String get connScanning => 'SCANNEN';

  @override
  String get connDisconnected => 'NICHT VERBUNDEN';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Von $name trennen?';
  }

  @override
  String get disconnectConfirmBody =>
      'Sie können die Verbindung jederzeit über den Startbildschirm wiederherstellen.';

  @override
  String get cancelButton => 'ABBRECHEN';

  @override
  String get saveButton => 'SPEICHERN';

  @override
  String get customNickname => 'Benutzerdefinierter Spitzname';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name entkoppeln?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Dadurch wird $name aus Ihren Robotern auf diesem Telefon entfernt. Sie können es jederzeit wieder hinzufügen.\n\nHinweis: Um den Roboterspeicher vollständig zu löschen und die Werkseinstellungen wiederherzustellen, verwenden Sie „Factory Reset“.';
  }

  @override
  String get unpairButton => 'ENTPAREN';

  @override
  String get machineIdle => 'LEERLAUF';

  @override
  String get machineRunning => 'LAUFEN';

  @override
  String get machineEstop => 'NOT-AUS';

  @override
  String get machineError => 'FEHLER';

  @override
  String get machineCalibrating => 'KALIBRIEREN';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'GESPEICHERT';

  @override
  String get ledInputErr => 'EINGABEFEHLER';

  @override
  String get ledPairing => 'PAARUNG';

  @override
  String get ledConnected => 'VERBUNDEN';

  @override
  String get ledIdentify => 'IDENTIFIZIEREN';

  @override
  String get identifyButton => 'IDENTIFIZIEREN';

  @override
  String get identifyingToast => 'Blinkende Roboter-LED für 3 Sekunden...';

  @override
  String get homingToast => 'Alle Klappen referenzieren...';

  @override
  String get i2cFault => 'I2C-FEHLER';

  @override
  String get storageFault => 'SPEICHERFEHLER';

  @override
  String get estopLatched => 'NOT-AUS VERRIEGELT';

  @override
  String get presetButtonsTitle => 'PRESET-TASTEN';

  @override
  String customizePresetTitle(Object label) {
    return 'Anpassen von $label';
  }

  @override
  String get subtitleNameLabel => 'Untertitelname';

  @override
  String get subtitleNameHint => 'z.B. Schnellfaltung, Hemden, individuell...';

  @override
  String get buttonColorLabel => 'Tastenfarbe';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Schritt $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'NOT-AUS';

  @override
  String get clearEstop => 'NOT-AUS-STOPP LÖSCHEN & ENTSPERREN';

  @override
  String get clearEstopHint =>
      'Setzt den Notstopp zurück und kehrt den Roboter in den Leerlauf zurück';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'FABRICA-ANORDNUNG';

  @override
  String get editArrangement => 'ANORDNUNG BEARBEITEN';

  @override
  String get addPanel => 'PANEL HINZUFÜGEN';

  @override
  String get legendMotorized => 'Motorisiert';

  @override
  String get legendFollower => 'Anhänger';

  @override
  String get legendBase => 'Basis';

  @override
  String get colsLabel => 'Spalten';

  @override
  String get rowsLabel => 'Reihen';

  @override
  String stepSelectedHint(Object step) {
    return 'Schritt $step ausgewählt: Tippen Sie auf 1–2 motorisierte Panels im Raster';
  }

  @override
  String get tapPanelsHint => 'Tippen Sie auf 1–2 Motorfelder im Raster';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Erfordert mindestens 1 motorisiertes Panel (maximal 2)';

  @override
  String get selectedChangePanelsHint =>
      'Ausgewählt • Tippen Sie zum Ändern auf die Rasterfelder (max. 2).';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Schritt $step von $total';
  }

  @override
  String get removeStepTooltip => 'Schritt entfernen';

  @override
  String get requiresMotorizedModuleWarning =>
      'Für die Routine ist mindestens ein motorisiertes Modul von Fabrica Arrangement erforderlich.';

  @override
  String get routineFull => 'ROUTINE VOLLSTÄNDIG (16/16 SCHRITTE)';

  @override
  String addStepCount(Object count) {
    return 'SCHRITT HINZUFÜGEN ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Routine im Roboter speichern';

  @override
  String get selectButtonToProgram =>
      'Wählen Sie eine physische Robotertaste aus, die Sie mit dieser Routine programmieren möchten:';

  @override
  String buttonNumber(Object slot) {
    return 'Schaltfläche $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Hardware-Taste $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Schaltfläche $slot Untertitel (optional)';
  }

  @override
  String get saveToRobotButton => 'SPEICHERN AUF ROBOTER';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Schaltfläche $slot ($count Schritte)';
  }

  @override
  String get adultTshirtTemplate => 'T-Shirt-Vorlage für Erwachsene';

  @override
  String get longSleeveTemplate => 'Langarm-Vorlage';

  @override
  String get dualSweepTemplate => 'Dual-Sweep-Vorlage';

  @override
  String channelNumber(Object number) {
    return 'Kanal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count GEPAART';
  }

  @override
  String get moreHardwareOptions => 'Weitere Hardwareoptionen';

  @override
  String get loadTemplate => 'Vorlage laden';

  @override
  String get controllerLabel => 'CONTROLLER';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'FOLGER';

  @override
  String get baseBadge => 'BASIS';

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
