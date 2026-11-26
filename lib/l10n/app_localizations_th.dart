// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get appLanguageTitle => 'ภาษาของแอป';

  @override
  String get appVersionTitle => 'เวอร์ชันแอป';

  @override
  String get languageSectionTitle => 'ภาษา';

  @override
  String get languageSystemDefault => 'ค่าเริ่มต้นของระบบ (ภาษาของอุปกรณ์)';

  @override
  String get selectLanguageHint => 'เลือกภาษา';

  @override
  String get addDeviceTitle => 'เพิ่มหุ่นยนต์ใหม่';

  @override
  String get addDeviceSubtitle => 'จับคู่หุ่นยนต์ AIR';

  @override
  String get yourRobots => 'หุ่นยนต์ของคุณ';

  @override
  String get discoveredRobots => 'หุ่นยนต์ที่ถูกค้นพบ';

  @override
  String get noRobotsPairedYet => 'ยังไม่มีการจับคู่หุ่นยนต์';

  @override
  String get noRobotsPairedSubtitle =>
      'เชื่อมต่อหุ่นยนต์ของคุณเพื่อดูการวัดและส่งข้อมูลทางไกล จัดการการตั้งค่าล่วงหน้า และควบคุมการดำเนินการ';

  @override
  String get addYourFirstRobot => 'เพิ่มหุ่นยนต์ตัวแรกของคุณ';

  @override
  String get autoScanning => 'การสแกนอัตโนมัติ';

  @override
  String get idleStatus => 'ไม่ได้ใช้งาน';

  @override
  String get tabControl => 'ควบคุม';

  @override
  String get tabSequencer => 'ซีเควนเซอร์';

  @override
  String get tabCalibrator => 'เครื่องสอบเทียบ';

  @override
  String get tabDiagnostics => 'การวินิจฉัย';

  @override
  String get renameRobot => 'เปลี่ยนชื่อหุ่นยนต์';

  @override
  String get bleDiagnostics => 'การวินิจฉัย BLE';

  @override
  String get erasePresets => 'ลบค่าที่ตั้งไว้ล่วงหน้าที่บันทึกไว้';

  @override
  String get disconnect => 'ตัดการเชื่อมต่อ';

  @override
  String get unpairRobot => 'เลิกจับคู่หุ่นยนต์';

  @override
  String get factoryReset => 'รีเซ็ตเป็นค่าจากโรงงาน';

  @override
  String get servoManualJog => 'JOG แบบแมนนวลของเซอร์โว';

  @override
  String get homeAll => 'หน้าแรกทั้งหมด';

  @override
  String get foldingTimeline => 'ไทม์ไลน์แบบพับได้';

  @override
  String get addStep => 'เพิ่มขั้นตอน';

  @override
  String get previewOnRobot => 'ดูตัวอย่างบนหุ่นยนต์';

  @override
  String get saveToButton => 'บันทึกไปที่ปุ่ม';

  @override
  String get themeTitle => 'ธีม';

  @override
  String get themeSystem => 'อุปกรณ์';

  @override
  String get themeLight => 'แสงสว่าง';

  @override
  String get themeDark => 'มืด';

  @override
  String get connectedBadge => 'เชื่อมต่อแล้ว';

  @override
  String get inRangeBadge => 'อยู่ในช่วง';

  @override
  String get offlineBadge => 'ออฟไลน์';

  @override
  String get openButton => 'เปิด';

  @override
  String get connectButton => 'เชื่อมต่อ';

  @override
  String get reconnectButton => 'เชื่อมต่อใหม่';

  @override
  String get pairAndConnect => 'จับคู่และเชื่อมต่อ';

  @override
  String get autoScanningForRobots => 'การสแกนอัตโนมัติสำหรับหุ่นยนต์...';

  @override
  String get scanningIdle => 'ไม่ได้ใช้งานการสแกน';

  @override
  String get nearbyRobotsAppear =>
      'หุ่นยนต์ที่อยู่ใกล้เคียงจะปรากฏที่นี่โดยอัตโนมัติ';

  @override
  String get yourNearbyRobotsAppear =>
      'หุ่นยนต์ที่อยู่ใกล้เคียงของคุณจะปรากฏที่นี่โดยอัตโนมัติ';

  @override
  String get signalStrong => 'แข็งแกร่ง';

  @override
  String get signalGood => 'ดี';

  @override
  String get signalWeak => 'อ่อนแอ';

  @override
  String get addRobotIntro =>
      'เลือกหุ่นยนต์ด้านล่างเพื่อจับคู่ หุ่นยนต์ที่อยู่ใกล้เคียงในโหมดจับคู่จะถูกค้นพบโดยอัตโนมัติที่ด้านบน';

  @override
  String get autoDiscoveredRobot => 'หุ่นยนต์ค้นพบอัตโนมัติ';

  @override
  String get autoDiscoveredRobots => 'หุ่นยนต์ค้นพบอัตโนมัติ';

  @override
  String readyCountBadge(Object count) {
    return '$count พร้อมแล้ว';
  }

  @override
  String get supportedRobots => 'หุ่นยนต์ที่รองรับ';

  @override
  String get clothesFoldingRobot => 'หุ่นยนต์พับเสื้อผ้า';

  @override
  String get fabricaDescription =>
      'โฟลเดอร์เก็บเสื้อผ้าอัตโนมัติพร้อมการตั้งค่าล่วงหน้าสำหรับหลายแถบผ้าและการทำงานด้วยปุ่มเดียวที่สัมผัสได้';

  @override
  String get fabricaPairingHint =>
      'โหมดการจับคู่: กดปุ่มใดๆ บนแผงควบคุม Fabrica ค้างไว้ 3 วินาที (ไฟ LED สถานะจะกะพริบอย่างรวดเร็ว)';

  @override
  String get pairFabricaNow => 'จับคู่ผ้าตอนนี้เลย';

  @override
  String get backToHome => 'กลับไปที่บ้าน';

  @override
  String get connReady => 'พร้อม';

  @override
  String get connConnecting => 'กำลังเชื่อมต่อ';

  @override
  String get connDiscovering => 'การค้นพบ';

  @override
  String get connBonding => 'พันธะ';

  @override
  String get connScanning => 'การสแกน';

  @override
  String get connDisconnected => 'ตัดการเชื่อมต่อแล้ว';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'ตัดการเชื่อมต่อจาก $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'คุณสามารถเชื่อมต่อใหม่ได้ตลอดเวลาจากหน้าจอหลัก';

  @override
  String get cancelButton => 'ยกเลิก';

  @override
  String get saveButton => 'บันทึก';

  @override
  String get customNickname => 'ชื่อเล่นที่กำหนดเอง';

  @override
  String unpairConfirmTitle(Object name) {
    return 'เลิกจับคู่ $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'การดำเนินการนี้จะลบ $name ออกจาก Your Robots บนโทรศัพท์เครื่องนี้ คุณสามารถเพิ่มใหม่ได้ตลอดเวลา\n\nหมายเหตุ: หากต้องการล้างหน่วยความจำหุ่นยนต์อย่างสมบูรณ์และเรียกคืนค่าเริ่มต้นจากโรงงาน ให้ใช้ \"รีเซ็ตเป็นค่าจากโรงงาน\"';
  }

  @override
  String get unpairButton => 'เลิกจับคู่';

  @override
  String get machineIdle => 'ไม่ได้ใช้งาน';

  @override
  String get machineRunning => 'วิ่ง';

  @override
  String get machineEstop => 'อี-สต็อป';

  @override
  String get machineError => 'ข้อผิดพลาด';

  @override
  String get machineCalibrating => 'การสอบเทียบ';

  @override
  String ledLabel(Object state) {
    return 'ไฟ LED: $state';
  }

  @override
  String get ledSaved => 'บันทึกแล้ว';

  @override
  String get ledInputErr => 'ข้อผิดพลาดในการป้อนข้อมูล';

  @override
  String get ledPairing => 'การจับคู่';

  @override
  String get ledConnected => 'เชื่อมต่อแล้ว';

  @override
  String get ledIdentify => 'แยกแยะ';

  @override
  String get identifyButton => 'แยกแยะ';

  @override
  String get identifyingToast => 'LED หุ่นยนต์กระพริบ 3 วินาที...';

  @override
  String get homingToast => 'กลับบ้านทุกบาน...';

  @override
  String get i2cFault => 'ความผิดพลาดของ I2C';

  @override
  String get storageFault => 'ข้อผิดพลาดในการจัดเก็บ';

  @override
  String get estopLatched => 'สลัก E-STOP';

  @override
  String get presetButtonsTitle => 'ปุ่มตั้งค่าล่วงหน้า';

  @override
  String customizePresetTitle(Object label) {
    return 'ปรับแต่ง $label';
  }

  @override
  String get subtitleNameLabel => 'ชื่อคำบรรยาย';

  @override
  String get subtitleNameHint => 'เช่น พับด่วน, เสื้อเชิ้ต, สั่งทำ...';

  @override
  String get buttonColorLabel => 'สีของปุ่ม';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'ขั้นตอนที่ $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'หยุดฉุกเฉิน';

  @override
  String get clearEstop => 'ล้างและปลดล็อค E-STOP';

  @override
  String get clearEstopHint =>
      'รีเซ็ตการหยุดฉุกเฉินและส่งหุ่นยนต์กลับเข้าสู่รอบเดินเบา';

  @override
  String get stopButton => 'หยุด';

  @override
  String get fabricaArrangementTitle => 'การจัดผ้า';

  @override
  String get editArrangement => 'แก้ไขการจัดเตรียม';

  @override
  String get addPanel => 'เพิ่มแผง';

  @override
  String get legendMotorized => 'ขับเคลื่อนด้วยมอเตอร์';

  @override
  String get legendFollower => 'ผู้ติดตาม';

  @override
  String get legendBase => 'ฐาน';

  @override
  String get colsLabel => 'พ.อ';

  @override
  String get rowsLabel => 'แถว';

  @override
  String stepSelectedHint(Object step) {
    return 'ขั้นตอนที่ $step เลือก: แตะแผงมอเตอร์ 1–2 แผงบนตาราง';
  }

  @override
  String get tapPanelsHint => 'แตะแผงมอเตอร์ 1–2 แผงบนกริด';

  @override
  String get dualBadge => 'คู่';

  @override
  String get requiresMotorizedPanel =>
      'ต้องมีแผงมอเตอร์อย่างน้อย 1 แผง (สูงสุด 2)';

  @override
  String get selectedChangePanelsHint =>
      'เลือกไว้ • แตะแผงตารางเพื่อเปลี่ยน (สูงสุด 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'ขั้นตอนที่ $step จาก $total';
  }

  @override
  String get removeStepTooltip => 'ลบขั้นตอน';

  @override
  String get requiresMotorizedModuleWarning =>
      'งานประจำต้องมีโมดูลแบบใช้มอเตอร์อย่างน้อยหนึ่งโมดูลจาก Fabrica Arrangement';

  @override
  String get routineFull => 'กิจวัตรเต็ม (16/16 ขั้นตอน)';

  @override
  String addStepCount(Object count) {
    return 'เพิ่มขั้นตอน ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'บันทึกกิจวัตรไปที่ Robot';

  @override
  String get selectButtonToProgram =>
      'เลือกปุ่มหุ่นยนต์ทางกายภาพเพื่อตั้งโปรแกรมด้วยกิจวัตรนี้:';

  @override
  String buttonNumber(Object slot) {
    return 'ปุ่ม $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'ปุ่มฮาร์ดแวร์ $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'ปุ่ม $slot คำบรรยาย (ไม่บังคับ)';
  }

  @override
  String get saveToRobotButton => 'บันทึกไปยังหุ่นยนต์';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'ปุ่ม $slot ($count ขั้นตอน)';
  }

  @override
  String get adultTshirtTemplate => 'เทมเพลตเสื้อยืดสำหรับผู้ใหญ่';

  @override
  String get longSleeveTemplate => 'เทมเพลตแขนยาว';

  @override
  String get dualSweepTemplate => 'เทมเพลต Dual Sweep';

  @override
  String channelNumber(Object number) {
    return 'ช่อง $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count จับคู่แล้ว';
  }

  @override
  String get moreHardwareOptions => 'ตัวเลือกฮาร์ดแวร์เพิ่มเติม';

  @override
  String get loadTemplate => 'โหลดเทมเพลต';

  @override
  String get controllerLabel => 'ผู้ควบคุม';

  @override
  String get motorBadge => 'มอเตอร์';

  @override
  String get followerBadge => 'ติดตาม';

  @override
  String get baseBadge => 'ฐาน';

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
