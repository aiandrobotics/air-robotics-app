// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lao (`lo`).
class AppLocalizationsLo extends AppLocalizations {
  AppLocalizationsLo([String locale = 'lo']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'ການຕັ້ງຄ່າ';

  @override
  String get appLanguageTitle => 'ພາສາແອັບ';

  @override
  String get appVersionTitle => 'ເວີຊັນແອັບ';

  @override
  String get languageSectionTitle => 'ພາສາ';

  @override
  String get languageSystemDefault => 'ຄ່າເລີ່ມຕົ້ນຂອງລະບົບ (ພາສາອຸປະກອນ)';

  @override
  String get selectLanguageHint => 'ເລືອກພາສາ';

  @override
  String get addDeviceTitle => 'ເພີ່ມຫຸ່ນຍົນໃໝ່';

  @override
  String get addDeviceSubtitle => 'ຈັບຄູ່ຫຸ່ນຍົນ AIR';

  @override
  String get yourRobots => 'ຫຸ່ນຍົນຂອງເຈົ້າ';

  @override
  String get discoveredRobots => 'ຄົ້ນພົບຫຸ່ນຍົນ';

  @override
  String get noRobotsPairedYet => 'ບໍ່ມີຫຸ່ນຍົນຈັບຄູ່ເທື່ອ';

  @override
  String get noRobotsPairedSubtitle =>
      'ເຊື່ອມຕໍ່ຫຸ່ນຍົນຂອງທ່ານເພື່ອເບິ່ງ telemetry, ຈັດການ presets ແລະຄວບຄຸມການດໍາເນີນງານ.';

  @override
  String get addYourFirstRobot => 'ຕື່ມຫຸ່ນຍົນທໍາອິດຂອງທ່ານ';

  @override
  String get autoScanning => 'ການສະແກນອັດຕະໂນມັດ';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'ການຄວບຄຸມ';

  @override
  String get tabSequencer => 'ລໍາດັບ';

  @override
  String get tabCalibrator => 'ເຄື່ອງປັບທຽບ';

  @override
  String get tabDiagnostics => 'ການວິນິດໄສ';

  @override
  String get renameRobot => 'ປ່ຽນຊື່ຫຸ່ນຍົນ';

  @override
  String get bleDiagnostics => 'BLE ການວິນິດໄສ';

  @override
  String get erasePresets => 'ລຶບການຕັ້ງຄ່າທີ່ບັນທຶກໄວ້';

  @override
  String get disconnect => 'ຕັດການເຊື່ອມຕໍ່';

  @override
  String get unpairRobot => 'ຍົກເລີກການຈັບຄູ່ຫຸ່ນຍົນ';

  @override
  String get factoryReset => 'ຣີເຊັດເປັນຄ່າໂຮງງານ';

  @override
  String get servoManualJog => 'SERVO JOG ຄູ່ມື';

  @override
  String get homeAll => 'ຫນ້າທໍາອິດທັງຫມົດ';

  @override
  String get foldingTimeline => 'ເວລາພັບ';

  @override
  String get addStep => 'ເພີ່ມຂັ້ນຕອນ';

  @override
  String get previewOnRobot => 'ເບິ່ງຕົວຢ່າງກ່ຽວກັບຫຸ່ນຍົນ';

  @override
  String get saveToButton => 'ບັນທຶກໃສ່ປຸ່ມ';

  @override
  String get themeTitle => 'ຫົວຂໍ້';

  @override
  String get themeSystem => 'ອຸປະກອນ';

  @override
  String get themeLight => 'ແສງສະຫວ່າງ';

  @override
  String get themeDark => 'ມືດ';

  @override
  String get connectedBadge => 'ເຊື່ອມຕໍ່';

  @override
  String get inRangeBadge => 'ຢູ່ໃນຂອບເຂດ';

  @override
  String get offlineBadge => 'ອອບລາຍ';

  @override
  String get openButton => 'ເປີດ';

  @override
  String get connectButton => 'ເຊື່ອມຕໍ່';

  @override
  String get reconnectButton => 'ເຊື່ອມຕໍ່ຄືນໃໝ່';

  @override
  String get pairAndConnect => 'ຈັບຄູ່ & ເຊື່ອມຕໍ່';

  @override
  String get autoScanningForRobots => 'ສະແກນອັດຕະໂນມັດສຳລັບຫຸ່ນຍົນ...';

  @override
  String get scanningIdle => 'ສະແກນຢູ່ບໍ່ເຮັດວຽກ';

  @override
  String get nearbyRobotsAppear =>
      'ຫຸ່ນຍົນທີ່ຢູ່ໃກ້ຄຽງຈະປາກົດຢູ່ທີ່ນີ້ໂດຍອັດຕະໂນມັດ.';

  @override
  String get yourNearbyRobotsAppear =>
      'ຫຸ່ນຍົນທີ່ຢູ່ໃກ້ຄຽງຂອງທ່ານຈະປາກົດຢູ່ທີ່ນີ້ໂດຍອັດຕະໂນມັດ.';

  @override
  String get signalStrong => 'ເຂັ້ມແຂງ';

  @override
  String get signalGood => 'ດີ';

  @override
  String get signalWeak => 'ອ່ອນເພຍ';

  @override
  String get addRobotIntro =>
      'ເລືອກຫຸ່ນຍົນຂ້າງລຸ່ມນີ້ເພື່ອຈັບຄູ່. ຫຸ່ນຍົນທີ່ຢູ່ໃກ້ຄຽງໃນໂໝດຈັບຄູ່ຈະຖືກຄົ້ນພົບໂດຍອັດຕະໂນມັດຢູ່ເທິງສຸດ.';

  @override
  String get autoDiscoveredRobot => 'ຫຸ່ນຍົນຄົ້ນພົບອັດຕະໂນມັດ';

  @override
  String get autoDiscoveredRobots => 'ຫຸ່ນຍົນຄົ້ນພົບອັດຕະໂນມັດ';

  @override
  String readyCountBadge(Object count) {
    return '$count ພ້ອມແລ້ວ';
  }

  @override
  String get supportedRobots => 'ຫຸ່ນຍົນທີ່ຮອງຮັບ';

  @override
  String get clothesFoldingRobot => 'ຫຸ່ນຍົນພັບເສື້ອຜ້າ';

  @override
  String get fabricaDescription =>
      'ໂຟເດີເຄື່ອງຕັດຫຍິບອັດຕະໂນມັດທີ່ມີເຄື່ອງຕັດຫຍິບທີ່ຕັ້ງໄວ້ລ່ວງໜ້າຫຼາຍອັນ ແລະ ປຸ່ມປຸ່ມດຽວ tactile ເຮັດວຽກ.';

  @override
  String get fabricaPairingHint =>
      'ໂໝດການຈັບຄູ່: ກົດປຸ່ມໃດນຶ່ງໃນແຜງຄວບຄຸມ Fabrica ຄ້າງໄວ້ 3 ວິນາທີ (ສະຖານະ LED ຈະກະພິບຢ່າງໄວວາ).';

  @override
  String get pairFabricaNow => 'ຈັບຄູ່ FABRICA ດຽວນີ້';

  @override
  String get backToHome => 'ກັບໄປເຮືອນ';

  @override
  String get connReady => 'ພ້ອມ';

  @override
  String get connConnecting => 'ການເຊື່ອມຕໍ່';

  @override
  String get connDiscovering => 'ຄົ້ນພົບ';

  @override
  String get connBonding => 'ຜູກມັດ';

  @override
  String get connScanning => 'ການສະແກນ';

  @override
  String get connDisconnected => 'ຕັດການເຊື່ອມຕໍ່';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'ຕັດການເຊື່ອມຕໍ່ຈາກ $name ບໍ?';
  }

