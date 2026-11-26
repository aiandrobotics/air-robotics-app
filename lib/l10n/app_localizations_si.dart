// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class AppLocalizationsSi extends AppLocalizations {
  AppLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'සැකසීම්';

  @override
  String get appLanguageTitle => 'යෙදුම් භාෂාව';

  @override
  String get appVersionTitle => 'යෙදුම් අනුවාදය';

  @override
  String get languageSectionTitle => 'භාෂාව';

  @override
  String get languageSystemDefault => 'පද්ධති පෙරනිමි (උපාංග භාෂාව)';

  @override
  String get selectLanguageHint => 'භාෂාවක් තෝරන්න';

  @override
  String get addDeviceTitle => 'නව රොබෝවක් එක් කරන්න';

  @override
  String get addDeviceSubtitle => 'AIR රොබෝවරු යුගල කරන්න';

  @override
  String get yourRobots => 'ඔබේ රොබෝවරු';

  @override
  String get discoveredRobots => 'සොයාගත් රොබෝවරු';

  @override
  String get noRobotsPairedYet => 'තවමත් රොබෝවරු යුගල කර නැත';

  @override
  String get noRobotsPairedSubtitle =>
      'ටෙලිමෙට්‍රි බැලීමට, පෙරසිටුවීම් කළමනාකරණය කිරීමට සහ මෙහෙයුම් පාලනය කිරීමට ඔබේ රොබෝව සම්බන්ධ කරන්න.';

  @override
  String get addYourFirstRobot => 'ඔබේ පළමු රොබෝවරයා එක් කරන්න';

  @override
  String get autoScanning => 'ස්වයංක්‍රීය පරිලෝකනය';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'පාලනය කරන්න';

  @override
  String get tabSequencer => 'අනුක්රමික';

  @override
  String get tabCalibrator => 'ක්රමාංකනය කරන්නා';

  @override
  String get tabDiagnostics => 'රෝග විනිශ්චය';

  @override
  String get renameRobot => 'රොබෝව නැවත නම් කරන්න';

  @override
  String get bleDiagnostics => 'BLE රෝග විනිශ්චය';

  @override
  String get erasePresets => 'සුරැකි පෙරසිටුවීම් මකන්න';

  @override
  String get disconnect => 'විසන්ධි කරන්න';

  @override
  String get unpairRobot => 'රොබෝ යුගල ඉවත් කරන්න';

  @override
  String get factoryReset => 'කර්මාන්තශාලා යළි පිහිටුවීම';

  @override
  String get servoManualJog => 'සර්වෝ මැනුවල් ජෝග්';

  @override
  String get homeAll => 'නිවස සියල්ල';

  @override
  String get foldingTimeline => 'folding කාලරේඛාව';

  @override
  String get addStep => 'පියවර එකතු කරන්න';

  @override
  String get previewOnRobot => 'රොබෝව මත පෙරදසුන';

  @override
  String get saveToButton => 'බොත්තම වෙත සුරකින්න';

  @override
  String get themeTitle => 'තේමාව';

  @override
  String get themeSystem => 'උපාංගය';

  @override
  String get themeLight => 'ආලෝකය';

  @override
  String get themeDark => 'අඳුරු';

  @override
  String get connectedBadge => 'සම්බන්ධයි';

  @override
  String get inRangeBadge => 'පරාසයක';

  @override
  String get offlineBadge => 'නොබැඳි';

  @override
  String get openButton => 'විවෘත කරන්න';

  @override
  String get connectButton => 'සම්බන්ධ කරන්න';

  @override
  String get reconnectButton => 'නැවත සම්බන්ධ කරන්න';

  @override
  String get pairAndConnect => 'යුගල සහ සම්බන්ධ කරන්න';

  @override
  String get autoScanningForRobots => 'රොබෝවරුන් සඳහා ස්වයංක්‍රීය පරිලෝකනය...';

  @override
  String get scanningIdle => 'අක්‍රියව ස්කෑන් කිරීම';

  @override
  String get nearbyRobotsAppear => 'අවට රොබෝවරු මෙහි ස්වයංක්‍රීයව දිස් වනු ඇත.';

  @override
  String get yourNearbyRobotsAppear =>
      'ඔබගේ අවට රොබෝවරු මෙහි ස්වයංක්‍රීයව දිස් වනු ඇත.';

  @override
  String get signalStrong => 'ශක්තිමත්';

  @override
  String get signalGood => 'හොඳයි';

  @override
  String get signalWeak => 'දුර්වලයි';

  @override
  String get addRobotIntro =>
      'යුගල කිරීමට පහත රොබෝවක් තෝරන්න. යුගල කිරීමේ ප්‍රකාරයේ අසල ඇති ඕනෑම රොබෝවක් ඉහළින් ස්වයංක්‍රීයව සොයාගනු ඇත.';

  @override
  String get autoDiscoveredRobot => 'ස්වයංක්‍රීයව සොයාගත් රොබෝ';

  @override
  String get autoDiscoveredRobots => 'ස්වයංක්‍රීයව සොයාගත් රොබෝවරු';

  @override
  String readyCountBadge(Object count) {
    return '$count සූදානම්';
  }

  @override
  String get supportedRobots => 'සහාය දක්වන රොබෝවරු';

  @override
  String get clothesFoldingRobot => 'ඇඳුම් ෆෝල්ඩින් රොබෝ';

  @override
  String get fabricaDescription =>
      'බහු-ඇඟළුම් පෙරසිටුවීම් සහ ස්පර්ශක තනි බොත්තම් ක්‍රියාකාරිත්වය සහිත ස්වයංක්‍රීය ඇඟලුම් ෆෝල්ඩරය.';

  @override
  String get fabricaPairingHint =>
      'යුගල කිරීමේ ප්‍රකාරය: Fabrica පාලක පැනලයේ ඕනෑම බොත්තමක් තත්පර 3ක් ඔබාගෙන සිටින්න (තත්ත්වය LED ​​වේගයෙන් දැල්වෙයි).';

  @override
  String get pairFabricaNow => 'දැන් FABRICA යුගල කරන්න';

  @override
  String get backToHome => 'ආපසු නිවසට';

  @override
  String get connReady => 'සූදානම්';

  @override
  String get connConnecting => 'සම්බන්ධ වෙමින්';

  @override
  String get connDiscovering => 'සොයා ගැනීම';

  @override
  String get connBonding => 'බැඳීම';

  @override
  String get connScanning => 'ස්කෑන් කිරීම';

  @override
  String get connDisconnected => 'විසන්ධි වී ඇත';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name වෙතින් විසන්ධි කරන්නද?';
  }

  @override
  String get disconnectConfirmBody =>
      'ඔබට මුල් තිරයෙන් ඕනෑම වේලාවක නැවත සම්බන්ධ විය හැක.';

  @override
  String get cancelButton => 'අවලංගු කරන්න';

  @override
  String get saveButton => 'සුරකින්න';

  @override
  String get customNickname => 'අභිරුචි අන්වර්ථ නාමය';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name යුගල ඉවත් කරන්නද?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'මෙය මෙම දුරකථනයේ ඔබගේ රොබෝවරුන් වෙතින් $name ඉවත් කරනු ඇත. ඔබට ඕනෑම අවස්ථාවක එය නැවත එකතු කළ හැක.\n\nසටහන: රොබෝ මතකය සම්පූර්ණයෙන් මකා දැමීමට සහ කර්මාන්තශාලා පෙරනිමි ප්‍රතිසාධනය කිරීමට, \"කර්මාන්තශාලා යළි පිහිටුවීම\" භාවිතා කරන්න.';
  }

  @override
  String get unpairButton => 'UNPAIR';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'දුවනවා';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'දෝෂයකි';

  @override
  String get machineCalibrating => 'ක්රමාංකනය කිරීම';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'සුරකින ලදී';

  @override
  String get ledInputErr => 'ආදාන දෝෂය';

  @override
  String get ledPairing => 'යුගල කිරීම';

  @override
  String get ledConnected => 'සම්බන්ධයි';

  @override
  String get ledIdentify => 'හඳුනාගන්න';

  @override
  String get identifyButton => 'හඳුනාගන්න';

  @override
  String get identifyingToast => 'තත්පර 3ක් සඳහා රොබෝ LED දැල්වෙන...';

  @override
  String get homingToast => 'සියලුම ෆ්ලැප්ස් හෝමින්...';

  @override
  String get i2cFault => 'I2C දෝෂය';

  @override
  String get storageFault => 'ගබඩා දෝෂය';

  @override
  String get estopLatched => 'E-STOP LATCHED';

  @override
  String get presetButtonsTitle => 'පෙරසැකසුම් බොත්තම්';

  @override
  String customizePresetTitle(Object label) {
    return 'අභිරුචිකරණය $label';
  }

  @override
  String get subtitleNameLabel => 'උපසිරැසි නම';

  @override
  String get subtitleNameHint => 'උදා. ඉක්මන් නැවීම, ෂර්ට්, අභිරුචි...';

  @override
  String get buttonColorLabel => 'බොත්තම් වර්ණය';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'පියවර $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'හදිසි නැවතුම';

  @override
  String get clearEstop => 'E-STOP CLEAR & UNLATCH';

  @override
  String get clearEstopHint =>
      'හදිසි නැවතුම නැවත සකස් කර රොබෝව නැවත Idle වෙත ලබා දෙයි';

  @override
  String get stopButton => 'නවත්වන්න';

  @override
  String get fabricaArrangementTitle => 'රෙදිපිළි සකස් කිරීම';

  @override
  String get editArrangement => 'සකස් කිරීම';

  @override
  String get addPanel => 'පැනලය එක් කරන්න';

  @override
  String get legendMotorized => 'මෝටර්රථය';

  @override
  String get legendFollower => 'අනුගාමිකයා';

  @override
  String get legendBase => 'පදනම';

  @override
  String get colsLabel => 'කොල්ස්';

  @override
  String get rowsLabel => 'පේළි';

  @override
  String stepSelectedHint(Object step) {
    return 'පියවර $step තෝරන ලදී: ජාලකයේ ඇති මෝටර් කළ පැනල් 1–2 තට්ටු කරන්න';
  }

  @override
  String get tapPanelsHint => 'ජාලකයේ මෝටර් පැනල් 1-2ක් තට්ටු කරන්න';

  @override
  String get dualBadge => 'ද්විත්ව';

  @override
  String get requiresMotorizedPanel =>
      'අවම වශයෙන් යතුරුපැදි පැනල 1ක් අවශ්‍ය වේ (උපරිම 2)';

  @override
  String get selectedChangePanelsHint =>
      'තෝරන ලදී • වෙනස් කිරීමට ජාල පැනල තට්ටු කරන්න (උපරිම 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'පියවර $step න් $total';
  }

  @override
  String get removeStepTooltip => 'පියවර ඉවත් කරන්න';

  @override
  String get requiresMotorizedModuleWarning =>
      'දිනචරියාව සඳහා Fabrica Arrangement වෙතින් අවම වශයෙන් එක් මොටෝරයිඩ් මොඩියුලයක් අවශ්‍ය වේ.';

  @override
  String get routineFull => 'දිනචර්යාව සම්පූර්ණ (පියවර 16/16)';

  @override
  String addStepCount(Object count) {
    return 'පියවර එක් කරන්න ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Robot වෙත දින චර්යාව සුරකින්න';

  @override
  String get selectButtonToProgram =>
      'මෙම චර්යාව සමඟ වැඩසටහන් කිරීමට භෞතික රොබෝ බොත්තමක් තෝරන්න:';

  @override
  String buttonNumber(Object slot) {
    return 'බොත්තම $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'දෘඪාංග බොත්තම $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'බොත්තම $slot උපසිරැසි (විකල්ප)';
  }

  @override
  String get saveToRobotButton => 'රොබෝට සුරකින්න';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'බොත්තම $slot ($count පියවර)';
  }

  @override
  String get adultTshirtTemplate => 'වැඩිහිටි T-Shirt සැකිල්ල';

  @override
  String get longSleeveTemplate => 'දිගු අත් අච්චුව';

  @override
  String get dualSweepTemplate => 'ද්විත්ව ස්වීප් අච්චුව';

  @override
  String channelNumber(Object number) {
    return 'නාලිකාව $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count යුගල කරන ලදී';
  }

  @override
  String get moreHardwareOptions => 'තවත් දෘඪාංග විකල්ප';

  @override
  String get loadTemplate => 'අච්චුව පැටවීම';

  @override
  String get controllerLabel => 'පාලකය';

  @override
  String get motorBadge => 'මෝටර්';

  @override
  String get followerBadge => 'අනුගාමිකයා';

  @override
  String get baseBadge => 'පදනම';

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
