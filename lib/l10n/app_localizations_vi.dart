// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get appLanguageTitle => 'Ngôn ngữ ứng dụng';

  @override
  String get appVersionTitle => 'Phiên bản ứng dụng';

  @override
  String get languageSectionTitle => 'Ngôn ngữ';

  @override
  String get languageSystemDefault => 'Mặc định hệ thống (ngôn ngữ thiết bị)';

  @override
  String get selectLanguageHint => 'Chọn ngôn ngữ';

  @override
  String get addDeviceTitle => 'THÊM ROBOT MỚI';

  @override
  String get addDeviceSubtitle => 'Ghép nối robot AIR';

  @override
  String get yourRobots => 'ROBOT CỦA BẠN';

  @override
  String get discoveredRobots => 'ROBOT ĐÃ TÌM THẤY';

  @override
  String get noRobotsPairedYet => 'Chưa có robot nào được ghép nối';

  @override
  String get noRobotsPairedSubtitle =>
      'Kết nối robot của bạn để xem dữ liệu đo từ xa, quản lý các cài đặt trước và điều khiển hoạt động.';

  @override
  String get addYourFirstRobot => 'THÊM ROBOT ĐẦU TIÊN CỦA BẠN';

  @override
  String get autoScanning => 'TỰ ĐỘNG QUÉT';

  @override
  String get idleStatus => 'nhàn rỗi';

  @override
  String get tabControl => 'Kiểm soát';

  @override
  String get tabSequencer => 'Trình sắp xếp thứ tự';

  @override
  String get tabCalibrator => 'bộ hiệu chuẩn';

  @override
  String get tabDiagnostics => 'Chẩn đoán';

  @override
  String get renameRobot => 'Đổi tên robot';

  @override
  String get bleDiagnostics => 'Chẩn đoán BLE';

  @override
  String get erasePresets => 'Xóa cài đặt trước đã lưu';

  @override
  String get disconnect => 'Ngắt kết nối';

  @override
  String get unpairRobot => 'Robot hủy ghép nối';

  @override
  String get factoryReset => 'Khôi phục cài đặt gốc';

  @override
  String get servoManualJog => 'SERVO THỦ CÔNG JOG';

  @override
  String get homeAll => 'TRANG CHỦ TẤT CẢ';

  @override
  String get foldingTimeline => 'THỜI GIAN GẤP';

  @override
  String get addStep => 'THÊM BƯỚC';

  @override
  String get previewOnRobot => 'XEM TRƯỚC TRÊN ROBOT';

  @override
  String get saveToButton => 'NÚT LƯU VÀO';

  @override
  String get themeTitle => 'chủ đề';

  @override
  String get themeSystem => 'Thiết bị';

  @override
  String get themeLight => 'Ánh sáng';

  @override
  String get themeDark => 'Tối';

  @override
  String get connectedBadge => 'ĐÃ KẾT NỐI';

  @override
  String get inRangeBadge => 'TRONG PHẠM VI';

  @override
  String get offlineBadge => 'NGOẠI TUYẾN';

  @override
  String get openButton => 'MỞ';

  @override
  String get connectButton => 'KẾT NỐI';

  @override
  String get reconnectButton => 'KẾT NỐI LẠI';

  @override
  String get pairAndConnect => 'CẶP & KẾT NỐI';

  @override
  String get autoScanningForRobots => 'Tự động quét robot...';

  @override
  String get scanningIdle => 'Đang quét ở trạng thái rảnh';

  @override
  String get nearbyRobotsAppear =>
      'Các robot ở gần sẽ tự động xuất hiện ở đây.';

  @override
  String get yourNearbyRobotsAppear =>
      'Các robot ở gần bạn sẽ tự động xuất hiện ở đây.';

  @override
  String get signalStrong => 'mạnh mẽ';

  @override
  String get signalGood => 'Tốt';

  @override
  String get signalWeak => 'yếu';

  @override
  String get addRobotIntro =>
      'Chọn một robot bên dưới để ghép nối. Mọi robot ở gần đang ở chế độ ghép nối sẽ tự động được phát hiện ở trên cùng.';

  @override
  String get autoDiscoveredRobot => 'ROBOT ĐƯỢC KHÁM PHÁ TỰ ĐỘNG';

  @override
  String get autoDiscoveredRobots => 'ROBOT ĐƯỢC KHÁM PHÁ TỰ ĐỘNG';

  @override
  String readyCountBadge(Object count) {
    return '$count SẴN SÀNG';
  }

  @override
  String get supportedRobots => 'ROBOT ĐƯỢC HỖ TRỢ';

  @override
  String get clothesFoldingRobot => 'Robot gấp quần áo';

  @override
  String get fabricaDescription =>
      'Thư mục quần áo tự động với các cài đặt trước cho nhiều loại quần áo và thao tác xúc giác bằng một nút bấm.';

  @override
  String get fabricaPairingHint =>
      'Chế độ ghép nối: Nhấn và giữ bất kỳ nút nào trên bảng điều khiển Fabrica trong 3 giây (Đèn LED trạng thái sẽ nhấp nháy nhanh).';

  @override
  String get pairFabricaNow => 'CẶP VẢI NGAY BÂY GIỜ';

  @override
  String get backToHome => 'Quay lại trang chủ';

  @override
  String get connReady => 'SẴN SÀNG';

  @override
  String get connConnecting => 'KẾT NỐI';

  @override
  String get connDiscovering => 'KHÁM PHÁ';

  @override
  String get connBonding => 'LIÊN KẾT';

  @override
  String get connScanning => 'QUÉT';

  @override
  String get connDisconnected => 'ĐÃ NGẮT KẾT NỐI';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Ngắt kết nối khỏi $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Bạn có thể kết nối lại bất cứ lúc nào từ màn hình chính.';

  @override
  String get cancelButton => 'HỦY';

  @override
  String get saveButton => 'LƯU';

  @override
  String get customNickname => 'Biệt hiệu tùy chỉnh';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Hủy ghép nối $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Thao tác này sẽ xóa $name khỏi Robot của bạn trên điện thoại này. Bạn có thể thêm lại nó bất cứ lúc nào.\n\nLưu ý: Để xóa hoàn toàn bộ nhớ robot và khôi phục cài đặt gốc, hãy sử dụng \"Khôi phục cài đặt gốc\".';
  }

  @override
  String get unpairButton => 'HỎI ĐÓNG GÓI';

  @override
  String get machineIdle => 'nhàn rỗi';

  @override
  String get machineRunning => 'CHẠY';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'LỖI';

  @override
  String get machineCalibrating => 'HIỆU CHỈNH';

  @override
  String ledLabel(Object state) {
    return 'ĐÈN LED: $state';
  }

  @override
  String get ledSaved => 'ĐÃ LƯU';

  @override
  String get ledInputErr => 'LỖI NHẬP';

  @override
  String get ledPairing => 'GHÉP NỐI';

  @override
  String get ledConnected => 'ĐÃ KẾT NỐI';

  @override
  String get ledIdentify => 'XÁC ĐỊNH';

  @override
  String get identifyButton => 'XÁC ĐỊNH';

  @override
  String get identifyingToast => 'Đèn LED robot nhấp nháy trong 3 giây...';

  @override
  String get homingToast => 'Hướng dẫn tất cả các cánh...';

  @override
  String get i2cFault => 'LỖI I2C';

  @override
  String get storageFault => 'LỖI BỘ LƯU TRỮ';

  @override
  String get estopLatched => 'E-STOP ĐÃ CHẬM';

  @override
  String get presetButtonsTitle => 'NÚT ĐẶT TRƯỚC';

  @override
  String customizePresetTitle(Object label) {
    return 'Tùy chỉnh $label';
  }

  @override
  String get subtitleNameLabel => 'Tên phụ đề';

  @override
  String get subtitleNameHint => 'ví dụ: Gấp nhanh, áo sơ mi, tùy chỉnh...';

  @override
  String get buttonColorLabel => 'Màu nút';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Bước $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'DỪNG KHẨN CẤP';

  @override
  String get clearEstop => 'XÓA & MỞ KHÓA E-STOP';

  @override
  String get clearEstopHint =>
      'Đặt lại chức năng dừng khẩn cấp và đưa robot về chế độ Chờ';

  @override
  String get stopButton => 'DỪNG';

  @override
  String get fabricaArrangementTitle => 'SẮP XẾP VẢI';

  @override
  String get editArrangement => 'SẮP XẾP CHỈNH SỬA';

  @override
  String get addPanel => 'THÊM BẢNG';

  @override
  String get legendMotorized => 'Có động cơ';

  @override
  String get legendFollower => 'Người theo dõi';

  @override
  String get legendBase => 'Căn cứ';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Hàng';

  @override
  String stepSelectedHint(Object step) {
    return 'Bước $step đã chọn: Nhấn vào 1–2 Bảng điều khiển cơ giới trên lưới';
  }

  @override
  String get tapPanelsHint => 'Nhấn vào 1–2 bảng động cơ trên lưới';

  @override
  String get dualBadge => 'KÉP';

  @override
  String get requiresMotorizedPanel =>
      'Yêu cầu ít nhất 1 bảng điều khiển cơ giới (tối đa 2)';

  @override
  String get selectedChangePanelsHint =>
      'Đã chọn • Nhấn vào bảng lưới để thay đổi (tối đa 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Bước $step của $total';
  }

  @override
  String get removeStepTooltip => 'Xóa bước';

  @override
  String get requiresMotorizedModuleWarning =>
      'Quy trình yêu cầu ít nhất một mô-đun Cơ giới hóa từ Sắp xếp Fabrica.';

  @override
  String get routineFull => 'QUY TRÌNH ĐẦY ĐỦ (16/16 BƯỚC)';

  @override
  String addStepCount(Object count) {
    return 'THÊM BƯỚC ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Lưu quy trình vào Robot';

  @override
  String get selectButtonToProgram =>
      'Chọn một nút robot vật lý để lập trình với quy trình này:';

  @override
  String buttonNumber(Object slot) {
    return 'Nút $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Nút phần cứng $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Nút $slot Phụ đề (Tùy chọn)';
  }

  @override
  String get saveToRobotButton => 'LƯU VÀO ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Nút $slot ($count bước)';
  }

  @override
  String get adultTshirtTemplate => 'Mẫu áo thun dành cho người lớn';

  @override
  String get longSleeveTemplate => 'Mẫu tay áo dài';

  @override
  String get dualSweepTemplate => 'Mẫu quét kép';

  @override
  String channelNumber(Object number) {
    return 'Kênh $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count ĐÃ ĐÓNG GÓI';
  }

  @override
  String get moreHardwareOptions => 'Tùy chọn phần cứng khác';

  @override
  String get loadTemplate => 'Tải mẫu';

  @override
  String get controllerLabel => 'BỘ ĐIỀU KHIỂN';

  @override
  String get motorBadge => 'ĐỘNG CƠ';

  @override
  String get followerBadge => 'NGƯỜI THEO DÕI';

  @override
  String get baseBadge => 'CƠ SỞ';

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
