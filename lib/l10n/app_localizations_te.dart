// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'సెట్టింగ్‌లు';

  @override
  String get appLanguageTitle => 'యాప్ భాష';

  @override
  String get appVersionTitle => 'యాప్ వెర్షన్';

  @override
  String get languageSectionTitle => 'భాష';

  @override
  String get languageSystemDefault => 'సిస్టమ్ డిఫాల్ట్ (పరికర భాష)';

  @override
  String get selectLanguageHint => 'భాషను ఎంచుకోండి';

  @override
  String get addDeviceTitle => 'కొత్త రోబోట్‌ని జోడించండి';

  @override
  String get addDeviceSubtitle => 'AIR రోబోట్‌లను జత చేయండి';

  @override
  String get yourRobots => 'మీ రోబోట్లు';

  @override
  String get discoveredRobots => 'కనుగొన్న రోబోట్లు';

  @override
  String get noRobotsPairedYet => 'ఇంకా ఏ రోబోట్‌లు జత చేయబడలేదు';

  @override
  String get noRobotsPairedSubtitle =>
      'టెలిమెట్రీని వీక్షించడానికి, ప్రీసెట్‌లను నిర్వహించడానికి మరియు కార్యకలాపాలను నియంత్రించడానికి మీ రోబోట్‌ను కనెక్ట్ చేయండి.';

  @override
  String get addYourFirstRobot => 'మీ మొదటి రోబోట్‌ను జోడించండి';

  @override
  String get autoScanning => 'ఆటో-స్కానింగ్';

  @override
  String get idleStatus => 'నిష్క్రియ';

  @override
  String get tabControl => 'నియంత్రణ';

  @override
  String get tabSequencer => 'సీక్వెన్సర్';

  @override
  String get tabCalibrator => 'కాలిబ్రేటర్';

  @override
  String get tabDiagnostics => 'డయాగ్నోస్టిక్స్';

  @override
  String get renameRobot => 'రోబోట్ పేరు మార్చండి';

  @override
  String get bleDiagnostics => 'BLE డయాగ్నోస్టిక్స్';

  @override
  String get erasePresets => 'సేవ్ చేసిన ప్రీసెట్‌లను తొలగించండి';

  @override
  String get disconnect => 'డిస్‌కనెక్ట్ చేయండి';

  @override
  String get unpairRobot => 'రోబోట్‌ను అన్‌పెయిర్ చేయండి';

  @override
  String get factoryReset => 'ఫ్యాక్టరీ రీసెట్';

  @override
  String get servoManualJog => 'సర్వో మాన్యువల్ జోగ్';

  @override
  String get homeAll => 'హోమ్ అందరూ';

  @override
  String get foldingTimeline => 'ఫోల్డింగ్ కాలక్రమం';

  @override
  String get addStep => 'దశను జోడించండి';

  @override
  String get previewOnRobot => 'రోబోట్‌లో ప్రివ్యూ';

  @override
  String get saveToButton => 'బటన్‌కు సేవ్ చేయండి';

  @override
  String get themeTitle => 'థీమ్';

  @override
  String get themeSystem => 'పరికరం';

  @override
  String get themeLight => 'కాంతి';

  @override
  String get themeDark => 'చీకటి';

  @override
  String get connectedBadge => 'కనెక్ట్ చేయబడింది';

  @override
  String get inRangeBadge => 'పరిధిలో';

  @override
  String get offlineBadge => 'ఆఫ్‌లైన్';

  @override
  String get openButton => 'తెరవండి';

  @override
  String get connectButton => 'కనెక్ట్ చేయండి';

  @override
  String get reconnectButton => 'మళ్లీ కనెక్ట్ చేయండి';

  @override
  String get pairAndConnect => 'జత & కనెక్ట్';

  @override
  String get autoScanningForRobots => 'రోబోల కోసం ఆటో-స్కానింగ్...';

  @override
  String get scanningIdle => 'స్కానింగ్ పనిలేకుండా ఉంది';

  @override
  String get nearbyRobotsAppear =>
      'సమీపంలోని రోబోలు స్వయంచాలకంగా ఇక్కడ కనిపిస్తాయి.';

  @override
  String get yourNearbyRobotsAppear =>
      'మీ సమీపంలోని రోబోలు స్వయంచాలకంగా ఇక్కడ కనిపిస్తాయి.';

  @override
  String get signalStrong => 'బలమైన';

  @override
  String get signalGood => 'బాగుంది';

  @override
  String get signalWeak => 'బలహీనమైనది';

  @override
  String get addRobotIntro =>
      'జత చేయడానికి దిగువన రోబోట్‌ను ఎంచుకోండి. జత చేసే మోడ్‌లో సమీపంలోని ఏదైనా రోబోట్ ఎగువన స్వయంచాలకంగా కనుగొనబడుతుంది.';

  @override
  String get autoDiscoveredRobot => 'ఆటో కనిపెట్టిన రోబోట్';

  @override
  String get autoDiscoveredRobots => 'ఆటో కనిపెట్టిన రోబోట్లు';

  @override
  String readyCountBadge(Object count) {
    return '$count సిద్ధంగా ఉంది';
  }

  @override
  String get supportedRobots => 'సపోర్టెడ్ రోబోట్‌లు';

  @override
  String get clothesFoldingRobot => 'బట్టలు మడతపెట్టే రోబోట్';

  @override
  String get fabricaDescription =>
      'బహుళ-గార్మెంట్ ప్రీసెట్‌లు మరియు స్పర్శ సింగిల్-బటన్ ఆపరేషన్‌తో ఆటోమేటెడ్ గార్మెంట్ ఫోల్డర్.';

  @override
  String get fabricaPairingHint =>
      'జత చేసే మోడ్: ఫ్యాబ్రికా కంట్రోల్ ప్యానెల్‌లోని ఏదైనా బటన్‌ను 3 సెకన్ల పాటు నొక్కి పట్టుకోండి (స్టేటస్ LED వేగంగా బ్లింక్ అవుతుంది).';

  @override
  String get pairFabricaNow => 'ఇప్పుడు ఫాబ్రికాను జత చేయండి';

  @override
  String get backToHome => 'ఇంటికి తిరిగి వెళ్ళు';

  @override
  String get connReady => 'సిద్ధంగా ఉంది';

  @override
  String get connConnecting => 'కనెక్ట్ చేస్తోంది';

  @override
  String get connDiscovering => 'కనుగొనడం';

  @override
  String get connBonding => 'బంధం';

  @override
  String get connScanning => 'స్కాన్ చేస్తోంది';

  @override
  String get connDisconnected => 'డిస్‌కనెక్ట్ చేయబడింది';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name నుండి డిస్‌కనెక్ట్ చేయాలా?';
  }

  @override
  String get disconnectConfirmBody =>
      'మీరు హోమ్ స్క్రీన్ నుండి ఎప్పుడైనా మళ్లీ కనెక్ట్ చేయవచ్చు.';

  @override
  String get cancelButton => 'రద్దు చేయి';

  @override
  String get saveButton => 'సేవ్ చేయండి';

  @override
  String get customNickname => 'అనుకూల మారుపేరు';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name జతని తీసివేయాలా?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'ఇది ఈ ఫోన్‌లోని మీ రోబోట్‌ల నుండి $nameని తీసివేస్తుంది. మీరు దీన్ని ఎప్పుడైనా మళ్లీ జోడించవచ్చు.\n\nగమనిక: రోబోట్ మెమరీని పూర్తిగా తుడిచివేయడానికి మరియు ఫ్యాక్టరీ డిఫాల్ట్‌లను పునరుద్ధరించడానికి, \"ఫ్యాక్టరీ రీసెట్\"ని ఉపయోగించండి.';
  }

  @override
  String get unpairButton => 'UNPAIR';

  @override
  String get machineIdle => 'నిష్క్రియ';

  @override
  String get machineRunning => 'రన్నింగ్';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'లోపం';

  @override
  String get machineCalibrating => 'కాలిబ్రేటింగ్';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'సేవ్ చేయబడింది';

  @override
  String get ledInputErr => 'ఇన్‌పుట్ లోపం';

  @override
  String get ledPairing => 'జత చేయడం';

  @override
  String get ledConnected => 'కనెక్ట్ చేయబడింది';

  @override
  String get ledIdentify => 'గుర్తించండి';

  @override
  String get identifyButton => 'గుర్తించండి';

  @override
  String get identifyingToast => '3 సెకన్ల పాటు మెరుస్తున్న రోబోట్ LED...';

  @override
  String get homingToast => 'అన్ని ఫ్లాప్‌లను హోమింగ్...';

  @override
  String get i2cFault => 'I2C లోపం';

  @override
  String get storageFault => 'నిల్వ లోపం';

  @override
  String get estopLatched => 'ఇ-స్టాప్ లాచ్ చేయబడింది';

  @override
  String get presetButtonsTitle => 'ప్రీసెట్ బటన్లు';

  @override
  String customizePresetTitle(Object label) {
    return 'అనుకూలీకరించు $label';
  }

  @override
  String get subtitleNameLabel => 'ఉపశీర్షిక పేరు';

  @override
  String get subtitleNameHint => 'ఉదా త్వరిత మడతలు, చొక్కాలు, కస్టమ్...';

  @override
  String get buttonColorLabel => 'బటన్ రంగు';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'దశ $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'ఎమర్జెన్సీ స్టాప్';

  @override
  String get clearEstop => 'ఇ-స్టాప్‌ని క్లియర్ చేసి అన్‌లాచ్ చేయండి';

  @override
  String get clearEstopHint =>
      'ఎమర్జెన్సీ స్టాప్‌ని రీసెట్ చేస్తుంది మరియు రోబోట్‌ని ఐడిల్‌కి తిరిగి ఇస్తుంది';

  @override
  String get stopButton => 'ఆపు';

  @override
  String get fabricaArrangementTitle => 'ఫాబ్రికా అమరిక';

  @override
  String get editArrangement => 'సవరణ అమరిక';

  @override
  String get addPanel => 'ప్యానెల్ జోడించండి';

  @override
  String get legendMotorized => 'మోటారు';

  @override
  String get legendFollower => 'అనుచరుడు';

  @override
  String get legendBase => 'బేస్';

  @override
  String get colsLabel => 'కల్ల్స్';

  @override
  String get rowsLabel => 'వరుసలు';

  @override
  String stepSelectedHint(Object step) {
    return 'దశ $step ఎంచుకోబడింది: గ్రిడ్‌లో 1–2 మోటరైజ్డ్ ప్యానెల్‌లను నొక్కండి';
  }

  @override
  String get tapPanelsHint => 'గ్రిడ్‌లో 1–2 మోటార్ ప్యానెల్‌లను నొక్కండి';

  @override
  String get dualBadge => 'ద్వంద్వ';

  @override
  String get requiresMotorizedPanel =>
      'కనీసం 1 మోటరైజ్డ్ ప్యానెల్ అవసరం (గరిష్టంగా 2)';

  @override
  String get selectedChangePanelsHint =>
      'ఎంచుకోబడింది • మార్చడానికి గ్రిడ్ ప్యానెల్‌లను నొక్కండి (గరిష్టంగా 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return '$totalలో $step దశ';
  }

  @override
  String get removeStepTooltip => 'దశను తీసివేయండి';

  @override
  String get requiresMotorizedModuleWarning =>
      'రొటీన్‌కు ఫ్యాబ్రికా అరేంజ్‌మెంట్ నుండి కనీసం ఒక మోటరైజ్డ్ మాడ్యూల్ అవసరం.';

  @override
  String get routineFull => 'రొటీన్ పూర్తి (16/16 దశలు)';

  @override
  String addStepCount(Object count) {
    return 'దశను జోడించు ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'రోబోట్‌కు దినచర్యను సేవ్ చేయండి';

  @override
  String get selectButtonToProgram =>
      'ఈ రొటీన్‌తో ప్రోగ్రామ్ చేయడానికి ఫిజికల్ రోబోట్ బటన్‌ను ఎంచుకోండి:';

  @override
  String buttonNumber(Object slot) {
    return 'బటన్ $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'హార్డ్‌వేర్ బటన్ $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'బటన్ $slot ఉపశీర్షిక (ఐచ్ఛికం)';
  }

  @override
  String get saveToRobotButton => 'రోబోట్‌కి సేవ్ చేయండి';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'బటన్ $slot ($count అడుగులు)';
  }

  @override
  String get adultTshirtTemplate => 'వయోజన T-షర్టు టెంప్లేట్';

  @override
  String get longSleeveTemplate => 'లాంగ్ స్లీవ్ టెంప్లేట్';

  @override
  String get dualSweepTemplate => 'ద్వంద్వ స్వీప్ టెంప్లేట్';

  @override
  String channelNumber(Object number) {
    return 'ఛానెల్ $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count జత చేయబడింది';
  }

  @override
  String get moreHardwareOptions => 'మరిన్ని హార్డ్‌వేర్ ఎంపికలు';

  @override
  String get loadTemplate => 'మూసను లోడ్ చేయండి';

  @override
  String get controllerLabel => 'కంట్రోలర్';

  @override
  String get motorBadge => 'మోటారు';

  @override
  String get followerBadge => 'అనుచరుడు';

  @override
  String get baseBadge => 'బేస్';

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