  @override
  String get disconnectConfirmBody =>
      'ທ່ານສາມາດເຊື່ອມຕໍ່ຄືນໃໝ່ໄດ້ທຸກເວລາຈາກໜ້າຈໍຫຼັກ.';

  @override
  String get cancelButton => 'ຍົກເລີກ';

  @override
  String get saveButton => 'ບັນທຶກ';

  @override
  String get customNickname => 'ຊື່ຫຼິ້ນແບບກຳນົດເອງ';

  @override
  String unpairConfirmTitle(Object name) {
    return 'ຍົກເລີກການຈັບຄູ່ $name ບໍ?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'ນີ້ຈະລຶບ $name ອອກຈາກຫຸ່ນຍົນຂອງເຈົ້າຢູ່ໃນໂທລະສັບເຄື່ອງນີ້. ທ່ານສາມາດເພີ່ມມັນຄືນໃໝ່ໄດ້ທຸກເວລາ.\n\nໝາຍເຫດ: ເພື່ອລຶບຄວາມຊົງຈຳຫຸ່ນຍົນທັງໝົດ ແລະຟື້ນຟູຄ່າເລີ່ມຕົ້ນຈາກໂຮງງານ, ໃຫ້ໃຊ້ \"ຣີເຊັດເປັນຄ່າໂຮງງານ\".';
  }

  @override
  String get unpairButton => 'ຍົກເລີກຄູ່';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'ແລ່ນ';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'ຜິດພາດ';

  @override
  String get machineCalibrating => 'ການປັບຕົວ';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'ບັນທຶກແລ້ວ';

  @override
  String get ledInputErr => 'ປ້ອນຂໍ້ມູນ ERR';

  @override
  String get ledPairing => 'ການຈັບຄູ່';

  @override
  String get ledConnected => 'ເຊື່ອມຕໍ່';

  @override
  String get ledIdentify => 'ລະບຸຕົວຕົນ';

  @override
  String get identifyButton => 'ລະບຸຕົວຕົນ';

  @override
  String get identifyingToast => 'ກະພິບ LED ຫຸ່ນຍົນເປັນເວລາ 3 ວິນາທີ...';

  @override
  String get homingToast => 'ໂຮມທັງສິ້ນ...';

  @override
  String get i2cFault => 'ຜິດ I2C';

