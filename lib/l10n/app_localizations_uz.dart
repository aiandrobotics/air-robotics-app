// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Sozlamalar';

  @override
  String get appLanguageTitle => 'Ilova tili';

  @override
  String get appVersionTitle => 'Ilova versiyasi';

  @override
  String get languageSectionTitle => 'Til';

  @override
  String get languageSystemDefault => 'Tizim standarti (qurilma tili)';

  @override
  String get selectLanguageHint => 'Tilni tanlang';

  @override
  String get addDeviceTitle => 'YANGI ROBOT QO\'SHISH';

  @override
  String get addDeviceSubtitle => 'AIR robotlarini ulash';

  @override
  String get yourRobots => 'SIZNING ROBOTLARINGIZ';

  @override
  String get discoveredRobots => 'KAZIFLANGAN ROBOTLAR';

  @override
  String get noRobotsPairedYet => 'Hali robotlar ulanmagan';

  @override
  String get noRobotsPairedSubtitle =>
      'Telemetriyani ko\'rish, oldindan sozlashlarni boshqarish va operatsiyalarni boshqarish uchun robotingizni ulang.';

  @override
  String get addYourFirstRobot => 'BIRINCHI ROBOTINGIZNI QO\'SHING';

  @override
  String get autoScanning => 'AVTO-KO\'RISH';

  @override
  String get idleStatus => 'BO\'LGAN';

  @override
  String get tabControl => 'Nazorat';

  @override
  String get tabSequencer => 'Sequencer';

  @override
  String get tabCalibrator => 'Kalibrator';

  @override
  String get tabDiagnostics => 'Diagnostika';

  @override
  String get renameRobot => 'Robot nomini o‘zgartiring';

  @override
  String get bleDiagnostics => 'BLE diagnostikasi';

  @override
  String get erasePresets => 'Saqlangan sozlamalarni o\'chirish';

  @override
  String get disconnect => 'Ulanishni uzing';

  @override
  String get unpairRobot => 'Robotni ajratish';

  @override
  String get factoryReset => 'Zavod sozlamalarini tiklash';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'UYGA HAMMA';

  @override
  String get foldingTimeline => 'YUKLASH TILI';

  @override
  String get addStep => 'QADAM QO‘SHISH';

  @override
  String get previewOnRobot => 'ROBOTDA OLDINDAN KOʻRISH';

  @override
  String get saveToButton => 'TUGMAGA SAQLASH';

  @override
  String get themeTitle => 'Mavzu';

  @override
  String get themeSystem => 'Qurilma';

  @override
  String get themeLight => 'Nur';

  @override
  String get themeDark => 'Qorong\'i';

  @override
  String get connectedBadge => 'ULANGAN';

  @override
  String get inRangeBadge => 'ARASONDA';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'OCH';

  @override
  String get connectButton => 'ulaning';

  @override
  String get reconnectButton => 'QAYTA ulaning';

  @override
  String get pairAndConnect => 'URUSH VA ulaning';

  @override
  String get autoScanningForRobots => 'Robotlarni avtomatik skanerlash...';

  @override
  String get scanningIdle => 'Bekor holda skanerlash';

  @override
  String get nearbyRobotsAppear =>
      'Yaqin atrofdagi robotlar bu yerda avtomatik ravishda paydo bo\'ladi.';

  @override
  String get yourNearbyRobotsAppear =>
      'Yaqin-atrofdagi robotlaringiz shu yerda avtomatik ravishda paydo bo‘ladi.';

  @override
  String get signalStrong => 'Kuchli';

  @override
  String get signalGood => 'Yaxshi';

  @override
  String get signalWeak => 'Zaif';

  @override
  String get addRobotIntro =>
      'Ulanish uchun pastdan robotni tanlang. Ulanish rejimida yaqin atrofdagi har qanday robot avtomatik ravishda tepada topiladi.';

  @override
  String get autoDiscoveredRobot => 'AVTO KASHFLANGAN ROBOT';

  @override
  String get autoDiscoveredRobots => 'AVTO KAZIFLANGAN ROBOTLAR';

  @override
  String readyCountBadge(Object count) {
    return '$count TAYYOR';
  }

  @override
  String get supportedRobots => 'Qo\'llab-quvvatlanadigan ROBOTLAR';

  @override
  String get clothesFoldingRobot => 'Kiyimlarni yig\'uvchi robot';

  @override
  String get fabricaDescription =>
      'Ko\'p kiyimli oldindan o\'rnatilgan va sensorli bir tugma bilan ishlaydigan avtomatlashtirilgan kiyim papkasi.';

  @override
  String get fabricaPairingHint =>
      'Ulanish rejimi: Fabrica boshqaruv panelidagi istalgan tugmani 3 soniya bosib turing (Holat LED tez miltillaydi).';

  @override
  String get pairFabricaNow => 'MATONI HOZIR USHLASH';

  @override
  String get backToHome => 'Uyga qaytish';

  @override
  String get connReady => 'TAYYOR';

  @override
  String get connConnecting => 'ULLANMAYDI';

  @override
  String get connDiscovering => 'KASHFIYAT';

  @override
  String get connBonding => 'BOG\'LANISH';

  @override
  String get connScanning => 'Skanerlash';

  @override
  String get connDisconnected => 'UZILGAN';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name dan uzilsinmi?';
  }

  @override
  String get disconnectConfirmBody =>
      'Istalgan vaqtda bosh ekrandan qayta ulanishingiz mumkin.';

  @override
  String get cancelButton => 'BEKOR';

  @override
  String get saveButton => 'SAQLASH';

  @override
  String get customNickname => 'Maxsus taxallus';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name uzilsinmi?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Bu telefondagi Robotlaringizdan $name olib tashlanadi. Siz uni istalgan vaqtda qayta qo\'shishingiz mumkin.\n\nEslatma: Robot xotirasini butunlay o‘chirish va zavod sozlamalarini tiklash uchun “Zavod sozlamalarini tiklash” dan foydalaning.';
  }

  @override
  String get unpairButton => 'BO\'LDI';

  @override
  String get machineIdle => 'BO\'LGAN';

  @override
  String get machineRunning => 'MUVOFIQ';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'XATO';

  @override
  String get machineCalibrating => 'KALIBRLASH';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'SAQLANGAN';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'URUSH';

  @override
  String get ledConnected => 'ULANGAN';

  @override
  String get ledIdentify => 'TANING';

  @override
  String get identifyButton => 'TANING';

  @override
  String get identifyingToast => 'Robot LED 3 soniya davomida miltillaydi...';

  @override
  String get homingToast => 'Barcha flaplar homing...';

  @override
  String get i2cFault => 'I2C xatosi';

  @override
  String get storageFault => 'SAQLASH NO';

  @override
  String get estopLatched => 'E-TO\'XTIRISH BO\'LDI';

  @override
  String get presetButtonsTitle => 'OLDINDAN SOZLANGAN TUGMALAR';

  @override
  String customizePresetTitle(Object label) {
    return '$label sozlang';
  }

  @override
  String get subtitleNameLabel => 'Subtitr nomi';

  @override
  String get subtitleNameHint => 'masalan. Tez buklama, ko\'ylaklar, maxsus...';

  @override
  String get buttonColorLabel => 'Tugma rangi';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Qadam $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'Favqulodda to\'xtash';

  @override
  String get clearEstop => 'ELEKTRON TOʻXTANI OʻCHIRISH VA OCHISH';

  @override
  String get clearEstopHint =>
      'Favqulodda to\'xtashni tiklaydi va robotni \"Bo\'sh rejimga\" qaytaradi';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'FABRIKANI TASHLASH';

  @override
  String get editArrangement => 'TARTIBNI TAHRIRLASH';

  @override
  String get addPanel => 'PANEL QO‘SHISH';

  @override
  String get legendMotorized => 'Motorli';

  @override
  String get legendFollower => 'Izdosh';

  @override
  String get legendBase => 'Baza';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Qatorlar';

  @override
  String stepSelectedHint(Object step) {
    return '$step qadam tanlandi: To‘rdagi 1–2 motorli panellarga teging';
  }

  @override
  String get tapPanelsHint => 'To\'rdagi 1-2 motor paneliga teging';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Kamida 1 ta motorli panel kerak (maksimal 2)';

  @override
  String get selectedChangePanelsHint =>
      'Tanlangan • O‘zgartirish uchun panjara panellarini bosing (maksimal 2 ta)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Qadam $step / $total';
  }

  @override
  String get removeStepTooltip => 'Qadamni olib tashlash';

  @override
  String get requiresMotorizedModuleWarning =>
      'Muntazam Fabrica Arrangement’dan kamida bitta motorli modulni talab qiladi.';

  @override
  String get routineFull => 'TO\'LIQ (16/16 QADAM)';

  @override
  String addStepCount(Object count) {
    return 'QADAM QO‘SHISH ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Rotini robotga saqlang';

  @override
  String get selectButtonToProgram =>
      'Ushbu tartib bilan dasturlash uchun jismoniy robot tugmachasini tanlang:';

  @override
  String buttonNumber(Object slot) {
    return '$slot tugmasi';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Uskuna tugmasi $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Tugma $slot Subtitr (ixtiyoriy)';
  }

  @override
  String get saveToRobotButton => 'ROBOTGA SAQLASH';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return '$slot tugmasi ($count qadam)';
  }

  @override
  String get adultTshirtTemplate => 'Kattalar uchun futbolkalar shabloni';

  @override
  String get longSleeveTemplate => 'Uzun yengli shablon';

  @override
  String get dualSweepTemplate => 'Ikki marta tozalash shabloni';

  @override
  String channelNumber(Object number) {
    return 'Kanal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count JUKLANGAN';
  }

  @override
  String get moreHardwareOptions => 'Qoʻshimcha apparat opsiyalari';

  @override
  String get loadTemplate => 'Shablonni yuklash';

  @override
  String get controllerLabel => 'NAZORATCHI';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'MUUZATCHI';

  @override
  String get baseBadge => 'BAZA';

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
