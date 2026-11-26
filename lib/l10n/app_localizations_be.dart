// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Belarusian (`be`).
class AppLocalizationsBe extends AppLocalizations {
  AppLocalizationsBe([String locale = 'be']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Налады';

  @override
  String get appLanguageTitle => 'Мова праграмы';

  @override
  String get appVersionTitle => 'Версія праграмы';

  @override
  String get languageSectionTitle => 'мова';

  @override
  String get languageSystemDefault => 'Сістэма па змаўчанні (мова прылады)';

  @override
  String get selectLanguageHint => 'Выберыце мову';

  @override
  String get addDeviceTitle => 'ДАДАЦЬ НОВЫ РОБОТ';

  @override
  String get addDeviceSubtitle => 'Парныя робаты AIR';

  @override
  String get yourRobots => 'ВАШЫ РОБАТЫ';

  @override
  String get discoveredRobots => 'ВЫЯЎЛЕНЫЯ РОБАТЫ';

  @override
  String get noRobotsPairedYet => 'Робатаў пакуль не спалучана';

  @override
  String get noRobotsPairedSubtitle =>
      'Падключыце свайго робата, каб праглядаць тэлеметрыю, кіраваць папярэднімі наладамі і кантраляваць аперацыі.';

  @override
  String get addYourFirstRobot => 'ДАДАЦЬ СВОЙ ПЕРШЫ РОБАТ';

  @override
  String get autoScanning => 'АЎТАМАТИЧНАЕ СКАНІРАВАННЕ';

  @override
  String get idleStatus => 'ХАЛАСТЫ';

  @override
  String get tabControl => 'Кантроль';

  @override
  String get tabSequencer => 'Секвенсар';

  @override
  String get tabCalibrator => 'Калібратар';

  @override
  String get tabDiagnostics => 'Дыягностыка';

  @override
  String get renameRobot => 'Перайменаваць робата';

  @override
  String get bleDiagnostics => 'Дыягностыка BLE';

  @override
  String get erasePresets => 'Сцерці захаваныя налады';

  @override
  String get disconnect => 'Адключыцца';

  @override
  String get unpairRobot => 'Разлучыць робата';

  @override
  String get factoryReset => 'Скід да заводскіх налад';

  @override
  String get servoManualJog => 'РУЧНОЙ СЕРВУ';

  @override
  String get homeAll => 'ДОМАЎ УСІХ';

  @override
  String get foldingTimeline => 'СКЛАДНАЯ ХРАНА';

  @override
  String get addStep => 'ДАДАЦЬ КРОК';

  @override
  String get previewOnRobot => 'ПРАГЛЯД НА РОБАТ';

  @override
  String get saveToButton => 'ЗАХАВАЦЬ НА КНОПКУ';

  @override
  String get themeTitle => 'Тэма';

  @override
  String get themeSystem => 'прылада';

  @override
  String get themeLight => 'Святло';

  @override
  String get themeDark => 'Цёмны';

  @override
  String get connectedBadge => 'ЗВЯЗАНЫ';

  @override
  String get inRangeBadge => 'У ДАЛЕЖНАСЦІ';

  @override
  String get offlineBadge => 'ПА-ЗА СЯБОЙ';

  @override
  String get openButton => 'АДКРЫТАЯ';

  @override
  String get connectButton => 'ЗЛУЧЫЦЬ';

  @override
  String get reconnectButton => 'ПАВЯРНІЦЦА';

  @override
  String get pairAndConnect => 'ПАЛУЧЫЦЬ І ПАДКЛЮЧЫЦЬ';

  @override
  String get autoScanningForRobots =>
      'Аўтаматычнае сканіраванне для робатаў...';

  @override
  String get scanningIdle => 'Сканаванне ў рэжыме чакання';

  @override
  String get nearbyRobotsAppear => 'Робаты паблізу з\'явяцца тут аўтаматычна.';

  @override
  String get yourNearbyRobotsAppear =>
      'Вашы робаты паблізу з\'явяцца тут аўтаматычна.';

  @override
  String get signalStrong => 'Моцны';

  @override
  String get signalGood => 'Добра';

  @override
  String get signalWeak => 'Слабы';

  @override
  String get addRobotIntro =>
      'Выберыце робата ніжэй для спалучэння. Любы робат паблізу ў рэжыме спалучэння будзе аўтаматычна знойдзены ўверсе.';

  @override
  String get autoDiscoveredRobot => 'АЎТА ВЫЯЎЛЕНЫ РОБАТ';

  @override
  String get autoDiscoveredRobots => 'АЎТА ВЫЯВІЛІ РОБАТЫ';

  @override
  String readyCountBadge(Object count) {
    return '$count ГАТОВЫ';
  }

  @override
  String get supportedRobots => 'ПАДТРЫМАЕМЫЯ РОБАТЫ';

  @override
  String get clothesFoldingRobot => 'Робат для складання адзення';

  @override
  String get fabricaDescription =>
      'Аўтаматызаваная папка для адзення з прадусталяванымі наладамі для некалькіх прадметаў адзення і тактыльным кіраваннем адной кнопкай.';

  @override
  String get fabricaPairingHint =>
      'Рэжым спалучэння: націсніце і ўтрымлівайце любую кнопку на панэлі кіравання Fabrica на працягу 3 секунд (святлодыёд стану будзе хутка міргаць).';

  @override
  String get pairFabricaNow => 'ПАЛУЧЫЦЬ ТКАНІНУ ЗАРАЗ';

  @override
  String get backToHome => 'Назад дадому';

  @override
  String get connReady => 'ГАТОВЫ';

  @override
  String get connConnecting => 'ПАДКЛЮЧЭННЕ';

  @override
  String get connDiscovering => 'АДКРЫЦЬ';

  @override
  String get connBonding => 'Склейванне';

  @override
  String get connScanning => 'СКАНІРАВАННЕ';

  @override
  String get connDisconnected => 'АДКЛЮЧЭНЫ';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Адключыцца ад $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Вы можаце паўторна падключыцца ў любы час з галоўнага экрана.';

  @override
  String get cancelButton => 'СКАСАВАЦЬ';

  @override
  String get saveButton => 'ЗАХАВАЦЬ';

  @override
  String get customNickname => 'Карыстальніцкі нік';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Разлучыць $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Гэта выдаліць $name з вашых робатаў на гэтым тэлефоне. Вы можаце паўторна дадаць яго ў любы час.\n\nЗаўвага: каб цалкам ачысціць памяць робата і аднавіць заводскія налады, выкарыстоўвайце «Скід да заводскіх налад».';
  }

