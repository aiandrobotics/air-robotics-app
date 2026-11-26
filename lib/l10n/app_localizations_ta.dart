// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'அமைப்புகள்';

  @override
  String get appLanguageTitle => 'பயன்பாட்டு மொழி';

  @override
  String get appVersionTitle => 'பயன்பாட்டு பதிப்பு';

  @override
  String get languageSectionTitle => 'மொழி';

  @override
  String get languageSystemDefault => 'கணினி இயல்புநிலை (சாதன மொழி)';

  @override
  String get selectLanguageHint => 'மொழியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get addDeviceTitle => 'புதிய ரோபோவைச் சேர்க்கவும்';

  @override
  String get addDeviceSubtitle => 'AIR ரோபோக்களை இணைக்கவும்';

  @override
  String get yourRobots => 'உங்கள் ரோபோக்கள்';

  @override
  String get discoveredRobots => 'கண்டுபிடிக்கப்பட்ட ரோபோக்கள்';

  @override
  String get noRobotsPairedYet => 'இன்னும் ரோபோக்கள் இணைக்கப்படவில்லை';

  @override
  String get noRobotsPairedSubtitle =>
      'டெலிமெட்ரியைப் பார்க்க, முன்னமைவுகளை நிர்வகிக்க மற்றும் செயல்பாடுகளைக் கட்டுப்படுத்த உங்கள் ரோபோவை இணைக்கவும்.';

  @override
  String get addYourFirstRobot => 'உங்கள் முதல் ரோபோவைச் சேர்க்கவும்';

  @override
  String get autoScanning => 'ஆட்டோ ஸ்கேனிங்';

  @override
  String get idleStatus => 'செயலற்ற';

  @override
  String get tabControl => 'கட்டுப்பாடு';

  @override
  String get tabSequencer => 'சீக்வென்சர்';

  @override
  String get tabCalibrator => 'அளவீடு செய்பவர்';

  @override
  String get tabDiagnostics => 'நோய் கண்டறிதல்';

  @override
  String get renameRobot => 'ரோபோவின் பெயரை மாற்றவும்';

  @override
  String get bleDiagnostics => 'BLE நோயறிதல்';

  @override
  String get erasePresets => 'சேமித்த முன்னமைவுகளை அழிக்கவும்';

  @override
  String get disconnect => 'துண்டிக்கவும்';

  @override
  String get unpairRobot => 'ரோபோவை இணைக்கவும்';

  @override
  String get factoryReset => 'தொழிற்சாலை மீட்டமைப்பு';

  @override
  String get servoManualJog => 'சர்வோ மேனுவல் ஜாக்';

  @override
  String get homeAll => 'வீடு அனைத்தும்';

  @override
  String get foldingTimeline => 'மடிப்பு காலவரிசை';

  @override
  String get addStep => 'படியைச் சேர்';

  @override
  String get previewOnRobot => 'ரோபோவில் முன்னோட்டம்';

  @override
  String get saveToButton => 'பொத்தானில் சேமிக்கவும்';

  @override
  String get themeTitle => 'தீம்';

  @override
  String get themeSystem => 'சாதனம்';

  @override
  String get themeLight => 'ஒளி';

  @override
  String get themeDark => 'இருள்';

  @override
  String get connectedBadge => 'இணைக்கப்பட்டது';

  @override
  String get inRangeBadge => 'வரம்பில்';

  @override
  String get offlineBadge => 'ஆஃப்லைனில்';

  @override
  String get openButton => 'திறந்த';

  @override
  String get connectButton => 'இணைக்கவும்';

  @override
  String get reconnectButton => 'மீண்டும் இணைக்கவும்';

  @override
  String get pairAndConnect => 'இணை & இணைக்கவும்';

  @override
  String get autoScanningForRobots => 'ரோபோக்களுக்கான தானாக ஸ்கேனிங்...';

  @override
  String get scanningIdle => 'செயலற்ற நிலையில் ஸ்கேன் செய்கிறது';

  @override
  String get nearbyRobotsAppear =>
      'அருகிலுள்ள ரோபோக்கள் இங்கே தானாகவே தோன்றும்.';

  @override
  String get yourNearbyRobotsAppear =>
      'உங்கள் அருகிலுள்ள ரோபோக்கள் இங்கே தானாகவே தோன்றும்.';

  @override
  String get signalStrong => 'வலுவான';

  @override
  String get signalGood => 'நல்லது';

  @override
  String get signalWeak => 'பலவீனமான';

  @override
  String get addRobotIntro =>
      'இணைக்க கீழே ஒரு ரோபோவைத் தேர்ந்தெடுக்கவும். இணைத்தல் பயன்முறையில் அருகிலுள்ள எந்த ரோபோவும் மேலே தானாகவே கண்டறியப்படும்.';

  @override
  String get autoDiscoveredRobot => 'ஆட்டோ கண்டுபிடித்த ரோபோ';

  @override
  String get autoDiscoveredRobots => 'ஆட்டோ கண்டுபிடித்த ரோபோக்கள்';

  @override
  String readyCountBadge(Object count) {
    return '$count தயார்';
  }

  @override
  String get supportedRobots => 'ஆதரிக்கப்படும் ரோபோக்கள்';

  @override
  String get clothesFoldingRobot => 'ஆடைகளை மடக்கும் ரோபோ';

  @override
  String get fabricaDescription =>
      'மல்டி-கார்மென்ட் முன்னமைவுகள் மற்றும் தொட்டுணரக்கூடிய ஒற்றை-பொத்தான் இயக்கத்துடன் கூடிய தானியங்கு ஆடை கோப்புறை.';

  @override
  String get fabricaPairingHint =>
      'இணைத்தல் முறை: ஃபேப்ரிகா கண்ட்ரோல் பேனலில் ஏதேனும் பட்டனை 3 வினாடிகள் அழுத்திப் பிடிக்கவும் (நிலை LED விரைவாக ஒளிரும்).';

  @override
  String get pairFabricaNow => 'இப்போது ஃபேப்ரிகாவை இணைக்கவும்';

  @override
  String get backToHome => 'முகப்புக்குத் திரும்பு';

  @override
  String get connReady => 'தயார்';

  @override
  String get connConnecting => 'இணைக்கிறது';

  @override
  String get connDiscovering => 'கண்டறிதல்';

  @override
  String get connBonding => 'பிணைப்பு';

  @override
  String get connScanning => 'ஸ்கேன் செய்கிறது';

  @override
  String get connDisconnected => 'துண்டிக்கப்பட்டது';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name இலிருந்து துண்டிக்கவா?';
  }

  @override
  String get disconnectConfirmBody =>
      'முகப்புத் திரையில் இருந்து எப்போது வேண்டுமானாலும் மீண்டும் இணைக்கலாம்.';

  @override
  String get cancelButton => 'ரத்துசெய்';

  @override
  String get saveButton => 'சேமிக்கவும்';

  @override
  String get customNickname => 'தனிப்பயன் புனைப்பெயர்';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name ஜோடியை நீக்கவா?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'இது இந்த மொபைலில் உள்ள உங்கள் ரோபோக்களில் இருந்து $name ஐ அகற்றும். நீங்கள் எந்த நேரத்திலும் அதை மீண்டும் சேர்க்கலாம்.\n\nகுறிப்பு: ரோபோ நினைவகத்தை முழுவதுமாக அழிக்க மற்றும் தொழிற்சாலை இயல்புநிலைகளை மீட்டெடுக்க, \"தொழிற்சாலை மீட்டமை\" ஐப் பயன்படுத்தவும்.';
  }

  @override
  String get unpairButton => 'UNPAIR';

  @override
  String get machineIdle => 'செயலற்ற';

  @override
  String get machineRunning => 'ஓடுகிறது';

  @override
  String get machineEstop => 'மின் நிறுத்தம்';

  @override
  String get machineError => 'பிழை';

  @override
  String get machineCalibrating => 'அளவீடு செய்தல்';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'சேமிக்கப்பட்டது';

  @override
  String get ledInputErr => 'உள்ளீடு பிழை';

  @override
  String get ledPairing => 'இணைத்தல்';

  @override
  String get ledConnected => 'இணைக்கப்பட்டது';

  @override
  String get ledIdentify => 'அடையாளம் காணவும்';

  @override
  String get identifyButton => 'அடையாளம் காணவும்';

  @override
  String get identifyingToast => '3 வினாடிகளுக்கு ஒளிரும் ரோபோ LED...';

  @override
  String get homingToast => 'அனைத்து மடல்களையும் ஹோமிங்...';

  @override
  String get i2cFault => 'I2C தவறு';

  @override
  String get storageFault => 'சேமிப்பு பிழை';

  @override
  String get estopLatched => 'மின் நிறுத்தம் லாட்ச்';

  @override
  String get presetButtonsTitle => 'முன்னமைக்கப்பட்ட பொத்தான்கள்';

  @override
  String customizePresetTitle(Object label) {
    return 'தனிப்பயனாக்கு $label';
  }

  @override
  String get subtitleNameLabel => 'வசன பெயர்';

  @override
  String get subtitleNameHint =>
      'எ.கா. விரைவான மடிப்பு, சட்டைகள், தனிப்பயன்...';

  @override
  String get buttonColorLabel => 'பொத்தான் நிறம்';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'படி $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'அவசர நிறுத்தம்';

  @override
  String get clearEstop => 'மின்-நிறுத்தத்தை அழி & துண்டிக்கவும்';

  @override
  String get clearEstopHint =>
      'அவசரகால நிறுத்தத்தை மீட்டமைத்து, ரோபோவை செயலற்ற நிலைக்குத் திருப்புகிறது';

  @override
  String get stopButton => 'நிறுத்து';

  @override
  String get fabricaArrangementTitle => 'ஃபேப்ரிகா ஏற்பாடு';

  @override
  String get editArrangement => 'திருத்த ஏற்பாடு';

  @override
  String get addPanel => 'பேனலைச் சேர்க்கவும்';

  @override
  String get legendMotorized => 'மோட்டார் பொருத்தப்பட்டது';

  @override
  String get legendFollower => 'பின்பற்றுபவர்';

  @override
  String get legendBase => 'அடிப்படை';

  @override
  String get colsLabel => 'கோல்ஸ்';

  @override
  String get rowsLabel => 'வரிசைகள்';

  @override
  String stepSelectedHint(Object step) {
    return 'படி $step தேர்ந்தெடுக்கப்பட்டது: கட்டத்தில் 1–2 மோட்டார் பொருத்தப்பட்ட பேனல்களைத் தட்டவும்';
  }

  @override
  String get tapPanelsHint => 'கட்டத்தில் 1-2 மோட்டார் பேனல்களைத் தட்டவும்';

  @override
  String get dualBadge => 'இரட்டை';

  @override
  String get requiresMotorizedPanel =>
      'குறைந்தது 1 மோட்டார் பொருத்தப்பட்ட பேனல் தேவை (அதிகபட்சம் 2)';

  @override
  String get selectedChangePanelsHint =>
      'தேர்ந்தெடுக்கப்பட்டது • மாற்ற கிரிட் பேனல்களைத் தட்டவும் (அதிகபட்சம் 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'படி $step / $total';
  }

  @override
  String get removeStepTooltip => 'படியை அகற்று';

  @override
  String get requiresMotorizedModuleWarning =>
      'ஃபேப்ரிகா ஏற்பாட்டிலிருந்து குறைந்தபட்சம் ஒரு மோட்டார் பொருத்தப்பட்ட மாட்யூலாவது வழக்கமாக இருக்க வேண்டும்.';

  @override
  String get routineFull => 'வழக்கமான முழு (16/16 படிகள்)';

  @override
  String addStepCount(Object count) {
    return 'படி சேர் ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'ரோபோவுக்கு வழக்கத்தைச் சேமிக்கவும்';

  @override
  String get selectButtonToProgram =>
      'இந்த வழக்கத்துடன் நிரல் செய்ய இயற்பியல் ரோபோ பொத்தானைத் தேர்ந்தெடுக்கவும்:';

  @override
  String buttonNumber(Object slot) {
    return 'பொத்தான் $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'வன்பொருள் பொத்தான் $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'பொத்தான் $slot வசனம் (விரும்பினால்)';
  }

  @override
  String get saveToRobotButton => 'ரோபோவில் சேமிக்கவும்';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'பொத்தான் $slot ($count படிகள்)';
  }

  @override
  String get adultTshirtTemplate => 'வயது வந்தோருக்கான டி-ஷர்ட் டெம்ப்ளேட்';

  @override
  String get longSleeveTemplate => 'லாங் ஸ்லீவ் டெம்ப்ளேட்';

  @override
  String get dualSweepTemplate => 'இரட்டை ஸ்வீப் டெம்ப்ளேட்';

  @override
  String channelNumber(Object number) {
    return 'சேனல் $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count ஜோடி';
  }

  @override
  String get moreHardwareOptions => 'மேலும் வன்பொருள் விருப்பங்கள்';

  @override
  String get loadTemplate => 'வார்ப்புருவை ஏற்றவும்';

  @override
  String get controllerLabel => 'கன்ட்ரோலர்';

  @override
  String get motorBadge => 'மோட்டார்';

  @override
  String get followerBadge => 'பின்பற்றுபவர்';

  @override
  String get baseBadge => 'அடிப்படை';

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
