// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

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
  String get selectLanguageHint => 'Sprache auswählen';

  @override
  String get addDeviceTitle => 'NEUEN ROBOTER HINZUFÜGEN';

  @override
  String get addDeviceSubtitle => 'AIR-Roboter koppeln';

  @override
  String get yourRobots => 'DEINE ROBOTER';

  @override
  String get discoveredRobots => 'GEFUNDENE ROBOTER';

  @override
  String get noRobotsPairedYet => 'Noch keine Roboter gekoppelt';

  @override
  String get noRobotsPairedSubtitle =>
      'Verbinde deinen Roboter, um Telemetrie anzuzeigen, Voreinstellungen zu verwalten und Abläufe zu steuern.';

  @override
  String get addYourFirstRobot => 'ERSTEN ROBOTER HINZUFÜGEN';

  @override
  String get autoScanning => 'AUTO-SCAN';

  @override
  String get idleStatus => 'LEERLAUF';

  @override
  String get tabControl => 'Steuerung';

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
  String get erasePresets => 'Gespeicherte Presets löschen';

  @override
  String get disconnect => 'Trennen';

  @override
  String get unpairRobot => 'Roboter entkoppeln';

  @override
  String get factoryReset => 'Werkseinstellungen';

  @override
  String get servoManualJog => 'SERVO MANUELL';

  @override
  String get homeAll => 'ALLE HOME';

  @override
  String get foldingTimeline => 'FALT-ZEITLEISTE';

  @override
  String get addStep => 'SCHRITT HINZUFÜGEN';

  @override
  String get previewOnRobot => 'VORSCHAU AM ROBOTER';

  @override
  String get saveToButton => 'AUF TASTE SPEICHERN';

  @override
  String get themeTitle => 'Design';

  @override
  String get themeSystem => 'Gerät';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get connectedBadge => 'VERBUNDEN';

  @override
  String get inRangeBadge => 'IN REICHWEITE';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'ÖFFNEN';

  @override
  String get connectButton => 'VERBINDEN';

  @override
  String get reconnectButton => 'NEU VERBINDEN';

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
  String get presetButtonsTitle => 'VOREINSTELLUNGEN';

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
  String get stopButton => 'STOPP';

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
    return '$model KOPPELN';
  }

  @override
  String get stopScan => 'Suche stoppen';

  @override
  String get rescan => 'Erneut suchen';

  @override
  String searchingForNearby(Object model) {
    return 'SUCHE NACH $model IN DER NÄHE...';
  }

  @override
  String get scanPaused => 'SUCHE PAUSIERT';

  @override
  String filteringForBle(Object prefix) {
    return 'Filtere nach „$prefix*“ BLE-Anzeigen';
  }

  @override
  String get tapRefreshToRestart =>
      'Tippe oben auf Aktualisieren, um die Suche neu zu starten';

  @override
  String get fabricaPairingInstructions => 'FABRICA KOPPLUNGSANLEITUNG';

  @override
  String get pairingProcedure => 'KOPPLUNGSVORGANG';

  @override
  String get pairStep1Fabrica => 'Schalte deinen Fabrica-Roboter ein.';

  @override
  String get pairStep2Fabrica =>
      'Halte eine beliebige Taste auf dem Fabrica-Bedienfeld 3 Sekunden lang gedrückt, um den Kopplungsmodus zu starten.';

  @override
  String get pairStep3Fabrica =>
      'Die Status-LED blinkt schnell, um den aktiven Kopplungsmodus zu bestätigen.';

  @override
  String pairStep1Generic(Object model) {
    return 'Schalte deinen $model-Roboter ein.';
  }

  @override
  String get pairStep2Generic =>
      'Stelle sicher, dass der Bluetooth-Kopplungsmodus am Roboter aktiv ist.';

  @override
  String searchingForModel(Object model) {
    return 'Suche nach $model...';
  }

  @override
  String get noMatchingRobotsYet => 'Noch keine passenden Roboter gefunden';

  @override
  String get makeSureRobotPowered =>
      'Stelle sicher, dass dein Roboter eingeschaltet und in Reichweite ist.';

  @override
  String get checkPowerSwitch =>
      'Überprüfe den Netzschalter und tippe oben rechts auf das Symbol, um neu zu scannen.';

  @override
  String failedToConnect(Object error, Object name) {
    return 'Verbindung zu $name fehlgeschlagen: $error';
  }

  @override
  String get restoreDefaultPresetsTitle =>
      'Standard-Tastenbelegungen wiederherstellen?';

  @override
  String get restoreDefaultPresetsBody =>
      'Dadurch werden alle benutzerdefinierten Tastenroutinen auf dem Roboter gelöscht und die Tasten 1–4 zurückgesetzt.\n\nMöchtest du wirklich fortfahren?';

  @override
  String get presetsRestoredToast =>
      'Alle Tastenbelegungen auf dem Roboter wurden auf Standard zurückgesetzt.';

  @override
  String get eraseAllPresetsButton => 'ALLE VORLAGEN AUF ROBOTER LÖSCHEN';

  @override
  String get factoryResetTitle =>
      'Fabrica auf Werkseinstellungen zurücksetzen?';

  @override
  String get factoryResetBody =>
      'Dadurch wird Fabrica auf Werkseinstellungen zurückgesetzt:\n\n• Löscht alle benutzerdefinierten Routinen im Speicher.\n• Bringt alle Klappen flach in die Ausgangsposition (0°).\n• Löscht gespeicherte Bluetooth-Kopplungsschlüssel.\n• Trennt Bluetooth und startet den Kopplungsmodus neu.\n\nDer Roboter wird aus Deine Geräte entfernt.';

  @override
  String get executingFactoryReset => 'Fabrica-Werksreset wird ausgeführt...';

  @override
  String get resetEverythingButton => 'ALLES ZURÜCKSETZEN';

  @override
  String get editFabricaArrangementTitle => 'Fabrica-Anordnung bearbeiten';

  @override
  String get doneButton => 'FERTIG';

  @override
  String moduleNumber(Object number) {
    return 'Modul #$number';
  }

  @override
  String pairingModeHintError(Object name) {
    return 'Kopplung mit $name fehlgeschlagen. Stelle sicher, dass der Roboter im Kopplungsmodus ist (halte eine Taste 3 Sekunden gedrückt, bis die LED schnell blinkt) und versuche es erneut.';
  }
}
