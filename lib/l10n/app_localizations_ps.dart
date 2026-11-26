// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Pushto Pashto (`ps`).
class AppLocalizationsPs extends AppLocalizations {
  AppLocalizationsPs([String locale = 'ps']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'ترتیبات';

  @override
  String get appLanguageTitle => 'د اپلیکیشن ژبه';

  @override
  String get appVersionTitle => 'د اپلیکیشن نسخه';

  @override
  String get languageSectionTitle => 'ژبه';

  @override
  String get languageSystemDefault => 'د سیسټم ډیفالټ (د وسیلې ژبه)';

  @override
  String get selectLanguageHint => 'یوه ژبه غوره کړئ';

  @override
  String get addDeviceTitle => 'نوی روبوټ اضافه کړئ';

  @override
  String get addDeviceSubtitle => 'AIR روبوټونه جوړه کړئ';

  @override
  String get yourRobots => 'ستاسو روباټونه';

  @override
  String get discoveredRobots => 'کشف شوي روبوټونه';

  @override
  String get noRobotsPairedYet => 'تر اوسه هیڅ روبوټ نه دی جوړ شوی';

  @override
  String get noRobotsPairedSubtitle =>
      'خپل روبوټ د ټیلی میټری لیدو لپاره وصل کړئ ، پری سیټونه اداره کړئ ، او عملیات کنټرول کړئ.';

  @override
  String get addYourFirstRobot => 'خپل لومړی روبوټ اضافه کړئ';

  @override
  String get autoScanning => 'اتوماتیک سکینګ';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'کنټرول';

  @override
  String get tabSequencer => 'ترتیب کوونکی';

  @override
  String get tabCalibrator => 'کیلیبریټر';

  @override
  String get tabDiagnostics => 'تشخیص';

  @override
  String get renameRobot => 'د روبوټ نوم بدل کړئ';

  @override
  String get bleDiagnostics => 'د BLE تشخیص';

  @override
  String get erasePresets => 'خوندي شوي پریزیټونه پاک کړئ';

  @override
  String get disconnect => 'منحل کول';

  @override
  String get unpairRobot => 'روبوټ بې جوړې کړئ';

  @override
  String get factoryReset => 'د فابریکې ری سیٹ';

  @override
  String get servoManualJog => 'د خدمت لارښود جوګ';

  @override
  String get homeAll => 'کور ټول';

  @override
  String get foldingTimeline => 'د فولډینګ مهال ویش';

  @override
  String get addStep => 'ګام اضافه کړئ';

  @override
  String get previewOnRobot => 'په روبوټ کې مخکتنه';

  @override
  String get saveToButton => 'په تڼۍ کې خوندي کړئ';

  @override
  String get themeTitle => 'موضوع';

  @override
  String get themeSystem => 'وسیله';

  @override
  String get themeLight => 'رڼا';

  @override
  String get themeDark => 'تیاره';

  @override
  String get connectedBadge => 'نښلول شوی';

  @override
  String get inRangeBadge => 'په رینج کې';

  @override
  String get offlineBadge => 'آفلاین';

  @override
  String get openButton => 'خلاص';

  @override
  String get connectButton => 'نښلول';

  @override
  String get reconnectButton => 'بیا نښلول';

  @override
  String get pairAndConnect => 'جوړه او نښلول';

  @override
  String get autoScanningForRobots => 'د روبوټونو لپاره اتوماتیک سکین کول ...';

  @override
  String get scanningIdle => 'بې کاره سکین کول';

  @override
  String get nearbyRobotsAppear =>
      'نږدې روبوټونه به دلته په اتوماتيک ډول ښکاره شي.';

  @override
  String get yourNearbyRobotsAppear =>
      'ستاسو نږدې روبوټونه به دلته په اتوماتيک ډول ښکاره شي.';

  @override
  String get signalStrong => 'قوي';

  @override
  String get signalGood => 'ښه';

  @override
  String get signalWeak => 'کمزوری';

  @override
  String get addRobotIntro =>
      'د جوړه کولو لپاره لاندې یو روبوټ غوره کړئ. د جوړه کولو حالت کې هر نږدې روبوټ به په اوتومات ډول په سر کې وموندل شي.';

  @override
  String get autoDiscoveredRobot => 'اتومات کشف شوی روبوټ';

  @override
  String get autoDiscoveredRobots => 'اتومات کشف شوي روبوټونه';

  @override
  String readyCountBadge(Object count) {
    return '$count چمتو دی';
  }

  @override
  String get supportedRobots => 'ملاتړ شوي روبوټونه';

  @override
  String get clothesFoldingRobot => 'د جامو فولډ روبوټ';

  @override
  String get fabricaDescription =>
      'د ملټي ګارمینټ پریسیټس او د تکثیر واحد تڼۍ عملیاتو سره د جامو اتومات فولډر.';

  @override
  String get fabricaPairingHint =>
      'د جوړه کولو حالت: د 3 ثانیو لپاره د فیبریکا کنټرول پینل کې هر ډول تڼۍ فشار کړئ او ونیسئ (د حالت LED به په چټکۍ سره روښانه شي).';

  @override
  String get pairFabricaNow => 'همدا اوس فابریکا جوړه کړئ';

  @override
  String get backToHome => 'بیرته کور ته';

  @override
  String get connReady => 'چمتو';

  @override
  String get connConnecting => 'نښلول';

  @override
  String get connDiscovering => 'کشف کول';

  @override
  String get connBonding => 'BONDING';

  @override
  String get connScanning => 'سکین کول';

  @override
  String get connDisconnected => 'منحل شوی';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'له $name سره نښلول؟';
  }

