// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get appLanguageTitle => 'Bahasa Aplikasi';

  @override
  String get appVersionTitle => 'Versi Aplikasi';

  @override
  String get languageSectionTitle => 'Bahasa';

  @override
  String get languageSystemDefault => 'Default Sistem (Bahasa Perangkat)';

  @override
  String get selectLanguageHint => 'Pilih bahasa';

  @override
  String get addDeviceTitle => 'TAMBAHKAN ROBOT BARU';

  @override
  String get addDeviceSubtitle => 'Pasangkan robot UDARA';

  @override
  String get yourRobots => 'ROBOT ANDA';

  @override
  String get discoveredRobots => 'ROBOT YANG DITEMUKAN';

  @override
  String get noRobotsPairedYet => 'Belum Ada Robot yang Dipasangkan';

  @override
  String get noRobotsPairedSubtitle =>
      'Hubungkan robot Anda untuk melihat telemetri, mengelola preset, dan mengontrol operasi.';

  @override
  String get addYourFirstRobot => 'TAMBAHKAN ROBOT PERTAMA ANDA';

  @override
  String get autoScanning => 'PEMINDAIAN OTOMATIS';

  @override
  String get idleStatus => 'menganggur';

  @override
  String get tabControl => 'Kontrol';

  @override
  String get tabSequencer => 'pengurutan';

  @override
  String get tabCalibrator => 'Kalibrator';

  @override
  String get tabDiagnostics => 'Diagnostik';

  @override
  String get renameRobot => 'Ganti nama Robot';

  @override
  String get bleDiagnostics => 'Diagnostik BLE';

  @override
  String get erasePresets => 'Hapus Preset Tersimpan';

  @override
  String get disconnect => 'Putuskan sambungan';

  @override
  String get unpairRobot => 'Putuskan pasangan Robot';

  @override
  String get factoryReset => 'Reset Pabrik';

  @override
  String get servoManualJog => 'JOG MANUAL SERVO';

  @override
  String get homeAll => 'RUMAH SEMUA';

  @override
  String get foldingTimeline => 'GARIS WAKTU LIPAT';

  @override
  String get addStep => 'TAMBAHKAN LANGKAH';

  @override
  String get previewOnRobot => 'PRATINJAU DI ROBOT';

  @override
  String get saveToButton => 'SIMPAN KE TOMBOL';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Perangkat';

  @override
  String get themeLight => 'Ringan';

  @override
  String get themeDark => 'Gelap';

  @override
  String get connectedBadge => 'TERHUBUNG';

  @override
  String get inRangeBadge => 'DALAM JANGKAUAN';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'BUKA';

  @override
  String get connectButton => 'HUBUNGKAN';

  @override
  String get reconnectButton => 'HUBUNGKAN KEMBALI';

  @override
  String get pairAndConnect => 'PASANGKAN & SAMBUNGKAN';

  @override
  String get autoScanningForRobots => 'Pemindaian otomatis untuk robot...';

  @override
  String get scanningIdle => 'Pemindaian menganggur';

  @override
  String get nearbyRobotsAppear =>
      'Robot terdekat akan muncul di sini secara otomatis.';

  @override
  String get yourNearbyRobotsAppear =>
      'Robot terdekat Anda akan muncul di sini secara otomatis.';

  @override
  String get signalStrong => 'Kuat';

  @override
  String get signalGood => 'Bagus';

  @override
  String get signalWeak => 'Lemah';

  @override
  String get addRobotIntro =>
      'Pilih robot di bawah untuk dipasangkan. Robot terdekat dalam mode berpasangan akan otomatis ditemukan di bagian atas.';

  @override
  String get autoDiscoveredRobot => 'ROBOT YANG DITEMUKAN OTOMATIS';

  @override
  String get autoDiscoveredRobots => 'ROBOT YANG DITEMUKAN OTOMATIS';

  @override
  String readyCountBadge(Object count) {
    return '$count SIAP';
  }

  @override
  String get supportedRobots => 'ROBOT YANG DIDUKUNG';

  @override
  String get clothesFoldingRobot => 'Robot Lipat Pakaian';

  @override
  String get fabricaDescription =>
      'Folder pakaian otomatis dengan preset multi-garmen dan pengoperasian satu tombol yang dapat disentuh.';

  @override
  String get fabricaPairingHint =>
      'Mode berpasangan: Tekan dan tahan tombol apa saja pada panel kontrol Fabrica selama 3 detik (LED Status akan berkedip cepat).';

  @override
  String get pairFabricaNow => 'PASANGKAN KAIN SEKARANG';

  @override
  String get backToHome => 'Kembali ke Rumah';

  @override
  String get connReady => 'SIAP';

  @override
  String get connConnecting => 'MENGHUBUNGKAN';

  @override
  String get connDiscovering => 'MENEMUKAN';

  @override
  String get connBonding => 'IKATAN';

  @override
  String get connScanning => 'PEMINDAIAN';

  @override
  String get connDisconnected => 'TERHUBUNG';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Putuskan sambungan dari $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Anda dapat menyambung kembali kapan saja dari layar utama.';

  @override
  String get cancelButton => 'BATAL';

  @override
  String get saveButton => 'SIMPAN';

  @override
  String get customNickname => 'Nama Panggilan Khusus';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Putuskan sambungan $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Ini akan menghapus $name dari Robot Anda di ponsel ini. Anda dapat menambahkannya kembali kapan saja.\n\nCatatan: Untuk menghapus sepenuhnya memori robot dan memulihkan default pabrik, gunakan \"Factory Reset\".';
  }

  @override
  String get unpairButton => 'LEPASKAN PASANGAN';

  @override
  String get machineIdle => 'menganggur';

  @override
  String get machineRunning => 'BERJALAN';

  @override
  String get machineEstop => 'E-BERHENTI';

  @override
  String get machineError => 'KESALAHAN';

  @override
  String get machineCalibrating => 'KALIBRASI';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'DISELAMATKAN';

  @override
  String get ledInputErr => 'MASUKAN KESALAHAN';

  @override
  String get ledPairing => 'PASANG';

  @override
  String get ledConnected => 'TERHUBUNG';

  @override
  String get ledIdentify => 'IDENTIFIKASI';

  @override
  String get identifyButton => 'IDENTIFIKASI';

  @override
  String get identifyingToast => 'LED robot berkedip selama 3 detik...';

  @override
  String get homingToast => 'Homing semua penutup...';

  @override
  String get i2cFault => 'KESALAHAN I2C';

  @override
  String get storageFault => 'KESALAHAN PENYIMPANAN';

  @override
  String get estopLatched => 'E-STOP TERCANTUM';

  @override
  String get presetButtonsTitle => 'TOMBOL PRESET';

  @override
  String customizePresetTitle(Object label) {
    return 'Sesuaikan $label';
  }

  @override
  String get subtitleNameLabel => 'Nama Subjudul';

  @override
  String get subtitleNameHint => 'misalnya Lipat Cepat, Kemeja, Kustom...';

  @override
  String get buttonColorLabel => 'Warna Tombol';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Langkah $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'BERHENTI DARURAT';

  @override
  String get clearEstop => 'HAPUS & BUKA E-STOP';

  @override
  String get clearEstopHint =>
      'Menyetel ulang penghentian darurat dan mengembalikan robot ke Idle';

  @override
  String get stopButton => 'BERHENTI';

  @override
  String get fabricaArrangementTitle => 'PENGATURAN KAIN';

  @override
  String get editArrangement => 'EDIT PENGATURAN';

  @override
  String get addPanel => 'TAMBAHKAN PANEL';

  @override
  String get legendMotorized => 'Bermotor';

  @override
  String get legendFollower => 'Pengikut';

  @override
  String get legendBase => 'Pangkalan';

  @override
  String get colsLabel => 'Kol';

  @override
  String get rowsLabel => 'Baris';

  @override
  String stepSelectedHint(Object step) {
    return 'Langkah $step dipilih: Ketuk 1–2 Panel bermotor pada grid';
  }

  @override
  String get tapPanelsHint => 'Ketuk 1–2 panel motor pada jaringan';

  @override
  String get dualBadge => 'GANDA';

  @override
  String get requiresMotorizedPanel =>
      'Membutuhkan setidaknya 1 panel bermotor (maks 2)';

  @override
  String get selectedChangePanelsHint =>
      'Dipilih • Ketuk panel kisi untuk mengubah (maks 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Langkah $step dari $total';
  }

  @override
  String get removeStepTooltip => 'Hapus Langkah';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutin memerlukan setidaknya satu modul Bermotor dari Fabrica Arrangement.';

  @override
  String get routineFull => 'RUTIN PENUH (16/16 LANGKAH)';

  @override
  String addStepCount(Object count) {
    return 'TAMBAHKAN LANGKAH ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Simpan Rutin ke Robot';

  @override
  String get selectButtonToProgram =>
      'Pilih tombol robot fisik untuk diprogram dengan rutinitas ini:';

  @override
  String buttonNumber(Object slot) {
    return 'Tombol $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Tombol Perangkat Keras $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Tombol $slot Subtitle (Opsional)';
  }

  @override
  String get saveToRobotButton => 'SIMPAN KE ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Tombol $slot ($count langkah)';
  }

  @override
  String get adultTshirtTemplate => 'Templat Kaos Dewasa';

  @override
  String get longSleeveTemplate => 'Templat Lengan Panjang';

  @override
  String get dualSweepTemplate => 'Templat Sapu Ganda';

  @override
  String channelNumber(Object number) {
    return 'Saluran $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count DIPASANGKAN';
  }

  @override
  String get moreHardwareOptions => 'Opsi Perangkat Keras Lainnya';

  @override
  String get loadTemplate => 'Muat Templat';

  @override
  String get controllerLabel => 'KONTROLER';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'PENGIKUT';

  @override
  String get baseBadge => 'DASAR';

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
