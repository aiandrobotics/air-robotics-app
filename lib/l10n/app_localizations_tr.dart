// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get appLanguageTitle => 'Uygulama Dili';

  @override
  String get appVersionTitle => 'Uygulama Sürümü';

  @override
  String get languageSectionTitle => 'Dil';

  @override
  String get languageSystemDefault => 'Sistem Varsayılanı (Cihaz Dili)';

  @override
  String get selectLanguageHint => 'Bir dil seçin';

  @override
  String get addDeviceTitle => 'YENİ ROBOT EKLE';

  @override
  String get addDeviceSubtitle => 'AIR robotlarını eşleştirin';

  @override
  String get yourRobots => 'ROBOTLARINIZ';

  @override
  String get discoveredRobots => 'BULUNAN ROBOTLAR';

  @override
  String get noRobotsPairedYet => 'Henüz Eşleştirilen Robot Yok';

  @override
  String get noRobotsPairedSubtitle =>
      'Telemetriyi görüntülemek, ön ayarları yönetmek ve işlemleri kontrol etmek için robotunuzu bağlayın.';

  @override
  String get addYourFirstRobot => 'İLK ROBOTUNUZU EKLEYİN';

  @override
  String get autoScanning => 'OTOMATİK TARAMA';

  @override
  String get idleStatus => 'BOŞTA';

  @override
  String get tabControl => 'Kontrol';

  @override
  String get tabSequencer => 'Sıralayıcı';

  @override
  String get tabCalibrator => 'Kalibratör';

  @override
  String get tabDiagnostics => 'Teşhis';

  @override
  String get renameRobot => 'Robotu Yeniden Adlandır';

  @override
  String get bleDiagnostics => 'BLE Tanılama';

  @override
  String get erasePresets => 'Kaydedilmiş Ön Ayarları Sil';

  @override
  String get disconnect => 'Bağlantıyı kes';

  @override
  String get unpairRobot => 'Robotun Eşleşmesini Kaldır';

  @override
  String get factoryReset => 'Fabrika Ayarlarına Sıfırlama';

  @override
  String get servoManualJog => 'SERVO MANUEL JOG';

  @override
  String get homeAll => 'ANA SAYFA TÜMÜ';

  @override
  String get foldingTimeline => 'KATLANIR ZAMAN ÇİZELGESİ';

  @override
  String get addStep => 'ADIM EKLE';

  @override
  String get previewOnRobot => 'ROBOTTA ÖNİZLEME';

  @override
  String get saveToButton => 'BUTONA KAYDET';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Cihaz';

  @override
  String get themeLight => 'Işık';

  @override
  String get themeDark => 'Karanlık';

  @override
  String get connectedBadge => 'BAĞLI';

  @override
  String get inRangeBadge => 'ARALIK İÇİNDE';

  @override
  String get offlineBadge => 'ÇEVRİMDIŞI';

  @override
  String get openButton => 'AÇIK';

  @override
  String get connectButton => 'BAĞLANTI';

  @override
  String get reconnectButton => 'YENİDEN BAĞLAN';

  @override
  String get pairAndConnect => 'EŞLEŞTİR VE BAĞLAN';

  @override
  String get autoScanningForRobots => 'Robotlar için otomatik tarama...';

  @override
  String get scanningIdle => 'Boşta tarama';

  @override
  String get nearbyRobotsAppear =>
      'Yakındaki robotlar burada otomatik olarak görünecektir.';

  @override
  String get yourNearbyRobotsAppear =>
      'Yakındaki robotlarınız otomatik olarak burada görünecek.';

  @override
  String get signalStrong => 'Güçlü';

  @override
  String get signalGood => 'iyi';

  @override
  String get signalWeak => 'Zayıf';

  @override
  String get addRobotIntro =>
      'Eşleştirmek için aşağıdan bir robot seçin. Eşleştirme modunda yakındaki herhangi bir robot otomatik olarak üstte keşfedilecektir.';

  @override
  String get autoDiscoveredRobot => 'OTOMATİK KEŞFEDİLEN ROBOT';

  @override
  String get autoDiscoveredRobots => 'OTOMATİK KEŞFEDİLEN ROBOTLAR';

  @override
  String readyCountBadge(Object count) {
    return '$count HAZIR';
  }

  @override
  String get supportedRobots => 'DESTEKLENEN ROBOTLAR';

  @override
  String get clothesFoldingRobot => 'Elbise Katlama Robotu';

  @override
  String get fabricaDescription =>
      'Çoklu giysi ön ayarlarına ve dokunsal tek tuşla çalıştırma özelliğine sahip otomatik giysi klasörü.';

  @override
  String get fabricaPairingHint =>
      'Eşleştirme modu: Fabrica kontrol panelindeki herhangi bir düğmeyi 3 saniye basılı tutun (Durum LED\'i hızla yanıp sönecektir).';

  @override
  String get pairFabricaNow => 'ŞİMDİ FABRICA\'YI EŞLEŞTİRİN';

  @override
  String get backToHome => 'Ana Sayfaya Geri Dön';

  @override
  String get connReady => 'HAZIR';

  @override
  String get connConnecting => 'BAĞLANIYOR';

  @override
  String get connDiscovering => 'KEŞFETMEK';

  @override
  String get connBonding => 'YAPIŞTIRMA';

  @override
  String get connScanning => 'TARAMA';

  @override
  String get connDisconnected => 'BAĞLANTI KESİLDİ';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name ile bağlantı kesilsin mi?';
  }

  @override
  String get disconnectConfirmBody =>
      'Ana ekrandan istediğiniz zaman yeniden bağlanabilirsiniz.';

  @override
  String get cancelButton => 'İPTAL';

  @override
  String get saveButton => 'KAYDET';

  @override
  String get customNickname => 'Özel Takma Ad';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name\'nin eşlemesi kaldırılsın mı?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Bu, $name öğesini bu telefondaki Robotlarınızdan kaldıracaktır. İstediğiniz zaman yeniden ekleyebilirsiniz.\n\nNot: Robot hafızasını tamamen silmek ve fabrika varsayılanlarını geri yüklemek için \"Fabrika Ayarlarına Sıfırla\"yı kullanın.';
  }

  @override
  String get unpairButton => 'EŞLEŞTİRMEYİ KALDIR';

  @override
  String get machineIdle => 'BOŞTA';

  @override
  String get machineRunning => 'KOŞU';

  @override
  String get machineEstop => 'Acil DURDURMA';

  @override
  String get machineError => 'HATA';

  @override
  String get machineCalibrating => 'KALİBRASYON';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'KAYDEDİLDİ';

  @override
  String get ledInputErr => 'GİRİŞ HATASI';

  @override
  String get ledPairing => 'EŞLEŞTİRME';

  @override
  String get ledConnected => 'BAĞLI';

  @override
  String get ledIdentify => 'TANIMLAYIN';

  @override
  String get identifyButton => 'TANIMLAYIN';

  @override
  String get identifyingToast =>
      'Robot LED\'i 3 saniye boyunca yanıp sönüyor...';

  @override
  String get homingToast => 'Tüm flapları hedef alıyor...';

  @override
  String get i2cFault => 'I2C HATASI';

  @override
  String get storageFault => 'DEPOLAMA HATASI';

  @override
  String get estopLatched => 'ACİL DURDURMA KİLİTLİ';

  @override
  String get presetButtonsTitle => 'ÖN AYAR DÜĞMELERİ';

  @override
  String customizePresetTitle(Object label) {
    return '$label\'ı özelleştir';
  }

  @override
  String get subtitleNameLabel => 'Altyazı Adı';

  @override
  String get subtitleNameHint => 'örneğin Hızlı Katlama, Gömlekler, Özel...';

  @override
  String get buttonColorLabel => 'Düğme Rengi';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Adım $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'ACİL DURDURMA';

  @override
  String get clearEstop => 'ACİL DURDURMAYI TEMİZLEYİN VE KİLİDİ AÇIN';

  @override
  String get clearEstopHint =>
      'Acil durdurmayı sıfırlar ve robotu Boşta durumuna döndürür';

  @override
  String get stopButton => 'DUR';

  @override
  String get fabricaArrangementTitle => 'KUMAŞ DÜZENLEMESİ';

  @override
  String get editArrangement => 'DÜZENLEMEYİ DÜZENLE';

  @override
  String get addPanel => 'PANEL EKLE';

  @override
  String get legendMotorized => 'Motorlu';

  @override
  String get legendFollower => 'Takipçi';

  @override
  String get legendBase => 'Baz';

  @override
  String get colsLabel => 'Sütunlar';

  @override
  String get rowsLabel => 'Satırlar';

  @override
  String stepSelectedHint(Object step) {
    return 'Adım $step seçildi: Izgaradaki 1–2 Motorlu panellere dokunun';
  }

  @override
  String get tapPanelsHint => 'Izgaraya 1-2 motor paneline dokunun';

  @override
  String get dualBadge => 'ÇİFT';

  @override
  String get requiresMotorizedPanel =>
      'En az 1 motorlu panel gerektirir (maks. 2)';

  @override
  String get selectedChangePanelsHint =>
      'Seçildi • Değiştirmek için ızgara panellerine dokunun (maks. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return '$step / $total Adımı';
  }

  @override
  String get removeStepTooltip => 'Adımı Kaldır';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutin, Fabrica Düzenlemesinden en az bir Motorlu modül gerektirir.';

  @override
  String get routineFull => 'RUTİN TAM (16/16 ADIM)';

  @override
  String addStepCount(Object count) {
    return 'ADIM EKLE ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Rutini Robota Kaydet';

  @override
  String get selectButtonToProgram =>
      'Bu rutinle programlamak için fiziksel bir robot düğmesi seçin:';

  @override
  String buttonNumber(Object slot) {
    return 'Düğme $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Donanım Düğmesi $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Düğme $slot Altyazı (İsteğe Bağlı)';
  }

  @override
  String get saveToRobotButton => 'ROBOTA KAYDET';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return '$slot Düğmesi ($count adımlar)';
  }

  @override
  String get adultTshirtTemplate => 'Yetişkin Tişört Şablonu';

  @override
  String get longSleeveTemplate => 'Uzun Kollu Şablon';

  @override
  String get dualSweepTemplate => 'Çift Süpürme Şablonu';

  @override
  String channelNumber(Object number) {
    return 'Kanal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count EŞLEŞTİRİLDİ';
  }

  @override
  String get moreHardwareOptions => 'Daha Fazla Donanım Seçeneği';

  @override
  String get loadTemplate => 'Şablonu Yükle';

  @override
  String get controllerLabel => 'KONTROLÖR';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'TAKİPÇİ';

  @override
  String get baseBadge => 'TABAN';

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
