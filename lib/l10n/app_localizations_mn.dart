// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class AppLocalizationsMn extends AppLocalizations {
  AppLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Тохиргоо';

  @override
  String get appLanguageTitle => 'Програмын хэл';

  @override
  String get appVersionTitle => 'Програмын хувилбар';

  @override
  String get languageSectionTitle => 'Хэл';

  @override
  String get languageSystemDefault => 'Системийн өгөгдмөл (төхөөрөмжийн хэл)';

  @override
  String get selectLanguageHint => 'Хэл сонгоно уу';

  @override
  String get addDeviceTitle => 'ШИНЭ РОБОТ НЭМЭХ';

  @override
  String get addDeviceSubtitle => 'AIR роботуудыг хослуул';

  @override
  String get yourRobots => 'ТАНЫ РОБОТ';

  @override
  String get discoveredRobots => 'ИЛРЭГДСЭН РОБОТУУДЫГ';

  @override
  String get noRobotsPairedYet => 'Одоогоор хосолсон робот байхгүй байна';

  @override
  String get noRobotsPairedSubtitle =>
      'Телеметрийг үзэх, урьдчилан тохируулах болон үйлдлүүдийг удирдахын тулд роботоо холбоно уу.';

  @override
  String get addYourFirstRobot => 'АНХНЫ РОБОТОО НЭМЭЭРЭЙ';

  @override
  String get autoScanning => 'АВТО-Сканнердах';

  @override
  String get idleStatus => 'СУУДАЛ';

  @override
  String get tabControl => 'Хяналт';

  @override
  String get tabSequencer => 'Севентор';

  @override
  String get tabCalibrator => 'Калибратор';

  @override
  String get tabDiagnostics => 'Оношлогоо';

  @override
  String get renameRobot => 'Роботын нэрийг өөрчлөх';

  @override
  String get bleDiagnostics => 'BLE оношлогоо';

  @override
  String get erasePresets => 'Хадгалсан урьдчилан тохируулгыг арилгах';

  @override
  String get disconnect => 'Салга';

  @override
  String get unpairRobot => 'Роботыг салга';

  @override
  String get factoryReset => 'Үйлдвэрийн тохиргоонд дахин тохируулах';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'БҮГД ГЭРТЭЭ';

  @override
  String get foldingTimeline => 'ЭВГЭХ ХУГАЦАА';

  @override
  String get addStep => 'АЛХАМ НЭМЭХ';

  @override
  String get previewOnRobot => 'РОБОТ ДЭЭР УРЬДЧИЛАН ҮЗҮҮЛЭХ';

  @override
  String get saveToButton => 'ТОВЧТОЙ ХАДГАЛАХ';

  @override
  String get themeTitle => 'Сэдэв';

  @override
  String get themeSystem => 'Төхөөрөмж';

  @override
  String get themeLight => 'Гэрэл';

  @override
  String get themeDark => 'Харанхуй';

  @override
  String get connectedBadge => 'ХОЛБООТОЙ';

  @override
  String get inRangeBadge => 'ХҮРЭЭНД';

  @override
  String get offlineBadge => 'ОФЛАЙН';

  @override
  String get openButton => 'НЭЭЛТТЭЙ';

  @override
  String get connectButton => 'ХОЛБОО';

  @override
  String get reconnectButton => 'ДАХИН ХОЛБОО';

  @override
  String get pairAndConnect => 'ХОСЛОХ, ХОЛБОО';

  @override
  String get autoScanningForRobots =>
      'Роботуудыг автоматаар скан хийж байна...';

  @override
  String get scanningIdle => 'Сканнер идэвхгүй байна';

  @override
  String get nearbyRobotsAppear =>
      'Ойролцоох роботууд энд автоматаар гарч ирнэ.';

  @override
  String get yourNearbyRobotsAppear =>
      'Таны ойролцоох роботууд энд автоматаар гарч ирнэ.';

  @override
  String get signalStrong => 'Хүчтэй';

  @override
  String get signalGood => 'Сайн байна';

  @override
  String get signalWeak => 'Сул дорой';

  @override
  String get addRobotIntro =>
      'Хослуулахын тулд доороос роботыг сонгоно уу. Хослуулах горимд байгаа ойролцоох роботууд дээд хэсэгт автоматаар нээгдэнэ.';

  @override
  String get autoDiscoveredRobot => 'АВТО ИЛРЭГДСЭН РОБОТ';

  @override
  String get autoDiscoveredRobots => 'АВТО ИЛРЭГДСЭН РОБОТУУДЫГ';

  @override
  String readyCountBadge(Object count) {
    return '$count БЭЛЭН';
  }

  @override
  String get supportedRobots => 'ДЭМЖЭГДСЭН РОБОТ';

  @override
  String get clothesFoldingRobot => 'Хувцас эвхдэг робот';

  @override
  String get fabricaDescription =>
      'Олон хувцасны урьдчилан тохируулсан автомат хувцасны хавтас, мэдрэгчтэй ганц товчлууртай.';

  @override
  String get fabricaPairingHint =>
      'Хослох горим: Fabrica хяналтын самбар дээрх дурын товчлуурыг 3 секундын турш дарна уу (Статус LED хурдан анивчих болно).';

  @override
  String get pairFabricaNow => 'ОДОО ДААВАР ХОСОЛЦООРОЙ';

  @override
  String get backToHome => 'Гэртээ буцах';

  @override
  String get connReady => 'БЭЛЭН';

  @override
  String get connConnecting => 'ХОЛБОЖ БАЙНА';

  @override
  String get connDiscovering => 'НЭЭЖ БАЙНА';

  @override
  String get connBonding => 'ХОЛБООТОЙ';

  @override
  String get connScanning => 'Сканнердаж байна';

  @override
  String get connDisconnected => 'ХОЛБОГДСОН';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name-аас салгах уу?';
  }

  @override
  String get disconnectConfirmBody =>
      'Та хүссэн үедээ үндсэн дэлгэцээс дахин холбогдох боломжтой.';

  @override
  String get cancelButton => 'Цуцлах';

  @override
  String get saveButton => 'ХАДГАЛАХ';

  @override
  String get customNickname => 'Тусгай хоч';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name-г салгах уу?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Энэ нь таны энэ утсан дээрх роботуудаас $name-г устгах болно. Та хүссэн үедээ дахин нэмж болно.\n\nТайлбар: Роботын санах ойг бүрэн арчиж, үйлдвэрийн тохиргоог сэргээхийн тулд \"Үйлдвэрийн тохиргоонд дахин тохируулах\"-ыг ашиглана уу.';
  }

  @override
  String get unpairButton => 'ХОСОЛЦОХ';

  @override
  String get machineIdle => 'СУУДАЛ';

  @override
  String get machineRunning => 'ГҮЙЖ БАЙНА';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'АЛДАА';

  @override
  String get machineCalibrating => 'ШАЛГАРУУЛАХ';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'ХАДГАЛСАН';

  @override
  String get ledInputErr => 'ОРОЛТЫН АЛДАА';

  @override
  String get ledPairing => 'ХОСОЛЖ БАЙНА';

  @override
  String get ledConnected => 'ХОЛБООТОЙ';

  @override
  String get ledIdentify => 'ТАНИЛЦУУЛАХ';

  @override
  String get identifyButton => 'ТАНИЛЦУУЛАХ';

  @override
  String get identifyingToast => 'Робот LED 3 секундын турш анивчдаг...';

  @override
  String get homingToast => 'Бүх хавчааруудыг чиглүүлэх...';

  @override
  String get i2cFault => 'I2C алдаа';

  @override
  String get storageFault => 'ХАДГАЛАХ ГЭДЭГ';

  @override
  String get estopLatched => 'ЦАХИМ ЗОГСООЛ түгжээтэй';

  @override
  String get presetButtonsTitle => 'УРЬДЧИЛСАН ТОВЧЛУУД';

  @override
  String customizePresetTitle(Object label) {
    return '$label тохируулах';
  }

  @override
  String get subtitleNameLabel => 'Хадмал орчуулгын нэр';

  @override
  String get subtitleNameHint => 'жишээ нь Хурдан нугалах, цамц, захиалгат...';

  @override
  String get buttonColorLabel => 'Товчлуурын өнгө';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Алхам $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'ЯАРАЛТАЙ ЗОГСООХ';

  @override
  String get clearEstop => 'ЦАХИМ ЗОГСООЛЫГ ЦЭВЭРЛҮҮЛЖ, тайлаарай';

  @override
  String get clearEstopHint =>
      'Яаралтай зогсолтыг дахин тохируулж, роботыг Сул горимд буцаана';

  @override
  String get stopButton => 'ЗОГС';

  @override
  String get fabricaArrangementTitle => 'ДААВАР ЗОХИЦУУЛАЛТ';

  @override
  String get editArrangement => 'ЗОХИЦУУЛАЛТЫГ ЗАСАХ';

  @override
  String get addPanel => 'PANEL НЭМЭХ';

  @override
  String get legendMotorized => 'Моторжуулсан';

  @override
  String get legendFollower => 'Дагагч';

  @override
  String get legendBase => 'Суурь';

  @override
  String get colsLabel => 'Колс';

  @override
  String get rowsLabel => 'Мөр';

  @override
  String stepSelectedHint(Object step) {
    return 'Алхам $step сонгогдсон: Торон дээрх 1–2 моторт самбарыг товшино уу';
  }

  @override
  String get tapPanelsHint => 'Сүлжээнд 1-2 мотор хавтанг товш';

  @override
  String get dualBadge => 'ХОС';

  @override
  String get requiresMotorizedPanel =>
      'Дор хаяж 1 моторт самбар шаардлагатай (хамгийн ихдээ 2)';

  @override
  String get selectedChangePanelsHint =>
      'Сонгосон • Өөрчлөхийн тулд сүлжээний самбарыг товшино уу (хамгийн ихдээ 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return '$total-ийн $step алхам';
  }

  @override
  String get removeStepTooltip => 'Алхамыг арилгах';

  @override
  String get requiresMotorizedModuleWarning =>
      'Тогтмол горимд Fabrica Arrangement-аас дор хаяж нэг моторжуулсан модуль шаардлагатай.';

  @override
  String get routineFull => 'ХЭВШИЛ БҮРЭН (16/16 АЛХАМ)';

  @override
  String addStepCount(Object count) {
    return 'АЛХАМ НЭМЭХ ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Хэвлэх журмыг роботт хадгал';

  @override
  String get selectButtonToProgram =>
      'Энэ горимоор програмчлахын тулд физик роботын товчлуурыг сонгоно уу:';

  @override
  String buttonNumber(Object slot) {
    return 'Товчлуур $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Техник хангамжийн товчлуур $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Товчлуур $slot Хадмал (заавал биш)';
  }

  @override
  String get saveToRobotButton => 'РОБОТТ ХАДГАЛАХ';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Товчлуур $slot ($count алхам)';
  }

  @override
  String get adultTshirtTemplate => 'Насанд хүрэгчдэд зориулсан цамцны загвар';

  @override
  String get longSleeveTemplate => 'Урт ханцуйтай загвар';

  @override
  String get dualSweepTemplate => 'Хос цэвэрлэх загвар';

  @override
  String channelNumber(Object number) {
    return 'Суваг $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count ХОСОЛСОН';
  }

  @override
  String get moreHardwareOptions => 'Илүү олон техник хангамжийн сонголтууд';

  @override
  String get loadTemplate => 'Загвар ачаалах';

  @override
  String get controllerLabel => 'ХЯНАЛТАЙ';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'дагагч';

  @override
  String get baseBadge => 'Суурь';

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
