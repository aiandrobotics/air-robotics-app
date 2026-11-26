// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get appLanguageTitle => 'Idioma do aplicativo';

  @override
  String get appVersionTitle => 'Versão do aplicativo';

  @override
  String get languageSectionTitle => 'Idioma';

  @override
  String get languageSystemDefault =>
      'Padrão do sistema (idioma do dispositivo)';

  @override
  String get selectLanguageHint => 'Selecionar um idioma';

  @override
  String get addDeviceTitle => 'ADICIONAR NOVO ROBÔ';

  @override
  String get addDeviceSubtitle => 'Parear robôs AIR';

  @override
  String get yourRobots => 'SEUS ROBÔS';

  @override
  String get discoveredRobots => 'ROBÔS DESCOBERTOS';

  @override
  String get noRobotsPairedYet => 'Nenhum robô pareado ainda';

  @override
  String get noRobotsPairedSubtitle =>
      'Conecte seu robô para visualizar telemetria, gerenciar predefinições e controlar operações.';

  @override
  String get addYourFirstRobot => 'ADICIONAR SEU PRIMEIRO ROBÔ';

  @override
  String get autoScanning => 'VERIFICAÇÃO AUTOMÁTICA';

  @override
  String get idleStatus => 'PARADO';

  @override
  String get tabControl => 'Controlar';

  @override
  String get tabSequencer => 'Sequenciador';

  @override
  String get tabCalibrator => 'Calibrador';

  @override
  String get tabDiagnostics => 'Diagnóstico';

  @override
  String get renameRobot => 'Renomear robô';

  @override
  String get bleDiagnostics => 'Diagnóstico BLE';

  @override
  String get erasePresets => 'Apagar predefinições salvas';

  @override
  String get disconnect => 'Desconectar';

  @override
  String get unpairRobot => 'Desemparelhar robô';

  @override
  String get factoryReset => 'Redefinição de fábrica';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'CASA TODOS';

  @override
  String get foldingTimeline => 'CRONOGRAMA DOBRÁVEL';

  @override
  String get addStep => 'ADICIONAR ETAPA';

  @override
  String get previewOnRobot => 'PRÉ-VISUALIZAÇÃO NO ROBÔ';

  @override
  String get saveToButton => 'SALVAR NO BOTÃO';

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
  String get inRangeBadge => 'NA FAIXA';

  @override
  String get offlineBadge => 'OFF-LINE';

  @override
  String get openButton => 'ABRIR';

  @override
  String get connectButton => 'CONECTAR';

  @override
  String get reconnectButton => 'RECONECTAR';

  @override
  String get pairAndConnect => 'PAR E CONECTAR';

  @override
  String get autoScanningForRobots => 'Verificação automática para robôs...';

  @override
  String get scanningIdle => 'Verificação ociosa';

  @override
  String get nearbyRobotsAppear =>
      'Os robôs próximos aparecerão aqui automaticamente.';

  @override
  String get yourNearbyRobotsAppear =>
      'Seus robôs próximos aparecerão aqui automaticamente.';

  @override
  String get signalStrong => 'Forte';

  @override
  String get signalGood => 'Bom';

  @override
  String get signalWeak => 'Fraco';

  @override
  String get addRobotIntro =>
      'Selecione um robô abaixo para emparelhar. Qualquer robô próximo em modo de emparelhamento será automaticamente descoberto no topo.';

  @override
  String get autoDiscoveredRobot => 'ROBÔ DESCOBERTO AUTOMÁTICO';

  @override
  String get autoDiscoveredRobots => 'ROBÔS DESCOBERTOS AUTOMÁTICOS';

  @override
  String readyCountBadge(Object count) {
    return '$count PRONTO';
  }

  @override
  String get supportedRobots => 'ROBÔS SUPORTADOS';

  @override
  String get clothesFoldingRobot => 'Robô Dobrável de Roupas';

  @override
  String get fabricaDescription =>
      'Dobrador de roupas automatizado com predefinições de várias peças e operação tátil com um único botão.';

  @override
  String get fabricaPairingHint =>
      'Modo de emparelhamento: Pressione e segure qualquer botão no painel de controle do Fabrica por 3 segundos (o LED de status piscará rapidamente).';

  @override
  String get pairFabricaNow => 'PAR FÁBRICA AGORA';

  @override
  String get backToHome => 'De volta para casa';

  @override
  String get connReady => 'PREPARAR';

  @override
  String get connConnecting => 'CONECTANDO';

  @override
  String get connDiscovering => 'DESCOBRIR';

  @override
  String get connBonding => 'COLAGEM';

  @override
  String get connScanning => 'DIGITALIZANDO';

  @override
  String get connDisconnected => 'DESCONECTADO';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Desconectar de $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Você pode se reconectar a qualquer momento na tela inicial.';

  @override
  String get cancelButton => 'CANCELAR';

  @override
  String get saveButton => 'SALVAR';

  @override
  String get customNickname => 'Apelido personalizado';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Desemparelhar $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Isso removerá $name de Seus Robôs neste telefone. Você pode adicioná-lo novamente a qualquer momento.\n\nNota: Para limpar completamente a memória do robô e restaurar os padrões de fábrica, use \"Factory Reset\".';
  }

  @override
  String get unpairButton => 'DESEMPARELHAR';

  @override
  String get machineIdle => 'PARADO';

  @override
  String get machineRunning => 'CORRENDO';

  @override
  String get machineEstop => 'PARADA DE EMERGÊNCIA';

  @override
  String get machineError => 'ERRO';

  @override
  String get machineCalibrating => 'CALIBRANDO';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'SALVO';

  @override
  String get ledInputErr => 'ERRO DE ENTRADA';

  @override
  String get ledPairing => 'EMPARELHAMENTO';

  @override
  String get ledConnected => 'CONECTADO';

  @override
  String get ledIdentify => 'IDENTIFICAR';

  @override
  String get identifyButton => 'IDENTIFICAR';

  @override
  String get identifyingToast => 'LED do robô piscando por 3 segundos...';

  @override
  String get homingToast => 'Direcionando todas as abas...';

  @override
  String get i2cFault => 'FALHA I2C';

  @override
  String get storageFault => 'FALHA DE ARMAZENAMENTO';

  @override
  String get estopLatched => 'PARADA DE EMERGÊNCIA TRAVADA';

  @override
  String get presetButtonsTitle => 'BOTÕES PREDEFINIDOS';

  @override
  String customizePresetTitle(Object label) {
    return 'Personalizar $label';
  }

  @override
  String get subtitleNameLabel => 'Nome da legenda';

  @override
  String get subtitleNameHint =>
      'por exemplo Dobra rápida, camisas, personalizadas...';

  @override
  String get buttonColorLabel => 'Cor do botão';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Etapa $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'PARADA DE EMERGÊNCIA';

  @override
  String get clearEstop => 'LIMPAR E DESBLOQUEAR E-STOP';

  @override
  String get clearEstopHint =>
      'Redefine a parada de emergência e retorna o robô para ocioso';

  @override
  String get stopButton => 'PARAR';

  @override
  String get fabricaArrangementTitle => 'ARRANJO DE FÁBRICA';

  @override
  String get editArrangement => 'EDITAR ARRANJO';

  @override
  String get addPanel => 'ADICIONAR PAINEL';

  @override
  String get legendMotorized => 'Motorizado';

  @override
  String get legendFollower => 'Seguidor';

  @override
  String get legendBase => 'Base';

  @override
  String get colsLabel => 'Colunas';

  @override
  String get rowsLabel => 'Linhas';

  @override
  String stepSelectedHint(Object step) {
    return 'Etapa $step selecionada: Toque em 1–2 painéis motorizados na grade';
  }

  @override
  String get tapPanelsHint => 'Toque em 1–2 painéis de motor na grade';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Requer pelo menos 1 painel motorizado (máx. 2)';

  @override
  String get selectedChangePanelsHint =>
      'Selecionado • Toque nos painéis da grade para alterar (máx. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Etapa $step de $total';
  }

  @override
  String get removeStepTooltip => 'Remover etapa';

  @override
  String get requiresMotorizedModuleWarning =>
      'A rotina requer pelo menos um módulo motorizado da Fabrica Arrangement.';

  @override
  String get routineFull => 'ROTINA COMPLETA (16/16 PASSOS)';

  @override
  String addStepCount(Object count) {
    return 'ADICIONAR ETAPA ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Salvar rotina no robô';

  @override
  String get selectButtonToProgram =>
      'Selecione um botão físico do robô para programar com esta rotina:';

  @override
  String buttonNumber(Object slot) {
    return 'Botão $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Botão de hardware $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Botão $slot Legenda (opcional)';
  }

  @override
  String get saveToRobotButton => 'SALVAR NO ROBÔ';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Botão $slot (etapas $count)';
  }

  @override
  String get adultTshirtTemplate => 'Modelo de camiseta adulta';

  @override
  String get longSleeveTemplate => 'Modelo de manga comprida';

  @override
  String get dualSweepTemplate => 'Modelo de varredura dupla';

  @override
  String channelNumber(Object number) {
    return 'Canal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count EMPARELHADO';
  }

  @override
  String get moreHardwareOptions => 'Mais opções de hardware';

  @override
  String get loadTemplate => 'Carregar modelo';

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