  @override
  String get storageFault => 'ການເກັບຮັກສາຜິດ';

  @override
  String get estopLatched => 'E-STOP LATCHED';

  @override
  String get presetButtonsTitle => 'ປຸ່ມຕັ້ງໄວ້ລ່ວງໜ້າ';

  @override
  String customizePresetTitle(Object label) {
    return 'ປັບແຕ່ງ $label';
  }

  @override
  String get subtitleNameLabel => 'ຊື່ຄໍາບັນຍາຍ';

  @override
  String get subtitleNameHint => 'ຕົວຢ່າງ: ພັບດ່ວນ, ເສື້ອ, Custom...';

  @override
  String get buttonColorLabel => 'ສີປຸ່ມ';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'ຂັ້ນຕອນ $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'ຢຸດສຸກເສີນ';

  @override
  String get clearEstop => 'ລຶບລ້າງ ແລະປົດລ໋ອກອີ-ຢຸດ';

  @override
  String get clearEstopHint =>
      'ຣີເຊັດການຢຸດສຸກເສີນ ແລະສົ່ງຫຸ່ນຍົນກັບຄືນໄປ Idle';

  @override
  String get stopButton => 'ຢຸດ';

  @override
  String get fabricaArrangementTitle => 'ການຈັດວາງ FABRICA';

  @override
  String get editArrangement => 'ແກ້ໄຂການຈັດລຽງ';

  @override
  String get addPanel => 'ເພີ່ມແຜງ';

  @override
  String get legendMotorized => 'ເຄື່ອງຈັກ';

  @override
  String get legendFollower => 'ຜູ້ຕິດຕາມ';

  @override
  String get legendBase => 'ຖານ';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'ແຖວ';

  @override
  String stepSelectedHint(Object step) {
    return 'ຂັ້ນຕອນ $step ເລືອກແລ້ວ: ແຕະ 1–2 ແຜງມໍເຕີຢູ່ໃນຕາຂ່າຍໄຟຟ້າ';
  }

  @override
  String get tapPanelsHint => 'ແຕະ 1-2 ແຜງມໍເຕີຢູ່ໃນຕາຂ່າຍໄຟຟ້າ';

  @override
  String get dualBadge => 'ຄູ່';

  @override
  String get requiresMotorizedPanel => 'ຕ້ອງການຢ່າງໜ້ອຍ 1 ແຜງມໍເຕີ (ສູງສຸດ 2)';

  @override
  String get selectedChangePanelsHint =>
      'ເລືອກແລ້ວ • ແຕະແຖບຕາໜ່າງເພື່ອປ່ຽນ (ສູງສຸດ 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'ຂັ້ນຕອນ $step ຂອງ $total';
  }

  @override
  String get removeStepTooltip => 'ເອົາຂັ້ນຕອນ';

  @override
  String get requiresMotorizedModuleWarning =>
      'ສິ່ງທີ່ເຮັດປະຈຳຕ້ອງການຢ່າງໜ້ອຍໜຶ່ງໂມດູນ Motorized ຈາກ Fabrica Arrangement.';

  @override
  String get routineFull => 'ເຮັດປະຈຳຕະຫຼອດ (16/16 ຂັ້ນຕອນ)';

  @override
  String addStepCount(Object count) {
    return 'ເພີ່ມຂັ້ນຕອນ ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'ບັນທຶກສິ່ງທີ່ເຮັດປະຈຳໃຫ້ກັບຫຸ່ນຍົນ';

  @override
  String get selectButtonToProgram =>
      'ເລືອກປຸ່ມຫຸ່ນຍົນເພື່ອຂຽນໂປຣແກຣມກັບສິ່ງທີ່ເຮັດປະຈຳນີ້:';

  @override
  String buttonNumber(Object slot) {
    return 'ປຸ່ມ $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'ປຸ່ມຮາດແວ $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'ປຸ່ມ $slot ຄຳບັນຍາຍ (ທາງເລືອກ)';
  }

  @override
  String get saveToRobotButton => 'ບັນທຶກໃສ່ຫຸ່ນຍົນ';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'ປຸ່ມ $slot ($count ຂັ້ນຕອນ)';
  }

  @override
  String get adultTshirtTemplate => 'ແມ່ແບບເສື້ອຍືດຜູ້ໃຫຍ່';

  @override
  String get longSleeveTemplate => 'ແມ່ແບບແຂນຍາວ';

  @override
  String get dualSweepTemplate => 'ແບບ Dual Sweep';

  @override
  String channelNumber(Object number) {
    return 'ຊ່ອງ $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count ຄູ່';
  }

  @override
  String get moreHardwareOptions => 'ຕົວເລືອກຮາດແວເພີ່ມເຕີມ';

  @override
  String get loadTemplate => 'ໂຫຼດແມ່ແບບ';

  @override
  String get controllerLabel => 'ຜູ້ຄວບຄຸມ';

  @override
  String get motorBadge => 'ມໍເຕີ';

  @override
  String get followerBadge => 'ຕິດຕາມ';

  @override
  String get baseBadge => 'ພື້ນຖານ';

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
