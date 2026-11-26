// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'تنظیمات';

  @override
  String get appLanguageTitle => 'زبان برنامه';

  @override
  String get appVersionTitle => 'نسخه برنامه';

  @override
  String get languageSectionTitle => 'زبان';

  @override
  String get languageSystemDefault => 'پیش‌فرض سیستم (زبان دستگاه)';

  @override
  String get selectLanguageHint => 'یک زبان انتخاب کنید';

  @override
  String get addDeviceTitle => 'افزودن ربات جدید';

  @override
  String get addDeviceSubtitle => 'ربات های AIR را جفت کنید';

  @override
  String get yourRobots => 'ربات های شما';

  @override
  String get discoveredRobots => 'ربات های کشف شده';

  @override
  String get noRobotsPairedYet => 'هنوز هیچ روباتی جفت نشده است';

  @override
  String get noRobotsPairedSubtitle =>
      'ربات خود را برای مشاهده تله متری، مدیریت از پیش تنظیم ها و کنترل عملیات وصل کنید.';

  @override
  String get addYourFirstRobot => 'اولین ربات خود را اضافه کنید';

  @override
  String get autoScanning => 'اسکن خودکار';

  @override
  String get idleStatus => 'بیکار';

  @override
  String get tabControl => 'کنترل کنید';

  @override
  String get tabSequencer => 'ترتیب دهنده';

  @override
  String get tabCalibrator => 'کالیبراتور';

  @override
  String get tabDiagnostics => 'تشخیص';

  @override
  String get renameRobot => 'تغییر نام ربات';

  @override
  String get bleDiagnostics => 'تشخیص BLE';

  @override
  String get erasePresets => 'پاک کردن تنظیمات از پیش ذخیره شده';

  @override
  String get disconnect => 'قطع کن';

  @override
  String get unpairRobot => 'لغو جفت ربات';

  @override
  String get factoryReset => 'تنظیم مجدد کارخانه';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'خانه همه';

  @override
  String get foldingTimeline => 'تایم لاین تاشو';

  @override
  String get addStep => 'مرحله را اضافه کنید';

  @override
  String get previewOnRobot => 'پیش نمایش در ربات';

  @override
  String get saveToButton => 'ذخیره در دکمه';

  @override
  String get themeTitle => 'موضوع';

  @override
  String get themeSystem => 'دستگاه';

  @override
  String get themeLight => 'نور';

  @override
  String get themeDark => 'تاریک';

  @override
  String get connectedBadge => 'متصل شد';

  @override
  String get inRangeBadge => 'در محدوده';

  @override
  String get offlineBadge => 'آفلاین';

  @override
  String get openButton => 'باز کردن';

  @override
  String get connectButton => 'اتصال';

  @override
  String get reconnectButton => 'دوباره وصل کنید';

  @override
  String get pairAndConnect => 'جفت کردن و اتصال';

  @override
  String get autoScanningForRobots => 'اسکن خودکار ربات ها ...';

  @override
  String get scanningIdle => 'اسکن بیکار';

  @override
  String get nearbyRobotsAppear =>
      'ربات های نزدیک به طور خودکار در اینجا ظاهر می شوند.';

  @override
  String get yourNearbyRobotsAppear =>
      'ربات های نزدیک شما به طور خودکار در اینجا ظاهر می شوند.';

  @override
  String get signalStrong => 'قوی';

  @override
  String get signalGood => 'خوب';

  @override
  String get signalWeak => 'ضعیف';

  @override
  String get addRobotIntro =>
      'ربات زیر را برای جفت شدن انتخاب کنید. هر ربات نزدیک در حالت جفت شدن به طور خودکار در بالا کشف می شود.';

  @override
  String get autoDiscoveredRobot => 'ربات خودکار کشف شده';

  @override
  String get autoDiscoveredRobots => 'ربات های خودکار کشف شده';

  @override
  String readyCountBadge(Object count) {
    return '$count آماده است';
  }

  @override
  String get supportedRobots => 'ربات های پشتیبانی شده';

  @override
  String get clothesFoldingRobot => 'ربات تاشو لباس';

  @override
  String get fabricaDescription =>
      'پوشه لباس خودکار با از پیش تنظیم چند لباس و عملکرد لمسی تک دکمه.';

  @override
  String get fabricaPairingHint =>
      'حالت جفت شدن: هر دکمه روی صفحه کنترل Fabrica را فشار داده و نگه دارید به مدت 3 ثانیه (ال ای دی وضعیت به سرعت چشمک می زند).';

  @override
  String get pairFabricaNow => 'اکنون پارچه را جفت کنید';

  @override
  String get backToHome => 'بازگشت به خانه';

  @override
  String get connReady => 'آماده است';

  @override
  String get connConnecting => 'در حال اتصال';

  @override
  String get connDiscovering => 'کشف کردن';

  @override
  String get connBonding => 'پیوند';

  @override
  String get connScanning => 'اسکن کردن';

  @override
  String get connDisconnected => 'قطع شد';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'اتصال از $name قطع شود؟';
  }

  @override
  String get disconnectConfirmBody =>
      'می‌توانید در هر زمان از صفحه اصلی دوباره وصل شوید.';

  @override
  String get cancelButton => 'لغو';

  @override
  String get saveButton => 'ذخیره کنید';

  @override
  String get customNickname => 'نام مستعار سفارشی';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name لغو جفت شود؟';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'با این کار $name از روبات های شما در این تلفن حذف می شود. در هر زمان می توانید آن را دوباره اضافه کنید.\n\nتوجه: برای پاک کردن کامل حافظه ربات و بازیابی تنظیمات پیش فرض کارخانه، از \"بازنشانی کارخانه\" استفاده کنید.';
  }

  @override
  String get unpairButton => 'لغو جفت کردن';

  @override
  String get machineIdle => 'بیکار';

  @override
  String get machineRunning => 'در حال اجرا';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'خطا';

  @override
  String get machineCalibrating => 'کالیبراسیون';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'ذخیره شد';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'جفت شدن';

  @override
  String get ledConnected => 'متصل شد';

  @override
  String get ledIdentify => 'شناسایی';

  @override
  String get identifyButton => 'شناسایی';

  @override
  String get identifyingToast => 'چراغ چشمک زن ربات به مدت 3 ثانیه...';

  @override
  String get homingToast => 'خانه کردن همه فلپ ها...';

  @override
  String get i2cFault => 'خطای I2C';

  @override
  String get storageFault => 'خطای ذخیره سازی';

  @override
  String get estopLatched => 'E-STOP چفت شده';

  @override
  String get presetButtonsTitle => 'دکمه های از پیش تعیین شده';

  @override
  String customizePresetTitle(Object label) {
    return 'سفارشی کردن $label';
  }

  @override
  String get subtitleNameLabel => 'نام زیرنویس';

  @override
  String get subtitleNameHint => 'به عنوان مثال تاشو سریع، پیراهن، سفارشی...';

  @override
  String get buttonColorLabel => 'رنگ دکمه';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'مرحله $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'توقف اضطراری';

  @override
  String get clearEstop => 'CLEAR & UNLATCH E-STOP';

  @override
  String get clearEstopHint =>
      'توقف اضطراری را بازنشانی می کند و ربات را به حالت بیکار باز می گرداند';

  @override
  String get stopButton => 'توقف';

  @override
  String get fabricaArrangementTitle => 'چیدمان پارچه';

  @override
  String get editArrangement => 'تنظیم ویرایش';

  @override
  String get addPanel => 'افزودن پنل';

  @override
  String get legendMotorized => 'موتوری';

  @override
  String get legendFollower => 'دنبال کننده';

  @override
  String get legendBase => 'پایه';

  @override
  String get colsLabel => 'سرهنگ ها';

  @override
  String get rowsLabel => 'ردیف ها';

  @override
  String stepSelectedHint(Object step) {
    return 'مرحله $step انتخاب شد: روی 1 تا 2 پانل موتوردار در شبکه ضربه بزنید';
  }

  @override
  String get tapPanelsHint => 'روی 1 تا 2 پانل موتور روی شبکه ضربه بزنید';

  @override
  String get dualBadge => 'دوگانه';

  @override
  String get requiresMotorizedPanel =>
      'به حداقل 1 پانل موتوردار (حداکثر 2) نیاز دارد';

  @override
  String get selectedChangePanelsHint =>
      'انتخاب شده • برای تغییر روی پانل های شبکه ضربه بزنید (حداکثر 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'مرحله $step از $total';
  }

  @override
  String get removeStepTooltip => 'مرحله را بردارید';

  @override
  String get requiresMotorizedModuleWarning =>
      'روتین حداقل به یک ماژول موتوریزه از Fabrica Arrangement نیاز دارد.';

  @override
  String get routineFull => 'روتین کامل (16/16 مرحله)';

  @override
  String addStepCount(Object count) {
    return 'ADD STEP ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Routine را در Robot ذخیره کنید';

  @override
  String get selectButtonToProgram =>
      'یک دکمه ربات فیزیکی را برای برنامه ریزی با این روال انتخاب کنید:';

  @override
  String buttonNumber(Object slot) {
    return 'دکمه $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'دکمه سخت افزار $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'دکمه $slot زیرنویس (اختیاری)';
  }

  @override
  String get saveToRobotButton => 'ذخیره در ربات';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'دکمه $slot ($count مرحله)';
  }

  @override
  String get adultTshirtTemplate => 'قالب تی شرت بزرگسال';

  @override
  String get longSleeveTemplate => 'قالب آستین بلند';

  @override
  String get dualSweepTemplate => 'قالب دوتایی';

  @override
  String channelNumber(Object number) {
    return 'کانال $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count جفت شده';
  }

  @override
  String get moreHardwareOptions => 'گزینه های سخت افزاری بیشتر';

  @override
  String get loadTemplate => 'بارگذاری قالب';

  @override
  String get controllerLabel => 'کنترلر';

  @override
  String get motorBadge => 'موتور';

  @override
  String get followerBadge => 'دنبال کننده';

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
