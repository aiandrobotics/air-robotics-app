// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get appLanguageTitle => 'Язык приложения';

  @override
  String get appVersionTitle => 'Версия приложения';

  @override
  String get languageSectionTitle => 'Язык';

  @override
  String get languageSystemDefault =>
      'Системный по умолчанию (язык устройства)';

  @override
  String get selectLanguageHint => 'Выберите язык';

  @override
  String get addDeviceTitle => 'ДОБАВИТЬ НОВОГО РОБОТА';

  @override
  String get addDeviceSubtitle => 'Сопряжение роботов AIR';

  @override
  String get yourRobots => 'ВАШИ РОБОТЫ';

  @override
  String get discoveredRobots => 'ОБНАРУЖЕННЫЕ РОБОТЫ';

  @override
  String get noRobotsPairedYet => 'Роботы ещё не сопряжены';

  @override
  String get noRobotsPairedSubtitle =>
      'Подключите своего робота для просмотра телеметрии, управления предустановками и управления операциями.';

  @override
  String get addYourFirstRobot => 'ДОБАВИТЬ ПЕРВОГО РОБОТА';

  @override
  String get autoScanning => 'АВТОСКАНИРОВАНИЕ';

  @override
  String get idleStatus => 'ПРАЗДНЫЙ';

  @override
  String get tabControl => 'Контроль';

  @override
  String get tabSequencer => 'Секвенсор';

  @override
  String get tabCalibrator => 'Калибратор';

  @override
  String get tabDiagnostics => 'Диагностика';

  @override
  String get renameRobot => 'Переименовать робота';

  @override
  String get bleDiagnostics => 'БЛЕ Диагностика';

  @override
  String get erasePresets => 'Удалить сохраненные пресеты';

  @override
  String get disconnect => 'Отключить';

  @override
  String get unpairRobot => 'Отсоединить робота';

  @override
  String get factoryReset => 'Сброс к заводским настройкам';

  @override
  String get servoManualJog => 'СЕРВОРУЧНОЙ JOG';

  @override
  String get homeAll => 'ДОМ ВСЕ';

  @override
  String get foldingTimeline => 'СКЛАДЫВАНИЕ ВРЕМЕНИ';

  @override
  String get addStep => 'ДОБАВИТЬ ШАГ';

  @override
  String get previewOnRobot => 'ПРЕДВАРИТЕЛЬНЫЙ ПРОСМОТР НА РОБОТЕ';

  @override
  String get saveToButton => 'СОХРАНИТЬ НА КНОПКУ';

  @override
  String get themeTitle => 'Тема';

  @override
  String get themeSystem => 'Устройство';

  @override
  String get themeLight => 'Свет';

  @override
  String get themeDark => 'Темный';

  @override
  String get connectedBadge => 'ПОДКЛЮЧЕНО';

  @override
  String get inRangeBadge => 'В ДИАПАЗОНЕ';

  @override
  String get offlineBadge => 'ОФЛАЙН';

  @override
  String get openButton => 'ОТКРЫТЬ';

  @override
  String get connectButton => 'СОЕДИНЯТЬ';

  @override
  String get reconnectButton => 'ВОССТАНОВИТЬ ПОДКЛЮЧЕНИЕ';

  @override
  String get pairAndConnect => 'СОПРЯЖЕНИЕ И ПОДКЛЮЧЕНИЕ';

  @override
  String get autoScanningForRobots => 'Автоматическое сканирование роботов...';

  @override
  String get scanningIdle => 'Сканирование в режиме ожидания';

  @override
  String get nearbyRobotsAppear =>
      'Ближайшие роботы появятся здесь автоматически.';

  @override
  String get yourNearbyRobotsAppear =>
      'Ваши ближайшие роботы появятся здесь автоматически.';

  @override
  String get signalStrong => 'Сильный';

  @override
  String get signalGood => 'Хороший';

  @override
  String get signalWeak => 'Слабый';

  @override
  String get addRobotIntro =>
      'Выберите робота ниже для сопряжения. Любой ближайший робот в режиме сопряжения будет автоматически обнаружен вверху.';

  @override
  String get autoDiscoveredRobot => 'АВТО ОТКРЫТЫЙ РОБОТ';

  @override
  String get autoDiscoveredRobots => 'АВТО ОТКРЫТЫЕ РОБОТЫ';

  @override
  String readyCountBadge(Object count) {
    return '$count ГОТОВО';
  }

  @override
  String get supportedRobots => 'ПОДДЕРЖИВАЕМЫЕ РОБОТЫ';

  @override
  String get clothesFoldingRobot => 'Робот для складывания одежды';

  @override
  String get fabricaDescription =>
      'Автоматизированная папка для одежды с предустановками для нескольких предметов одежды и сенсорным управлением одной кнопкой.';

  @override
  String get fabricaPairingHint =>
      'Режим сопряжения: нажмите и удерживайте любую кнопку на панели управления Fabrica в течение 3 секунд (светодиодный индикатор состояния будет быстро мигать).';

  @override
  String get pairFabricaNow => 'ПАРА ФАБРИКИ СЕЙЧАС';

  @override
  String get backToHome => 'Вернуться домой';

  @override
  String get connReady => 'ГОТОВЫЙ';

  @override
  String get connConnecting => 'ПОДКЛЮЧЕНИЕ';

  @override
  String get connDiscovering => 'ОТКРЫВАНИЕ';

  @override
  String get connBonding => 'СКЛЕИВАНИЕ';

  @override
  String get connScanning => 'СКАНИРОВАНИЕ';

  @override
  String get connDisconnected => 'ОТКЛЮЧЕНО';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Отключиться от $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Вы можете повторно подключиться в любое время с главного экрана.';

  @override
  String get cancelButton => 'ОТМЕНА';

  @override
  String get saveButton => 'СОХРАНЯТЬ';

  @override
  String get customNickname => 'Пользовательский псевдоним';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Отключить $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Это приведет к удалению $name из ваших роботов на этом телефоне. Вы можете повторно добавить его в любое время.\n\nПримечание. Чтобы полностью очистить память робота и восстановить заводские настройки, используйте «Сброс к заводским настройкам».';
  }

  @override
  String get unpairButton => 'РАЗЪЕДИНИТЬ';

  @override
  String get machineIdle => 'ПРАЗДНЫЙ';

  @override
  String get machineRunning => 'БЕГ';

  @override
  String get machineEstop => 'АВАРИЙНЫЙ СТОП';

  @override
  String get machineError => 'ОШИБКА';

  @override
  String get machineCalibrating => 'КАЛИБРОВКА';

  @override
  String ledLabel(Object state) {
    return 'Светодиод: $state';
  }

  @override
  String get ledSaved => 'СОХРАНЕНО';

  @override
  String get ledInputErr => 'ВХОДНАЯ ОШИБКА';

  @override
  String get ledPairing => 'СОПРЯЖЕНИЕ';

  @override
  String get ledConnected => 'ПОДКЛЮЧЕНО';

  @override
  String get ledIdentify => 'ИДЕНТИФИЦИРОВАТЬ';

  @override
  String get identifyButton => 'ИДЕНТИФИЦИРОВАТЬ';

  @override
  String get identifyingToast =>
      'Мигающий светодиод робота в течение 3 секунд...';

  @override
  String get homingToast => 'Наведение всех закрылков...';

  @override
  String get i2cFault => 'ОШИБКА I2C';

  @override
  String get storageFault => 'НЕИСПРАВНОСТЬ ХРАНЕНИЯ';

  @override
  String get estopLatched => 'АВАРИЙНЫЙ ОСТАНОВ ЗАФИКСИРОВАН';

  @override
  String get presetButtonsTitle => 'ПРЕДУСТАНОВЛЕННЫЕ КНОПКИ';

  @override
  String customizePresetTitle(Object label) {
    return 'Настроить $label';
  }

  @override
  String get subtitleNameLabel => 'Название субтитра';

  @override
  String get subtitleNameHint =>
      'например Quick Fold, Рубашки, Пользовательские...';

  @override
  String get buttonColorLabel => 'Цвет кнопки';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Шаг $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'АВАРИЙНАЯ ОСТАНОВКА';

  @override
  String get clearEstop => 'ОЧИСТИТЬ И РАЗблокировать АВАРИЙНЫЙ ОСТАНОВ';

  @override
  String get clearEstopHint =>
      'Сбрасывает аварийную остановку и возвращает робота в режим ожидания';

  @override
  String get stopButton => 'ОСТАНАВЛИВАТЬСЯ';

  @override
  String get fabricaArrangementTitle => 'КОМПЛЕКТАЦИЯ ФАБРИКА';

  @override
  String get editArrangement => 'РЕДАКТИРОВАНИЕ';

  @override
  String get addPanel => 'ДОБАВИТЬ ПАНЕЛЬ';

  @override
  String get legendMotorized => 'Моторизованный';

  @override
  String get legendFollower => 'Последователь';

  @override
  String get legendBase => 'База';

  @override
  String get colsLabel => 'Колс';

  @override
  String get rowsLabel => 'Строки';

  @override
  String stepSelectedHint(Object step) {
    return 'Выбран шаг $step: коснитесь 1–2 моторизованных панелей на сетке.';
  }

  @override
  String get tapPanelsHint => 'Коснитесь 1–2 панелей двигателей на сетке.';

  @override
  String get dualBadge => 'ДВОЙНОЙ';

  @override
  String get requiresMotorizedPanel =>
      'Требуется как минимум 1 моторизованная панель (максимум 2)';

  @override
  String get selectedChangePanelsHint =>
      'Выбрано • Коснитесь панели сетки, чтобы изменить ее (максимум 2).';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Шаг $step из $total';
  }

  @override
  String get removeStepTooltip => 'Удалить шаг';

  @override
  String get requiresMotorizedModuleWarning =>
      'Для выполнения Routine требуется как минимум один моторизованный модуль от Fabrica Arrangement.';

  @override
  String get routineFull => 'ПРОГРАММА ПОЛНАЯ (16/16 ШАГОВ)';

  @override
  String addStepCount(Object count) {
    return 'ДОБАВИТЬ ШАГ ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Сохранить процедуру в роботе';

  @override
  String get selectButtonToProgram =>
      'Выберите физическую кнопку робота для программирования с помощью этой процедуры:';

  @override
  String buttonNumber(Object slot) {
    return 'Кнопка $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Аппаратная кнопка $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Кнопка $slot Субтитры (необязательно)';
  }

  @override
  String get saveToRobotButton => 'СОХРАНИТЬ В РОБОТА';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Кнопка $slot (шагов $count)';
  }

  @override
  String get adultTshirtTemplate => 'Шаблон футболки для взрослых';

  @override
  String get longSleeveTemplate => 'Шаблон с длинным рукавом';

  @override
  String get dualSweepTemplate => 'Шаблон двойной развертки';

  @override
  String channelNumber(Object number) {
    return 'Канал $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count СОПРЯЖЕН';
  }

  @override
  String get moreHardwareOptions => 'Дополнительные возможности оборудования';

  @override
  String get loadTemplate => 'Загрузить шаблон';

  @override
  String get controllerLabel => 'КОНТРОЛЛЕР';

  @override
  String get motorBadge => 'МОТОР';

  @override
  String get followerBadge => 'ПОСЛЕДОВАТЕЛЬ';

  @override
  String get baseBadge => 'БАЗА';

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
