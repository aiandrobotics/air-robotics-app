// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get appLanguageTitle => 'لغة التطبيق';

  @override
  String get appVersionTitle => 'إصدار التطبيق';

  @override
  String get languageSectionTitle => 'اللغة';

  @override
  String get languageSystemDefault => 'افتراضي النظام (لغة الجهاز)';

  @override
  String get selectLanguageHint => 'اختر لغة';

  @override
  String get addDeviceTitle => 'إضافة روبوت جديد';

  @override
  String get addDeviceSubtitle => 'إقران روبوتات AIR';

  @override
  String get yourRobots => 'روبوتاتك';

  @override
  String get discoveredRobots => 'الروبوتات المكتشفة';

  @override
  String get noRobotsPairedYet => 'لم يتم إقران أي روبوت بعد';

  @override
  String get noRobotsPairedSubtitle =>
      'قم بتوصيل الروبوت الخاص بك لعرض القياس عن بعد وإدارة الإعدادات المسبقة وعمليات التحكم.';

  @override
  String get addYourFirstRobot => 'أضف أول روبوت لك';

  @override
  String get autoScanning => 'المسح التلقائي';

  @override
  String get idleStatus => 'عاطل';

  @override
  String get tabControl => 'يتحكم';

  @override
  String get tabSequencer => 'التسلسل';

  @override
  String get tabCalibrator => 'المعاير';

  @override
  String get tabDiagnostics => 'التشخيص';

  @override
  String get renameRobot => 'إعادة تسمية الروبوت';

  @override
  String get bleDiagnostics => 'تشخيص بليه';

  @override
  String get erasePresets => 'مسح الإعدادات المسبقة المحفوظة';

  @override
  String get disconnect => 'قطع الاتصال';

  @override
  String get unpairRobot => 'إلغاء إقران الروبوت';

  @override
  String get factoryReset => 'إعادة ضبط المصنع';

  @override
  String get servoManualJog => 'تشغيل يدوي مؤازر';

  @override
  String get homeAll => 'الصفحة الرئيسية الكل';

  @override
  String get foldingTimeline => 'الجدول الزمني للطي';

  @override
  String get addStep => 'أضف خطوة';

  @override
  String get previewOnRobot => 'معاينة على الروبوت';

  @override
  String get saveToButton => 'حفظ إلى الزر';

  @override
  String get themeTitle => 'سمة';

  @override
  String get themeSystem => 'جهاز';

  @override
  String get themeLight => 'ضوء';

  @override
  String get themeDark => 'مظلم';

  @override
  String get connectedBadge => 'متصل';

  @override
  String get inRangeBadge => 'في النطاق';

  @override
  String get offlineBadge => 'غير متصل';

  @override
  String get openButton => 'يفتح';

  @override
  String get connectButton => 'يتصل';

  @override
  String get reconnectButton => 'إعادة الاتصال';

  @override
  String get pairAndConnect => 'إقران واتصال';

  @override
  String get autoScanningForRobots => 'المسح التلقائي للروبوتات...';

  @override
  String get scanningIdle => 'المسح خاملاً';

  @override
  String get nearbyRobotsAppear => 'ستظهر الروبوتات القريبة هنا تلقائيًا.';

  @override
  String get yourNearbyRobotsAppear =>
      'ستظهر الروبوتات القريبة منك هنا تلقائيًا.';

  @override
  String get signalStrong => 'قوي';

  @override
  String get signalGood => 'جيد';

  @override
  String get signalWeak => 'ضعيف';

  @override
  String get addRobotIntro =>
      'حدد الروبوت أدناه للاقتران. سيتم اكتشاف أي روبوت قريب في وضع الاقتران تلقائيًا في الأعلى.';

  @override
  String get autoDiscoveredRobot => 'روبوت تم اكتشافه تلقائيًا';

  @override
  String get autoDiscoveredRobots => 'الروبوتات المكتشفة تلقائيًا';

  @override
  String readyCountBadge(Object count) {
    return '$count جاهز';
  }

  @override
  String get supportedRobots => 'الروبوتات المدعومة';

  @override
  String get clothesFoldingRobot => 'روبوت لطي الملابس';

  @override
  String get fabricaDescription =>
      'مجلد ملابس آلي مزود بإعدادات مسبقة متعددة الملابس وتشغيل باللمس بزر واحد.';

  @override
  String get fabricaPairingHint =>
      'وضع الاقتران: اضغط مع الاستمرار على أي زر في لوحة تحكم Fabrica لمدة 3 ثوانٍ (سيومض مؤشر الحالة بسرعة).';

  @override
  String get pairFabricaNow => 'قم بإقران المصنع الآن';

  @override
  String get backToHome => 'العودة إلى المنزل';

  @override
  String get connReady => 'مستعد';

  @override
  String get connConnecting => 'الاتصال';

  @override
  String get connDiscovering => 'الاكتشاف';

  @override
  String get connBonding => 'الترابط';

  @override
  String get connScanning => 'مسح';

  @override
  String get connDisconnected => 'غير متصل';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'هل تريد قطع الاتصال بـ $name؟';
  }

  @override
  String get disconnectConfirmBody =>
      'يمكنك إعادة الاتصال في أي وقت من الشاشة الرئيسية.';

  @override
  String get cancelButton => 'يلغي';

  @override
  String get saveButton => 'يحفظ';

  @override
  String get customNickname => 'اللقب المخصص';

  @override
  String unpairConfirmTitle(Object name) {
    return 'إلغاء الاقتران $name؟';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'سيؤدي هذا إلى إزالة $name من الروبوتات الخاصة بك على هذا الهاتف. ويمكنك إعادة إضافته في أي وقت.\n\nملحوظة: لمسح ذاكرة الروبوت بالكامل واستعادة إعدادات المصنع الافتراضية، استخدم \"إعادة ضبط المصنع\".';
  }

  @override
  String get unpairButton => 'إلغاء الاقتران';

  @override
  String get machineIdle => 'عاطل';

  @override
  String get machineRunning => 'جري';

  @override
  String get machineEstop => 'أوقف';

  @override
  String get machineError => 'خطأ';

  @override
  String get machineCalibrating => 'المعايرة';

  @override
  String ledLabel(Object state) {
    return 'الصمام: $state';
  }

  @override
  String get ledSaved => 'أنقذ';

  @override
  String get ledInputErr => 'خطأ الإدخال';

  @override
  String get ledPairing => 'الاقتران';

  @override
  String get ledConnected => 'متصل';

  @override
  String get ledIdentify => 'تعريف';

  @override
  String get identifyButton => 'تعريف';

  @override
  String get identifyingToast => 'وميض LED للروبوت لمدة 3 ثواني...';

  @override
  String get homingToast => 'تهكير جميع اللوحات...';

  @override
  String get i2cFault => 'خطأ I2C';

  @override
  String get storageFault => 'خطأ في التخزين';

  @override
  String get estopLatched => 'توقف إلكتروني مغلق';

  @override
  String get presetButtonsTitle => 'أزرار محددة مسبقا';

  @override
  String customizePresetTitle(Object label) {
    return 'تخصيص $label';
  }

  @override
  String get subtitleNameLabel => 'اسم الترجمة';

  @override
  String get subtitleNameHint =>
      'على سبيل المثال الطية السريعة، القمصان، العرف...';

  @override
  String get buttonColorLabel => 'لون الزر';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'الخطوة $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'توقف الطوارئ';

  @override
  String get clearEstop => 'مسح وفتح E-STOP';

  @override
  String get clearEstopHint =>
      'إعادة ضبط التوقف في حالات الطوارئ وإعادة الروبوت إلى وضع الخمول';

  @override
  String get stopButton => 'قف';

  @override
  String get fabricaArrangementTitle => 'ترتيب المصنع';

  @override
  String get editArrangement => 'تعديل الترتيب';

  @override
  String get addPanel => 'إضافة لوحة';

  @override
  String get legendMotorized => 'بمحركات';

  @override
  String get legendFollower => 'تابع';

  @override
  String get legendBase => 'قاعدة';

  @override
  String get colsLabel => 'كولز';

  @override
  String get rowsLabel => 'الصفوف';

  @override
  String stepSelectedHint(Object step) {
    return 'الخطوة $step المحددة: اضغط على 1–2 من اللوحات الآلية الموجودة على الشبكة';
  }

  @override
  String get tapPanelsHint => 'اضغط على 1-2 لوحات المحرك على الشبكة';

  @override
  String get dualBadge => 'مزدوج';

  @override
  String get requiresMotorizedPanel =>
      'يتطلب لوحة آلية واحدة على الأقل (بحد أقصى 2)';

  @override
  String get selectedChangePanelsHint =>
      'تم التحديد • اضغط على لوحات الشبكة للتغيير (2 كحد أقصى)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'الخطوة $step من $total';
  }

  @override
  String get removeStepTooltip => 'إزالة الخطوة';

  @override
  String get requiresMotorizedModuleWarning =>
      'يتطلب الروتين وحدة آلية واحدة على الأقل من ترتيب فابريكا.';

  @override
  String get routineFull => 'روتين كامل (16/16 خطوة)';

  @override
  String addStepCount(Object count) {
    return 'إضافة خطوة ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'حفظ الروتين إلى الروبوت';

  @override
  String get selectButtonToProgram =>
      'حدد زرًا فعليًا للروبوت للبرمجة باستخدام هذا الروتين:';

  @override
  String buttonNumber(Object slot) {
    return 'الزر $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'زر الأجهزة $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'الزر $slot الترجمة (اختياري)';
  }

  @override
  String get saveToRobotButton => 'حفظ للروبوت';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'الزر $slot ($count خطوات)';
  }

  @override
  String get adultTshirtTemplate => 'قالب تي شيرت للكبار';

  @override
  String get longSleeveTemplate => 'قالب كم طويل';

  @override
  String get dualSweepTemplate => 'قالب الاجتياح المزدوج';

  @override
  String channelNumber(Object number) {
    return 'القناة $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count مقترن';
  }

  @override
  String get moreHardwareOptions => 'المزيد من خيارات الأجهزة';

  @override
  String get loadTemplate => 'تحميل القالب';

  @override
  String get controllerLabel => 'وحدة التحكم';

  @override
  String get motorBadge => 'المحرك';

  @override
  String get followerBadge => 'متابع';

  @override
  String get baseBadge => 'قاعدة';

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
