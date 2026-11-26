// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Configuració';

  @override
  String get appLanguageTitle => 'Idioma de l\'aplicació';

  @override
  String get appVersionTitle => 'Versió de l\'aplicació';

  @override
  String get languageSectionTitle => 'Idioma';

  @override
  String get languageSystemDefault =>
      'Per defecte del sistema (idioma del dispositiu)';

  @override
  String get selectLanguageHint => 'Selecciona un idioma';

  @override
  String get addDeviceTitle => 'AFEGEIX UN ROBOT NOU';

  @override
  String get addDeviceSubtitle => 'Vincula els robots AIR';

  @override
  String get yourRobots => 'ELS SEUS ROBOTS';

  @override
  String get discoveredRobots => 'ELS ROBOTS DESCOBERTS';

  @override
  String get noRobotsPairedYet => 'Encara no hi ha cap robot emparellat';

  @override
  String get noRobotsPairedSubtitle =>
      'Connecteu el vostre robot per veure la telemetria, gestionar els valors predefinits i controlar les operacions.';

  @override
  String get addYourFirstRobot => 'AFEGEIX EL TEU PRIMER ROBOT';

  @override
  String get autoScanning => 'ESCANEIG AUTOMÀTIC';

  @override
  String get idleStatus => 'INACTIVE';

  @override
  String get tabControl => 'Control';

  @override
  String get tabSequencer => 'Seqüenciador';

  @override
  String get tabCalibrator => 'Calibrador';

  @override
  String get tabDiagnostics => 'Diagnòstics';

  @override
  String get renameRobot => 'Canvia el nom del robot';

  @override
  String get bleDiagnostics => 'Diagnòstic BLE';

  @override
  String get erasePresets => 'Esborra els valors predefinits desats';

  @override
  String get disconnect => 'Desconnecta';

  @override
  String get unpairRobot => 'Desvincular el robot';

  @override
  String get factoryReset => 'Restabliment de fàbrica';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'A CASA TOTS';

  @override
  String get foldingTimeline => 'LÍNIA DE TEMPS PLEGABLE';

  @override
  String get addStep => 'AFEGIR PAS';

  @override
  String get previewOnRobot => 'PREVISUALITZACIÓ EN ROBOT';

  @override
  String get saveToButton => 'DESA AL BOTÓ';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Dispositiu';

  @override
  String get themeLight => 'Llum';

  @override
  String get themeDark => 'fosc';

  @override
  String get connectedBadge => 'CONNECTAT';

  @override
  String get inRangeBadge => 'EN RANGA';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'OBERT';

  @override
  String get connectButton => 'CONNECTA';

  @override
  String get reconnectButton => 'RECONNECTAR';

  @override
  String get pairAndConnect => 'PARELLA I CONNECTA';

  @override
  String get autoScanningForRobots => 'Escaneig automàtic de robots...';

  @override
  String get scanningIdle => 'Escaneig inactiu';

  @override
  String get nearbyRobotsAppear =>
      'Els robots propers apareixeran aquí automàticament.';

  @override
  String get yourNearbyRobotsAppear =>
      'Els vostres robots propers apareixeran aquí automàticament.';

  @override
  String get signalStrong => 'Fort';

  @override
  String get signalGood => 'Bé';

  @override
  String get signalWeak => 'Feble';

  @override
  String get addRobotIntro =>
      'Seleccioneu un robot a continuació per emparellar-lo. Qualsevol robot proper en mode de vinculació es descobrirà automàticament a la part superior.';

  @override
  String get autoDiscoveredRobot => 'AUTO DESCOBRIT EL ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTO DESCOBERTA DE ROBOTS';

  @override
  String readyCountBadge(Object count) {
    return '$count PREPARAT';
  }

  @override
  String get supportedRobots => 'ROBOTS SUPORTS';

  @override
  String get clothesFoldingRobot => 'Robot plegable de roba';

  @override
  String get fabricaDescription =>
      'Carpeta de roba automatitzada amb preajustos de peces múltiples i funcionament tàctil amb un sol botó.';

  @override
  String get fabricaPairingHint =>
      'Mode d\'aparellament: manteniu premut qualsevol botó del tauler de control de Fabrica durant 3 segons (el LED d\'estat parpellejarà ràpidament).';

  @override
  String get pairFabricaNow => 'PAR TELA ARA';

  @override
  String get backToHome => 'Tornar a casa';

  @override
  String get connReady => 'PREPARAT';

  @override
  String get connConnecting => 'CONNEXANT';

  @override
  String get connDiscovering => 'DESCOBRIR';

  @override
  String get connBonding => 'ENLLAÇAMENT';

  @override
  String get connScanning => 'ESCANEIG';

  @override
  String get connDisconnected => 'DESCONNECTAT';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Desconnecteu-vos de $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Podeu tornar a connectar-vos en qualsevol moment des de la pantalla d\'inici.';

  @override
  String get cancelButton => 'CANCEL·LA';

  @override
  String get saveButton => 'DESA';

  @override
  String get customNickname => 'Pseudònim personalitzat';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Desvincular $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Això eliminarà $name dels teus robots en aquest telèfon. Podeu tornar-lo a afegir en qualsevol moment.\n\nNota: per esborrar completament la memòria del robot i restaurar els valors predeterminats de fàbrica, utilitzeu \"Factory Reset\".';
  }

  @override
  String get unpairButton => 'DESPARAR';

  @override
  String get machineIdle => 'INACTIVE';

  @override
  String get machineRunning => 'CÓRRER';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'ERROR';

  @override
  String get machineCalibrating => 'CALIBRACIÓ';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'SALAT';

  @override
  String get ledInputErr => 'ERR D\'ENTRADA';

  @override
  String get ledPairing => 'MARIDATGE';

  @override
  String get ledConnected => 'CONNECTAT';

  @override
  String get ledIdentify => 'IDENTIFICAR';

  @override
  String get identifyButton => 'IDENTIFICAR';

  @override
  String get identifyingToast =>
      'LED del robot parpellejant durant 3 segons...';

  @override
  String get homingToast => 'Apuntant tots els flaps...';

  @override
  String get i2cFault => 'FALLA I2C';

  @override
  String get storageFault => 'Avaria d\'emmagatzematge';

  @override
  String get estopLatched => 'PARADA ELECTRÒNICA PANELLADA';

  @override
  String get presetButtonsTitle => 'BTONS PRESET';

  @override
  String customizePresetTitle(Object label) {
    return 'Personalitza $label';
  }

  @override
  String get subtitleNameLabel => 'Nom del subtítol';

  @override
  String get subtitleNameHint =>
      'p. ex. Plegat ràpid, samarretes, personalitzats...';

  @override
  String get buttonColorLabel => 'Color del botó';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Pas $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'PARADA D\'EMERGÈNCIA';

  @override
  String get clearEstop => 'ESBORRA I DESBLOQUEU PARADA D\'EMERGÈNCIA';

  @override
  String get clearEstopHint =>
      'Restableix l\'aturada d\'emergència i torna el robot al mode inactiu';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'ARRANJAMENT DE TELA';

  @override
  String get editArrangement => 'EDITAR ARRANJAMENT';

  @override
  String get addPanel => 'AFEGEIX EL PANEL';

  @override
  String get legendMotorized => 'Motoritzat';

  @override
  String get legendFollower => 'Seguidor';

  @override
  String get legendBase => 'Base';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Files';

  @override
  String stepSelectedHint(Object step) {
    return 'Pas $step seleccionat: toqueu 1–2 panells motoritzats a la quadrícula';
  }

  @override
  String get tapPanelsHint => 'Toqueu 1-2 panells del motor a la graella';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Requereix almenys 1 panell motoritzat (màxim 2)';

  @override
  String get selectedChangePanelsHint =>
      'Seleccionat • Toqueu els panells de quadrícula per canviar-lo (2 com a màxim)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Pas $step de $total';
  }

  @override
  String get removeStepTooltip => 'Elimina el pas';

  @override
  String get requiresMotorizedModuleWarning =>
      'La rutina requereix almenys un mòdul motoritzat de Fabrica Arrangement.';

  @override
  String get routineFull => 'RUTINA COMPLETA (16/16 PASS)';

  @override
  String addStepCount(Object count) {
    return 'AFEGUEIX EL PAS ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Desa la rutina al robot';

  @override
  String get selectButtonToProgram =>
      'Seleccioneu un botó de robot físic per programar amb aquesta rutina:';

  @override
  String buttonNumber(Object slot) {
    return 'Botó $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Botó de maquinari $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Botó $slot Subtítol (Opcional)';
  }

  @override
  String get saveToRobotButton => 'DESA AL ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Botó $slot ($count passos)';
  }

  @override
  String get adultTshirtTemplate => 'Plantilla de samarreta per a adults';

  @override
  String get longSleeveTemplate => 'Plantilla de màniga llarga';

  @override
  String get dualSweepTemplate => 'Plantilla de doble escombrat';

  @override
  String channelNumber(Object number) {
    return 'Canal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count EMPAREJAT';
  }

  @override
  String get moreHardwareOptions => 'Més opcions de maquinari';

  @override
  String get loadTemplate => 'Carrega la plantilla';

  @override
  String get controllerLabel => 'CONTROLADOR';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'SEGUIDOR';

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
