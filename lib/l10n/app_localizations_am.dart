// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'ቅንብሮች';

  @override
  String get appLanguageTitle => 'የመተግበሪያ ቋንቋ';

  @override
  String get appVersionTitle => 'የመተግበሪያ ሥሪት';

  @override
  String get languageSectionTitle => 'ቋንቋ';

  @override
  String get languageSystemDefault => 'የስርዓት ነባሪ (የመሳሪያ ቋንቋ)';

  @override
  String get selectLanguageHint => 'ቋንቋ ይምረጡ';

  @override
  String get addDeviceTitle => 'አዲስ ሮቦት ጨምር';

  @override
  String get addDeviceSubtitle => 'AIR ሮቦቶችን ያጣምሩ';

  @override
  String get yourRobots => 'የእርስዎ ሮቦቶች';

  @override
  String get discoveredRobots => 'የተገኙ ሮቦቶች';

  @override
  String get noRobotsPairedYet => 'እስካሁን ምንም ሮቦቶች አልተጣመሩም።';

  @override
  String get noRobotsPairedSubtitle =>
      'ቴሌሜትሪ ለማየት፣ ቅድመ-ቅምጦችን ለማስተዳደር እና ስራዎችን ለመቆጣጠር ሮቦትዎን ያገናኙ።';

  @override
  String get addYourFirstRobot => 'የመጀመሪያውን ሮቦት ጨምር';

  @override
  String get autoScanning => 'ራስ-ሰር ቅኝት';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'ቁጥጥር';

  @override
  String get tabSequencer => 'ተከታታይ';

  @override
  String get tabCalibrator => 'Calibrator';

  @override
  String get tabDiagnostics => 'ምርመራዎች';

  @override
  String get renameRobot => 'ሮቦትን እንደገና ይሰይሙ';

  @override
  String get bleDiagnostics => 'BLE ምርመራዎች';

  @override
  String get erasePresets => 'የተቀመጡ ቅድመ-ቅምጦችን ደምስስ';

  @override
  String get disconnect => 'ግንኙነት አቋርጥ';

  @override
  String get unpairRobot => 'ሮቦትን አታጣምር';

  @override
  String get factoryReset => 'የፋብሪካ ዳግም ማስጀመር';

  @override
  String get servoManualJog => 'SERVO ማንዋል JOG';

  @override
  String get homeAll => 'ቤት ሁሉም';

  @override
  String get foldingTimeline => 'የሚታጠፍ የጊዜ መስመር';

  @override
  String get addStep => 'ደረጃ ጨምር';

  @override
  String get previewOnRobot => 'በሮቦት ላይ ቅድመ እይታ';

  @override
  String get saveToButton => 'ወደ ቁልፍ አስቀምጥ';

  @override
  String get themeTitle => 'ጭብጥ';

  @override
  String get themeSystem => 'መሳሪያ';

  @override
  String get themeLight => 'ብርሃን';

  @override
  String get themeDark => 'ጨለማ';

  @override
  String get connectedBadge => 'ተገናኝቷል።';

  @override
  String get inRangeBadge => 'ክልል ውስጥ';

  @override
  String get offlineBadge => 'ከመስመር ውጭ';

  @override
  String get openButton => 'ክፈት';

  @override
  String get connectButton => 'ተገናኝ';

  @override
  String get reconnectButton => 'እንደገና ተገናኝ';

  @override
  String get pairAndConnect => 'ያጣምሩ እና ይገናኙ';

  @override
  String get autoScanningForRobots => 'ሮቦቶችን በራስ-ሰር በመቃኘት ላይ...';

  @override
  String get scanningIdle => 'ስራ ፈትቶ በመቃኘት ላይ';

  @override
  String get nearbyRobotsAppear => 'በአቅራቢያ ያሉ ሮቦቶች በራስ-ሰር እዚህ ይታያሉ።';

  @override
  String get yourNearbyRobotsAppear => 'በአቅራቢያዎ ያሉ ሮቦቶች በራስ-ሰር እዚህ ይታያሉ።';

  @override
  String get signalStrong => 'ጠንካራ';

  @override
  String get signalGood => 'ጥሩ';

  @override
  String get signalWeak => 'ደካማ';

  @override
  String get addRobotIntro =>
      'ለማጣመር ከዚህ በታች ሮቦት ይምረጡ። በማጣመር ሁነታ ላይ ያለ ማንኛውም ሮቦት በራስ ሰር ከላይ ይገኛል።';

  @override
  String get autoDiscoveredRobot => 'በራስ-ሰር የተገኘ ሮቦት';

  @override
  String get autoDiscoveredRobots => 'በራስ-ሰር የተገኙ ሮቦቶች';

  @override
  String readyCountBadge(Object count) {
    return '$count ዝግጁ';
  }

  @override
  String get supportedRobots => 'የሚደገፉ ሮቦቶች';

  @override
  String get clothesFoldingRobot => 'ልብስ የሚታጠፍ ሮቦት';

  @override
  String get fabricaDescription =>
      'አውቶማቲክ የልብስ ማህደር ባለብዙ ልብስ ቅድመ-ቅምጦች እና የሚነካ ነጠላ-ቁልፍ አሰራር።';

  @override
  String get fabricaPairingHint =>
      'የማጣመጃ ሁነታ፡ በፋብሪካው የቁጥጥር ፓነል ላይ ያለውን ማንኛውንም ቁልፍ ተጭነው ለ3 ሰከንድ ይቆዩ (ሁኔታ LED በፍጥነት ብልጭ ድርግም ይላል)።';

  @override
  String get pairFabricaNow => 'ጨርቅ አሁን አጣምር';

  @override
  String get backToHome => 'ወደ ቤት ተመለስ';

  @override
  String get connReady => 'ዝግጁ';

  @override
  String get connConnecting => 'በመገናኘት ላይ';

  @override
  String get connDiscovering => 'ማግኘት';

  @override
  String get connBonding => 'ትስስር';

  @override
  String get connScanning => 'በመቃኘት ላይ';

  @override
  String get connDisconnected => 'ግንኙነት ተቋርጧል';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'ከ$name ጋር ያለው ግንኙነት ይቋረጥ?';
  }

  @override
  String get disconnectConfirmBody => 'በማንኛውም ጊዜ ከመነሻ ማያ ገጽ እንደገና መገናኘት ይችላሉ።';

  @override
  String get cancelButton => 'ሰርዝ';

  @override
  String get saveButton => 'አስቀምጥ';

  @override
  String get customNickname => 'ብጁ ቅጽል ስም';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name አይጣመር?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'ይህ በዚህ ስልክ ላይ $nameን ከእርስዎ ሮቦቶች ያስወግዳል። በማንኛውም ጊዜ እንደገና ማከል ይችላሉ።\n\nማሳሰቢያ: የሮቦት ማህደረ ትውስታን ሙሉ በሙሉ ለማጥፋት እና የፋብሪካውን ነባሪዎች ለመመለስ \"የፋብሪካ ዳግም ማስጀመር\" ይጠቀሙ.';
  }

  @override
  String get unpairButton => 'አራግፍ';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'መሮጥ';

  @override
  String get machineEstop => 'ኢ-አቁም';

  @override
  String get machineError => 'ስህተት';

  @override
  String get machineCalibrating => 'የካሊብሬቲንግ';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'ተቀምጧል';

  @override
  String get ledInputErr => 'የግቤት ስህተት';

  @override
  String get ledPairing => 'ማጣመር';

  @override
  String get ledConnected => 'ተገናኝቷል።';

  @override
  String get ledIdentify => 'መለየት';

  @override
  String get identifyButton => 'መለየት';

  @override
  String get identifyingToast => 'ብልጭ ድርግም የሚል ሮቦት LED ለ3 ሰከንድ...';

  @override
  String get homingToast => 'ሁሉንም ሽፋኖች በማስተናገድ ላይ...';

  @override
  String get i2cFault => 'I2C ስህተት';

  @override
  String get storageFault => 'የማከማቻ ስህተት';

  @override
  String get estopLatched => 'ኢ-ቶፕ ተዘግቷል።';

  @override
  String get presetButtonsTitle => 'የቅድሚያ አዝራሮች';

  @override
  String customizePresetTitle(Object label) {
    return '$label አብጅ';
  }

  @override
  String get subtitleNameLabel => 'የግርጌ ጽሑፍ ስም';

  @override
  String get subtitleNameHint => 'ለምሳሌ. ፈጣን ማጠፊያ፣ ሸሚዞች፣ ብጁ...';

  @override
  String get buttonColorLabel => 'የአዝራር ቀለም';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'ደረጃ $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'የአደጋ ጊዜ ማቆሚያ';

  @override
  String get clearEstop => 'ኢ-ማቆሚያን ያጽዱ እና ያስወግዱ';

  @override
  String get clearEstopHint =>
      'የአደጋ ጊዜ ማቆሚያን ዳግም ያስጀምራል እና ሮቦትን ወደ ስራ ፈት ይመልሳል';

  @override
  String get stopButton => 'አቁም';

  @override
  String get fabricaArrangementTitle => 'የጨርቃጨርቅ ዝግጅት';

  @override
  String get editArrangement => 'ዝግጅትን አርትዕ';

  @override
  String get addPanel => 'ፓነል ጨምር';

  @override
  String get legendMotorized => 'በሞተር የተሰራ';

  @override
  String get legendFollower => 'ተከታይ';

  @override
  String get legendBase => 'መሰረት';

  @override
  String get colsLabel => 'ቆላስይስ';

  @override
  String get rowsLabel => 'ረድፎች';

  @override
  String stepSelectedHint(Object step) {
    return 'ደረጃ $step ተመርጧል፡ 1–2 በሞተር የሚሠሩ ፓነሎች በፍርግርግ ላይ ይንኩ።';
  }

  @override
  String get tapPanelsHint => 'በፍርግርግ ላይ 1-2 የሞተር ፓነሎች ይንኩ።';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel => 'ቢያንስ 1 ሞተራይዝድ ፓኔል ያስፈልገዋል (ከፍተኛ 2)';

  @override
  String get selectedChangePanelsHint =>
      'ተመርጧል • ለመቀየር ፍርግርግ ፓነሎችን ነካ ያድርጉ (ከፍተኛ 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'ደረጃ $step ከ$total';
  }

  @override
  String get removeStepTooltip => 'ደረጃን ያስወግዱ';

  @override
  String get requiresMotorizedModuleWarning =>
      'የዕለት ተዕለት ተግባር ቢያንስ አንድ የሞተር ሞጁል ከፋብሪካ ዝግጅት ይፈልጋል።';

  @override
  String get routineFull => 'የዕለት ተዕለት እንቅስቃሴ ሙሉ (16/16 ደረጃዎች)';

  @override
  String addStepCount(Object count) {
    return 'ደረጃ አክል ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'የዕለት ተዕለት ተግባርን ወደ ሮቦት አስቀምጥ';

  @override
  String get selectButtonToProgram =>
      'በዚህ የዕለት ተዕለት ተግባር ፕሮግራም ለማድረግ አካላዊ ሮቦትን ይምረጡ፡-';

  @override
  String buttonNumber(Object slot) {
    return 'አዝራር $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'የሃርድዌር ቁልፍ $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'አዝራር $slot ንዑስ ርዕስ (አማራጭ)';
  }

  @override
  String get saveToRobotButton => 'ለሮቦት አስቀምጥ';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'አዝራር $slot ($count ደረጃዎች)';
  }

  @override
  String get adultTshirtTemplate => 'የአዋቂዎች ቲሸርት አብነት';

  @override
  String get longSleeveTemplate => 'ረጅም እጅጌ አብነት';

  @override
  String get dualSweepTemplate => 'ድርብ ጠረግ አብነት';

  @override
  String channelNumber(Object number) {
    return 'ቻናል $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count ተጣምሯል።';
  }

  @override
  String get moreHardwareOptions => 'ተጨማሪ የሃርድዌር አማራጮች';

  @override
  String get loadTemplate => 'አብነት ጫን';

  @override
  String get controllerLabel => 'ተቆጣጣሪ';

  @override
  String get motorBadge => 'ሞተር';

  @override
  String get followerBadge => 'ተከታይ';

  @override
  String get baseBadge => 'ቤዝ';

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
