// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'सेटिंग्ज';

  @override
  String get appLanguageTitle => 'अ‍ॅप भाषा';

  @override
  String get appVersionTitle => 'अ‍ॅप आवृत्ती';

  @override
  String get languageSectionTitle => 'भाषा';

  @override
  String get languageSystemDefault => 'सिस्टम डीफॉल्ट (डिव्हाइस भाषा)';

  @override
  String get selectLanguageHint => 'भाषा निवडा';

  @override
  String get addDeviceTitle => 'नवीन रोबोट जोडा';

  @override
  String get addDeviceSubtitle => 'आकाशवाणी रोबोट्सची जोडणी करा';

  @override
  String get yourRobots => 'तुमचे रोबोट्स';

  @override
  String get discoveredRobots => 'रोबोट्स शोधले';

  @override
  String get noRobotsPairedYet => 'अद्याप कोणतेही रोबोट जोडलेले नाहीत';

  @override
  String get noRobotsPairedSubtitle =>
      'टेलीमेट्री पाहण्यासाठी, प्रीसेट व्यवस्थापित करण्यासाठी आणि ऑपरेशन्स नियंत्रित करण्यासाठी तुमचा रोबोट कनेक्ट करा.';

  @override
  String get addYourFirstRobot => 'तुमचा पहिला रोबोट जोडा';

  @override
  String get autoScanning => 'ऑटो-स्कॅनिंग';

  @override
  String get idleStatus => 'निष्क्रिय';

  @override
  String get tabControl => 'नियंत्रण';

  @override
  String get tabSequencer => 'सिक्वेन्सर';

  @override
  String get tabCalibrator => 'कॅलिब्रेटर';

  @override
  String get tabDiagnostics => 'निदान';

  @override
  String get renameRobot => 'रोबोटचे नाव बदला';

  @override
  String get bleDiagnostics => 'BLE डायग्नोस्टिक्स';

  @override
  String get erasePresets => 'जतन केलेले प्रीसेट पुसून टाका';

  @override
  String get disconnect => 'डिस्कनेक्ट करा';

  @override
  String get unpairRobot => 'रोबोट अनपेअर करा';

  @override
  String get factoryReset => 'फॅक्टरी रीसेट';

  @override
  String get servoManualJog => 'सर्वो मॅन्युअल जॉग';

  @override
  String get homeAll => 'घर सर्व';

  @override
  String get foldingTimeline => 'फोल्डिंग टाइमलाइन';

  @override
  String get addStep => 'पायरी जोडा';

  @override
  String get previewOnRobot => 'रोबोटचे पूर्वावलोकन करा';

  @override
  String get saveToButton => 'बटणावर सेव्ह करा';

  @override
  String get themeTitle => 'थीम';

  @override
  String get themeSystem => 'साधन';

  @override
  String get themeLight => 'प्रकाश';

  @override
  String get themeDark => 'गडद';

  @override
  String get connectedBadge => 'कनेक्ट केलेले';

  @override
  String get inRangeBadge => 'रेंजमध्ये';

  @override
  String get offlineBadge => 'ऑफलाइन';

  @override
  String get openButton => 'उघडा';

  @override
  String get connectButton => 'कनेक्ट करा';

  @override
  String get reconnectButton => 'पुन्हा कनेक्ट करा';

  @override
  String get pairAndConnect => 'जोडा आणि कनेक्ट करा';

  @override
  String get autoScanningForRobots => 'रोबोट्ससाठी स्वयं-स्कॅनिंग...';

  @override
  String get scanningIdle => 'स्कॅनिंग निष्क्रिय';

  @override
  String get nearbyRobotsAppear => 'जवळपासचे रोबोट येथे आपोआप दिसून येतील.';

  @override
  String get yourNearbyRobotsAppear =>
      'तुमचे जवळपासचे रोबोट्स येथे आपोआप दिसून येतील.';

  @override
  String get signalStrong => 'मजबूत';

  @override
  String get signalGood => 'चांगले';

  @override
  String get signalWeak => 'कमकुवत';

  @override
  String get addRobotIntro =>
      'जोडण्यासाठी खालील रोबोट निवडा. पेअरिंग मोडमधील जवळपासचा कोणताही रोबो आपोआप शीर्षस्थानी शोधला जाईल.';

  @override
  String get autoDiscoveredRobot => 'ऑटो शोधला रोबोट';

  @override
  String get autoDiscoveredRobots => 'ऑटो शोधले रोबोट';

  @override
  String readyCountBadge(Object count) {
    return '$count तयार';
  }

  @override
  String get supportedRobots => 'सपोर्टेड रोबोट्स';

  @override
  String get clothesFoldingRobot => 'कपडे फोल्डिंग रोबोट';

  @override
  String get fabricaDescription =>
      'मल्टि-गारमेंट प्रीसेट आणि स्पर्शा सिंगल-बटण ऑपरेशनसह स्वयंचलित गारमेंट फोल्डर.';

  @override
  String get fabricaPairingHint =>
      'पेअरिंग मोड: फॅब्रिका कंट्रोल पॅनलवरील कोणतेही बटण 3 सेकंदांसाठी दाबा आणि धरून ठेवा (स्थिती LED वेगाने ब्लिंक होईल).';

  @override
  String get pairFabricaNow => 'आता फॅब्रिका पेअर करा';

  @override
  String get backToHome => 'घरी परत';

  @override
  String get connReady => 'तयार';

  @override
  String get connConnecting => 'कनेक्ट करत आहे';

  @override
  String get connDiscovering => 'शोधत आहे';

  @override
  String get connBonding => 'बाँडिंग';

  @override
  String get connScanning => 'स्कॅनिंग';

  @override
  String get connDisconnected => 'डिस्कनेक्ट केले';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name वरून डिस्कनेक्ट करायचे?';
  }

  @override
  String get disconnectConfirmBody =>
      'तुम्ही होम स्क्रीनवरून कधीही पुन्हा कनेक्ट करू शकता.';

  @override
  String get cancelButton => 'रद्द करा';

  @override
  String get saveButton => 'जतन करा';

  @override
  String get customNickname => 'सानुकूल टोपणनाव';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name अनपेअर करायचे?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'हे या फोनवरील तुमच्या रोबोट्समधून $name काढून टाकेल. तुम्ही ते कधीही पुन्हा जोडू शकता.\n\nटीप: रोबोट मेमरी पूर्णपणे पुसण्यासाठी आणि फॅक्टरी डीफॉल्ट पुनर्संचयित करण्यासाठी, \"फॅक्टरी रीसेट\" वापरा.';
  }

  @override
  String get unpairButton => 'अनपेअर करा';

  @override
  String get machineIdle => 'निष्क्रिय';

  @override
  String get machineRunning => 'धावत आहे';

  @override
  String get machineEstop => 'ई-स्टॉप';

  @override
  String get machineError => 'एरर';

  @override
  String get machineCalibrating => 'कॅलिब्रेटिंग';

  @override
  String ledLabel(Object state) {
    return 'एलईडी: $state';
  }

  @override
  String get ledSaved => 'जतन केले';

  @override
  String get ledInputErr => 'इनपुट त्रुटी';

  @override
  String get ledPairing => 'पेअरिंग';

  @override
  String get ledConnected => 'कनेक्ट केलेले';

  @override
  String get ledIdentify => 'ओळखा';

  @override
  String get identifyButton => 'ओळखा';

  @override
  String get identifyingToast => 'फ्लॅशिंग रोबोट एलईडी 3 सेकंदांसाठी...';

  @override
  String get homingToast => 'सर्व फ्लॅप होमिंग...';

  @override
  String get i2cFault => 'I2C फॉल्ट';

  @override
  String get storageFault => 'स्टोरेज फॉल्ट';

  @override
  String get estopLatched => 'ई-स्टॉप लॅच केलेले';

  @override
  String get presetButtonsTitle => 'प्रीसेट बटणे';

  @override
  String customizePresetTitle(Object label) {
    return 'सानुकूलित करा $label';
  }

  @override
  String get subtitleNameLabel => 'उपशीर्षक नाव';

  @override
  String get subtitleNameHint => 'उदा. क्विक फोल्ड, शर्ट, कस्टम...';

  @override
  String get buttonColorLabel => 'बटणाचा रंग';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'पायरी $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'आपत्कालीन थांबा';

  @override
  String get clearEstop => 'ई-स्टॉप साफ करा आणि अनलॅच करा';

  @override
  String get clearEstopHint =>
      'आणीबाणीचा थांबा रीसेट करतो आणि निष्क्रिय वर रोबोट परत करतो';

  @override
  String get stopButton => 'थांबा';

  @override
  String get fabricaArrangementTitle => 'फॅब्रिका व्यवस्था';

  @override
  String get editArrangement => 'व्यवस्था संपादित करा';

  @override
  String get addPanel => 'पॅनेल जोडा';

  @override
  String get legendMotorized => 'मोटारीकृत';

  @override
  String get legendFollower => 'अनुयायी';

  @override
  String get legendBase => 'बेस';

  @override
  String get colsLabel => 'कॉल्स';

  @override
  String get rowsLabel => 'पंक्ती';

  @override
  String stepSelectedHint(Object step) {
    return 'पायरी $step निवडली: ग्रिडवर 1-2 मोटराइज्ड पॅनेलवर टॅप करा';
  }

  @override
  String get tapPanelsHint => 'ग्रिडवर 1-2 मोटर पॅनेलवर टॅप करा';

  @override
  String get dualBadge => 'दुहेरी';

  @override
  String get requiresMotorizedPanel =>
      'किमान 1 मोटार चालवलेले पॅनेल आवश्यक आहे (कमाल 2)';

  @override
  String get selectedChangePanelsHint =>
      'निवडले • बदलण्यासाठी ग्रिड पॅनेलवर टॅप करा (कमाल २)';

  @override
  String stepOfTotal(Object step, Object total) {
    return '$total पैकी $step पायरी';
  }

  @override
  String get removeStepTooltip => 'पायरी काढा';

  @override
  String get requiresMotorizedModuleWarning =>
      'रुटीनसाठी फॅब्रिका अरेंजमेंटकडून किमान एक मोटारीकृत मॉड्यूल आवश्यक आहे.';

  @override
  String get routineFull => 'रूटीन पूर्ण (१६/१६ पायऱ्या)';

  @override
  String addStepCount(Object count) {
    return 'पायरी जोडा ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Robot मध्ये दिनचर्या जतन करा';

  @override
  String get selectButtonToProgram =>
      'या दिनचर्यासह प्रोग्राम करण्यासाठी एक भौतिक रोबोट बटण निवडा:';

  @override
  String buttonNumber(Object slot) {
    return 'बटण $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'हार्डवेअर बटण $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'बटण $slot उपशीर्षक (पर्यायी)';
  }

  @override
  String get saveToRobotButton => 'रोबोटमध्ये सेव्ह करा';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'बटण $slot ($count पावले)';
  }

  @override
  String get adultTshirtTemplate => 'प्रौढ टी-शर्ट टेम्पलेट';

  @override
  String get longSleeveTemplate => 'लांब बाही टेम्पलेट';

  @override
  String get dualSweepTemplate => 'ड्युअल स्वीप टेम्पलेट';

  @override
  String channelNumber(Object number) {
    return 'चॅनल $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count जोडलेले';
  }

  @override
  String get moreHardwareOptions => 'अधिक हार्डवेअर पर्याय';

  @override
  String get loadTemplate => 'टेम्पलेट लोड करा';

  @override
  String get controllerLabel => 'कंट्रोलर';

  @override
  String get motorBadge => 'मोटार';

  @override
  String get followerBadge => 'फॉलोअर';

  @override
  String get baseBadge => 'बेस';

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
