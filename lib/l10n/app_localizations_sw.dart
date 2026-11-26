// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Mipangilio';

  @override
  String get appLanguageTitle => 'Lugha ya Programu';

  @override
  String get appVersionTitle => 'Toleo la Programu';

  @override
  String get languageSectionTitle => 'Lugha';

  @override
  String get languageSystemDefault => 'Chaguomsingi cha Mfumo (Lugha ya Kifaa)';

  @override
  String get selectLanguageHint => 'Chagua lugha';

  @override
  String get addDeviceTitle => 'ONGEZA ROBOTI MPYA';

  @override
  String get addDeviceSubtitle => 'Oanisha roboti HEWA';

  @override
  String get yourRobots => 'ROBOTI ZAKO';

  @override
  String get discoveredRobots => 'ROBOTI ZILIZOGUNDULIWA';

  @override
  String get noRobotsPairedYet => 'Bado Hakuna Roboti Zilizooanishwa';

  @override
  String get noRobotsPairedSubtitle =>
      'Unganisha roboti yako ili kutazama telemetry, kudhibiti mipangilio ya awali, na kudhibiti uendeshaji.';

  @override
  String get addYourFirstRobot => 'ONGEZA ROBOTI YAKO YA KWANZA';

  @override
  String get autoScanning => 'KUCHANGANUA KIOTOmatiki';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'Udhibiti';

  @override
  String get tabSequencer => 'Mfuatano';

  @override
  String get tabCalibrator => 'Kidhibiti';

  @override
  String get tabDiagnostics => 'Uchunguzi';

  @override
  String get renameRobot => 'Badilisha jina la Roboti';

  @override
  String get bleDiagnostics => 'Uchunguzi wa BLE';

  @override
  String get erasePresets => 'Futa Uwekaji Mapema Uliohifadhiwa';

  @override
  String get disconnect => 'Tenganisha';

  @override
  String get unpairRobot => 'Batilisha Roboti';

  @override
  String get factoryReset => 'Rudisha Kiwanda';

  @override
  String get servoManualJog => 'SERVO MWONGOZO JOG';

  @override
  String get homeAll => 'NYUMBANI WOTE';

  @override
  String get foldingTimeline => 'MTANDAO WA WAKATI WA KUkunja';

  @override
  String get addStep => 'ONGEZA HATUA';

  @override
  String get previewOnRobot => 'ANGALIA KWENYE ROBOTI';

  @override
  String get saveToButton => 'HIFADHI KWENYE KITUFE';

  @override
  String get themeTitle => 'Mandhari';

  @override
  String get themeSystem => 'Kifaa';

  @override
  String get themeLight => 'Mwanga';

  @override
  String get themeDark => 'Giza';

  @override
  String get connectedBadge => 'IMEUNGANISHWA';

  @override
  String get inRangeBadge => 'KATIKA MBALIMBALI';

  @override
  String get offlineBadge => 'NJE YA MTANDAO';

  @override
  String get openButton => 'FUNGUA';

  @override
  String get connectButton => 'UNGANISHA';

  @override
  String get reconnectButton => 'UNGANISHA UPYA';

  @override
  String get pairAndConnect => 'UNGANISHA NA UUNGANISHE';

  @override
  String get autoScanningForRobots => 'Inachanganua roboti kiotomatiki...';

  @override
  String get scanningIdle => 'Inachanganua bila kufanya kitu';

  @override
  String get nearbyRobotsAppear =>
      'Roboti zilizo karibu zitaonekana hapa kiotomatiki.';

  @override
  String get yourNearbyRobotsAppear =>
      'Roboti zako zilizo karibu zitaonekana hapa kiotomatiki.';

  @override
  String get signalStrong => 'Nguvu';

  @override
  String get signalGood => 'Nzuri';

  @override
  String get signalWeak => 'Dhaifu';

  @override
  String get addRobotIntro =>
      'Chagua roboti hapa chini ili kuoanisha. Roboti yoyote iliyo karibu katika hali ya kuoanisha itagunduliwa kiotomatiki juu.';

  @override
  String get autoDiscoveredRobot => 'ROBOTI ILIYOGUNDUA KIOTOmatiki';

  @override
  String get autoDiscoveredRobots => 'ROBOTI ZILIZOGUNDUA KIOTOmatiki';

  @override
  String readyCountBadge(Object count) {
    return '$count TAYARI';
  }

  @override
  String get supportedRobots => 'ROBOTI ZINAZAIDIWA';

  @override
  String get clothesFoldingRobot => 'Roboti ya Kukunja Nguo';

  @override
  String get fabricaDescription =>
      'Folda ya nguo ya kiotomatiki iliyo na mipangilio ya awali ya nguo nyingi na uendeshaji wa kifungo kimoja cha kugusa.';

  @override
  String get fabricaPairingHint =>
      'Hali ya kuoanisha: Bonyeza na ushikilie kitufe chochote kwenye paneli dhibiti ya Kitambaa kwa sekunde 3 (Hali ya LED itaangaza haraka).';

  @override
  String get pairFabricaNow => 'UNGANISHA FABRICA SASA';

  @override
  String get backToHome => 'Rudi Nyumbani';

  @override
  String get connReady => 'TAYARI';

  @override
  String get connConnecting => 'KUUNGANISHA';

  @override
  String get connDiscovering => 'KUGUNDUA';

  @override
  String get connBonding => 'KUUNGANISHA';

  @override
  String get connScanning => 'KUCHANGANUA';

  @override
  String get connDisconnected => 'IMEKATIZWA';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Je, ungependa kutenganisha kutoka $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Unaweza kuunganisha tena wakati wowote kutoka skrini ya kwanza.';

  @override
  String get cancelButton => 'GHAIRI';

  @override
  String get saveButton => 'HIFADHI';

  @override
  String get customNickname => 'Jina la Utani Maalum';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Ungependa kuoanisha $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Hatua hii itaondoa $name kutoka kwa Roboti Zako kwenye simu hii. Unaweza kuiongeza tena wakati wowote.\n\nKumbuka: Ili kufuta kabisa kumbukumbu ya roboti na kurejesha chaguo-msingi za kiwanda, tumia \"Rudisha Kiwanda\".';
  }

  @override
  String get unpairButton => 'TUSAIDIE';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'KUKIMBIA';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'HITILAFU';

  @override
  String get machineCalibrating => 'KALIBITI';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'IMEOKOKA';

  @override
  String get ledInputErr => 'KOSA LA KUINGIZA';

  @override
  String get ledPairing => 'UNGANISHA';

  @override
  String get ledConnected => 'IMEUNGANISHWA';

  @override
  String get ledIdentify => 'TAMBUA';

  @override
  String get identifyButton => 'TAMBUA';

  @override
  String get identifyingToast => 'Roboti inayomulika LED kwa sekunde 3...';

  @override
  String get homingToast => 'Inaangazia vibao vyote...';

  @override
  String get i2cFault => 'KOSA LA I2C';

  @override
  String get storageFault => 'KOSA LA HIFADHI';

  @override
  String get estopLatched => 'E-STOP IMEFUNGWA';

  @override
  String get presetButtonsTitle => 'VIFUNGO VYA TAYARI';

  @override
  String customizePresetTitle(Object label) {
    return 'Geuza kukufaa $label';
  }

  @override
  String get subtitleNameLabel => 'Jina la Manukuu';

  @override
  String get subtitleNameHint => 'k.m. Kunja Haraka, Mashati, Maalum...';

  @override
  String get buttonColorLabel => 'Rangi ya Kitufe';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Hatua $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'KUKOMESHA DHARURA';

  @override
  String get clearEstop => 'FUTA NA UZINDUE E-STOP';

  @override
  String get clearEstopHint =>
      'Huweka upya kituo cha dharura na kurudisha roboti kwenye hali ya kutofanya kazi';

  @override
  String get stopButton => 'SIMAMA';

  @override
  String get fabricaArrangementTitle => 'MPANGO WA KIFUA';

  @override
  String get editArrangement => 'BADILISHA MPANGILIO';

  @override
  String get addPanel => 'ONGEZA JOPO';

  @override
  String get legendMotorized => 'Motorized';

  @override
  String get legendFollower => 'Mfuasi';

  @override
  String get legendBase => 'Msingi';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Safu';

  @override
  String stepSelectedHint(Object step) {
    return 'Hatua ya $step imechaguliwa: Gusa paneli 1–2 za magari kwenye gridi ya taifa';
  }

  @override
  String get tapPanelsHint => 'Gusa paneli 1-2 za injini kwenye gridi ya taifa';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Inahitaji angalau paneli 1 yenye injini (max 2)';

  @override
  String get selectedChangePanelsHint =>
      'Imechaguliwa • Gusa paneli za gridi ili kubadilisha (usizidi 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Hatua $step ya $total';
  }

  @override
  String get removeStepTooltip => 'Ondoa Hatua';

  @override
  String get requiresMotorizedModuleWarning =>
      'Ratiba inahitaji angalau moduli moja ya Magari kutoka kwa Mpango wa Fabrica.';

  @override
  String get routineFull => 'RATIBA KAMILI (HATUA 16/16)';

  @override
  String addStepCount(Object count) {
    return 'ONGEZA HATUA ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Hifadhi Ratiba kwenye Roboti';

  @override
  String get selectButtonToProgram =>
      'Chagua kitufe cha roboti halisi ili kupanga na utaratibu huu:';

  @override
  String buttonNumber(Object slot) {
    return 'Kitufe $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Kitufe cha maunzi $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Kitufe $slot Manukuu (Si lazima)';
  }

  @override
  String get saveToRobotButton => 'HIFADHI KWENYE ROBOTI';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Kitufe $slot ($count hatua)';
  }

  @override
  String get adultTshirtTemplate => 'Kiolezo cha T-Shirt ya Watu Wazima';

  @override
  String get longSleeveTemplate => 'Kiolezo cha Mikono Mirefu';

  @override
  String get dualSweepTemplate => 'Kiolezo cha Kufagia Mbili';

  @override
  String channelNumber(Object number) {
    return 'Kituo $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count IMEANDALIWA';
  }

  @override
  String get moreHardwareOptions => 'Chaguzi Zaidi za Vifaa';

  @override
  String get loadTemplate => 'Pakia Kiolezo';

  @override
  String get controllerLabel => 'MDHIBITI';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'MFUASI';

  @override
  String get baseBadge => 'MSINGI';

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
