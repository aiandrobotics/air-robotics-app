// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get appLanguageTitle => 'অ্যাপের ভাষা';

  @override
  String get appVersionTitle => 'অ্যাপ সংস্করণ';

  @override
  String get languageSectionTitle => 'ভাষা';

  @override
  String get languageSystemDefault => 'সিস্টেম ডিফল্ট (ডিভাইসের ভাষা)';

  @override
  String get selectLanguageHint => 'একটি ভাষা নির্বাচন করুন';

  @override
  String get addDeviceTitle => 'নতুন রোবট যোগ করুন';

  @override
  String get addDeviceSubtitle => 'AIR রোবট পেয়ার করুন';

  @override
  String get yourRobots => 'আপনার রোবটসমূহ';

  @override
  String get discoveredRobots => 'খুঁজে পাওয়া রোবটসমূহ';

  @override
  String get noRobotsPairedYet => 'এখনও কোনো রোবট পেয়ার করা হয়নি';

  @override
  String get noRobotsPairedSubtitle =>
      'টেলিমেট্রি দেখতে, প্রিসেট পরিচালনা করতে এবং অপারেশন নিয়ন্ত্রণ করতে আপনার রোবট সংযুক্ত করুন।';

  @override
  String get addYourFirstRobot => 'আপনার প্রথম রোবট যোগ করুন';

  @override
  String get autoScanning => 'স্বয়ংক্রিয় স্ক্যানিং';

  @override
  String get idleStatus => 'নিষ্ক্রিয়';

  @override
  String get tabControl => 'নিয়ন্ত্রণ';

  @override
  String get tabSequencer => 'সিকোয়েন্সার';

  @override
  String get tabCalibrator => 'ক্যালিব্রেটর';

  @override
  String get tabDiagnostics => 'ডায়াগনস্টিকস';

  @override
  String get renameRobot => 'রোবটের নাম পরিবর্তন করুন';

  @override
  String get bleDiagnostics => 'BLE ডায়াগনস্টিকস';

  @override
  String get erasePresets => 'সংরক্ষিত প্রিসেট মুছুন';

  @override
  String get disconnect => 'সংযোগ বিচ্ছিন্ন করুন';

  @override
  String get unpairRobot => 'রোবট আনপেয়ার করুন';

  @override
  String get factoryReset => 'ফ্যাক্টরি রিসেট';

  @override
  String get servoManualJog => 'সার্ভো ম্যানুয়াল জোগ';

  @override
  String get homeAll => 'সব হোম করুন';

  @override
  String get foldingTimeline => 'ফোল্ডিং টাইমলাইন';

  @override
  String get addStep => 'ধাপ যোগ করুন';

  @override
  String get previewOnRobot => 'রোবটে প্রিভিউ';

  @override
  String get saveToButton => 'বাটনে সংরক্ষণ করুন';

  @override
  String get themeTitle => 'থিম';

  @override
  String get themeSystem => 'ডিভাইস';

  @override
  String get themeLight => 'লাইট';

  @override
  String get themeDark => 'ডার্ক';

  @override
  String get connectedBadge => 'সংযুক্ত';

  @override
  String get inRangeBadge => 'সীমার মধ্যে';

  @override
  String get offlineBadge => 'অফলাইন';

  @override
  String get openButton => 'খুলুন';

  @override
  String get connectButton => 'সংযুক্ত করুন';

  @override
  String get reconnectButton => 'পুনরায় সংযোগ';

  @override
  String get pairAndConnect => 'পেয়ার ও সংযোগ';

  @override
  String get autoScanningForRobots =>
      'রোবটের জন্য স্বয়ংক্রিয় স্ক্যান চলছে...';

  @override
  String get scanningIdle => 'স্ক্যানিং নিষ্ক্রিয়';

  @override
  String get nearbyRobotsAppear =>
      'কাছাকাছি রোবট স্বয়ংক্রিয়ভাবে এখানে দেখা যাবে।';

  @override
  String get yourNearbyRobotsAppear =>
      'আপনার কাছাকাছি রোবট স্বয়ংক্রিয়ভাবে এখানে দেখা যাবে।';

  @override
  String get signalStrong => 'শক্তিশালী';

  @override
  String get signalGood => 'ভালো';

  @override
  String get signalWeak => 'দুর্বল';

  @override
  String get addRobotIntro =>
      'পেয়ার করতে নিচে একটি রোবট নির্বাচন করুন। পেয়ারিং মোডে থাকা কাছাকাছি যেকোনো রোবট স্বয়ংক্রিয়ভাবে উপরে দেখা যাবে।';

  @override
  String get autoDiscoveredRobot => 'স্বয়ংক্রিয়ভাবে খুঁজে পাওয়া রোবট';

  @override
  String get autoDiscoveredRobots => 'স্বয়ংক্রিয়ভাবে খুঁজে পাওয়া রোবটসমূহ';

  @override
  String readyCountBadge(Object count) {
    return '$count প্রস্তুত';
  }

  @override
  String get supportedRobots => 'সমর্থিত রোবটসমূহ';

  @override
  String get clothesFoldingRobot => 'কাপড় ভাঁজ করার রোবট';

  @override
  String get fabricaDescription =>
      'মাল্টি-গার্মেন্ট প্রিসেট এবং এক-বাটন অপারেশনসহ স্বয়ংক্রিয় কাপড় ভাঁজ করার রোবট।';

  @override
  String get fabricaPairingHint =>
      'পেয়ারিং মোড: Fabrica কন্ট্রোল প্যানেলের যেকোনো বাটন ৩ সেকেন্ড চেপে ধরুন (স্ট্যাটাস LED দ্রুত জ্বলবে)।';

  @override
  String get pairFabricaNow => 'এখনই FABRICA পেয়ার করুন';

  @override
  String get backToHome => 'হোমে ফিরুন';

  @override
  String get connReady => 'প্রস্তুত';

  @override
  String get connConnecting => 'সংযোগ হচ্ছে';

  @override
  String get connDiscovering => 'খোঁজা হচ্ছে';

  @override
  String get connBonding => 'বন্ডিং হচ্ছে';

  @override
  String get connScanning => 'স্ক্যানিং';

  @override
  String get connDisconnected => 'বিচ্ছিন্ন';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name থেকে সংযোগ বিচ্ছিন্ন করবেন?';
  }

  @override
  String get disconnectConfirmBody =>
      'আপনি হোম স্ক্রিন থেকে যেকোনো সময় পুনরায় সংযোগ করতে পারবেন।';

  @override
  String get cancelButton => 'বাতিল';

  @override
  String get saveButton => 'সংরক্ষণ';

  @override
  String get customNickname => 'কাস্টম ডাকনাম';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name আনপেয়ার করবেন?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'এটি এই ফোনের আপনার রোবট তালিকা থেকে $name সরিয়ে দেবে। আপনি যেকোনো সময় আবার যোগ করতে পারবেন।\n\nদ্রষ্টব্য: রোবটের মেমরি সম্পূর্ণ মুছে ফ্যাক্টরি ডিফল্ট ফিরিয়ে আনতে \"ফ্যাক্টরি রিসেট\" ব্যবহার করুন।';
  }

  @override
  String get unpairButton => 'আনপেয়ার';

  @override
  String get machineIdle => 'নিষ্ক্রিয়';

  @override
  String get machineRunning => 'চলছে';

  @override
  String get machineEstop => 'ই-স্টপ';

  @override
  String get machineError => 'ত্রুটি';

  @override
  String get machineCalibrating => 'ক্যালিব্রেট হচ্ছে';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'সংরক্ষিত';

  @override
  String get ledInputErr => 'ইনপুট ত্রুটি';

  @override
  String get ledPairing => 'পেয়ারিং';

  @override
  String get ledConnected => 'সংযুক্ত';

  @override
  String get ledIdentify => 'শনাক্ত';

  @override
  String get identifyButton => 'শনাক্ত করুন';

  @override
  String get identifyingToast => '৩ সেকেন্ডের জন্য রোবট LED জ্বলছে...';

  @override
  String get homingToast => 'সব ফ্ল্যাপ হোম পজিশনে যাচ্ছে...';

  @override
  String get i2cFault => 'I2C ত্রুটি';

  @override
  String get storageFault => 'স্টোরেজ ত্রুটি';

  @override
  String get estopLatched => 'ই-স্টপ ল্যাচড';

  @override
  String get presetButtonsTitle => 'প্রিসেট বাটনসমূহ';

  @override
  String customizePresetTitle(Object label) {
    return '$label কাস্টমাইজ করুন';
  }

  @override
  String get subtitleNameLabel => 'সাবটাইটেল নাম';

  @override
  String get subtitleNameHint => 'যেমন: দ্রুত ভাঁজ, শার্ট, কাস্টম...';

  @override
  String get buttonColorLabel => 'বাটনের রঙ';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'ধাপ $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'জরুরি থামান';

  @override
  String get clearEstop => 'ই-স্টপ পরিষ্কার ও আনল্যাচ করুন';

  @override
  String get clearEstopHint =>
      'জরুরি থামা রিসেট করে এবং রোবটকে নিষ্ক্রিয় অবস্থায় ফেরায়';

  @override
  String get stopButton => 'থামান';

  @override
  String get fabricaArrangementTitle => 'FABRICA বিন্যাস';

  @override
  String get editArrangement => 'বিন্যাস সম্পাদনা';

  @override
  String get addPanel => 'প্যানেল যোগ করুন';

  @override
  String get legendMotorized => 'মোটরচালিত';

  @override
  String get legendFollower => 'ফলোয়ার';

  @override
  String get legendBase => 'বেস';

  @override
  String get colsLabel => 'কলাম';

  @override
  String get rowsLabel => 'সারি';

  @override
  String stepSelectedHint(Object step) {
    return 'ধাপ $step নির্বাচিত: গ্রিডে ১–২টি মোটরচালিত প্যানেল ট্যাপ করুন';
  }

  @override
  String get tapPanelsHint => 'গ্রিডে ১–২টি মোটর প্যানেল ট্যাপ করুন';

  @override
  String get dualBadge => 'ডুয়াল';

  @override
  String get requiresMotorizedPanel =>
      'কমপক্ষে ১টি মোটরচালিত প্যানেল প্রয়োজন (সর্বোচ্চ ২)';

  @override
  String get selectedChangePanelsHint =>
      'নির্বাচিত • পরিবর্তন করতে গ্রিড প্যানেল ট্যাপ করুন (সর্বোচ্চ ২)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'ধাপ $step / $total';
  }

  @override
  String get removeStepTooltip => 'ধাপ সরান';

  @override
  String get requiresMotorizedModuleWarning =>
      'রুটিনের জন্য Fabrica বিন্যাস থেকে কমপক্ষে একটি মোটরচালিত মডিউল প্রয়োজন।';

  @override
  String get routineFull => 'রুটিন পূর্ণ (১৬/১৬ ধাপ)';

  @override
  String addStepCount(Object count) {
    return 'ধাপ যোগ করুন ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'রোবটে রুটিন সংরক্ষণ করুন';

  @override
  String get selectButtonToProgram =>
      'এই রুটিন প্রোগ্রাম করতে একটি ফিজিক্যাল রোবট বাটন নির্বাচন করুন:';

  @override
  String buttonNumber(Object slot) {
    return 'বাটন $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'হার্ডওয়্যার বাটন $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'বাটন $slot সাবটাইটেল (ঐচ্ছিক)';
  }

  @override
  String get saveToRobotButton => 'রোবটে সংরক্ষণ করুন';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'বাটন $slot ($count ধাপ)';
  }

  @override
  String get adultTshirtTemplate => 'বড় টি-শার্ট টেমপ্লেট';

  @override
  String get longSleeveTemplate => 'লং স্লিভ টেমপ্লেট';

  @override
  String get dualSweepTemplate => 'ডুয়াল সুইপ টেমপ্লেট';

  @override
  String channelNumber(Object number) {
    return 'চ্যানেল $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count জোড়া হয়েছে';
  }

  @override
  String get moreHardwareOptions => 'আরও হার্ডওয়্যার বিকল্প';

  @override
  String get loadTemplate => 'টেমপ্লেট লোড করুন';

  @override
  String get controllerLabel => 'কন্ট্রোলার';

  @override
  String get motorBadge => 'মোটর';

  @override
  String get followerBadge => 'অনুগামী';

  @override
  String get baseBadge => 'বেস';

  @override
  String pairModelTitle(Object model) {
    return '$model পেয়ার করুন';
  }

  @override
  String get stopScan => 'স্ক্যান থামান';

  @override
  String get rescan => 'পুনরায় স্ক্যান করুন';

  @override
  String searchingForNearby(Object model) {
    return 'কাছাকাছি $model খোঁজা হচ্ছে...';
  }

  @override
  String get scanPaused => 'স্ক্যান বিরতি';

  @override
  String filteringForBle(Object prefix) {
    return '\"$prefix*\" BLE বিজ্ঞাপনের জন্য ফিল্টার করা হচ্ছে';
  }

  @override
  String get tapRefreshToRestart =>
      'স্ক্যান পুনরায় শুরু করতে উপরের বারে রিফ্রেশ বোতামে ট্যাপ করুন';

  @override
  String get fabricaPairingInstructions => 'ফ্যাব্রিকা পেয়ারিং নির্দেশাবলী';

  @override
  String get pairingProcedure => 'পেয়ারিং পদ্ধতি';

  @override
  String get pairStep1Fabrica => 'আপনার ফ্যাব্রিকা রোবট চালু করুন।';

  @override
  String get pairStep2Fabrica =>
      'পেয়ারিং মোডে প্রবেশ করতে ফ্যাব্রিকা কন্ট্রোল প্যানেলে যেকোনো বোতাম ৩ সেকেন্ড ধরে রাখুন।';

  @override
  String get pairStep3Fabrica =>
      'পেয়ারিং মোড সক্রিয় হয়েছে তা নিশ্চিত করতে স্ট্যাটাস LED দ্রুত জ্বলবে।';

  @override
  String pairStep1Generic(Object model) {
    return 'আপনার $model রোবট চালু করুন।';
  }

  @override
  String get pairStep2Generic =>
      'নিশ্চিত করুন যে রোবটে ব্লুটুথ পেয়ারিং মোড সক্রিয় রয়েছে।';

  @override
  String searchingForModel(Object model) {
    return '$model খোঁজা হচ্ছে...';
  }

  @override
  String get noMatchingRobotsYet => 'এখনো কোনো মিল পাওয়া রোবট আবিষ্কৃত হয়নি';

  @override
  String get makeSureRobotPowered =>
      'নিশ্চিত করুন আপনার রোবট চালু আছে এবং পরিসরের মধ্যে রয়েছে।';

  @override
  String get checkPowerSwitch =>
      'পাওয়ার সুইচ পরীক্ষা করুন এবং স্ক্যান পুনরায় শুরু করতে উপরের ডানদিকের আইকনে ট্যাপ করুন।';

  @override
  String failedToConnect(Object error, Object name) {
    return '$name-এর সাথে সংযোগ করতে ব্যর্থ: $error';
  }

  @override
  String get restoreDefaultPresetsTitle =>
      'ডিফল্ট বোতাম প্রিসেট পুনরুদ্ধার করবেন?';

  @override
  String get restoreDefaultPresetsBody =>
      'এটি রোবটের সমস্ত কাস্টম বোতাম রুটিন মুছে ফেলবে এবং বোতাম ১–৪ তাদের ডিফল্ট প্রিসেটে রিসেট করবে।\n\nআপনি কি এগিয়ে যেতে চান?';

  @override
  String get presetsRestoredToast =>
      'রোবটের সমস্ত বোতাম প্রিসেট ডিফল্টে পুনরুদ্ধার করা হয়েছে।';

  @override
  String get eraseAllPresetsButton => 'রোবটের সমস্ত প্রিসেট মুছুন';

  @override
  String get factoryResetTitle => 'ফ্যাব্রিকা ফ্যাক্টরি রিসেট?';

  @override
  String get factoryResetBody =>
      'এটি ফ্যাব্রিকাকে ফ্যাক্টরি ডিফল্টে রিসেট করবে:\n\n• মেমরির সমস্ত কাস্টম রুটিন মুছে দেয় এবং ফ্যাক্টরি ডিফল্ট পুনরুদ্ধার করে।\n• সমস্ত ফ্ল্যাপকে হোম অবস্থানে (0°) সমতল ফিরিয়ে আনে।\n• সংরক্ষিত ব্লুটুথ পেয়ারিং কীগুলি পরিষ্কার করে।\n• ব্লুটুথ সংযোগ বিচ্ছিন্ন করে এবং পেয়ারিং মোড পুনরায় শুরু করে।\n\nএই ফোনের আপনার ডিভাইসগুলি থেকে রোবটটি সরানো হবে।';

  @override
  String get executingFactoryReset => 'ফ্যাব্রিকা ফ্যাক্টরি রিসেট চলছে...';

  @override
  String get resetEverythingButton => 'সবকিছু রিসেট করুন';

  @override
  String get editFabricaArrangementTitle => 'ফ্যাব্রিকা বিন্যাস সম্পাদনা করুন';

  @override
  String get doneButton => 'সম্পন্ন';

  @override
  String moduleNumber(Object number) {
    return 'মডিউল #$number';
  }

  @override
  String pairingModeHintError(Object name) {
    return '$name-এর সাথে পেয়ার করা যায়নি। নিশ্চিত করুন রোবটটি পেয়ারিং মোডে আছে (LED দ্রুত জ্বলা পর্যন্ত যেকোনো বোতাম ৩ সেকেন্ড ধরে রাখুন) এবং আবার চেষ্টা করুন।';
  }
}
