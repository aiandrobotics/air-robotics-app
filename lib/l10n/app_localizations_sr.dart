// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Подешавања';

  @override
  String get appLanguageTitle => 'Језик апликације';

  @override
  String get appVersionTitle => 'Верзија апликације';

  @override
  String get languageSectionTitle => 'Језик';

  @override
  String get languageSystemDefault => 'Системски подразумевано (језик уређаја)';

  @override
  String get selectLanguageHint => 'Изаберите језик';

  @override
  String get addDeviceTitle => 'ДОДАЈТЕ НОВОГ РОБОТА';

  @override
  String get addDeviceSubtitle => 'Упарите АИР роботе';

  @override
  String get yourRobots => 'ВАШИ РОБОТИ';

  @override
  String get discoveredRobots => 'ОТКРИВЕНИ РОБОТИ';

  @override
  String get noRobotsPairedYet => 'Још нема упарених робота';

  @override
  String get noRobotsPairedSubtitle =>
      'Повежите свог робота да бисте видели телеметрију, управљали унапред подешеним вредностима и контролисали операције.';

  @override
  String get addYourFirstRobot => 'ДОДАЈТЕ СВОГ ПРВОГ РОБОТА';

  @override
  String get autoScanning => 'АУТО-СЦЕНИНГ';

  @override
  String get idleStatus => 'ИДЛЕ';

  @override
  String get tabControl => 'Контрола';

  @override
  String get tabSequencer => 'Секуенцер';

  @override
  String get tabCalibrator => 'Калибратор';

  @override
  String get tabDiagnostics => 'Дијагностика';

  @override
  String get renameRobot => 'Преименуј робота';

  @override
  String get bleDiagnostics => 'БЛЕ Диагностицс';

  @override
  String get erasePresets => 'Обришите сачуване унапред подешене поставке';

  @override
  String get disconnect => 'Прекини везу';

  @override
  String get unpairRobot => 'Унпаир Робот';

  @override
  String get factoryReset => 'Фацтори Ресет';

  @override
  String get servoManualJog => 'СЕРВО МАНУАЛ ЈОГ';

  @override
  String get homeAll => 'ХОМЕ АЛЛ';

  @override
  String get foldingTimeline => 'ПРЕКЛОПИВАЊЕ ВРЕМЕНА';

  @override
  String get addStep => 'ДОДАЈ КОРАК';

  @override
  String get previewOnRobot => 'ПРЕГЛЕД НА РОБОТУ';

  @override
  String get saveToButton => 'САЧУВАЈ НА ДУГМЕ';

  @override
  String get themeTitle => 'Тема';

  @override
  String get themeSystem => 'Уређај';

  @override
  String get themeLight => 'Светлост';

  @override
  String get themeDark => 'Дарк';

  @override
  String get connectedBadge => 'ЦОННЕЦТЕД';

  @override
  String get inRangeBadge => 'ИН РАНГЕ';

  @override
  String get offlineBadge => 'ОФФЛИНЕ';

  @override
  String get openButton => 'ОПЕН';

  @override
  String get connectButton => 'ЦОННЕЦТ';

  @override
  String get reconnectButton => 'РЕЦОННЕЦТ';

  @override
  String get pairAndConnect => 'ПАИР & ЦОННЕЦТ';

  @override
  String get autoScanningForRobots => 'Аутоматско скенирање за роботе...';

  @override
  String get scanningIdle => 'Скенирање у мировању';

  @override
  String get nearbyRobotsAppear =>
      'Роботи у близини ће се аутоматски појавити овде.';

  @override
  String get yourNearbyRobotsAppear =>
      'Ваши роботи у близини ће се аутоматски појавити овде.';

  @override
  String get signalStrong => 'Јака';

  @override
  String get signalGood => 'Добро';

  @override
  String get signalWeak => 'Слабо';

  @override
  String get addRobotIntro =>
      'Изаберите робота испод за упаривање. Сваки робот у близини у режиму упаривања биће аутоматски откривен на врху.';

  @override
  String get autoDiscoveredRobot => 'АУТО ОТКРИВЕНИ РОБОТ';

  @override
  String get autoDiscoveredRobots => 'АУТО ОТКРИВЕНИ РОБОТИ';

  @override
  String readyCountBadge(Object count) {
    return '__ПХ0__ СПРЕМНО';
  }

  @override
  String get supportedRobots => 'ПОДРЖАНИ РОБОТИ';

  @override
  String get clothesFoldingRobot => 'Робот за склапање одеће';

  @override
  String get fabricaDescription =>
      'Аутоматска фасцикла за одећу са унапред подешеним деловима одеће и тактилним управљањем једним дугметом.';

  @override
  String get fabricaPairingHint =>
      'Режим упаривања: Притисните и држите било које дугме на Фабрица контролној табли 3 секунде (ЛЕД статуса ће брзо трептати).';

  @override
  String get pairFabricaNow => 'ПАИР ФАБРИЦА САДА';

  @override
  String get backToHome => 'Повратак кући';

  @override
  String get connReady => 'РЕАДИ';

  @override
  String get connConnecting => 'ЦОННЕЦТИНГ';

  @override
  String get connDiscovering => 'ОТКРИВАЊЕ';

  @override
  String get connBonding => 'БОНДИНГ';

  @override
  String get connScanning => 'СКЕНИРАЊЕ';

  @override
  String get connDisconnected => 'ИСКЉУЧЕН';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Прекинути везу са __ПХ0__?';
  }

  @override
  String get disconnectConfirmBody =>
      'Можете поново да се повежете у било ком тренутку са почетног екрана.';

  @override
  String get cancelButton => 'ЦАНЦЕЛ';

  @override
  String get saveButton => 'САВЕ';

  @override
  String get customNickname => 'Прилагођени надимак';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Прекинути упаривање __ПХ0__?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Ово ће уклонити __ПХ0__ из ваших робота на овом телефону. Можете га поново додати у било ком тренутку.\n\nНапомена: Да бисте потпуно обрисали меморију робота и вратили фабричка подешавања, користите „Фацтори Ресет“.';
  }

  @override
  String get unpairButton => 'УНПАИР';

  @override
  String get machineIdle => 'ИДЛЕ';

  @override
  String get machineRunning => 'РУННИНГ';

  @override
  String get machineEstop => 'Е-СТОП';

  @override
  String get machineError => 'ГРЕШКА';

  @override
  String get machineCalibrating => 'ЦАЛИБРАТИНГ';

  @override
  String ledLabel(Object state) {
    return 'ЛЕД: __ПХ0__';
  }

  @override
  String get ledSaved => 'САВЕД';

  @override
  String get ledInputErr => 'ИНПУТ ЕРР';

  @override
  String get ledPairing => 'ПАИРИНГ';

  @override
  String get ledConnected => 'ЦОННЕЦТЕД';

  @override
  String get ledIdentify => 'ИДЕНТИФИКОВАТИ';

  @override
  String get identifyButton => 'ИДЕНТИФИКОВАТИ';

  @override
  String get identifyingToast => 'ЛЕД робота трепери 3 секунде...';

  @override
  String get homingToast => 'Покретање свих закрилаца...';

  @override
  String get i2cFault => 'И2Ц ФАУЛТ';

  @override
  String get storageFault => 'СТОРАГЕ ФАУЛТ';

  @override
  String get estopLatched => 'Е-СТОП ЛАТЦХЕД';

  @override
  String get presetButtonsTitle => 'ПРЕСЕТ ДУГМЕ';

  @override
  String customizePresetTitle(Object label) {
    return 'Прилагодите __ПХ0__';
  }

  @override
  String get subtitleNameLabel => 'Назив титла';

  @override
  String get subtitleNameHint => 'нпр. Брзо склапање, кошуље, прилагођене...';

  @override
  String get buttonColorLabel => 'Боја дугмета';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Корак __ПХ0__/__ПХ1__ (__ПХ2__%)';
  }

  @override
  String get emergencyStop => 'ХИТНО СТУПАЊЕ';

  @override
  String get clearEstop => 'ОБРАСИТЕ И ОТКЉУЧИТЕ Е-СТОП';

  @override
  String get clearEstopHint =>
      'Ресетује заустављање у нужди и враћа робота у стање мировања';

  @override
  String get stopButton => 'СТОП';

  @override
  String get fabricaArrangementTitle => 'АРАНЖМАН ТКАНИНЕ';

  @override
  String get editArrangement => 'ЕДИТ АРРАНГЕМЕНТ';

  @override
  String get addPanel => 'АДД ПАНЕЛ';

  @override
  String get legendMotorized => 'Моторизовано';

  @override
  String get legendFollower => 'Фолловер';

  @override
  String get legendBase => 'База';

  @override
  String get colsLabel => 'Цолс';

  @override
  String get rowsLabel => 'Редови';

  @override
  String stepSelectedHint(Object step) {
    return 'Корак __ПХ0__ изабран: Додирните 1–2 моторизована панела на мрежи';
  }

  @override
  String get tapPanelsHint => 'Додирните 1–2 панела мотора на мрежи';

  @override
  String get dualBadge => 'ДУАЛ';

  @override
  String get requiresMotorizedPanel =>
      'Захтева најмање 1 моторизовани панел (макс. 2)';

  @override
  String get selectedChangePanelsHint =>
      'Изабрано • Додирните решеткасте панеле да бисте променили (максимално 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Корак __ПХ0__ од __ПХ1__';
  }

  @override
  String get removeStepTooltip => 'Уклоните корак';

  @override
  String get requiresMotorizedModuleWarning =>
      'Рутина захтева најмање један моторизовани модул из Фабрица Аррангемента.';

  @override
  String get routineFull => 'РУТИНА ПУНА (16/16 КОРАКА)';

  @override
  String addStepCount(Object count) {
    return 'ДОДАЈ КОРАК (__ПХ0__/16)';
  }

  @override
  String get saveRoutineToRobot => 'Сачувај рутину у робота';

  @override
  String get selectButtonToProgram =>
      'Изаберите дугме физичког робота за програмирање са овом рутином:';

  @override
  String buttonNumber(Object slot) {
    return 'Дугме __ПХ0__';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Хардверско дугме __ПХ0__';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Дугме __ПХ0__ титл (опционо)';
  }

  @override
  String get saveToRobotButton => 'САЧУВАЈ У РОБОТА';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Дугме __ПХ0__ (__ПХ1__ корака)';
  }

  @override
  String get adultTshirtTemplate => 'Шаблон мајице за одрасле';

  @override
  String get longSleeveTemplate => 'Шаблон дугих рукава';

  @override
  String get dualSweepTemplate => 'Дуал Свееп Темплате';

  @override
  String channelNumber(Object number) {
    return 'Канал __ПХ0__';
  }

  @override
  String pairedCountBadge(Object count) {
    return '__ПХ0__ ПАИРЕД';
  }

  @override
  String get moreHardwareOptions => 'Више хардверских опција';

  @override
  String get loadTemplate => 'Учитај шаблон';

  @override
  String get controllerLabel => 'ЦОНТРОЛЛЕР';

  @override
  String get motorBadge => 'МОТОР';

  @override
  String get followerBadge => 'ФОЛЛОВЕР';

  @override
  String get baseBadge => 'БАСЕ';

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