  @override
  String get disconnectConfirmBody =>
      'تاسو کولی شئ هر وخت د کور سکرین څخه بیا وصل شئ.';

  @override
  String get cancelButton => 'لغوه کول';

  @override
  String get saveButton => 'خوندي کړئ';

  @override
  String get customNickname => 'دودیز مستعار نوم';

  @override
  String unpairConfirmTitle(Object name) {
    return 'بې جوړې $name؟';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'دا به په دې تلیفون کې ستاسو له روبوټونو څخه $name لرې کړي. تاسو کولی شئ دا په هر وخت کې بیا اضافه کړئ.\n\nیادونه: د روبوټ حافظې په بشپړ ډول پاکولو او د فابریکې ډیفالټ بحالولو لپاره ، د \"فیکٹري ری سیٹ\" وکاروئ.';
  }

  @override
  String get unpairButton => 'UNPAIR';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'چلول';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'تېروتنه';

  @override
  String get machineCalibrating => 'calibrating';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'خوندي شوی';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'جوړه کول';

  @override
  String get ledConnected => 'نښلول شوی';

  @override
  String get ledIdentify => 'پیژندنه';

  @override
  String get identifyButton => 'پیژندنه';

  @override
  String get identifyingToast => 'د 3 ثانیو لپاره د روبوټ LED فلش کول ...';

  @override
  String get homingToast => 'ټول فلیپ کور کول ...';

  @override
  String get i2cFault => 'د I2C غلطی';

  @override
  String get storageFault => 'د ذخیره کولو غلطی';

  @override
  String get estopLatched => 'ای سټاپ لیچ شوی';

  @override
  String get presetButtonsTitle => 'مخکینۍ بټن';

  @override
  String customizePresetTitle(Object label) {
    return 'تخصیص $label';
  }

  @override
  String get subtitleNameLabel => 'د فرعي سرلیک نوم';

  @override
  String get subtitleNameHint => 'د مثال په توګه چټک فولډ، کمیسونه، دودیز ...';

  @override
  String get buttonColorLabel => 'د تڼۍ رنګ';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'ګام $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'بیړنی بند';

  @override
  String get clearEstop => 'ای سټاپ پاک او خلاص کړئ';

  @override
  String get clearEstopHint =>
      'اضطراري تمځای بیا تنظیموي او روبوټ بیکار ته راستنوي';

  @override
  String get stopButton => 'ودروئ';

  @override
  String get fabricaArrangementTitle => 'د فیبریکا ترتیب';

  @override
  String get editArrangement => 'ترتیب ترتیب کړئ';

  @override
  String get addPanel => 'پینل اضافه کړئ';

  @override
  String get legendMotorized => 'موټر شوی';

  @override
  String get legendFollower => 'پیروونکی';

  @override
  String get legendBase => 'بیس';

  @override
  String get colsLabel => 'کولس';

  @override
  String get rowsLabel => 'قطارونه';

  @override
  String stepSelectedHint(Object step) {
    return 'مرحله $step غوره شوی: په ګریډ کې د 1-2 موټرو تختو ټایپ کړئ';
  }

  @override
  String get tapPanelsHint => 'په ګریډ کې د 1-2 موټرو تختو ټایپ کړئ';

  @override
  String get dualBadge => 'دوه ګونی';

  @override
  String get requiresMotorizedPanel =>
      'لږترلږه 1 د موټرو پینل ته اړتیا لري (زیاته 2)';

  @override
  String get selectedChangePanelsHint =>
      'غوره شوی • د بدلولو لپاره د ګریډ تختو ټایپ کړئ ( اعظمي 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'ګام $step د $total';
  }

  @override
  String get removeStepTooltip => 'ګام لرې کړئ';

  @override
  String get requiresMotorizedModuleWarning =>
      'روټین د فابریکا ترتیب څخه لږترلږه یو موټریز ماډل ته اړتیا لري.';

  @override
  String get routineFull => 'روټین بشپړ (16/16 مرحلې)';

  @override
  String addStepCount(Object count) {
    return 'ګام اضافه کړئ ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'روټین روبوټ ته خوندي کړئ';

  @override
  String get selectButtonToProgram =>
      'د دې معمول سره برنامه کولو لپاره فزیکي روبوټ تڼۍ غوره کړئ:';

  @override
  String buttonNumber(Object slot) {
    return 'تڼۍ $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'د هارډویر تڼۍ $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'تڼۍ $slot فرعي سرلیک (اختیاري)';
  }

  @override
  String get saveToRobotButton => 'روبوټ ته خوندي کړئ';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'تڼۍ $slot ($count ګامونه)';
  }

  @override
  String get adultTshirtTemplate => 'د بالغ ټي شرټ کينډۍ';

  @override
  String get longSleeveTemplate => 'اوږده آستین ټیمپلیټ';

  @override
  String get dualSweepTemplate => 'دوه ګونی سویپ کينډۍ';

  @override
  String channelNumber(Object number) {
    return 'چینل $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count جوړه شوې';
  }

  @override
  String get moreHardwareOptions => 'نور هارډویر اختیارونه';

  @override
  String get loadTemplate => 'کينډۍ پورته کړئ';

  @override
  String get controllerLabel => 'کنټرولر';

  @override
  String get motorBadge => 'موټور';

  @override
  String get followerBadge => 'فالوور';

  @override
  String get baseBadge => 'بیس';

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
