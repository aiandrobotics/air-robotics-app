// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'ترتیبات';

  @override
  String get appLanguageTitle => 'ایپ کی زبان';

  @override
  String get appVersionTitle => 'ایپ ورژن';

  @override
  String get languageSectionTitle => 'زبان';

  @override
  String get languageSystemDefault => 'سسٹم ڈیفالٹ (ڈیوائس کی زبان)';

  @override
  String get selectLanguageHint => 'زبان منتخب کریں';

  @override
  String get addDeviceTitle => 'نیا روبوٹ شامل کریں۔';

  @override
  String get addDeviceSubtitle => 'AIR روبوٹ جوڑیں۔';

  @override
  String get yourRobots => 'آپ کے روبوٹ';

  @override
  String get discoveredRobots => 'دریافت شدہ روبوٹ';

  @override
  String get noRobotsPairedYet => 'ابھی تک کوئی روبوٹ جوڑا نہیں بنا';

  @override
  String get noRobotsPairedSubtitle =>
      'ٹیلی میٹری دیکھنے، پیش سیٹوں کا نظم کرنے اور آپریشنز کو کنٹرول کرنے کے لیے اپنے روبوٹ کو جوڑیں۔';

  @override
  String get addYourFirstRobot => 'اپنا پہلا روبوٹ شامل کریں۔';

  @override
  String get autoScanning => 'آٹو اسکیننگ';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'کنٹرول';

  @override
  String get tabSequencer => 'ترتیب دینے والا';

  @override
  String get tabCalibrator => 'کیلیبریٹر';

  @override
  String get tabDiagnostics => 'تشخیص';

  @override
  String get renameRobot => 'روبوٹ کا نام تبدیل کریں۔';

  @override
  String get bleDiagnostics => 'BLE تشخیص';

  @override
  String get erasePresets => 'محفوظ کردہ پیش سیٹ کو مٹا دیں۔';

  @override
  String get disconnect => 'منقطع کرنا';

  @override
  String get unpairRobot => 'روبوٹ کا جوڑا ختم کریں۔';

  @override
  String get factoryReset => 'فیکٹری ری سیٹ';

  @override
  String get servoManualJog => 'سروو مینوئل جوگ';

  @override
  String get homeAll => 'گھر سب';

  @override
  String get foldingTimeline => 'فولڈنگ ٹائم لائن';

  @override
  String get addStep => 'قدم شامل کریں۔';

  @override
  String get previewOnRobot => 'روبوٹ پر پیش نظارہ';

  @override
  String get saveToButton => 'بٹن پر محفوظ کریں۔';

  @override
  String get themeTitle => 'تھیم';

  @override
  String get themeSystem => 'ڈیوائس';

  @override
  String get themeLight => 'روشنی';

  @override
  String get themeDark => 'اندھیرا';

  @override
  String get connectedBadge => 'منسلک';

  @override
  String get inRangeBadge => 'رینج میں';

  @override
  String get offlineBadge => 'آف لائن';

  @override
  String get openButton => 'کھولیں۔';

  @override
  String get connectButton => 'جڑیں۔';

  @override
  String get reconnectButton => 'دوبارہ جڑیں۔';

  @override
  String get pairAndConnect => 'جوڑا اور جڑیں۔';

  @override
  String get autoScanningForRobots => 'روبوٹس کے لیے خودکار اسکیننگ...';

  @override
  String get scanningIdle => 'اسکیننگ بیکار';

  @override
  String get nearbyRobotsAppear => 'قریبی روبوٹ خود بخود یہاں ظاہر ہوں گے۔';

  @override
  String get yourNearbyRobotsAppear =>
      'آپ کے قریبی روبوٹ خود بخود یہاں ظاہر ہوں گے۔';

  @override
  String get signalStrong => 'مضبوط';

  @override
  String get signalGood => 'اچھا';

  @override
  String get signalWeak => 'کمزور';

  @override
  String get addRobotIntro =>
      'جوڑا بنانے کے لیے نیچے ایک روبوٹ منتخب کریں۔ جوڑا بنانے کے موڈ میں کوئی بھی قریبی روبوٹ خود بخود سب سے اوپر دریافت ہو جائے گا۔';

  @override
  String get autoDiscoveredRobot => 'آٹو دریافت شدہ روبوٹ';

  @override
  String get autoDiscoveredRobots => 'آٹو دریافت شدہ روبوٹ';

  @override
  String readyCountBadge(Object count) {
    return '$count تیار';
  }

  @override
  String get supportedRobots => 'تعاون یافتہ روبوٹ';

  @override
  String get clothesFoldingRobot => 'کپڑے تہ کرنے والا روبوٹ';

  @override
  String get fabricaDescription =>
      'ملٹی گارمنٹ پرسیٹس اور ٹیکٹائل سنگل بٹن آپریشن کے ساتھ ملٹی گارمنٹ فولڈر۔';

  @override
  String get fabricaPairingHint =>
      'پیئرنگ موڈ: فیبریکا کنٹرول پینل پر کسی بھی بٹن کو 3 سیکنڈ تک دبائیں اور تھامیں (اسٹیٹس ایل ای ڈی تیزی سے پلک جھپکائے گا)۔';

  @override
  String get pairFabricaNow => 'ابھی فیبریکا جوڑیں۔';

  @override
  String get backToHome => 'واپس گھر پر';

  @override
  String get connReady => 'تیار';

  @override
  String get connConnecting => 'جڑ رہا ہے۔';

  @override
  String get connDiscovering => 'دریافت کرنا';

  @override
  String get connBonding => 'بانڈنگ';

  @override
  String get connScanning => 'سکیننگ';

  @override
  String get connDisconnected => 'منقطع';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name سے رابطہ منقطع کریں؟';
  }

  @override
  String get disconnectConfirmBody =>
      'آپ ہوم اسکرین سے کسی بھی وقت دوبارہ جڑ سکتے ہیں۔';

  @override
  String get cancelButton => 'منسوخ کریں۔';

  @override
  String get saveButton => 'محفوظ کریں۔';

  @override
  String get customNickname => 'حسب ضرورت عرفی نام';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name کا جوڑا ختم کریں؟';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'یہ اس فون پر آپ کے روبوٹس سے $name کو ہٹا دے گا۔ آپ اسے کسی بھی وقت دوبارہ شامل کر سکتے ہیں۔\n\nنوٹ: روبوٹ میموری کو مکمل طور پر صاف کرنے اور فیکٹری ڈیفالٹس کو بحال کرنے کے لیے، \"فیکٹری ری سیٹ\" استعمال کریں۔';
  }

  @override
  String get unpairButton => 'جوڑا ختم کریں۔';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'چل رہا ہے۔';

  @override
  String get machineEstop => 'ای اسٹاپ';

  @override
  String get machineError => 'غلطی';

  @override
  String get machineCalibrating => 'کیلیبریٹنگ';

  @override
  String ledLabel(Object state) {
    return 'ایل ای ڈی: $state';
  }

  @override
  String get ledSaved => 'محفوظ کیا گیا۔';

  @override
  String get ledInputErr => 'ان پٹ غلطی';

  @override
  String get ledPairing => 'جوڑا بنانا';

  @override
  String get ledConnected => 'منسلک';

  @override
  String get ledIdentify => 'شناخت کریں۔';

  @override
  String get identifyButton => 'شناخت کریں۔';

  @override
  String get identifyingToast => '3 سیکنڈ کے لیے چمکتا ہوا روبوٹ ایل ای ڈی...';

  @override
  String get homingToast => 'تمام فلیپس کو ہومنگ...';

  @override
  String get i2cFault => 'I2C غلطی';

  @override
  String get storageFault => 'اسٹوریج فالٹ';

  @override
  String get estopLatched => 'ای اسٹاپ لیچڈ';

  @override
  String get presetButtonsTitle => 'پری سیٹ بٹن';

  @override
  String customizePresetTitle(Object label) {
    return 'حسب ضرورت بنائیں $label';
  }

  @override
  String get subtitleNameLabel => 'ذیلی عنوان کا نام';

  @override
  String get subtitleNameHint => 'جیسے فوری فولڈ، شرٹس، حسب ضرورت...';

  @override
  String get buttonColorLabel => 'بٹن کا رنگ';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'مرحلہ $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'ایمرجنسی اسٹاپ';

  @override
  String get clearEstop => 'ای سٹاپ کو صاف کریں اور انلچ کریں۔';

  @override
  String get clearEstopHint =>
      'ایمرجنسی اسٹاپ کو ری سیٹ کرتا ہے اور روبوٹ کو Idle پر لوٹاتا ہے۔';

  @override
  String get stopButton => 'سٹاپ';

  @override
  String get fabricaArrangementTitle => 'فیبریکا بندوبست';

  @override
  String get editArrangement => 'ترتیب میں ترمیم کریں۔';

  @override
  String get addPanel => 'پینل شامل کریں۔';

  @override
  String get legendMotorized => 'موٹرائزڈ';

  @override
  String get legendFollower => 'پیروکار';

  @override
  String get legendBase => 'بیس';

  @override
  String get colsLabel => 'کولس';

  @override
  String get rowsLabel => 'قطاریں';

  @override
  String stepSelectedHint(Object step) {
    return 'مرحلہ $step منتخب کیا گیا: گرڈ پر 1–2 موٹرائزڈ پینلز کو تھپتھپائیں۔';
  }

  @override
  String get tapPanelsHint => 'گرڈ پر 1-2 موٹر پینلز کو تھپتھپائیں۔';

  @override
  String get dualBadge => 'دوہری';

  @override
  String get requiresMotorizedPanel =>
      'کم از کم 1 موٹر والا پینل درکار ہے (زیادہ سے زیادہ 2)';

  @override
  String get selectedChangePanelsHint =>
      'منتخب کردہ • تبدیل کرنے کے لیے گرڈ پینلز کو تھپتھپائیں (زیادہ سے زیادہ 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'مرحلہ $step از $total';
  }

  @override
  String get removeStepTooltip => 'مرحلہ کو ہٹا دیں۔';

  @override
  String get requiresMotorizedModuleWarning =>
      'روٹین کے لیے فیبریکا ارینجمنٹ سے کم از کم ایک موٹرائزڈ ماڈیول درکار ہے۔';

  @override
  String get routineFull => 'روٹین مکمل (16/16 مراحل)';

  @override
  String addStepCount(Object count) {
    return 'قدم شامل کریں ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'روٹین کو روبوٹ میں محفوظ کریں۔';

  @override
  String get selectButtonToProgram =>
      'اس روٹین کے ساتھ پروگرام کرنے کے لیے ایک فزیکل روبوٹ بٹن منتخب کریں:';

  @override
  String buttonNumber(Object slot) {
    return 'بٹن $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'ہارڈ ویئر بٹن $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'بٹن $slot سب ٹائٹل (اختیاری)';
  }

  @override
  String get saveToRobotButton => 'روبوٹ میں محفوظ کریں۔';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'بٹن $slot ($count قدم)';
  }

  @override
  String get adultTshirtTemplate => 'بالغوں کی ٹی شرٹ ٹیمپلیٹ';

  @override
  String get longSleeveTemplate => 'لمبی بازو ٹیمپلیٹ';

  @override
  String get dualSweepTemplate => 'ڈوئل سویپ ٹیمپلیٹ';

  @override
  String channelNumber(Object number) {
    return 'چینل $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count جوڑا';
  }

  @override
  String get moreHardwareOptions => 'مزید ہارڈ ویئر کے اختیارات';

  @override
  String get loadTemplate => 'لوڈ ٹیمپلیٹ';

  @override
  String get controllerLabel => 'کنٹرولر';

  @override
  String get motorBadge => 'موٹر';

  @override
  String get followerBadge => 'پیروکار';

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
