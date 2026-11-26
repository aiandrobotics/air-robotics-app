// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'सेटिङहरू';

  @override
  String get appLanguageTitle => 'एप भाषा';

  @override
  String get appVersionTitle => 'एप संस्करण';

  @override
  String get languageSectionTitle => 'भाषा';

  @override
  String get languageSystemDefault => 'प्रणाली पूर्वनिर्धारित (उपकरण भाषा)';

  @override
  String get selectLanguageHint => 'भाषा चयन गर्नुहोस्';

  @override
  String get addDeviceTitle => 'नयाँ रोबोट थप्नुहोस्';

  @override
  String get addDeviceSubtitle => 'AIR रोबोटहरू जोड्नुहोस्';

  @override
  String get yourRobots => 'तपाईंका रोबोटहरू';

  @override
  String get discoveredRobots => 'पत्ता लगाएका रोबोटहरू';

  @override
  String get noRobotsPairedYet => 'अहिलेसम्म कुनै पनि रोबोटहरू जोडिएका छैनन्';

  @override
  String get noRobotsPairedSubtitle =>
      'टेलिमेट्री हेर्न, प्रिसेटहरू प्रबन्ध गर्न र सञ्चालनहरू नियन्त्रण गर्न आफ्नो रोबोट जडान गर्नुहोस्।';

  @override
  String get addYourFirstRobot => 'आफ्नो पहिलो रोबोट थप्नुहोस्';

  @override
  String get autoScanning => 'स्वत: स्क्यानिङ';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'नियन्त्रण';

  @override
  String get tabSequencer => 'अनुक्रमक';

  @override
  String get tabCalibrator => 'क्यालिब्रेटर';

  @override
  String get tabDiagnostics => 'निदान';

  @override
  String get renameRobot => 'रोबोट पुन: नामाकरण गर्नुहोस्';

  @override
  String get bleDiagnostics => 'BLE निदान';

  @override
  String get erasePresets => 'सुरक्षित गरिएका प्रिसेटहरू मेटाउनुहोस्';

  @override
  String get disconnect => 'जडान विच्छेद गर्नुहोस्';

  @override
  String get unpairRobot => 'रोबोटको जोडा हटाउनुहोस्';

  @override
  String get factoryReset => 'कारखाना रिसेट';

  @override
  String get servoManualJog => 'सर्भो म्यानुअल जोग';

  @override
  String get homeAll => 'घर सबै';

  @override
  String get foldingTimeline => 'फोल्डिङ टाइमलाइन';

  @override
  String get addStep => 'कदम थप्नुहोस्';

  @override
  String get previewOnRobot => 'रोबोटमा पूर्वावलोकन गर्नुहोस्';

  @override
  String get saveToButton => 'बटनमा बचत गर्नुहोस्';

  @override
  String get themeTitle => 'विषयवस्तु';

  @override
  String get themeSystem => 'यन्त्र';

  @override
  String get themeLight => 'उज्यालो';

  @override
  String get themeDark => 'अँध्यारो';

  @override
  String get connectedBadge => 'जडान गरिएको';

  @override
  String get inRangeBadge => 'दायरामा';

  @override
  String get offlineBadge => 'अफलाइन';

  @override
  String get openButton => 'खोल्नुहोस्';

  @override
  String get connectButton => 'जडान गर्नुहोस्';

  @override
  String get reconnectButton => 'पुन: जडान गर्नुहोस्';

  @override
  String get pairAndConnect => 'जोडा र जडान गर्नुहोस्';

  @override
  String get autoScanningForRobots => 'रोबोटहरूको लागि स्वत: स्क्यानिङ...';

  @override
  String get scanningIdle => 'स्क्यानिङ निष्क्रिय';

  @override
  String get nearbyRobotsAppear => 'नजिकैका रोबोटहरू यहाँ स्वतः देखिनेछन्।';

  @override
  String get yourNearbyRobotsAppear =>
      'तपाईंका नजिकैका रोबोटहरू यहाँ स्वतः देखिनेछन्।';

  @override
  String get signalStrong => 'बलियो';

  @override
  String get signalGood => 'राम्रो';

  @override
  String get signalWeak => 'कमजोर';

  @override
  String get addRobotIntro =>
      'जोडा बनाउन तलको एउटा रोबोट चयन गर्नुहोस्। जोडी मोडमा कुनै पनि नजिकैको रोबोट स्वचालित रूपमा शीर्षमा पत्ता लगाइनेछ।';

  @override
  String get autoDiscoveredRobot => 'स्वत: पत्ता लगाइएको रोबोट';

  @override
  String get autoDiscoveredRobots => 'स्वत: पत्ता लगाएका रोबोटहरू';

  @override
  String readyCountBadge(Object count) {
    return '$count तयार';
  }

  @override
  String get supportedRobots => 'समर्थित रोबोटहरू';

  @override
  String get clothesFoldingRobot => 'लुगा फोल्डिङ रोबोट';

  @override
  String get fabricaDescription =>
      'बहु-गार्मेन्ट प्रिसेटहरू र स्पर्श एकल-बटन सञ्चालनको साथ स्वचालित कपडा फोल्डर।';

  @override
  String get fabricaPairingHint =>
      'जोडी मोड: 3 सेकेन्डको लागि Fabrica नियन्त्रण प्यानलमा कुनै पनि बटन थिच्नुहोस् र होल्ड गर्नुहोस् (स्थिति LED द्रुत रूपमा झिम्किनेछ)।';

  @override
  String get pairFabricaNow => 'अहिले फेब्रिका जोड्नुहोस्';

  @override
  String get backToHome => 'घर फर्कनुहोस्';

  @override
  String get connReady => 'तयार';

  @override
  String get connConnecting => 'जडान गर्दै';

  @override
  String get connDiscovering => 'पत्ता लगाउँदै';

  @override
  String get connBonding => 'बन्धन';

  @override
  String get connScanning => 'स्क्यानिङ';

  @override
  String get connDisconnected => 'जडान विच्छेद गरियो';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name बाट जडान विच्छेद गर्ने हो?';
  }

  @override
  String get disconnectConfirmBody =>
      'तपाईं गृह स्क्रिनबाट कुनै पनि समय पुन: जडान गर्न सक्नुहुन्छ।';

  @override
  String get cancelButton => 'रद्द गर्नुहोस्';

  @override
  String get saveButton => 'बचत गर्नुहोस्';

  @override
  String get customNickname => 'अनुकूलन उपनाम';

  @override
  String unpairConfirmTitle(Object name) {
    return 'जोडा हटाउने हो $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'यसले यस फोनमा तपाईंको रोबोटहरूबाट $name लाई हटाउनेछ। तपाइँ यसलाई कुनै पनि समयमा पुन: थप्न सक्नुहुन्छ।\n\nनोट: रोबोट मेमोरी पूर्ण रूपमा मेटाउन र कारखाना पूर्वनिर्धारितहरू पुनर्स्थापना गर्न, \"फ्याक्ट्री रिसेट\" प्रयोग गर्नुहोस्।';
  }

  @override
  String get unpairButton => 'UNPAIR';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'दौडिरहेको';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'त्रुटि';

  @override
  String get machineCalibrating => 'क्यालिब्रेट गर्दै';

  @override
  String ledLabel(Object state) {
    return 'एलईडी: $state';
  }

  @override
  String get ledSaved => 'बचत गरियो';

  @override
  String get ledInputErr => 'इनपुट त्रुटि';

  @override
  String get ledPairing => 'जोडा बनाउँदै';

  @override
  String get ledConnected => 'जडान गरिएको';

  @override
  String get ledIdentify => 'पहिचान गर्नुहोस्';

  @override
  String get identifyButton => 'पहिचान गर्नुहोस्';

  @override
  String get identifyingToast => '3 सेकेन्डको लागि रोबोट एलईडी फ्ल्यास...';

  @override
  String get homingToast => 'सबै फ्ल्याप होमिङ...';

  @override
  String get i2cFault => 'I2C त्रुटि';

  @override
  String get storageFault => 'भण्डारण त्रुटि';

  @override
  String get estopLatched => 'E-STOP LACHED';

  @override
  String get presetButtonsTitle => 'प्रिसेट बटनहरू';

  @override
  String customizePresetTitle(Object label) {
    return 'अनुकूलन गर्नुहोस् $label';
  }

  @override
  String get subtitleNameLabel => 'उपशीर्षक नाम';

  @override
  String get subtitleNameHint => 'जस्तै द्रुत फोल्ड, शर्ट, अनुकूलन ...';

  @override
  String get buttonColorLabel => 'बटन रङ';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'चरण $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'आपतकालीन रोक';

  @override
  String get clearEstop => 'खाली गर्नुहोस् र ई-स्टप खोल्नुहोस्';

  @override
  String get clearEstopHint =>
      'आपत्कालीन बिसौनी रिसेट गर्छ र रोबोटलाई निष्क्रियमा फर्काउँछ';

  @override
  String get stopButton => 'रोक्नुहोस्';

  @override
  String get fabricaArrangementTitle => 'FABRICA व्यवस्था';

  @override
  String get editArrangement => 'व्यवस्था सम्पादन गर्नुहोस्';

  @override
  String get addPanel => 'प्यानल थप्नुहोस्';

  @override
  String get legendMotorized => 'मोटराइज्ड';

  @override
  String get legendFollower => 'अनुयायी';

  @override
  String get legendBase => 'आधार';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'पङ्क्तिहरू';

  @override
  String stepSelectedHint(Object step) {
    return 'चरण $step चयन गरियो: ग्रिडमा १–२ मोटर चालित प्यानलहरूमा ट्याप गर्नुहोस्';
  }

  @override
  String get tapPanelsHint => 'ग्रिडमा १–२ मोटर प्यानलहरूमा ट्याप गर्नुहोस्';

  @override
  String get dualBadge => 'डुअल';

  @override
  String get requiresMotorizedPanel =>
      'कम्तिमा १ मोटर चालित प्यानल चाहिन्छ (अधिकतम २)';

  @override
  String get selectedChangePanelsHint =>
      'चयन गरिएको • परिवर्तन गर्न ग्रिड प्यानलहरूमा ट्याप गर्नुहोस् (अधिकतम 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'चरण $step को $total';
  }

  @override
  String get removeStepTooltip => 'चरण हटाउनुहोस्';

  @override
  String get requiresMotorizedModuleWarning =>
      'दिनचर्यालाई Fabrica Arrangement बाट कम्तिमा एउटा मोटर चालित मोड्युल चाहिन्छ।';

  @override
  String get routineFull => 'दिनचर्या पूर्ण (१६/१६ चरणहरू)';

  @override
  String addStepCount(Object count) {
    return 'कदम थप्नुहोस् ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Robot मा दिनचर्या बचत गर्नुहोस्';

  @override
  String get selectButtonToProgram =>
      'यो दिनचर्या संग कार्यक्रम गर्न भौतिक रोबोट बटन चयन गर्नुहोस्:';

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
  String get saveToRobotButton => 'रोबोटमा बचत गर्नुहोस्';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'बटन $slot ($count चरणहरू)';
  }

  @override
  String get adultTshirtTemplate => 'वयस्क टी-शर्ट टेम्प्लेट';

  @override
  String get longSleeveTemplate => 'लामो बाहुला टेम्प्लेट';

  @override
  String get dualSweepTemplate => 'डुअल स्वीप टेम्प्लेट';

  @override
  String channelNumber(Object number) {
    return 'च्यानल $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count जोडी';
  }

  @override
  String get moreHardwareOptions => 'थप हार्डवेयर विकल्पहरू';

  @override
  String get loadTemplate => 'टेम्प्लेट लोड गर्नुहोस्';

  @override
  String get controllerLabel => 'नियन्त्रक';

  @override
  String get motorBadge => 'मोटर';

  @override
  String get followerBadge => 'फलोअर';

  @override
  String get baseBadge => 'आधार';

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
