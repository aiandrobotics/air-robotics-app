// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Macedonian (`mk`).
class AppLocalizationsMk extends AppLocalizations {
  AppLocalizationsMk([String locale = 'mk']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Поставки';

  @override
  String get appLanguageTitle => 'Јазик на апликацијата';

  @override
  String get appVersionTitle => 'Верзија на апликација';

  @override
  String get languageSectionTitle => 'Јазик';

  @override
  String get languageSystemDefault => 'Стандарден систем (јазик на уредот)';

  @override
  String get selectLanguageHint => 'Изберете јазик';

  @override
  String get addDeviceTitle => 'ДОДАЈ НОВ РОБОТ';

  @override
  String get addDeviceSubtitle => 'Спарете AIR роботи';

  @override
  String get yourRobots => 'ВАШИТЕ РОБОТИ';

  @override
  String get discoveredRobots => 'ОТКРИЕНИ РОБОТИ';

  @override
  String get noRobotsPairedYet => 'Сè уште нема спарени роботи';

  @override
  String get noRobotsPairedSubtitle =>
      'Поврзете го роботот за да гледате телеметрија, да управувате со претходно поставените поставки и да контролирате операции.';

  @override
  String get addYourFirstRobot => 'ДОДАДЕТЕ ГО ВАШИОТ ПРВ РОБОТ';

  @override
  String get autoScanning => 'АВТОСКЕНИРАЊЕ';

  @override
  String get idleStatus => 'НЕДЕЛНИ';

  @override
  String get tabControl => 'Контрола';

  @override
  String get tabSequencer => 'Секвенсер';

  @override
  String get tabCalibrator => 'Калибратор';

  @override
  String get tabDiagnostics => 'Дијагностика';

  @override
  String get renameRobot => 'Преименувајте го роботот';

  @override
  String get bleDiagnostics => 'BLE дијагностика';

  @override
  String get erasePresets => 'Избришете ги зачуваните поставки';

  @override
  String get disconnect => 'Исклучете се';

  @override
  String get unpairRobot => 'Откажи го роботот';

  @override
  String get factoryReset => 'Фабрички ресетирање';

  @override
  String get servoManualJog => 'СЕРВО РАЧНИК ЖОГ';

  @override
  String get homeAll => 'ДОМА СИТЕ';

  @override
  String get foldingTimeline => 'ВРЕМЕЛНИОТ НА СВКЛУВАЊЕ';

  @override
  String get addStep => 'ДОДАЈ ЧЕКОР';

  @override
  String get previewOnRobot => 'ПРЕГЛЕД НА РОБОТ';

  @override
  String get saveToButton => 'ЗАЧУВАЈ НА КОПЧЕТО';

  @override
  String get themeTitle => 'Тема';

  @override
  String get themeSystem => 'Уред';

  @override
  String get themeLight => 'Светлина';

  @override
  String get themeDark => 'Темно';

  @override
  String get connectedBadge => 'ПОВРЗАНО';

  @override
  String get inRangeBadge => 'ВО РАЗГОВОР';

  @override
  String get offlineBadge => 'ОФЛАЈН';

  @override
  String get openButton => 'ОТВОРЕНО';

  @override
  String get connectButton => 'ПОВРЗИ';

  @override
  String get reconnectButton => 'ПОВТОРНО ПОВРЗУВАЈ';

  @override
  String get pairAndConnect => 'СПАРИ И ПОВРЗИ';

  @override
  String get autoScanningForRobots => 'Автоматско скенирање за роботи...';

  @override
  String get scanningIdle => 'Скенирањето е во мирување';

  @override
  String get nearbyRobotsAppear =>
      'Овде автоматски ќе се појават роботите во близина.';

  @override
  String get yourNearbyRobotsAppear =>
      'Вашите роботи во близина ќе се појават тука автоматски.';

  @override
  String get signalStrong => 'Силен';

  @override
  String get signalGood => 'Добро';

  @override
  String get signalWeak => 'Слаби';

  @override
  String get addRobotIntro =>
      'Изберете робот подолу за да го спарите. Секој робот во близина во режим на спарување ќе биде автоматски откриен на врвот.';

  @override
  String get autoDiscoveredRobot => 'АВТООТКРИЕН РОБОТ';

  @override
  String get autoDiscoveredRobots => 'АВТО ОТКРИЕНИ РОБОТИ';

  @override
  String readyCountBadge(Object count) {
    return '$count ПОДГОТВЕН';
  }

  @override
  String get supportedRobots => 'ПОДДРЖАНИ РОБОТИ';

  @override
  String get clothesFoldingRobot => 'Роботот за преклопување на облека';

  @override
  String get fabricaDescription =>
      'Автоматска папка за облека со претходно поставени повеќекратни алишта и тактилна работа со едно копче.';

  @override
  String get fabricaPairingHint =>
      'Режим на спарување: Притиснете и задржете кое било копче на контролната табла Fabrica 3 секунди (Статусната сијаличка ќе трепка брзо).';

  @override
  String get pairFabricaNow => 'СПАРИ ФАБРИКА СЕГА';

  @override
  String get backToHome => 'Назад кон дома';

  @override
  String get connReady => 'ПОДГОТВЕНИ';

  @override
  String get connConnecting => 'ПОВРЗУВАЊЕ';

  @override
  String get connDiscovering => 'ОТКРИВАЊЕ';

  @override
  String get connBonding => 'ПОВРЗУВАЊЕ';

  @override
  String get connScanning => 'СКЕНИРАЊЕ';

  @override
  String get connDisconnected => 'ИСКЛУЧЕН';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Исклучете се од $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Можете повторно да се поврзете во секое време од почетниот екран.';

  @override
  String get cancelButton => 'ОТКАЖИ';

  @override
  String get saveButton => 'ЗАЧУВАЈ';

  @override
  String get customNickname => 'Прилагодено прекар';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Да се распари $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Ова ќе го отстрани $name од вашите роботи на овој телефон. Можете повторно да го додадете во секое време.\n\nЗабелешка: За целосно да ја избришете меморијата на роботот и да ги вратите фабричките поставки, користете „Фабричко ресетирање“.';
  }

