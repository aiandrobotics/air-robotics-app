// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class AppLocalizationsGl extends AppLocalizations {
  AppLocalizationsGl([String locale = 'gl']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get appLanguageTitle => 'Idioma da aplicación';

  @override
  String get appVersionTitle => 'Versión da aplicación';

  @override
  String get languageSectionTitle => 'Linguaxe';

  @override
  String get languageSystemDefault =>
      'Valor predeterminado do sistema (idioma do dispositivo)';

  @override
  String get selectLanguageHint => 'Seleccione un idioma';

  @override
  String get addDeviceTitle => 'ENGADIR NOVO ROBOT';

  @override
  String get addDeviceSubtitle => 'Emparellar robots AIR';

  @override
  String get yourRobots => 'OS SEUS ROBOTS';

  @override
  String get discoveredRobots => 'DESCUBRIMOS OS ROBOTS';

  @override
  String get noRobotsPairedYet => 'Aínda non hai robots emparejados';

  @override
  String get noRobotsPairedSubtitle =>
      'Conecta o teu robot para ver a telemetría, xestionar axustes preestablecidos e controlar operacións.';

  @override
  String get addYourFirstRobot => 'ENGADE O TEU PRIMEIRO ROBOT';

  @override
  String get autoScanning => 'ESCANEO AUTOMÁTICO';

  @override
  String get idleStatus => 'INACTIVO';

  @override
  String get tabControl => 'Control';

  @override
  String get tabSequencer => 'Secuenciador';

  @override
  String get tabCalibrator => 'Calibrador';

  @override
  String get tabDiagnostics => 'Diagnóstico';

  @override
  String get renameRobot => 'Cambiar o nome do robot';

  @override
  String get bleDiagnostics => 'Diagnóstico BLE';

  @override
  String get erasePresets => 'Borrar presets gardados';

  @override
  String get disconnect => 'Desconectar';

  @override
  String get unpairRobot => 'Desvincular robot';

  @override
  String get factoryReset => 'Restablecemento de fábrica';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'CASA TODOS';

  @override
  String get foldingTimeline => 'CRONOGRAMA PLEGABLE';

  @override
  String get addStep => 'ENGADIR PASO';

  @override
  String get previewOnRobot => 'VISTA PREVIA EN ROBOT';

  @override
  String get saveToButton => 'GARDAR NO BOTÓN';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Dispositivo';

  @override
  String get themeLight => 'Luz';

  @override
  String get themeDark => 'Escuro';

  @override
  String get connectedBadge => 'CONECTADO';

  @override
  String get inRangeBadge => 'EN RANGE';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'ABERTO';

  @override
  String get connectButton => 'CONECTAR';

  @override
  String get reconnectButton => 'RECONECTAR';

  @override
  String get pairAndConnect => 'PAR E CONECTAR';

  @override
  String get autoScanningForRobots => 'Exploración automática de robots...';

  @override
  String get scanningIdle => 'Escaneando inactivo';

  @override
  String get nearbyRobotsAppear =>
      'Os robots próximos aparecerán aquí automaticamente.';

  @override
  String get yourNearbyRobotsAppear =>
      'Os teus robots próximos aparecerán aquí automaticamente.';

  @override
  String get signalStrong => 'Forte';

  @override
  String get signalGood => 'Ben';

  @override
  String get signalWeak => 'Débil';

  @override
  String get addRobotIntro =>
      'Selecciona un robot a continuación para emparellar. Calquera robot próximo en modo de sincronización descubrirase automaticamente na parte superior.';

  @override
  String get autoDiscoveredRobot => 'AUTO DESCUBRIDO ROBOT';

  @override
  String get autoDiscoveredRobots => 'ROBOTS DESCUBRIDOS AUTOMÁTICOS';

  @override
  String readyCountBadge(Object count) {
    return '$count LISTO';
  }

  @override
  String get supportedRobots => 'ROBOTS SOPORTADOS';

  @override
  String get clothesFoldingRobot => 'Robot dobrador de roupa';

  @override
  String get fabricaDescription =>
      'Carpeta de roupa automatizada con predefinidos de varias prendas e operación táctil cun só botón.';

  @override
  String get fabricaPairingHint =>
      'Modo de sincronización: manteña premido calquera botón do panel de control de Fabrica durante 3 segundos (o LED de estado parpadeará rapidamente).';

  @override
  String get pairFabricaNow => 'PAR TELA AGORA';

  @override
  String get backToHome => 'Volver á casa';

  @override
  String get connReady => 'LISTO';

  @override
  String get connConnecting => 'CONECTANDO';

  @override
  String get connDiscovering => 'DESCUBRIR';

  @override
  String get connBonding => 'VINCULACIÓN';

  @override
  String get connScanning => 'ESCAXEO';

  @override
  String get connDisconnected => 'DESCONECTADO';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Desconectarte de $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Podes volver conectarte en calquera momento desde a pantalla de inicio.';

  @override
  String get cancelButton => 'CANCELAR';

  @override
  String get saveButton => 'GARDAR';

  @override
  String get customNickname => 'Alcume personalizado';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Desvincular $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Isto eliminará $name de Your Robots neste teléfono. Podes engadilo de novo en calquera momento.\n\nNota: Para borrar completamente a memoria do robot e restaurar os valores predeterminados de fábrica, use \"Restablecer a configuración de fábrica\".';
  }

  @override
  String get unpairButton => 'DESPARAR';

  @override
  String get machineIdle => 'INACTIVO';

  @override
  String get machineRunning => 'CORRANDO';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'ERRO';

  @override
  String get machineCalibrating => 'CALIBRANDO';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'GARDADO';

  @override
  String get ledInputErr => 'ERRO DE ENTRADA';

  @override
  String get ledPairing => 'MARIDAXE';

  @override
  String get ledConnected => 'CONECTADO';

  @override
  String get ledIdentify => 'IDENTIFICAR';

  @override
  String get identifyButton => 'IDENTIFICAR';

  @override
  String get identifyingToast => 'LED robot parpadeando durante 3 segundos...';

  @override
  String get homingToast => 'Apuntando todas as solapas...';

  @override
  String get i2cFault => 'FALLO I2C';

  @override
  String get storageFault => 'AVERÍA DE ALMACENAMIENTO';

  @override
  String get estopLatched => 'E-STOP BLOQUEADO';

  @override
  String get presetButtonsTitle => 'BOTÓNS PRESET';

  @override
  String customizePresetTitle(Object label) {
    return 'Personalizar $label';
  }

  @override
  String get subtitleNameLabel => 'Nome do subtítulo';

  @override
  String get subtitleNameHint =>
      'p.ex. Dobra rápida, camisas, personalizadas...';

  @override
  String get buttonColorLabel => 'Cor do botón';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Paso $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'PARADA DE EMERXENCIA';

  @override
  String get clearEstop => 'BORRAR E DESBLOQUEAR PARADA DE EMERGENCIA';

  @override
  String get clearEstopHint =>
      'Restablece a parada de emerxencia e devolve o robot ao estado inactivo';

  @override
  String get stopButton => 'PARA';

  @override
  String get fabricaArrangementTitle => 'DISPOSICIÓN DE TELAS';

  @override
  String get editArrangement => 'EDITAR DISPOSICIÓN';

  @override
  String get addPanel => 'ENGADIR PANEL';

  @override
  String get legendMotorized => 'Motorizado';

  @override
  String get legendFollower => 'Seguidor';

  @override
  String get legendBase => 'Base';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Filas';

  @override
  String stepSelectedHint(Object step) {
    return 'Paso $step seleccionado: toca 1–2 paneis motorizados na grella';
  }

  @override
  String get tapPanelsHint => 'Toca 1-2 paneis do motor na reixa';

  @override
  String get dualBadge => 'DOBLE';

  @override
  String get requiresMotorizedPanel =>
      'Require polo menos 1 panel motorizado (máximo 2)';

  @override
  String get selectedChangePanelsHint =>
      'Seleccionado • Toca os paneis de cuadrícula para cambiar (máximo 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Paso $step de $total';
  }

  @override
  String get removeStepTooltip => 'Eliminar paso';

  @override
  String get requiresMotorizedModuleWarning =>
      'A rutina require polo menos un módulo motorizado de Fabrica Arrangement.';

  @override
  String get routineFull => 'RUTINA COMPLETA (16/16 PASOS)';

  @override
  String addStepCount(Object count) {
    return 'ENGADIR PASO ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Gardar rutina en Robot';

  @override
  String get selectButtonToProgram =>
      'Seleccione un botón de robot físico para programar con esta rutina:';

  @override
  String buttonNumber(Object slot) {
    return 'Botón $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Botón de hardware $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Botón $slot Subtítulo (Opcional)';
  }

  @override
  String get saveToRobotButton => 'GARDAR EN ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Botón $slot ($count pasos)';
  }

  @override
  String get adultTshirtTemplate => 'Modelo de camiseta para adultos';

  @override
  String get longSleeveTemplate => 'Modelo de manga longa';

  @override
  String get dualSweepTemplate => 'Modelo de varrido dual';

  @override
  String channelNumber(Object number) {
    return 'Canle $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count EMPAREJADO';
  }

  @override
  String get moreHardwareOptions => 'Máis opcións de hardware';

  @override
  String get loadTemplate => 'Cargar modelo';

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