  @override
  String get unpairButton => 'РАЗПАРАВАЦЬ';

  @override
  String get machineIdle => 'ХАЛАСТЫ';

  @override
  String get machineRunning => 'БЕГ';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'ПАМЫЛКА';

  @override
  String get machineCalibrating => 'КАЛІБРОВКА';

  @override
  String ledLabel(Object state) {
    return 'Святлодыёд: $state';
  }

  @override
  String get ledSaved => 'ЗАХАВАНА';

  @override
  String get ledInputErr => 'ПАМЫЛКА ЎВОДУ';

  @override
  String get ledPairing => 'ПАРЫВАННЕ';

  @override
  String get ledConnected => 'ЗВЯЗАНЫ';

  @override
  String get ledIdentify => 'ІДЭНТЫФІКАЦЫЯ';

  @override
  String get identifyButton => 'ІДЭНТЫФІКАЦЫЯ';

  @override
  String get identifyingToast =>
      'Мігае святлодыёд робата на працягу 3 секунд...';

  @override
  String get homingToast => 'Навядзенне ўсіх створак...';

  @override
  String get i2cFault => 'ПАМЫЛКА I2C';

  @override
  String get storageFault => 'ПАМЫЛКА ЗАХОЎВАННЯ';

  @override
  String get estopLatched => 'ЭЛЕКТРОННЫ СТОП БЛІКУЕЦЬ';

