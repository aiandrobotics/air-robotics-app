// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get appLanguageTitle => 'Мова додатка';

  @override
  String get appVersionTitle => 'Версія додатка';

  @override
  String get languageSectionTitle => 'Мова';

  @override
  String get languageSystemDefault =>
      'Системна за замовчуванням (мова пристрою)';

  @override
  String get selectLanguageHint => 'Виберіть мову';

  @override
  String get addDeviceTitle => 'ДОДАТИ НОВОГО РОБОТА';

  @override
  String get addDeviceSubtitle => 'Об’єднайте в пари роботів AIR';

  @override
  String get yourRobots => 'ВАШІ РОБОТИ';

  @override
  String get discoveredRobots => 'ВІДКРИТІ РОБОТИ';

  @override
  String get noRobotsPairedYet => 'Роботів ще не створено';

  @override
  String get noRobotsPairedSubtitle =>
      'Підключіть свого робота, щоб переглядати телеметрію, керувати попередніми налаштуваннями та контролювати операції.';

  @override
  String get addYourFirstRobot => 'ДОДАТИ СВОГО ПЕРШОГО РОБОТА';

  @override
  String get autoScanning => 'АВТОМАТИЧНЕ СКАНУВАННЯ';

  @override
  String get idleStatus => 'ПРОСТОЮЧИЙ';

  @override
  String get tabControl => 'контроль';

  @override
  String get tabSequencer => 'Секвенсор';

  @override
  String get tabCalibrator => 'Калібратор';

  @override
  String get tabDiagnostics => 'діагностика';

  @override
  String get renameRobot => 'Перейменувати робота';

  @override
  String get bleDiagnostics => 'BLE діагностика';

  @override
  String get erasePresets => 'Стерти збережені попередні налаштування';

  @override
  String get disconnect => 'Відключити';

  @override
  String get unpairRobot => 'Відключити робота';

  @override
  String get factoryReset => 'Скидання до заводських налаштувань';

  @override
  String get servoManualJog => 'СЕРВОРУЧНИЙ РУЧНИЙ РУХ';

  @override
  String get homeAll => 'ДОМУ ВСІ';

  @override
  String get foldingTimeline => 'СКЛАДАННЯ ХРАНІВ';

  @override
  String get addStep => 'ДОДАТИ КРОК';

  @override
  String get previewOnRobot => 'ПОПЕРЕДНІЙ ПРОГЛЯД НА РОБОТА';

  @override
  String get saveToButton => 'ЗБЕРЕГТИ НА КНОПКУ';

  @override
  String get themeTitle => 'Тема';

  @override
  String get themeSystem => 'пристрій';

  @override
  String get themeLight => 'світло';

  @override
  String get themeDark => 'Темний';

  @override
  String get connectedBadge => 'ПІДКЛЮЧЕНО';

  @override
  String get inRangeBadge => 'В ДАСОПІ';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'ВІДКРИТИ';

  @override
  String get connectButton => 'ПІДКЛЮЧАЙТЕСЯ';

  @override
  String get reconnectButton => 'ПОВТОРНО ПІДКЛЮЧИТИ';

  @override
  String get pairAndConnect => 'ПАРУЙТЕ ТА ПІДКЛЮЧАЙТЕ';

  @override
  String get autoScanningForRobots => 'Автоматичне сканування для роботів...';

  @override
  String get scanningIdle => 'Сканування неактивне';

  @override
  String get nearbyRobotsAppear => 'Роботи поблизу з’являться тут автоматично.';

  @override
  String get yourNearbyRobotsAppear =>
      'Ваші роботи поблизу з’являться тут автоматично.';

  @override
  String get signalStrong => 'Сильний';

  @override
  String get signalGood => 'добре';

  @override
  String get signalWeak => 'Слабкий';

  @override
  String get addRobotIntro =>
      'Виберіть робота нижче для створення пари. Будь-який робот поблизу, який перебуває в режимі сполучення, буде автоматично виявлено вгорі.';

  @override
  String get autoDiscoveredRobot => 'АВТО ВІДКРИТИЙ РОБОТ';

  @override
  String get autoDiscoveredRobots => 'АВТО ВІДКРИТІ РОБОТИ';

  @override
  String readyCountBadge(Object count) {
    return '$count ГОТОВИЙ';
  }

  @override
  String get supportedRobots => 'ПІДТРИМУВАНІ РОБОТИ';

  @override
  String get clothesFoldingRobot => 'Робот для складання одягу';

  @override
  String get fabricaDescription =>
      'Автоматизоване складання одягу з налаштуваннями для кількох предметів одягу та тактильним керуванням однією кнопкою.';

  @override
  String get fabricaPairingHint =>
      'Режим сполучення: натисніть і утримуйте будь-яку кнопку на панелі керування Fabrica протягом 3 секунд (індикатор стану швидко блимає).';

  @override
  String get pairFabricaNow => 'СПІЛУЙТЕ FABRICA ЗАРАЗ';

  @override
  String get backToHome => 'Назад додому';

  @override
  String get connReady => 'ГОТОВИЙ';

  @override
  String get connConnecting => 'ПІДКЛЮЧЕННЯ';

  @override
  String get connDiscovering => 'ВІДКРИТТЯ';

  @override
  String get connBonding => 'СКЛІЮВАННЯ';

  @override
  String get connScanning => 'СКАНУВАННЯ';

  @override
  String get connDisconnected => 'ВІДКЛЮЧЕНО';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Відключитися від $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Ви можете будь-коли повторно підключитися з головного екрана.';

  @override
  String get cancelButton => 'СКАСУВАТИ';

  @override
  String get saveButton => 'ЗБЕРЕГТИ';

  @override
  String get customNickname => 'Спеціальний псевдонім';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Розірвати пару $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Це видалить $name із ваших роботів на цьому телефоні. Ви можете будь-коли повторно додати його.\n\nПримітка. Щоб повністю очистити пам’ять робота та відновити заводські налаштування, скористайтеся функцією «Скинути заводські налаштування».';
  }

  @override
  String get unpairButton => 'РОЗПАРУВАТИ';

  @override
  String get machineIdle => 'ПРОСТОЮЧИЙ';

  @override
  String get machineRunning => 'БІГ';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'ПОМИЛКА';

  @override
  String get machineCalibrating => 'КАЛІБРУВАННЯ';

  @override
  String ledLabel(Object state) {
    return 'Світлодіод: $state';
  }

  @override
  String get ledSaved => 'ЗБЕРЕЖЕНО';

  @override
  String get ledInputErr => 'ПОМИЛКА ВВЕДЕННЯ';

  @override
  String get ledPairing => 'ПАРУВАННЯ';

  @override
  String get ledConnected => 'ПІДКЛЮЧЕНО';

  @override
  String get ledIdentify => 'ІДЕНТИФІКУВАТИ';

  @override
  String get identifyButton => 'ІДЕНТИФІКУВАТИ';

  @override
  String get identifyingToast =>
      'Світлодіод роботи блимає протягом 3 секунд...';

  @override
  String get homingToast => 'Наведення всіх закрилків...';

  @override
  String get i2cFault => 'ПОМИЛКА I2C';

  @override
  String get storageFault => 'ПОМИЛКА ЗБЕРІГАННЯ';

  @override
  String get estopLatched => 'АВТОМОБІЛЬНИЙ СТОП З БІРКУВАННЯМ';

  @override
  String get presetButtonsTitle => 'КНОПКИ ПОПЕРЕДНИХ НАЛАШТУВАНЬ';

  @override
  String customizePresetTitle(Object label) {
    return 'Налаштувати $label';
  }

  @override
  String get subtitleNameLabel => 'Назва субтитрів';

  @override
  String get subtitleNameHint =>
      'напр. Швидке складання, сорочки, на замовлення...';

  @override
  String get buttonColorLabel => 'Колір кнопки';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Крок $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'АВАРІЙНА ЗУПИНКА';

  @override
  String get clearEstop => 'ОЧИСТИТИ ТА ВІДКРИТИ АВТОМАТИЧНУ ЗУПИНКУ';

  @override
  String get clearEstopHint =>
      'Скидає аварійну зупинку та повертає робота в режим очікування';

  @override
  String get stopButton => 'СТОП';

  @override
  String get fabricaArrangementTitle => 'КОМПОНУВАННЯ ТКАНИНИ';

  @override
  String get editArrangement => 'РЕДАГУВАТИ КОМОЗУВАННЯ';

  @override
  String get addPanel => 'ДОДАТИ ПАНЕЛЬ';

  @override
  String get legendMotorized => 'Моторизований';

  @override
  String get legendFollower => 'Послідовник';

  @override
  String get legendBase => 'База';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'рядки';

  @override
  String stepSelectedHint(Object step) {
    return 'Вибрано крок $step: торкніться 1–2 моторизованих панелей на сітці';
  }

  @override
  String get tapPanelsHint => 'Торкніться 1–2 панелей двигуна на сітці';

  @override
  String get dualBadge => 'ДУАЛЬНИЙ';

  @override
  String get requiresMotorizedPanel =>
      'Потрібна принаймні 1 моторизована панель (макс. 2)';

  @override
  String get selectedChangePanelsHint =>
      'Вибрано • Натисніть панелі сітки, щоб змінити (макс. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Крок $step з $total';
  }

  @override
  String get removeStepTooltip => 'Видалити крок';

  @override
  String get requiresMotorizedModuleWarning =>
      'Процедура вимагає принаймні одного моторизованого модуля від Fabrica Arrangement.';

  @override
  String get routineFull => 'РУТИНА ПОВНА (16/16 КРОКІВ)';

  @override
  String addStepCount(Object count) {
    return 'ДОДАТИ КРОК ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Зберегти програму для робота';

  @override
  String get selectButtonToProgram =>
      'Виберіть фізичну кнопку робота для програмування за допомогою цієї процедури:';

  @override
  String buttonNumber(Object slot) {
    return 'Кнопка $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Апаратна кнопка $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Кнопка $slot Підзаголовок (необов’язково)';
  }

  @override
  String get saveToRobotButton => 'ЗБЕРЕГТИ В РОБОТА';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Кнопка $slot ($count кроків)';
  }

  @override
  String get adultTshirtTemplate => 'Шаблон футболки для дорослих';

  @override
  String get longSleeveTemplate => 'Шаблон з довгим рукавом';

  @override
  String get dualSweepTemplate => 'Шаблон подвійної розгортки';

  @override
  String channelNumber(Object number) {
    return 'Канал $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count В ПАРІ';
  }

  @override
  String get moreHardwareOptions => 'Більше апаратних параметрів';

  @override
  String get loadTemplate => 'Завантажити шаблон';

  @override
  String get controllerLabel => 'КОНТРОЛЕР';

  @override
  String get motorBadge => 'МОТОР';

  @override
  String get followerBadge => 'ПОСЛІДОВНИК';

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
