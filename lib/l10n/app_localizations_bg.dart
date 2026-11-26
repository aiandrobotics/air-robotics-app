// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get appLanguageTitle => 'Език на приложението';

  @override
  String get appVersionTitle => 'Версия на приложението';

  @override
  String get languageSectionTitle => 'Език';

  @override
  String get languageSystemDefault =>
      'Системен по подразбиране (език на устройството)';

  @override
  String get selectLanguageHint => 'Изберете език';

  @override
  String get addDeviceTitle => 'ДОБАВЯНЕ НА НОВ РОБОТ';

  @override
  String get addDeviceSubtitle => 'Сдвоете AIR роботи';

  @override
  String get yourRobots => 'ВАШИТЕ РОБОТИ';

  @override
  String get discoveredRobots => 'ОТКРИТИТЕ РОБОТИ';

  @override
  String get noRobotsPairedYet => 'Все още няма сдвоени роботи';

  @override
  String get noRobotsPairedSubtitle =>
      'Свържете вашия робот, за да видите телеметрия, да управлявате предварително зададени настройки и да контролирате операциите.';

  @override
  String get addYourFirstRobot => 'ДОБАВЕТЕ ПЪРВИЯ СИ РОБОТ';

  @override
  String get autoScanning => 'АВТОМАТИЧНО СКАНИРАНЕ';

  @override
  String get idleStatus => 'ПРЕЗЕНЕН';

  @override
  String get tabControl => 'контрол';

  @override
  String get tabSequencer => 'Секвенсър';

  @override
  String get tabCalibrator => 'Калибратор';

  @override
  String get tabDiagnostics => 'Диагностика';

  @override
  String get renameRobot => 'Преименуване на робота';

  @override
  String get bleDiagnostics => 'BLE диагностика';

  @override
  String get erasePresets =>
      'Изтриване на запазени предварително зададени настройки';

  @override
  String get disconnect => 'Прекъснете връзката';

  @override
  String get unpairRobot => 'Раздвояване на робота';

  @override
  String get factoryReset => 'Фабрично нулиране';

  @override
  String get servoManualJog => 'СЕРВО РЪЧНО БЪДАНЕ';

  @override
  String get homeAll => 'НАЧАЛО ВСИЧКИ';

  @override
  String get foldingTimeline => 'СГЪВАЕМА ХРОНОВА ЛАЙНА';

  @override
  String get addStep => 'ДОБАВИ СТЪПКА';

  @override
  String get previewOnRobot => 'ПРЕДВАРИТЕЛЕН ПРЕГЛЕД НА РОБОТ';

  @override
  String get saveToButton => 'БУТОН ЗА ЗАПАЗВАНЕ';

  @override
  String get themeTitle => 'Тема';

  @override
  String get themeSystem => 'устройство';

  @override
  String get themeLight => 'светлина';

  @override
  String get themeDark => 'Тъмно';

  @override
  String get connectedBadge => 'СВЪРЗАН';

  @override
  String get inRangeBadge => 'В ОБХВАТ';

  @override
  String get offlineBadge => 'ОФЛАЙН';

  @override
  String get openButton => 'ОТВОРЕНО';

  @override
  String get connectButton => 'СВЪРЗВАНЕ';

  @override
  String get reconnectButton => 'СВЪРЖЕТЕ СЕ ОТНОВО';

  @override
  String get pairAndConnect => 'СДВОЯВАНЕ И СВЪРЗВАНЕ';

  @override
  String get autoScanningForRobots => 'Автоматично сканиране за роботи...';

  @override
  String get scanningIdle => 'Сканиране на празен ход';

  @override
  String get nearbyRobotsAppear =>
      'Роботите наблизо ще се появят тук автоматично.';

  @override
  String get yourNearbyRobotsAppear =>
      'Вашите роботи наблизо ще се появят тук автоматично.';

  @override
  String get signalStrong => 'Силен';

  @override
  String get signalGood => 'добре';

  @override
  String get signalWeak => 'слаб';

  @override
  String get addRobotIntro =>
      'Изберете робот по-долу за сдвояване. Всеки близък робот в режим на сдвояване ще бъде автоматично открит в горната част.';

  @override
  String get autoDiscoveredRobot => 'АВТОМАТИЧНО ОТКРИТ РОБОТ';

  @override
  String get autoDiscoveredRobots => 'АВТОМАТИЧНО ОТКРИТИ РОБОТИ';

  @override
  String readyCountBadge(Object count) {
    return '$count ГОТОВ';
  }

  @override
  String get supportedRobots => 'ПОДДЪРЖАНИ РОБОТИ';

  @override
  String get clothesFoldingRobot => 'Робот за сгъване на дрехи';

  @override
  String get fabricaDescription =>
      'Автоматизирано папкане на дрехи с предварително зададени настройки за няколко дрехи и тактилно управление с един бутон.';

  @override
  String get fabricaPairingHint =>
      'Режим на сдвояване: Натиснете и задръжте произволен бутон на контролния панел на Fabrica за 3 секунди (светодиодът за състояние ще мига бързо).';

  @override
  String get pairFabricaNow => 'СДВОЕТЕ FABRICA СЕГА';

  @override
  String get backToHome => 'Обратно към дома';

  @override
  String get connReady => 'ГОТОВ';

  @override
  String get connConnecting => 'СВЪРЗВАНЕ';

  @override
  String get connDiscovering => 'ОТКРИВАНЕ';

  @override
  String get connBonding => 'СВЪРЗВАНЕ';

  @override
  String get connScanning => 'СКАНИРАНЕ';

  @override
  String get connDisconnected => 'ИЗКЛЮЧЕН';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Прекъсване на връзката с $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Можете да се свържете отново по всяко време от началния екран.';

  @override
  String get cancelButton => 'ОТМЕНЯНЕ';

  @override
  String get saveButton => 'ЗАПАЗЕТЕ';

  @override
  String get customNickname => 'Персонализиран псевдоним';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Раздвояване на $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Това ще премахне $name от вашите роботи на този телефон. Можете да го добавите отново по всяко време.\n\nЗабележка: За да изтриете напълно паметта на робота и да възстановите фабричните настройки, използвайте „Възстановяване на фабричните настройки“.';
  }

  @override
  String get unpairButton => 'РАСПАРЯВАНЕ';

  @override
  String get machineIdle => 'ПРЕЗЕНЕН';

  @override
  String get machineRunning => 'БЯГАНЕ';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'ГРЕШКА';

  @override
  String get machineCalibrating => 'КАЛИБРИРАНЕ';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'ЗАПАЗЕН';

  @override
  String get ledInputErr => 'ГРЕШКА ПРИ ВЪВЕЖДАНЕ';

  @override
  String get ledPairing => 'СВЪРЗВАНЕ';

  @override
  String get ledConnected => 'СВЪРЗАН';

  @override
  String get ledIdentify => 'ИДЕНТИФИЦИРАЙТЕ';

  @override
  String get identifyButton => 'ИДЕНТИФИЦИРАЙТЕ';

  @override
  String get identifyingToast => 'Мигащ светодиод на робота за 3 секунди...';

  @override
  String get homingToast => 'Насочване на всички клапи...';

  @override
  String get i2cFault => 'I2C ГРЕШКА';

  @override
  String get storageFault => 'ГРЕШКА В СЪХРАНЕНИЕТО';

  @override
  String get estopLatched => 'E-STOP ЗАКЛЮЧЕН';

  @override
  String get presetButtonsTitle => 'ПРЕДВАРИТЕЛНО НАСТРОЙКИ БУТОНИ';

  @override
  String customizePresetTitle(Object label) {
    return 'Персонализиране на $label';
  }

  @override
  String get subtitleNameLabel => 'Име на субтитрите';

  @override
  String get subtitleNameHint =>
      'напр. Бързо сгъване, ризи, персонализирани...';

  @override
  String get buttonColorLabel => 'Цвят на бутона';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Стъпка $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'АВАРИЙНО СПИРАНЕ';

  @override
  String get clearEstop => 'ИЗЧИСТВАНЕ И ОТКЛЮЧВАНЕ НА E-STOP';

  @override
  String get clearEstopHint =>
      'Нулира аварийното спиране и връща робота в неактивен режим';

  @override
  String get stopButton => 'СПРИ';

  @override
  String get fabricaArrangementTitle => 'ПОДРЕЖДАНЕ НА ПЛАТ';

  @override
  String get editArrangement => 'РЕДАКТИРАНЕ НА ПОДРЕЖДАНЕТО';

  @override
  String get addPanel => 'ДОБАВЯНЕ НА ПАНЕЛ';

  @override
  String get legendMotorized => 'Моторизирани';

  @override
  String get legendFollower => 'Последовател';

  @override
  String get legendBase => 'База';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Редове';

  @override
  String stepSelectedHint(Object step) {
    return 'Избрана стъпка $step: Докоснете 1–2 моторизирани панела в мрежата';
  }

  @override
  String get tapPanelsHint => 'Докоснете 1–2 моторни панела върху мрежата';

  @override
  String get dualBadge => 'ДВОЙНО';

  @override
  String get requiresMotorizedPanel =>
      'Изисква поне 1 моторизиран панел (макс. 2)';

  @override
  String get selectedChangePanelsHint =>
      'Избрано • Докоснете решетъчни панели за промяна (макс. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Стъпка $step от $total';
  }

  @override
  String get removeStepTooltip => 'Премахване на стъпка';

  @override
  String get requiresMotorizedModuleWarning =>
      'Рутината изисква поне един моторизиран модул от Fabrica Arrangement.';

  @override
  String get routineFull => 'ПЪЛНА РУТИНА (16/16 СТЪПКИ)';

  @override
  String addStepCount(Object count) {
    return 'ДОБАВЯНЕ НА СТЪПКА ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Запазване на рутина в робот';

  @override
  String get selectButtonToProgram =>
      'Изберете бутон на физически робот, който да програмирате с тази рутина:';

  @override
  String buttonNumber(Object slot) {
    return 'Бутон $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Хардуерен бутон $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Бутон $slot Подзаглавие (по избор)';
  }

  @override
  String get saveToRobotButton => 'ЗАПАЗЕТЕ В РОБОТА';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Бутон $slot ($count стъпки)';
  }

  @override
  String get adultTshirtTemplate => 'Шаблон за тениска за възрастни';

  @override
  String get longSleeveTemplate => 'Шаблон с дълъг ръкав';

  @override
  String get dualSweepTemplate => 'Шаблон за двойно почистване';

  @override
  String channelNumber(Object number) {
    return 'Канал $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count СДВОЕН';
  }

  @override
  String get moreHardwareOptions => 'Още хардуерни опции';

  @override
  String get loadTemplate => 'Зареждане на шаблон';

  @override
  String get controllerLabel => 'КОНТРОЛЕР';

  @override
  String get motorBadge => 'МОТОР';

  @override
  String get followerBadge => 'ПОСЛЕДОВАТЕЛ';

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
