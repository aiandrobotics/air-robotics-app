// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get appLanguageTitle => 'ऐप की भाषा';

  @override
  String get appVersionTitle => 'ऐप संस्करण';

  @override
  String get languageSectionTitle => 'भाषा';

  @override
  String get languageSystemDefault => 'सिस्टम डिफ़ॉल्ट (डिवाइस की भाषा)';

  @override
  String get selectLanguageHint => 'भाषा चुनें';

  @override
  String get addDeviceTitle => 'नया रोबोट जोड़ें';

  @override
  String get addDeviceSubtitle => 'AIR रोबोट पेयर करें';

  @override
  String get yourRobots => 'आपके रोबोट';

  @override
  String get discoveredRobots => 'खोजे गए रोबोट';

  @override
  String get noRobotsPairedYet => 'अभी तक कोई रोबोट पेयर नहीं हुआ';

  @override
  String get noRobotsPairedSubtitle =>
      'टेलीमेट्री देखने, प्रीसेट प्रबंधित करने और संचालन नियंत्रित करने के लिए अपने रोबोट को कनेक्ट करें।';

  @override
  String get addYourFirstRobot => 'अपना पहला रोबोट जोड़ें';

  @override
  String get autoScanning => 'ऑटो-स्कैनिंग';

  @override
  String get idleStatus => 'निष्क्रिय';

  @override
  String get tabControl => 'नियंत्रण';

  @override
  String get tabSequencer => 'सीक्वेंसर';

  @override
  String get tabCalibrator => 'कैलिब्रेटर';

  @override
  String get tabDiagnostics => 'डायग्नोस्टिक्स';

  @override
  String get renameRobot => 'रोबोट का नाम बदलें';

  @override
  String get bleDiagnostics => 'BLE डायग्नोस्टिक्स';

  @override
  String get erasePresets => 'सहेजे गए प्रीसेट मिटाएं';

  @override
  String get disconnect => 'डिस्कनेक्ट करें';

  @override
  String get unpairRobot => 'रोबोट अनपेयर करें';

  @override
  String get factoryReset => 'फ़ैक्टरी रीसेट';

  @override
  String get servoManualJog => 'सर्वो मैनुअल जॉग';

  @override
  String get homeAll => 'सभी होम करें';

  @override
  String get foldingTimeline => 'फोल्डिंग टाइमलाइन';

  @override
  String get addStep => 'चरण जोड़ें';

  @override
  String get previewOnRobot => 'रोबोट पर पूर्वावलोकन';

  @override
  String get saveToButton => 'बटन में सहेजें';

  @override
  String get themeTitle => 'थीम';

  @override
  String get themeSystem => 'डिवाइस';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String get connectedBadge => 'कनेक्टेड';

  @override
  String get inRangeBadge => 'रेंज में';

  @override
  String get offlineBadge => 'ऑफ़लाइन';

  @override
  String get openButton => 'खोलें';

  @override
  String get connectButton => 'कनेक्ट करें';

  @override
  String get reconnectButton => 'पुनः कनेक्ट';

  @override
  String get pairAndConnect => 'पेयर और कनेक्ट';

  @override
  String get autoScanningForRobots => 'रोबोट के लिए ऑटो-स्कैनिंग...';

  @override
  String get scanningIdle => 'स्कैनिंग निष्क्रिय';

  @override
  String get nearbyRobotsAppear =>
      'आस-पास के रोबोट स्वचालित रूप से यहां दिखाई देंगे.';

  @override
  String get yourNearbyRobotsAppear =>
      'आपके आस-पास के रोबोट स्वचालित रूप से यहां दिखाई देंगे।';

  @override
  String get signalStrong => 'मजबूत';

  @override
  String get signalGood => 'अच्छा';

  @override
  String get signalWeak => 'कमजोर';

  @override
  String get addRobotIntro =>
      'जोड़ी बनाने के लिए नीचे एक रोबोट चुनें। पेयरिंग मोड में कोई भी नजदीकी रोबोट स्वचालित रूप से शीर्ष पर खोजा जाएगा।';

  @override
  String get autoDiscoveredRobot => 'स्वतः खोजा गया रोबोट';

  @override
  String get autoDiscoveredRobots => 'स्वतः खोजे गए रोबोट';

  @override
  String readyCountBadge(Object count) {
    return '$count तैयार';
  }

  @override
  String get supportedRobots => 'समर्थित रोबोट';

  @override
  String get clothesFoldingRobot => 'कपड़े मोड़ने वाला रोबोट';

  @override
  String get fabricaDescription =>
      'मल्टी-गारमेंट प्रीसेट और स्पर्शनीय सिंगल-बटन ऑपरेशन के साथ स्वचालित परिधान फ़ोल्डर।';

  @override
  String get fabricaPairingHint =>
      'पेयरिंग मोड: फैब्रिका कंट्रोल पैनल पर किसी भी बटन को 3 सेकंड के लिए दबाकर रखें (स्टेटस एलईडी तेजी से झपकेगी)।';

  @override
  String get pairFabricaNow => 'अभी कपड़ा जोड़ें';

  @override
  String get backToHome => 'घर वापस';

  @override
  String get connReady => 'तैयार';

  @override
  String get connConnecting => 'जुड़ना';

  @override
  String get connDiscovering => 'खोज';

  @override
  String get connBonding => 'बंधन';

  @override
  String get connScanning => 'स्कैनिंग';

  @override
  String get connDisconnected => 'डिस्कनेक्ट किया गया';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name से डिस्कनेक्ट करें?';
  }

  @override
  String get disconnectConfirmBody =>
      'आप होम स्क्रीन से किसी भी समय पुनः कनेक्ट कर सकते हैं।';

  @override
  String get cancelButton => 'रद्द करें';

  @override
  String get saveButton => 'सहेजें';

  @override
  String get customNickname => 'कस्टम उपनाम';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name को अयुग्मित करें?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'यह इस फ़ोन पर आपके रोबोट से $name हटा देगा। आप इसे किसी भी समय दोबारा जोड़ सकते हैं.\n\nनोट: रोबोट मेमोरी को पूरी तरह से मिटाने और फ़ैक्टरी डिफ़ॉल्ट को पुनर्स्थापित करने के लिए, \"फ़ैक्टरी रीसेट\" का उपयोग करें।';
  }

  @override
  String get unpairButton => 'अनपेयर';

  @override
  String get machineIdle => 'निष्क्रिय';

  @override
  String get machineRunning => 'चल रहा है';

  @override
  String get machineEstop => 'ई-स्टॉप';

  @override
  String get machineError => 'त्रुटि';

  @override
  String get machineCalibrating => 'अंशांकन';

  @override
  String ledLabel(Object state) {
    return 'एलईडी: $state';
  }

  @override
  String get ledSaved => 'सहेजा गया';

  @override
  String get ledInputErr => 'इनपुट त्रुटि';

  @override
  String get ledPairing => 'जोड़ी बनाना';

  @override
  String get ledConnected => 'जुड़ा हुआ';

  @override
  String get ledIdentify => 'पहचानें';

  @override
  String get identifyButton => 'पहचानें';

  @override
  String get identifyingToast => '3 सेकंड के लिए चमकती रोबोट एलईडी...';

  @override
  String get homingToast => 'सभी फ़्लैप्स को होम किया जा रहा है...';

  @override
  String get i2cFault => 'I2C दोष';

  @override
  String get storageFault => 'भंडारण दोष';

  @override
  String get estopLatched => 'ई-स्टॉप को बंद कर दिया गया';

  @override
  String get presetButtonsTitle => 'प्रीसेट बटन';

  @override
  String customizePresetTitle(Object label) {
    return 'अनुकूलित करें$label';
  }

  @override
  String get subtitleNameLabel => 'उपशीर्षक नाम';

  @override
  String get subtitleNameHint => 'जैसे त्वरित तह, शर्ट, कस्टम...';

  @override
  String get buttonColorLabel => 'बटन का रंग';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'चरण $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'आपातकालीन स्टॉप';

  @override
  String get clearEstop => 'ई-स्टॉप साफ़ करें और खोलें';

  @override
  String get clearEstopHint =>
      'आपातकालीन स्टॉप को रीसेट करता है और रोबोट को निष्क्रिय स्थिति में लौटाता है';

  @override
  String get stopButton => 'रोकें';

  @override
  String get fabricaArrangementTitle => 'कपड़े की व्यवस्था';

  @override
  String get editArrangement => 'व्यवस्था संपादित करें';

  @override
  String get addPanel => 'पैनल जोड़ें';

  @override
  String get legendMotorized => 'मोटर चालित';

  @override
  String get legendFollower => 'अनुयायी';

  @override
  String get legendBase => 'आधार';

  @override
  String get colsLabel => 'कर्नल';

  @override
  String get rowsLabel => 'पंक्तियाँ';

  @override
  String stepSelectedHint(Object step) {
    return 'चरण $step चयनित: ग्रिड पर 1-2 मोटर चालित पैनल टैप करें';
  }

  @override
  String get tapPanelsHint => 'ग्रिड पर 1-2 मोटर पैनल टैप करें';

  @override
  String get dualBadge => 'दोहरी';

  @override
  String get requiresMotorizedPanel =>
      'कम से कम 1 मोटर चालित पैनल (अधिकतम 2) की आवश्यकता है';

  @override
  String get selectedChangePanelsHint =>
      'चयनित • बदलने के लिए ग्रिड पैनल टैप करें (अधिकतम 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return '$total का चरण $step';
  }

  @override
  String get removeStepTooltip => 'चरण हटाएँ';

  @override
  String get requiresMotorizedModuleWarning =>
      'रूटीन को फैब्रिका अरेंजमेंट से कम से कम एक मोटराइज्ड मॉड्यूल की आवश्यकता होती है।';

  @override
  String get routineFull => 'संपूर्ण दिनचर्या (16/16 चरण)';

  @override
  String addStepCount(Object count) {
    return 'चरण जोड़ें ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'रूटीन को रोबोट में सहेजें';

  @override
  String get selectButtonToProgram =>
      'इस रूटीन के साथ प्रोग्राम करने के लिए एक भौतिक रोबोट बटन का चयन करें:';

  @override
  String buttonNumber(Object slot) {
    return 'बटन $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'हार्डवेयर बटन $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'बटन $slot उपशीर्षक (वैकल्पिक)';
  }

  @override
  String get saveToRobotButton => 'रोबोट में सहेजें';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'बटन $slot ($count चरण)';
  }

  @override
  String get adultTshirtTemplate => 'वयस्क टी-शर्ट टेम्पलेट';

  @override
  String get longSleeveTemplate => 'लंबी बांह का टेम्पलेट';

  @override
  String get dualSweepTemplate => 'दोहरी स्वीप टेम्पलेट';

  @override
  String channelNumber(Object number) {
    return 'चैनल $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count युग्मित';
  }

  @override
  String get moreHardwareOptions => 'अधिक हार्डवेयर विकल्प';

  @override
  String get loadTemplate => 'टेम्पलेट लोड करें';

  @override
  String get controllerLabel => 'नियंत्रक';

  @override
  String get motorBadge => 'मोटर';

  @override
  String get followerBadge => 'अनुयायी';

  @override
  String get baseBadge => 'आधार';

  @override
  String pairModelTitle(Object model) {
    return '$model पेयर करें';
  }

  @override
  String get stopScan => 'स्कैन रोकें';

  @override
  String get rescan => 'पुनः स्कैन करें';

  @override
  String searchingForNearby(Object model) {
    return 'आसपास $model खोज रहे हैं...';
  }

  @override
  String get scanPaused => 'स्कैन रुका हुआ';

  @override
  String filteringForBle(Object prefix) {
    return '\"$prefix*\" BLE विज्ञापनों के लिए फ़िल्टर किया जा रहा है';
  }

  @override
  String get tapRefreshToRestart =>
      'स्कैन पुनः आरंभ करने के लिए शीर्ष बार में रीफ़्रेश बटन टैप करें';

  @override
  String get fabricaPairingInstructions => 'फ़ैब्रिका पेयरिंग निर्देश';

  @override
  String get pairingProcedure => 'पेयरिंग प्रक्रिया';

  @override
  String get pairStep1Fabrica => 'अपने फ़ैब्रिका रोबोट को चालू करें।';

  @override
  String get pairStep2Fabrica =>
      'पेयरिंग मोड में प्रवेश करने के लिए फ़ैब्रिका कंट्रोल पैनल पर किसी भी बटन को 3 सेकंड तक दबाए रखें।';

  @override
  String get pairStep3Fabrica =>
      'पेयरिंग मोड सक्रिय होने की पुष्टि के लिए स्थिति LED तेज़ी से झपकेगी।';

  @override
  String pairStep1Generic(Object model) {
    return 'अपने $model रोबोट को चालू करें।';
  }

  @override
  String get pairStep2Generic =>
      'सुनिश्चित करें कि रोबोट पर ब्लूटूथ पेयरिंग मोड सक्रिय है।';

  @override
  String searchingForModel(Object model) {
    return '$model खोज रहे हैं...';
  }

  @override
  String get noMatchingRobotsYet => 'अभी तक कोई मेल खाने वाला रोबोट नहीं मिला';

  @override
  String get makeSureRobotPowered =>
      'सुनिश्चित करें कि आपका रोबोट चालू है और सीमा के भीतर है।';

  @override
  String get checkPowerSwitch =>
      'पावर स्विच जांचें और स्कैन पुनः आरंभ करने के लिए ऊपर दाईं ओर आइकन टैप करें।';

  @override
  String failedToConnect(Object error, Object name) {
    return '$name से कनेक्ट करने में विफल: $error';
  }

  @override
  String get restoreDefaultPresetsTitle =>
      'डिफ़ॉल्ट बटन प्रीसेट पुनर्स्थापित करें?';

  @override
  String get restoreDefaultPresetsBody =>
      'यह रोबोट पर सभी कस्टम बटन रूटीन मिटा देगा और बटन 1–4 को उनके डिफ़ॉल्ट प्रीसेट पर रीसेट कर देगा।\n\nक्या आप वाकई आगे बढ़ना चाहते हैं?';

  @override
  String get presetsRestoredToast =>
      'रोबोट पर सभी बटन प्रीसेट डिफ़ॉल्ट पर पुनर्स्थापित कर दिए गए हैं।';

  @override
  String get eraseAllPresetsButton => 'रोबोट पर सभी प्रीसेट मिटाएं';

  @override
  String get factoryResetTitle => 'फ़ैब्रिका फ़ैक्टरी रीसेट?';

  @override
  String get factoryResetBody =>
      'यह फ़ैब्रिका को फ़ैक्टरी डिफ़ॉल्ट पर रीसेट कर देगा:\n\n• मेमोरी में सभी कस्टम रूटीन मिटाता है और फ़ैक्टरी डिफ़ॉल्ट पुनर्स्थापित करता है।\n• सभी फ़्लैप को होम स्थिति (0°) पर समतल लौटाता है।\n• सहेजी गई ब्लूटूथ पेयरिंग कुंजियां साफ़ करता है।\n• ब्लूटूथ डिस्कनेक्ट करता है और पेयरिंग मोड पुनः आरंभ करता है।\n\nइस फ़ोन पर आपके डिवाइस से रोबोट हटा दिया जाएगा।';

  @override
  String get executingFactoryReset =>
      'फ़ैब्रिका फ़ैक्टरी रीसेट निष्पादित हो रहा है...';

  @override
  String get resetEverythingButton => 'सब कुछ रीसेट करें';

  @override
  String get editFabricaArrangementTitle => 'फ़ैब्रिका व्यवस्था संपादित करें';

  @override
  String get doneButton => 'हो गया';

  @override
  String moduleNumber(Object number) {
    return 'मॉड्यूल #$number';
  }

  @override
  String pairingModeHintError(Object name) {
    return '$name से पेयर नहीं हो सका। सुनिश्चित करें कि रोबोट पेयरिंग मोड में है (LED तेज़ी से झपकने तक किसी भी बटन को 3 सेकंड तक दबाए रखें) और पुनः प्रयास करें।';
  }
}
