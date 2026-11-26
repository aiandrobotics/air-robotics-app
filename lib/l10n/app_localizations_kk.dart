// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Параметрлер';

  @override
  String get appLanguageTitle => 'Қолданба тілі';

  @override
  String get appVersionTitle => 'Қолданба нұсқасы';

  @override
  String get languageSectionTitle => 'Тіл';

  @override
  String get languageSystemDefault => 'Жүйенің әдепкі мәні (құрылғы тілі)';

  @override
  String get selectLanguageHint => 'Тілді таңдаңыз';

  @override
  String get addDeviceTitle => 'ЖАҢА РОБОТ ҚОСУ';

  @override
  String get addDeviceSubtitle => 'AIR роботтарын жұптаңыз';

  @override
  String get yourRobots => 'СІЗДІҢ РОБОТТАРЫҢЫЗ';

  @override
  String get discoveredRobots => 'АШЫЛҒАН РОБОТТАР';

  @override
  String get noRobotsPairedYet => 'Әзірге жұптастырылған роботтар жоқ';

  @override
  String get noRobotsPairedSubtitle =>
      'Телеметрияны көру, алдын ала орнатуларды басқару және операцияларды басқару үшін роботты қосыңыз.';

  @override
  String get addYourFirstRobot => 'БІРІНШІ РОБОТЫҢЫЗДЫ ҚОСУ';

  @override
  String get autoScanning => 'АВТО Сканерлеу';

  @override
  String get idleStatus => 'БҰЗУ';

  @override
  String get tabControl => 'Бақылау';

  @override
  String get tabSequencer => 'Секвендер';

  @override
  String get tabCalibrator => 'Калибратор';

  @override
  String get tabDiagnostics => 'Диагностика';

  @override
  String get renameRobot => 'Роботтың атын өзгерту';

  @override
  String get bleDiagnostics => 'BLE диагностикасы';

  @override
  String get erasePresets => 'Сақталған алдын ала орнатуларды өшіру';

  @override
  String get disconnect => 'Ажырату';

  @override
  String get unpairRobot => 'Роботты ажырату';

  @override
  String get factoryReset => 'Зауыттық параметрлерді қалпына келтіру';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'БАРЛЫҚ ҮЙ';

  @override
  String get foldingTimeline => 'БҮКТЕЛУ Хронологиясы';

  @override
  String get addStep => 'ҚАДАМ ҚОСУ';

  @override
  String get previewOnRobot => 'РОБОТТА АЛДЫН АЛА ҚАРАУ';

  @override
  String get saveToButton => 'ТҮЙМЕГЕ САҚТАУ';

  @override
  String get themeTitle => 'Тақырып';

  @override
  String get themeSystem => 'Құрылғы';

  @override
  String get themeLight => 'Жарық';

  @override
  String get themeDark => 'Қараңғы';

  @override
  String get connectedBadge => 'ҚОСЫЛДЫ';

  @override
  String get inRangeBadge => 'ҚҰРАҚТА';

  @override
  String get offlineBadge => 'ОФЛАЙН';

  @override
  String get openButton => 'АШЫҚ';

  @override
  String get connectButton => 'ҚОСЫЛУ';

  @override
  String get reconnectButton => 'ҚАЙТА ҚОСУ';

  @override
  String get pairAndConnect => 'ЖҰПТАУ ЖӘНЕ ҚОСУ';

  @override
  String get autoScanningForRobots => 'Роботтарды автоматты түрде іздеу...';

  @override
  String get scanningIdle => 'Сканерлеу әрекетсіз';

  @override
  String get nearbyRobotsAppear =>
      'Маңайдағы роботтар осы жерде автоматты түрде пайда болады.';

  @override
  String get yourNearbyRobotsAppear =>
      'Маңайдағы роботтар осы жерде автоматты түрде пайда болады.';

  @override
  String get signalStrong => 'Күшті';

  @override
  String get signalGood => 'Жақсы';

  @override
  String get signalWeak => 'Әлсіз';

  @override
  String get addRobotIntro =>
      'Жұптау үшін төмендегі роботты таңдаңыз. Жұптастыру режиміндегі кез келген жақын маңдағы робот автоматты түрде жоғарғы жағында анықталады.';

  @override
  String get autoDiscoveredRobot => 'АВТО АШЫЛҒАН РОБОТ';

  @override
  String get autoDiscoveredRobots => 'АВТО АШЫЛҒАН РОБОТТАР';

  @override
  String readyCountBadge(Object count) {
    return '$count ДАЙЫН';
  }

  @override
  String get supportedRobots => 'ҚОЛДАУ БАР РОБОТТАР';

  @override
  String get clothesFoldingRobot => 'Киім жинайтын робот';

  @override
  String get fabricaDescription =>
      'Көп киімге арналған алдын ала орнатылған және тактильді бір түймемен жұмыс істейтін автоматтандырылған киім қалтасы.';

  @override
  String get fabricaPairingHint =>
      'Жұптастыру режимі: Fabrica басқару тақтасындағы кез келген түймені 3 секунд басып тұрыңыз (күй ЖШД жылдам жыпылықтайды).';

  @override
  String get pairFabricaNow => 'ҚАЗІР МАТАНДЫ ЖҰПТАСТЫРЫҢЫЗ';

  @override
  String get backToHome => 'Үйге оралу';

  @override
  String get connReady => 'ДАЙЫН';

  @override
  String get connConnecting => 'ҚОСУ';

  @override
  String get connDiscovering => 'АШУ';

  @override
  String get connBonding => 'БАЙЛАНЫСТЫРУ';

  @override
  String get connScanning => 'Сканерлеу';

  @override
  String get connDisconnected => 'АЖЫРЫЛҒАН';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name желісінен ажырату керек пе?';
  }

  @override
  String get disconnectConfirmBody =>
      'Негізгі экраннан кез келген уақытта қайта қосылуға болады.';

  @override
  String get cancelButton => 'БАС ТАРТУ';

  @override
  String get saveButton => 'САҚТАУ';

  @override
  String get customNickname => 'Арнаулы лақап ат';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name жұпын ажырату керек пе?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Бұл телефондағы роботтарыңыздан $name жояды. Сіз оны кез келген уақытта қайта қоса аласыз.\n\nЕскертпе: Робот жадын толығымен өшіру және зауыттық әдепкі параметрлерді қалпына келтіру үшін «Зауыттық параметрлерді қалпына келтіру» опциясын пайдаланыңыз.';
  }

  @override
  String get unpairButton => 'ЖҰПТАУ';

  @override
  String get machineIdle => 'БҰЗУ';

  @override
  String get machineRunning => 'ЖҮГІРУ';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'ҚАТЕ';

  @override
  String get machineCalibrating => 'КАЛИБРЛЕУ';

  @override
  String ledLabel(Object state) {
    return 'ЖШД: $state';
  }

  @override
  String get ledSaved => 'САҚТАЛДЫ';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'ЖҰПТАУ';

  @override
  String get ledConnected => 'ҚОСЫЛДЫ';

  @override
  String get ledIdentify => 'АНЫҚТАҢЫЗ';

  @override
  String get identifyButton => 'АНЫҚТАҢЫЗ';

  @override
  String get identifyingToast => 'Робот жарық диоды 3 секундқа жыпылықтайды...';

  @override
  String get homingToast => 'Барлық қақпақтарды бастыру...';

  @override
  String get i2cFault => 'I2C ҚАТЕЛІГІ';

  @override
  String get storageFault => 'САҚТАУ ҚАТЕЛІГІ';

  @override
  String get estopLatched => 'E-STOP ҚЫСҚАУЛЫ';

  @override
  String get presetButtonsTitle => 'АЛДЫНДАҒЫ ОРНАТУ ТҮЙМЕЛЕРІ';

  @override
  String customizePresetTitle(Object label) {
    return '$label теңшеу';
  }

  @override
  String get subtitleNameLabel => 'Субтитр атауы';

  @override
  String get subtitleNameHint =>
      'мысалы Жылдам бүктемелер, көйлектер, тапсырыс бойынша...';

  @override
  String get buttonColorLabel => 'Түйме түсі';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Қадам $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'Төтенше жағдайдағы аялдама';

  @override
  String get clearEstop => 'ЭЛЕКТРОНДЫҚ ТОҚТАУДЫ ТАЗАЛАУ ЖӘНЕ АШУ';

  @override
  String get clearEstopHint =>
      'Төтенше тоқтатуды қалпына келтіреді және роботты Күту режиміне қайтарады';

  @override
  String get stopButton => 'ТОҚТАТУ';

  @override
  String get fabricaArrangementTitle => 'МАТА ЖАСАУ';

  @override
  String get editArrangement => 'ЖҰМЫСТЫ ӨҢДЕУ';

  @override
  String get addPanel => 'ПАНЕЛІ ҚОСУ';

  @override
  String get legendMotorized => 'Моторлы';

  @override
  String get legendFollower => 'Ізбасар';

  @override
  String get legendBase => 'Негіз';

  @override
  String get colsLabel => 'Колс';

  @override
  String get rowsLabel => 'Жолдар';

  @override
  String stepSelectedHint(Object step) {
    return '$step қадам таңдалды: Тордағы 1–2 моторлы панельдерді түртіңіз';
  }

  @override
  String get tapPanelsHint => 'Тордағы 1–2 мотор тақтасын түртіңіз';

  @override
  String get dualBadge => 'ҚОС';

  @override
  String get requiresMotorizedPanel =>
      'Кемінде 1 моторлы панель қажет (максимум 2)';

  @override
  String get selectedChangePanelsHint =>
      'Таңдалған • Өзгерту үшін тор тақталарын түртіңіз (ең көбі 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Қадам $step/$total';
  }

  @override
  String get removeStepTooltip => 'Қадамды жою';

  @override
  String get requiresMotorizedModuleWarning =>
      'Реттеу үшін Fabrica Arrangement кемінде бір моторлы модуль қажет.';

  @override
  String get routineFull => 'ТОЛЫҚ (16/16 ҚАДАМ)';

  @override
  String addStepCount(Object count) {
    return 'ҚАДАМ ҚОСУ ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Режимді роботқа сақтаңыз';

  @override
  String get selectButtonToProgram =>
      'Осы тәртіппен бағдарламалау үшін физикалық робот түймесін таңдаңыз:';

  @override
  String buttonNumber(Object slot) {
    return 'Түйме $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Жабдық түймесі $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Түйме $slot Субтитр (қосымша)';
  }

  @override
  String get saveToRobotButton => 'РОБОТҚА САҚТАУ';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return '$slot түймесі ($count қадам)';
  }

  @override
  String get adultTshirtTemplate => 'Ересектерге арналған футболка үлгісі';

  @override
  String get longSleeveTemplate => 'Ұзын жең үлгісі';

  @override
  String get dualSweepTemplate => 'Қосарлы тазалау үлгісі';

  @override
  String channelNumber(Object number) {
    return 'Арна $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count ЖҰПТАСТЫРЫЛҒАН';
  }

  @override
  String get moreHardwareOptions => 'Қосымша жабдық опциялары';

  @override
  String get loadTemplate => 'Үлгіні жүктеңіз';

  @override
  String get controllerLabel => 'БАСҚАРУШЫ';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'ҚОЛДАНУШЫ';

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
