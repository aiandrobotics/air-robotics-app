// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AppLocalizationsKa extends AppLocalizations {
  AppLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'პარამეტრები';

  @override
  String get appLanguageTitle => 'აპლიკაციის ენა';

  @override
  String get appVersionTitle => 'აპლიკაციის ვერსია';

  @override
  String get languageSectionTitle => 'ენა';

  @override
  String get languageSystemDefault =>
      'სისტემის ნაგულისხმევი (მოწყობილობის ენა)';

  @override
  String get selectLanguageHint => 'აირჩიეთ ენა';

  @override
  String get addDeviceTitle => 'ახალი რობოტის დამატება';

  @override
  String get addDeviceSubtitle => 'დააწყვილეთ AIR რობოტები';

  @override
  String get yourRobots => 'თქვენი რობოტები';

  @override
  String get discoveredRobots => 'აღმოჩენილი რობოტები';

  @override
  String get noRobotsPairedYet => 'ჯერ არ არის დაწყვილებული რობოტები';

  @override
  String get noRobotsPairedSubtitle =>
      'შეაერთეთ თქვენი რობოტი ტელემეტრიის სანახავად, წინასწარ დაყენების სამართავად და ოპერაციების გასაკონტროლებლად.';

  @override
  String get addYourFirstRobot => 'დაამატეთ თქვენი პირველი რობოტი';

  @override
  String get autoScanning => 'ავტომატური სკანირება';

  @override
  String get idleStatus => 'უსაქმური';

  @override
  String get tabControl => 'კონტროლი';

  @override
  String get tabSequencer => 'სეკვენსერი';

  @override
  String get tabCalibrator => 'კალიბრატორი';

  @override
  String get tabDiagnostics => 'დიაგნოსტიკა';

  @override
  String get renameRobot => 'გადარქმევა რობოტი';

  @override
  String get bleDiagnostics => 'BLE დიაგნოსტიკა';

  @override
  String get erasePresets => 'წაშალეთ შენახული წინასწარ პარამეტრები';

  @override
  String get disconnect => 'გათიშვა';

  @override
  String get unpairRobot => 'რობოტის გაუწყვილება';

  @override
  String get factoryReset => 'ქარხნული გადატვირთვა';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'მთავარი ყველა';

  @override
  String get foldingTimeline => 'დასაკეცი ვადები';

  @override
  String get addStep => 'ნაბიჯის დამატება';

  @override
  String get previewOnRobot => 'გადახედვა რობოტზე';

  @override
  String get saveToButton => 'შენახვა ღილაკზე';

  @override
  String get themeTitle => 'თემა';

  @override
  String get themeSystem => 'მოწყობილობა';

  @override
  String get themeLight => 'სინათლე';

  @override
  String get themeDark => 'ბნელი';

  @override
  String get connectedBadge => 'დაკავშირებულია';

  @override
  String get inRangeBadge => 'დიაპაზონში';

  @override
  String get offlineBadge => 'ოფლაინ';

  @override
  String get openButton => 'გახსენით';

  @override
  String get connectButton => 'დაკავშირება';

  @override
  String get reconnectButton => 'ხელახლა დაკავშირება';

  @override
  String get pairAndConnect => 'დაწყვილება და დაკავშირება';

  @override
  String get autoScanningForRobots => 'ავტომატური სკანირება რობოტებისთვის...';

  @override
  String get scanningIdle => 'სკანირება უმოქმედოა';

  @override
  String get nearbyRobotsAppear =>
      'ახლომდებარე რობოტები აქ ავტომატურად გამოჩნდება.';

  @override
  String get yourNearbyRobotsAppear =>
      'თქვენი ახლომდებარე რობოტები აქ ავტომატურად გამოჩნდება.';

  @override
  String get signalStrong => 'ძლიერი';

  @override
  String get signalGood => 'კარგი';

  @override
  String get signalWeak => 'სუსტი';

  @override
  String get addRobotIntro =>
      'აირჩიეთ რობოტი ქვემოთ დასაწყვილებლად. ნებისმიერი ახლომდებარე რობოტი დაწყვილების რეჟიმში ავტომატურად აღმოჩენილი იქნება ზედა.';

  @override
  String get autoDiscoveredRobot => 'ავტომატური აღმოჩენილი რობოტი';

  @override
  String get autoDiscoveredRobots => 'ავტომატური აღმოჩენილი რობოტები';

  @override
  String readyCountBadge(Object count) {
    return '$count მზადაა';
  }

  @override
  String get supportedRobots => 'მხარდაჭერილი რობოტები';

  @override
  String get clothesFoldingRobot => 'ტანსაცმლის დასაკეცი რობოტი';

  @override
  String get fabricaDescription =>
      'ტანსაცმლის ავტომატური საქაღალდე მრავალ ტანსაცმლის წინასწარ დაყენებით და ერთი ღილაკით ტაქტილური მოქმედებით.';

  @override
  String get fabricaPairingHint =>
      'დაწყვილების რეჟიმი: დააჭირეთ და ხანგრძლივად დააჭირეთ Fabrica-ს მართვის პანელზე არსებულ ნებისმიერ ღილაკს 3 წამის განმავლობაში (სტატუსის LED სწრაფად ციმციმდება).';

  @override
  String get pairFabricaNow => 'დააწყვილეთ ქსოვილი ახლავე';

  @override
  String get backToHome => 'სახლში დაბრუნება';

  @override
  String get connReady => 'მზადაა';

  @override
  String get connConnecting => 'დაკავშირება';

  @override
  String get connDiscovering => 'აღმოჩენა';

  @override
  String get connBonding => 'შემაკავშირებელი';

  @override
  String get connScanning => 'სკანირება';

  @override
  String get connDisconnected => 'გათიშულია';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'გათიშვა $name-დან?';
  }

  @override
  String get disconnectConfirmBody =>
      'შეგიძლიათ ხელახლა დაკავშირება ნებისმიერ დროს საწყისი ეკრანიდან.';

  @override
  String get cancelButton => 'გაუქმება';

  @override
  String get saveButton => 'შენახვა';

  @override
  String get customNickname => 'მორგებული მეტსახელი';

  @override
  String unpairConfirmTitle(Object name) {
    return 'გაუქმდეს $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'ეს წაშლის $name-ს თქვენი რობოტებიდან ამ ტელეფონზე. შეგიძლიათ ხელახლა დაამატოთ ის ნებისმიერ დროს.\n\nშენიშვნა: რობოტის მეხსიერების სრულად წაშლისთვის და ქარხნული პარამეტრების აღსადგენად, გამოიყენეთ \"Factory Reset\".';
  }

  @override
  String get unpairButton => 'გაუქმება';

  @override
  String get machineIdle => 'უსაქმური';

  @override
  String get machineRunning => 'სირბილი';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'შეცდომა';

  @override
  String get machineCalibrating => 'კალიბრირება';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'შენახულია';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'დაწყვილება';

  @override
  String get ledConnected => 'დაკავშირებულია';

  @override
  String get ledIdentify => 'იდენტიფიცირება';

  @override
  String get identifyButton => 'იდენტიფიცირება';

  @override
  String get identifyingToast =>
      'ციმციმებს რობოტის LED 3 წამის განმავლობაში...';

  @override
  String get homingToast => 'ყველა ფლაკონის თავმოყრა...';

  @override
  String get i2cFault => 'I2C ბრალია';

  @override
  String get storageFault => 'შენახვის გაუმართაობა';

  @override
  String get estopLatched => 'E-STOP დამაგრებული';

  @override
  String get presetButtonsTitle => 'წინასწარ დაყენებული ღილაკები';

  @override
  String customizePresetTitle(Object label) {
    return 'მორგება $label';
  }

  @override
  String get subtitleNameLabel => 'სუბტიტრების სახელი';

  @override
  String get subtitleNameHint =>
      'მაგ. სწრაფი დასაკეცი, მაისურები, მორგებული...';

  @override
  String get buttonColorLabel => 'ღილაკის ფერი';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'ნაბიჯი $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'გადაუდებელი გაჩერება';

  @override
  String get clearEstop => 'CLEAR & UNLATCH E-STOP';

  @override
  String get clearEstopHint =>
      'აღადგენს საგანგებო გაჩერებას და აბრუნებს რობოტს უმოქმედო მდგომარეობაში';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'ფაბრიკას მოწყობა';

  @override
  String get editArrangement => 'რედაქტირება მოწყობა';

  @override
  String get addPanel => 'პანელის დამატება';

  @override
  String get legendMotorized => 'მოტორიზებული';

  @override
  String get legendFollower => 'მიმდევარი';

  @override
  String get legendBase => 'ბაზა';

  @override
  String get colsLabel => 'პოლკოვნიკები';

  @override
  String get rowsLabel => 'რიგები';

  @override
  String stepSelectedHint(Object step) {
    return 'არჩეულია ნაბიჯი $step: შეეხეთ 1–2 მოტორიზებულ პანელს ბადეზე';
  }

  @override
  String get tapPanelsHint => 'შეეხეთ 1–2 ძრავის პანელს ბადეზე';

  @override
  String get dualBadge => 'ორმაგი';

  @override
  String get requiresMotorizedPanel =>
      'საჭიროებს მინიმუმ 1 მოტორიზებულ პანელს (მაქსიმუმ 2)';

  @override
  String get selectedChangePanelsHint =>
      'არჩეულია • შესაცვლელად შეეხეთ ბადის პანელებს (მაქს. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'ნაბიჯი $step $total-დან';
  }

  @override
  String get removeStepTooltip => 'ნაბიჯის ამოღება';

  @override
  String get requiresMotorizedModuleWarning =>
      'რუტინას სჭირდება მინიმუმ ერთი მოტორიზებული მოდული Fabrica Arrangement-ისგან.';

  @override
  String get routineFull => 'რუტინა სრული (16/16 ნაბიჯი)';

  @override
  String addStepCount(Object count) {
    return 'ნაბიჯის დამატება ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'რუტინის შენახვა რობოტში';

  @override
  String get selectButtonToProgram =>
      'აირჩიეთ ფიზიკური რობოტის ღილაკი ამ რუტინით დასაპროგრამებლად:';

  @override
  String buttonNumber(Object slot) {
    return 'ღილაკი $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'აპარატურის ღილაკი $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'ღილაკი $slot სუბტიტრები (სურვილისამებრ)';
  }

  @override
  String get saveToRobotButton => 'შენახვა რობოტში';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'ღილაკი $slot ($count ნაბიჯი)';
  }

  @override
  String get adultTshirtTemplate => 'ზრდასრულთა მაისურის შაბლონი';

  @override
  String get longSleeveTemplate => 'გრძელი ყდის შაბლონი';

  @override
  String get dualSweepTemplate => 'Dual Sweep შაბლონი';

  @override
  String channelNumber(Object number) {
    return 'არხი $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count დაწყვილებული';
  }

  @override
  String get moreHardwareOptions => 'მეტი აპარატურის პარამეტრები';

  @override
  String get loadTemplate => 'შაბლონის ჩატვირთვა';

  @override
  String get controllerLabel => 'კონტროლერი';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'მიმდევარი';

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
