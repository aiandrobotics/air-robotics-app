// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get appLanguageTitle => 'Lingua dell\'app';

  @override
  String get appVersionTitle => 'Versione dell\'app';

  @override
  String get languageSectionTitle => 'Lingua';

  @override
  String get languageSystemDefault =>
      'Predefinito di sistema (lingua del dispositivo)';

  @override
  String get selectLanguageHint => 'Seleziona una lingua';

  @override
  String get addDeviceTitle => 'AGGIUNGI NUOVO ROBOT';

  @override
  String get addDeviceSubtitle => 'Associa robot AIR';

  @override
  String get yourRobots => 'I TUOI ROBOT';

  @override
  String get discoveredRobots => 'ROBOT RILEVATI';

  @override
  String get noRobotsPairedYet => 'Nessun robot associato';

  @override
  String get noRobotsPairedSubtitle =>
      'Collega il tuo robot per visualizzare la telemetria, gestire le preimpostazioni e controllare le operazioni.';

  @override
  String get addYourFirstRobot => 'AGGIUNGI IL TUO PRIMO ROBOT';

  @override
  String get autoScanning => 'SCANSIONE AUTOMATICA';

  @override
  String get idleStatus => 'IN MINIMO';

  @override
  String get tabControl => 'Controllo';

  @override
  String get tabSequencer => 'Sequenziatore';

  @override
  String get tabCalibrator => 'Calibratore';

  @override
  String get tabDiagnostics => 'Diagnostica';

  @override
  String get renameRobot => 'Rinomina Robot';

  @override
  String get bleDiagnostics => 'Diagnostica BLE';

  @override
  String get erasePresets => 'Cancella le preimpostazioni salvate';

  @override
  String get disconnect => 'Disconnetti';

  @override
  String get unpairRobot => 'Disaccoppia Robot';

  @override
  String get factoryReset => 'Ripristino delle impostazioni di fabbrica';

  @override
  String get servoManualJog => 'JOG MANUALE SERVO';

  @override
  String get homeAll => 'A CASA TUTTI';

  @override
  String get foldingTimeline => 'CRONOLOGIA PIEGHEVOLE';

  @override
  String get addStep => 'AGGIUNGI PASSO';

  @override
  String get previewOnRobot => 'ANTEPRIMA SU ROBOT';

  @override
  String get saveToButton => 'SALVA SUL PULSANTE';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Dispositivo';

  @override
  String get themeLight => 'Luce';

  @override
  String get themeDark => 'Buio';

  @override
  String get connectedBadge => 'CONNESSO';

  @override
  String get inRangeBadge => 'NELLA GAMMA';

  @override
  String get offlineBadge => 'NON IN LINEA';

  @override
  String get openButton => 'APERTO';

  @override
  String get connectButton => 'CONNETTI';

  @override
  String get reconnectButton => 'RICONNETTI';

  @override
  String get pairAndConnect => 'ASSOCIA E CONNETTI';

  @override
  String get autoScanningForRobots => 'Scansione automatica per i robot...';

  @override
  String get scanningIdle => 'Scansione inattiva';

  @override
  String get nearbyRobotsAppear =>
      'I robot vicini appariranno qui automaticamente.';

  @override
  String get yourNearbyRobotsAppear =>
      'I tuoi robot nelle vicinanze appariranno qui automaticamente.';

  @override
  String get signalStrong => 'Forte';

  @override
  String get signalGood => 'Bene';

  @override
  String get signalWeak => 'Debole';

  @override
  String get addRobotIntro =>
      'Seleziona un robot qui sotto da accoppiare. Qualsiasi robot nelle vicinanze in modalità di accoppiamento verrà rilevato automaticamente in alto.';

  @override
  String get autoDiscoveredRobot => 'ROBOT SCOPERTO AUTOMATICAMENTE';

  @override
  String get autoDiscoveredRobots => 'ROBOT SCOPERTI AUTOMATICAMENTE';

  @override
  String readyCountBadge(Object count) {
    return '$count PRONTO';
  }

  @override
  String get supportedRobots => 'ROBOT SUPPORTATI';

  @override
  String get clothesFoldingRobot => 'Robot per piegare i vestiti';

  @override
  String get fabricaDescription =>
      'Piegatrice di indumenti automatizzata con preimpostazioni multi-indumento e funzionamento tattile con un solo pulsante.';

  @override
  String get fabricaPairingHint =>
      'Modalità di abbinamento: tieni premuto un pulsante qualsiasi sul pannello di controllo Fabrica per 3 secondi (il LED di stato lampeggerà rapidamente).';

  @override
  String get pairFabricaNow => 'ABBINA IL TESSUTO ORA';

  @override
  String get backToHome => 'Ritorno a casa';

  @override
  String get connReady => 'PRONTO';

  @override
  String get connConnecting => 'CONNESSIONE';

  @override
  String get connDiscovering => 'SCOPRIRE';

  @override
  String get connBonding => 'LEGAME';

  @override
  String get connScanning => 'SCANSIONE';

  @override
  String get connDisconnected => 'DISCONNESSO';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Disconnettersi da $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Puoi riconnetterti in qualsiasi momento dalla schermata principale.';

  @override
  String get cancelButton => 'ANNULLA';

  @override
  String get saveButton => 'SALVA';

  @override
  String get customNickname => 'Soprannome personalizzato';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Disaccoppiare $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Questa operazione rimuoverà $name da Your Robots su questo telefono. Puoi aggiungerlo nuovamente in qualsiasi momento.\n\nNota: per cancellare completamente la memoria del robot e ripristinare le impostazioni di fabbrica, utilizzare \"Ripristino delle impostazioni di fabbrica\".';
  }

  @override
  String get unpairButton => 'DISACCOPPIARE';

  @override
  String get machineIdle => 'IN MINIMO';

  @override
  String get machineRunning => 'CORRERE';

  @override
  String get machineEstop => 'ARRESTO DI EMERGENZA';

  @override
  String get machineError => 'ERRORE';

  @override
  String get machineCalibrating => 'CALIBRAZIONE';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'SALVATO';

  @override
  String get ledInputErr => 'ERRORE DI INGRESSO';

  @override
  String get ledPairing => 'ABBINAMENTO';

  @override
  String get ledConnected => 'CONNESSO';

  @override
  String get ledIdentify => 'IDENTIFICARE';

  @override
  String get identifyButton => 'IDENTIFICARE';

  @override
  String get identifyingToast => 'Il LED del robot lampeggia per 3 secondi...';

  @override
  String get homingToast => 'Homing di tutti i flap...';

  @override
  String get i2cFault => 'GUASTO I2C';

  @override
  String get storageFault => 'ERRORE DI STOCCAGGIO';

  @override
  String get estopLatched => 'ARRESTO DI EMERGENZA BLOCCATO';

  @override
  String get presetButtonsTitle => 'PULSANTI PRESET';

  @override
  String customizePresetTitle(Object label) {
    return 'Personalizza $label';
  }

  @override
  String get subtitleNameLabel => 'Nome del sottotitolo';

  @override
  String get subtitleNameHint =>
      'ad es. Piega Rapida, Camicie, Personalizzate...';

  @override
  String get buttonColorLabel => 'Colore del pulsante';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Passaggio $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'ARRESTO DI EMERGENZA';

  @override
  String get clearEstop => 'CANCELLARE E SBLOCCARE L\'ARRESTO DI EMERGENZA';

  @override
  String get clearEstopHint =>
      'Reimposta l\'arresto di emergenza e riporta il robot in modalità inattiva';

  @override
  String get stopButton => 'FERMARE';

  @override
  String get fabricaArrangementTitle => 'DISPOSIZIONE DEL TESSUTO';

  @override
  String get editArrangement => 'MODIFICA ARRANGIAMENTO';

  @override
  String get addPanel => 'AGGIUNGI PANNELLO';

  @override
  String get legendMotorized => 'Motorizzato';

  @override
  String get legendFollower => 'Seguace';

  @override
  String get legendBase => 'Fondo';

  @override
  String get colsLabel => 'Col';

  @override
  String get rowsLabel => 'Righe';

  @override
  String stepSelectedHint(Object step) {
    return 'Passaggio $step selezionato: tocca 1–2 Pannelli motorizzati sulla griglia';
  }

  @override
  String get tapPanelsHint => 'Tocca 1-2 pannelli motore sulla griglia';

  @override
  String get dualBadge => 'DOPPIO';

  @override
  String get requiresMotorizedPanel =>
      'Richiede almeno 1 pannello motorizzato (max 2)';

  @override
  String get selectedChangePanelsHint =>
      'Selezionato • Tocca i pannelli della griglia per modificare (max 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Passaggio $step di $total';
  }

  @override
  String get removeStepTooltip => 'Rimuovi passaggio';

  @override
  String get requiresMotorizedModuleWarning =>
      'La routine richiede almeno un modulo motorizzato di Fabrica Arrangement.';

  @override
  String get routineFull => 'ROUTINE COMPLETA (16/16 PASSI)';

  @override
  String addStepCount(Object count) {
    return 'AGGIUNGI PASSO ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Salva la routine sul robot';

  @override
  String get selectButtonToProgram =>
      'Seleziona un pulsante fisico del robot da programmare con questa routine:';

  @override
  String buttonNumber(Object slot) {
    return 'Pulsante $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Pulsante hardware $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Pulsante $slot Sottotitolo (facoltativo)';
  }

  @override
  String get saveToRobotButton => 'SALVA SUL ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Pulsante $slot ($count passi)';
  }

  @override
  String get adultTshirtTemplate => 'Modello di maglietta per adulti';

  @override
  String get longSleeveTemplate => 'Modello a manica lunga';

  @override
  String get dualSweepTemplate => 'Modello di doppia scansione';

  @override
  String channelNumber(Object number) {
    return 'Canale $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count ABBINATO';
  }

  @override
  String get moreHardwareOptions => 'Ulteriori opzioni hardware';

  @override
  String get loadTemplate => 'Carica modello';

  @override
  String get controllerLabel => 'CONTROLLORE';

  @override
  String get motorBadge => 'MOTORE';

  @override
  String get followerBadge => 'SEGUACE';

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
