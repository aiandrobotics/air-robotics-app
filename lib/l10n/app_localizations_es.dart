// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get appLanguageTitle => 'Idioma de la aplicación';

  @override
  String get appVersionTitle => 'Versión de la aplicación';

  @override
  String get languageSectionTitle => 'Idioma';

  @override
  String get languageSystemDefault =>
      'Predeterminado del sistema (idioma del dispositivo)';

  @override
  String get selectLanguageHint => 'Seleccionar un idioma';

  @override
  String get addDeviceTitle => 'AÑADIR NUEVO ROBOT';

  @override
  String get addDeviceSubtitle => 'Emparejar robots AIR';

  @override
  String get yourRobots => 'TUS ROBOTS';

  @override
  String get discoveredRobots => 'ROBOTS DESCUBIERTOS';

  @override
  String get noRobotsPairedYet => 'Aún no hay robots emparejados';

  @override
  String get noRobotsPairedSubtitle =>
      'Conecta tu robot para ver telemetría, gestionar preajustes y controlar operaciones.';

  @override
  String get addYourFirstRobot => 'AÑADE TU PRIMER ROBOT';

  @override
  String get autoScanning => 'AUTO-ESCANEO';

  @override
  String get idleStatus => 'INACTIVO';

  @override
  String get tabControl => 'controlar';

  @override
  String get tabSequencer => 'Secuenciador';

  @override
  String get tabCalibrator => 'Calibrador';

  @override
  String get tabDiagnostics => 'Diagnóstico';

  @override
  String get renameRobot => 'Renombrar robot';

  @override
  String get bleDiagnostics => 'Diagnóstico BLE';

  @override
  String get erasePresets => 'Borrar preajustes guardados';

  @override
  String get disconnect => 'Desconectar';

  @override
  String get unpairRobot => 'Desemparejar robot';

  @override
  String get factoryReset => 'Restablecer de fábrica';

  @override
  String get servoManualJog => 'AJUSTE MANUAL DE SERVO';

  @override
  String get homeAll => 'INICIO TODO';

  @override
  String get foldingTimeline => 'LÍNEA DE TIEMPO';

  @override
  String get addStep => 'AÑADIR PASO';

  @override
  String get previewOnRobot => 'VISTA PREVIA EN ROBOT';

  @override
  String get saveToButton => 'GUARDAR EN BOTÓN';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Dispositivo';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get connectedBadge => 'CONECTADO';

  @override
  String get inRangeBadge => 'EN RANGO';

  @override
  String get offlineBadge => 'DESCONECTADO';

  @override
  String get openButton => 'ABRIR';

  @override
  String get connectButton => 'CONECTAR';

  @override
  String get reconnectButton => 'RECONECTAR';

  @override
  String get pairAndConnect => 'EMPAREJAR Y CONECTAR';

  @override
  String get autoScanningForRobots => 'Escaneando robots...';

  @override
  String get scanningIdle => 'Escaneo inactivo';

  @override
  String get nearbyRobotsAppear =>
      'Los robots cercanos aparecerán aquí automáticamente.';

  @override
  String get yourNearbyRobotsAppear =>
      'Tus robots cercanos aparecerán aquí automáticamente.';

  @override
  String get signalStrong => 'fuerte';

  @override
  String get signalGood => 'bueno';

  @override
  String get signalWeak => 'Débil';

  @override
  String get addRobotIntro =>
      'Seleccione un robot a continuación para emparejarlo. Cualquier robot cercano en modo de emparejamiento será descubierto automáticamente en la parte superior.';

  @override
  String get autoDiscoveredRobot => 'ROBOT DESCUBIERTO AUTOMÁTICAMENTE';

  @override
  String get autoDiscoveredRobots => 'ROBOTS DESCUBIERTOS AUTOMÁTICAMENTE';

  @override
  String readyCountBadge(Object count) {
    return '$count LISTO';
  }

  @override
  String get supportedRobots => 'ROBOTS SOPORTADOS';

  @override
  String get clothesFoldingRobot => 'Robot plegable de ropa';

  @override
  String get fabricaDescription =>
      'Dobladora de prendas automatizada con ajustes preestablecidos para varias prendas y operación táctil con un solo botón.';

  @override
  String get fabricaPairingHint =>
      'Modo de emparejamiento: Mantenga presionado cualquier botón en el panel de control de Fabrica durante 3 segundos (el LED de estado parpadeará rápidamente).';

  @override
  String get pairFabricaNow => 'PAR DE TELA AHORA';

  @override
  String get backToHome => 'Volver a Inicio';

  @override
  String get connReady => 'LISTO';

  @override
  String get connConnecting => 'CONECTANDO';

  @override
  String get connDiscovering => 'DESCUBRIENDO';

  @override
  String get connBonding => 'VINCULACIÓN';

  @override
  String get connScanning => 'ESCANEO';

  @override
  String get connDisconnected => 'DESCONECTADO';

  @override
  String disconnectConfirmTitle(Object name) {
    return '¿Desconectarse de $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Puede volver a conectarse en cualquier momento desde la pantalla de inicio.';

  @override
  String get cancelButton => 'CANCELAR';

  @override
  String get saveButton => 'GUARDAR';

  @override
  String get customNickname => 'Apodo personalizado';

  @override
  String unpairConfirmTitle(Object name) {
    return '¿Desvincular $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Esto eliminará $name de Your Robots en este teléfono. Puedes volver a agregarlo en cualquier momento.\n\nNota: Para borrar completamente la memoria del robot y restaurar los valores predeterminados de fábrica, utilice \"Restablecimiento de fábrica\".';
  }

  @override
  String get unpairButton => 'DESPARAR';

  @override
  String get machineIdle => 'INACTIVO';

  @override
  String get machineRunning => 'CORRIENDO';

  @override
  String get machineEstop => 'PARADA DE EMERGENCIA';

  @override
  String get machineError => 'ERROR';

  @override
  String get machineCalibrating => 'CALIBRANDO';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'SALVADO';

  @override
  String get ledInputErr => 'ERROR DE ENTRADA';

  @override
  String get ledPairing => 'EMPAREJAMIENTO';

  @override
  String get ledConnected => 'CONECTADO';

  @override
  String get ledIdentify => 'IDENTIFICAR';

  @override
  String get identifyButton => 'IDENTIFICAR';

  @override
  String get identifyingToast =>
      'LED del robot parpadeante durante 3 segundos...';

  @override
  String get homingToast => 'Orientando todos los flaps...';

  @override
  String get i2cFault => 'FALLA I2C';

  @override
  String get storageFault => 'FALLA DE ALMACENAMIENTO';

  @override
  String get estopLatched => 'PARADA DE EMERGENCIA BLOQUEADA';

  @override
  String get presetButtonsTitle => 'BOTONES PREDEFINIDOS';

  @override
  String customizePresetTitle(Object label) {
    return 'Personalizar $label';
  }

  @override
  String get subtitleNameLabel => 'Nombre del subtítulo';

  @override
  String get subtitleNameHint =>
      'por ej. Plegado Rápido, Camisas, Personalizados...';

  @override
  String get buttonColorLabel => 'Color del botón';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Paso $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'PARADA DE EMERGENCIA';

  @override
  String get clearEstop => 'BORRAR Y DESBLOQUEAR LA PARADA DE EMERGENCIA';

  @override
  String get clearEstopHint =>
      'Restablece la parada de emergencia y devuelve el robot al modo inactivo';

  @override
  String get stopButton => 'DETENER';

  @override
  String get fabricaArrangementTitle => 'DISPOSICIÓN DE TELA';

  @override
  String get editArrangement => 'EDITAR DISPOSICIÓN';

  @override
  String get addPanel => 'AÑADIR PANEL';

  @override
  String get legendMotorized => 'motorizado';

  @override
  String get legendFollower => 'seguidor';

  @override
  String get legendBase => 'bases';

  @override
  String get colsLabel => 'columnas';

  @override
  String get rowsLabel => 'Filas';

  @override
  String stepSelectedHint(Object step) {
    return 'Paso $step seleccionado: toque 1 o 2 paneles motorizados en la cuadrícula';
  }

  @override
  String get tapPanelsHint => 'Toque 1 o 2 paneles de motor en la cuadrícula';

  @override
  String get dualBadge => 'DOBLE';

  @override
  String get requiresMotorizedPanel =>
      'Requiere al menos 1 panel motorizado (máximo 2)';

  @override
  String get selectedChangePanelsHint =>
      'Seleccionado • Toque los paneles de la cuadrícula para cambiar (máximo 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Paso $step de $total';
  }

  @override
  String get removeStepTooltip => 'Eliminar paso';

  @override
  String get requiresMotorizedModuleWarning =>
      'La rutina requiere al menos un módulo motorizado de Fabrica Arrangement.';

  @override
  String get routineFull => 'RUTINA COMPLETA (16/16 PASOS)';

  @override
  String addStepCount(Object count) {
    return 'AÑADIR PASO ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Guardar rutina en robot';

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
  String get saveToRobotButton => 'GUARDAR EN EL ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Botón $slot (pasos $count)';
  }

  @override
  String get adultTshirtTemplate => 'Plantilla de camiseta para adultos';

  @override
  String get longSleeveTemplate => 'Plantilla de manga larga';

  @override
  String get dualSweepTemplate => 'Plantilla de barrido doble';

  @override
  String channelNumber(Object number) {
    return 'Canal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count EMPAREJADO';
  }

  @override
  String get moreHardwareOptions => 'Más opciones de hardware';

  @override
  String get loadTemplate => 'Cargar plantilla';

  @override
  String get controllerLabel => 'CONTROLADOR';

  @override
  String get motorBadge => 'MOTORES';

  @override
  String get followerBadge => 'SEGUIDOR';

  @override
  String get baseBadge => 'FONDO';

  @override
  String pairModelTitle(Object model) {
    return 'EMPAREJAR $model';
  }

  @override
  String get stopScan => 'Detener escaneo';

  @override
  String get rescan => 'Volver a escanear';

  @override
  String searchingForNearby(Object model) {
    return 'BUSCANDO $model CERCANOS...';
  }

  @override
  String get scanPaused => 'ESCANEO PAUSADO';

  @override
  String filteringForBle(Object prefix) {
    return 'Filtrando anuncios BLE \"$prefix*\"';
  }

  @override
  String get tapRefreshToRestart =>
      'Toca el botón de actualizar en la barra superior para reiniciar el escaneo';

  @override
  String get fabricaPairingInstructions =>
      'INSTRUCCIONES DE EMPAREJAMIENTO FABRICA';

  @override
  String get pairingProcedure => 'PROCEDIMIENTO DE EMPAREJAMIENTO';

  @override
  String get pairStep1Fabrica => 'Enciende tu robot Fabrica.';

  @override
  String get pairStep2Fabrica =>
      'Mantén presionado cualquier botón del panel de control de Fabrica durante 3 segundos para entrar al modo de emparejamiento.';

  @override
  String get pairStep3Fabrica =>
      'El LED de estado parpadeará rápidamente para confirmar que el modo de emparejamiento está activo.';

  @override
  String pairStep1Generic(Object model) {
    return 'Enciende tu robot $model.';
  }

  @override
  String get pairStep2Generic =>
      'Asegúrate de que el modo de emparejamiento Bluetooth esté activo en el robot.';

  @override
  String searchingForModel(Object model) {
    return 'Buscando $model...';
  }

  @override
  String get noMatchingRobotsYet =>
      'Aún no se han descubierto robots coincidentes';

  @override
  String get makeSureRobotPowered =>
      'Asegúrate de que tu robot esté encendido y dentro del alcance.';

  @override
  String get checkPowerSwitch =>
      'Verifica el interruptor de encendido y toca el icono superior derecho para reiniciar el escaneo.';

  @override
  String failedToConnect(Object error, Object name) {
    return 'Error al conectar con $name: $error';
  }

  @override
  String get restoreDefaultPresetsTitle =>
      '¿Restaurar ajustes predeterminados de botones?';

  @override
  String get restoreDefaultPresetsBody =>
      'Esto borrará todas las rutinas de botones personalizadas en el robot y restablecerá los botones 1–4 a sus ajustes predeterminados.\n\n¿Seguro que deseas continuar?';

  @override
  String get presetsRestoredToast =>
      'Todos los ajustes de botones del robot se han restaurado a los valores predeterminados.';

  @override
  String get eraseAllPresetsButton => 'BORRAR TODOS LOS AJUSTES DEL ROBOT';

  @override
  String get factoryResetTitle => '¿Restablecimiento de fábrica de Fabrica?';

  @override
  String get factoryResetBody =>
      'Esto restablecerá Fabrica a los valores de fábrica:\n\n• Borra todas las rutinas personalizadas en memoria y restaura los valores de fábrica.\n• Devuelve todas las solapas a la posición inicial (0°).\n• Borra las claves de emparejamiento Bluetooth guardadas.\n• Desconecta el Bluetooth y reinicia el modo de emparejamiento.\n\nEl robot se eliminará de Tus Dispositivos en este teléfono.';

  @override
  String get executingFactoryReset =>
      'Ejecutando restablecimiento de fábrica de Fabrica...';

  @override
  String get resetEverythingButton => 'RESTABLECER TODO';

  @override
  String get editFabricaArrangementTitle => 'Editar disposición de Fabrica';

  @override
  String get doneButton => 'LISTO';

  @override
  String moduleNumber(Object number) {
    return 'Módulo #$number';
  }

  @override
  String pairingModeHintError(Object name) {
    return 'No se pudo emparejar con $name. Asegúrate de que el robot esté en modo de emparejamiento (mantén cualquier botón 3 segundos hasta que el LED parpadee rápido) e inténtalo de nuevo.';
  }
}
