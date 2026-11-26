// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Tetapan';

  @override
  String get appLanguageTitle => 'Bahasa Aplikasi';

  @override
  String get appVersionTitle => 'Versi Aplikasi';

  @override
  String get languageSectionTitle => 'Bahasa';

  @override
  String get languageSystemDefault => 'Lalai Sistem (Bahasa Peranti)';

  @override
  String get selectLanguageHint => 'Pilih bahasa';

  @override
  String get addDeviceTitle => 'TAMBAH ROBOT BARU';

  @override
  String get addDeviceSubtitle => 'Pasangkan robot AIR';

  @override
  String get yourRobots => 'ROBOT ANDA';

  @override
  String get discoveredRobots => 'ROBOT YANG DITEMUI';

  @override
  String get noRobotsPairedYet => 'Belum Ada Robot Dipasangkan';

  @override
  String get noRobotsPairedSubtitle =>
      'Sambungkan robot anda untuk melihat telemetri, mengurus pratetap dan mengawal operasi.';

  @override
  String get addYourFirstRobot => 'TAMBAH ROBOT PERTAMA ANDA';

  @override
  String get autoScanning => 'PENGISIAN AUTO';

  @override
  String get idleStatus => 'IDLE';

  @override
  String get tabControl => 'Kawalan';

  @override
  String get tabSequencer => 'Sequencer';

  @override
  String get tabCalibrator => 'Penentukuran';

  @override
  String get tabDiagnostics => 'Diagnostik';

  @override
  String get renameRobot => 'Namakan semula Robot';

  @override
  String get bleDiagnostics => 'Diagnostik BLE';

  @override
  String get erasePresets => 'Padamkan Pratetap yang Disimpan';

  @override
  String get disconnect => 'Putuskan sambungan';

  @override
  String get unpairRobot => 'Nyahgandingkan Robot';

  @override
  String get factoryReset => 'Tetapan Semula Kilang';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'RUMAH SEMUA';

  @override
  String get foldingTimeline => 'GARIS MASA LIPAT';

  @override
  String get addStep => 'TAMBAH LANGKAH';

  @override
  String get previewOnRobot => 'PREVIEW PADA ROBOT';

  @override
  String get saveToButton => 'SIMPAN KE BUTTON';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Peranti';

  @override
  String get themeLight => 'Cahaya';

  @override
  String get themeDark => 'Gelap';

  @override
  String get connectedBadge => 'BERSAMBUNG';

  @override
  String get inRangeBadge => 'DALAM RANGKAIAN';

  @override
  String get offlineBadge => 'LUAR TALIAN';

  @override
  String get openButton => 'TERBUKA';

  @override
  String get connectButton => 'SAMBUNG';

  @override
  String get reconnectButton => 'HUBUNGKAN SEMULA';

  @override
  String get pairAndConnect => 'PASANG & HUBUNGKAN';

  @override
  String get autoScanningForRobots => 'Pengimbasan automatik untuk robot...';

  @override
  String get scanningIdle => 'Mengimbas melahu';

  @override
  String get nearbyRobotsAppear =>
      'Robot berdekatan akan muncul di sini secara automatik.';

  @override
  String get yourNearbyRobotsAppear =>
      'Robot berdekatan anda akan muncul di sini secara automatik.';

  @override
  String get signalStrong => 'kuat';

  @override
  String get signalGood => 'bagus';

  @override
  String get signalWeak => 'Lemah';

  @override
  String get addRobotIntro =>
      'Pilih robot di bawah untuk dipasangkan. Mana-mana robot berdekatan dalam mod berpasangan akan ditemui secara automatik di bahagian atas.';

  @override
  String get autoDiscoveredRobot => 'ROBOT AUTO DITEMUI';

  @override
  String get autoDiscoveredRobots => 'ROBOT AUTO TERTEMU';

  @override
  String readyCountBadge(Object count) {
    return '$count SEDIA';
  }

  @override
  String get supportedRobots => 'ROBOT DISOKONG';

  @override
  String get clothesFoldingRobot => 'Robot Lipat Pakaian';

  @override
  String get fabricaDescription =>
      'Folder pakaian automatik dengan pratetap berbilang pakaian dan operasi butang tunggal sentuhan.';

  @override
  String get fabricaPairingHint =>
      'Mod berpasangan: Tekan dan tahan sebarang butang pada panel kawalan Fabrica selama 3 saat (LED Status akan berkelip dengan cepat).';

  @override
  String get pairFabricaNow => 'PASANGKAN FABRIKA SEKARANG';

  @override
  String get backToHome => 'Kembali ke Rumah';

  @override
  String get connReady => 'SEDIA';

  @override
  String get connConnecting => 'MENGHUBUNGKAN';

  @override
  String get connDiscovering => 'MENEMUKAN';

  @override
  String get connBonding => 'Ikatan';

  @override
  String get connScanning => 'MENGIMBAS';

  @override
  String get connDisconnected => 'TERPUTUS SAMBUNGAN';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Putuskan sambungan daripada $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Anda boleh menyambung semula pada bila-bila masa dari skrin utama.';

  @override
  String get cancelButton => 'BATALKAN';

  @override
  String get saveButton => 'JIMAT';

  @override
  String get customNickname => 'Nama Panggilan Tersuai';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Nyahgandingkan $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Ini akan mengalih keluar $name daripada Robot Anda pada telefon ini. Anda boleh menambahnya semula pada bila-bila masa.\n\nNota: Untuk memadam sepenuhnya memori robot dan memulihkan lalai kilang, gunakan \"Tetapan Semula Kilang\".';
  }

  @override
  String get unpairButton => 'NYAHPAKAI';

  @override
  String get machineIdle => 'IDLE';

  @override
  String get machineRunning => 'BERLARI';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'RALAT';

  @override
  String get machineCalibrating => 'MENENTEKURASI';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'DISIMPAN';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'BERPASANG';

  @override
  String get ledConnected => 'BERSAMBUNG';

  @override
  String get ledIdentify => 'KENALPASTI';

  @override
  String get identifyButton => 'KENALPASTI';

  @override
  String get identifyingToast => 'LED robot berkelip selama 3 saat...';

  @override
  String get homingToast => 'Menempatkan semua kepak...';

  @override
  String get i2cFault => 'KESALAHAN I2C';

  @override
  String get storageFault => 'KESALAHAN PENYIMPANAN';

  @override
  String get estopLatched => 'E-STOP TERSELAK';

  @override
  String get presetButtonsTitle => 'BUTANG PRESET';

  @override
  String customizePresetTitle(Object label) {
    return 'Sesuaikan $label';
  }

  @override
  String get subtitleNameLabel => 'Nama Sarikata';

  @override
  String get subtitleNameHint => 'cth. Lipat Pantas, Baju, Tersuai...';

  @override
  String get buttonColorLabel => 'Warna Butang';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Langkah $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'BERHENTI KECEMASAN';

  @override
  String get clearEstop => 'CLEAR & Cabut E-STOP';

  @override
  String get clearEstopHint =>
      'Menetapkan semula hentian kecemasan dan mengembalikan robot kepada Idle';

  @override
  String get stopButton => 'BERHENTI';

  @override
  String get fabricaArrangementTitle => 'SUSUNAN FABRIKA';

  @override
  String get editArrangement => 'EDIT SUSUNAN';

  @override
  String get addPanel => 'TAMBAH PANEL';

  @override
  String get legendMotorized => 'Bermotor';

  @override
  String get legendFollower => 'Pengikut';

  @override
  String get legendBase => 'Pangkalan';

  @override
  String get colsLabel => 'Kol';

  @override
  String get rowsLabel => 'baris';

  @override
  String stepSelectedHint(Object step) {
    return 'Langkah $step dipilih: Ketik 1–2 Panel bermotor pada grid';
  }

  @override
  String get tapPanelsHint => 'Ketik 1–2 panel motor pada grid';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Memerlukan sekurang-kurangnya 1 panel bermotor (maks 2)';

  @override
  String get selectedChangePanelsHint =>
      'Dipilih • Ketik panel grid untuk menukar (maks 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Langkah $step daripada $total';
  }

  @override
  String get removeStepTooltip => 'Keluarkan Langkah';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutin memerlukan sekurang-kurangnya satu modul Bermotor daripada Fabrica Arrangement.';

  @override
  String get routineFull => 'RUTIN PENUH (16/16 LANGKAH)';

  @override
  String addStepCount(Object count) {
    return 'TAMBAH LANGKAH ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Simpan Rutin ke Robot';

  @override
  String get selectButtonToProgram =>
      'Pilih butang robot fizikal untuk memprogram dengan rutin ini:';

  @override
  String buttonNumber(Object slot) {
    return 'Butang $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Butang Perkakasan $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Butang $slot Sari Kata (Pilihan)';
  }

  @override
  String get saveToRobotButton => 'SIMPAN KE ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Butang $slot ($count langkah)';
  }

  @override
  String get adultTshirtTemplate => 'Templat Baju-T Dewasa';

  @override
  String get longSleeveTemplate => 'Templat Lengan Panjang';

  @override
  String get dualSweepTemplate => 'Templat Dwi Sapuan';

  @override
  String channelNumber(Object number) {
    return 'Saluran $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count BERPASANGAN';
  }

  @override
  String get moreHardwareOptions => 'Lebih Banyak Pilihan Perkakasan';

  @override
  String get loadTemplate => 'Muatkan Templat';

  @override
  String get controllerLabel => 'PENGAWAL';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'PENGIKUT';

  @override
  String get baseBadge => 'ASAS';

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