  @override
  String get unpairButton => 'РАСПАРУВАЈ';

  @override
  String get machineIdle => 'НЕДЕЛНИ';

  @override
  String get machineRunning => 'ТРЧАЊЕ';

  @override
  String get machineEstop => 'Е-СТОП';

  @override
  String get machineError => 'ГРЕШКА';

  @override
  String get machineCalibrating => 'КАЛИБРИРАЊЕ';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'СОЧЕНИ';

  @override
  String get ledInputErr => 'ВЛЕЗ ГРЕШКА';

  @override
  String get ledPairing => 'СПАРУВАЊЕ';

  @override
  String get ledConnected => 'ПОВРЗАНО';

  @override
  String get ledIdentify => 'ИДЕНТИФИКАЈ';

  @override
  String get identifyButton => 'ИДЕНТИФИКАЈ';

  @override
  String get identifyingToast => 'Трепка LED робот за 3 секунди...';

  @override
  String get homingToast => 'Вдомување на сите клапи...';

  @override
  String get i2cFault => 'ГРЕШКА I2C';

  @override
  String get storageFault => 'ГРЕШКА ЗА ЧУВАЊЕ';

  @override
  String get estopLatched => 'Е-СТОП ЗАКРАВЕНО';

  @override
  String get presetButtonsTitle => 'ПОСТАВНИ КОПЧИЊА';

  @override
  String customizePresetTitle(Object label) {
    return 'Приспособете $label';
  }

  @override
  String get subtitleNameLabel => 'Име на титл';

  @override
  String get subtitleNameHint =>
      'на пр. Брзо преклопување, кошули, прилагодено...';

  @override
  String get buttonColorLabel => 'Боја на копче';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Чекор $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'ИТЕН СТОП';

  @override
  String get clearEstop => 'ЧИСТИ И ОТКЛУЧИ Е-СТОП';

  @override
  String get clearEstopHint =>
      'Ресетира итен прекин и го враќа роботот во мирување';

  @override
  String get stopButton => 'СТОП';

  @override
  String get fabricaArrangementTitle => 'ФАБРИКА АРАНЖМАН';

  @override
  String get editArrangement => 'УРЕДИ АРАНЖМАН';

  @override
  String get addPanel => 'ДОДАЈ ПАНЕЛ';

  @override
  String get legendMotorized => 'Моторизирани';

  @override
  String get legendFollower => 'Следбеник';

  @override
  String get legendBase => 'База';

  @override
  String get colsLabel => 'Кол';

  @override
  String get rowsLabel => 'Редови';

  @override
  String stepSelectedHint(Object step) {
    return 'Избран чекор $step: допрете 1–2 моторизирани панели на мрежата';
  }

  @override
  String get tapPanelsHint => 'Допрете 1–2 моторни панели на решетката';

  @override
  String get dualBadge => 'ДВОЈНА';

  @override
  String get requiresMotorizedPanel =>
      'Потребен е најмалку 1 моторизиран панел (макс 2)';

  @override
  String get selectedChangePanelsHint =>
      'Избрано • Допрете ги мрежните панели за промена (макс 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Чекор $step од $total';
  }

  @override
  String get removeStepTooltip => 'Отстрани чекор';

  @override
  String get requiresMotorizedModuleWarning =>
      'За рутина е потребен најмалку еден Моторизиран модул од Fabrica Arrangement.';

  @override
  String get routineFull => 'РУТИНА ПОЛНА (16/16 ЧЕКОРИ)';

  @override
  String addStepCount(Object count) {
    return 'ДОДАЈ ЧЕКОР ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Зачувај рутина на робот';

  @override
  String get selectButtonToProgram =>
      'Изберете копче за физички робот за програмирање со оваа рутина:';

  @override
  String buttonNumber(Object slot) {
    return 'Копче $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Хардверско копче $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Копче $slot Превод (изборно)';
  }

  @override
  String get saveToRobotButton => 'ЗАЧУВАЈ НА РОБОТ';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Копче $slot ($count чекори)';
  }

  @override
  String get adultTshirtTemplate => 'Шаблон за маица за возрасни';

  @override
  String get longSleeveTemplate => 'Шаблон со долги ракави';

  @override
  String get dualSweepTemplate => 'Шаблон за двојно чистење';

  @override
  String channelNumber(Object number) {
    return 'Канал $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count СПАРЕН';
  }

  @override
  String get moreHardwareOptions => 'Повеќе опции за хардвер';

  @override
  String get loadTemplate => 'Вчитај шаблон';

  @override
  String get controllerLabel => 'КОНТРОЛЕР';

  @override
  String get motorBadge => 'МОТОР';

  @override
  String get followerBadge => 'СЛЕДЕНИК';

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