  @override
  String get presetButtonsTitle => 'КНОПКІ ПРЕДУПРАЦОЖАНЫХ';

  @override
  String customizePresetTitle(Object label) {
    return 'Наладзіць $label';
  }

  @override
  String get subtitleNameLabel => 'Назва субтытраў';

  @override
  String get subtitleNameHint => 'напр. Quick Fold, кашулі, на заказ...';

  @override
  String get buttonColorLabel => 'Колер кнопкі';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Крок $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'АЎТЫЙНЫ СПЫН';

  @override
  String get clearEstop => 'АЧЫСТЫЦЬ І РАЗБЛІКАВАЦЬ E-STOP';

  @override
  String get clearEstopHint =>
      'Скідвае аварыйны прыпынак і вяртае робата ў рэжым чакання';

  @override
  String get stopButton => 'СТОП';

  @override
  String get fabricaArrangementTitle => 'РАСПЛАДЖЭННЕ ТКАНІНЫ';

  @override
  String get editArrangement => 'РЭДАГАВАЦЬ АРМАНІЗАЦЫЮ';

  @override
  String get addPanel => 'ДАДАЦЬ ПАНЭЛЬ';

  @override
  String get legendMotorized => 'Матарызаваны';

  @override
  String get legendFollower => 'Паслядоўнік';

  @override
  String get legendBase => 'База';

  @override
  String get colsLabel => 'Зб';

  @override
  String get rowsLabel => 'Шэрагі';

  @override
  String stepSelectedHint(Object step) {
    return 'Выбраны крок $step: націсніце 1–2 матарызаваныя панэлі на сетцы';
  }

  @override
  String get tapPanelsHint => 'Націсніце 1–2 панэлі рухавіка на сетку';

  @override
  String get dualBadge => 'ДУАЛ';

  @override
  String get requiresMotorizedPanel =>
      'Патрабуецца як мінімум 1 матарызаваная панэль (максімум 2)';

  @override
  String get selectedChangePanelsHint =>
      'Выбрана • Каб змяніць краніце панэлі сеткі (максімум 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Крок $step з $total';
  }

  @override
  String get removeStepTooltip => 'Выдаліць крок';

  @override
  String get requiresMotorizedModuleWarning =>
      'Праграма патрабуе як мінімум аднаго матарызаванага модуля ад Fabrica Arrangement.';

  @override
  String get routineFull => 'РУТЫНА ПОЎНА (16/16 КРОКІЎ)';

  @override
  String addStepCount(Object count) {
    return 'ДАДАЦЬ КРОК ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Захаваць працэдуру ў робата';

  @override
  String get selectButtonToProgram =>
      'Выберыце фізічную кнопку робата для праграмы з дапамогай гэтай працэдуры:';

  @override
  String buttonNumber(Object slot) {
    return 'Кнопка $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Апаратная кнопка $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Кнопка $slot Падзагаловак (неабавязкова)';
  }

  @override
  String get saveToRobotButton => 'ЗАХАВАЦЬ У РОБАТ';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Кнопка $slot ($count крокаў)';
  }

  @override
  String get adultTshirtTemplate => 'Шаблон футболкі для дарослых';

  @override
  String get longSleeveTemplate => 'Шаблон з доўгім рукавом';

  @override
  String get dualSweepTemplate => 'Шаблон падвойнай разгорткі';

  @override
  String channelNumber(Object number) {
    return 'Канал $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count ПАРА';
  }

  @override
  String get moreHardwareOptions => 'Дадатковыя параметры абсталявання';

  @override
  String get loadTemplate => 'Загрузіць шаблон';

  @override
  String get controllerLabel => 'КАНТРОЛЕР';

  @override
  String get motorBadge => 'РУХАВІК';

  @override
  String get followerBadge => 'ПАСЛЯДОЎНІК';

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
