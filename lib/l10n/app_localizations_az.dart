// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Parametrlər';

  @override
  String get appLanguageTitle => 'Proqram dili';

  @override
  String get appVersionTitle => 'Proqram Versiyası';

  @override
  String get languageSectionTitle => 'Dil';

  @override
  String get languageSystemDefault => 'Sistem Defolt (Cihaz Dili)';

  @override
  String get selectLanguageHint => 'Dil seçin';

  @override
  String get addDeviceTitle => 'YENİ ROBOT əlavə edin';

  @override
  String get addDeviceSubtitle => 'AIR robotlarını cütləşdirin';

  @override
  String get yourRobots => 'SİZİN ROBOTLARINIZ';

  @override
  String get discoveredRobots => 'KƏŞF EDİLMİŞ ROBOTLAR';

  @override
  String get noRobotsPairedYet => 'Hələ heç bir Robot Qoşulmayıb';

  @override
  String get noRobotsPairedSubtitle =>
      'Telemetriyaya baxmaq, əvvəlcədən təyinləri idarə etmək və əməliyyatları idarə etmək üçün robotunuzu birləşdirin.';

  @override
  String get addYourFirstRobot => 'İLK ROBOTUNUZU ƏLAVƏ EDİN';

  @override
  String get autoScanning => 'AVTO-TARANMA';

  @override
  String get idleStatus => 'BOŞ';

  @override
  String get tabControl => 'Nəzarət';

  @override
  String get tabSequencer => 'Sequencer';

  @override
  String get tabCalibrator => 'Kalibrator';

  @override
  String get tabDiagnostics => 'Diaqnostika';

  @override
  String get renameRobot => 'Robotun adını dəyişdirin';

  @override
  String get bleDiagnostics => 'BLE Diaqnostikası';

  @override
  String get erasePresets => 'Yadda saxlanmış əvvəlcədən təyinləri silin';

  @override
  String get disconnect => 'Bağlantını kəsin';

  @override
  String get unpairRobot => 'Robotu ayırın';

  @override
  String get factoryReset => 'Zavod sıfırlaması';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'HAMISI EVDƏ';

  @override
  String get foldingTimeline => 'QATLANAN ZAMAN QAZIRANI';

  @override
  String get addStep => 'ADDIM ƏLAVƏ';

  @override
  String get previewOnRobot => 'ROBOTDA ÖNİZLƏMƏ';

  @override
  String get saveToButton => 'DÜYMƏYƏ YAXŞ EDİN';

  @override
  String get themeTitle => 'Mövzu';

  @override
  String get themeSystem => 'Cihaz';

  @override
  String get themeLight => 'İşıq';

  @override
  String get themeDark => 'Qaranlıq';

  @override
  String get connectedBadge => 'BAĞLI';

  @override
  String get inRangeBadge => 'ARALIQDA';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'AÇIQ';

  @override
  String get connectButton => 'BAĞLANIN';

  @override
  String get reconnectButton => 'YENİDƏ QOŞULUN';

  @override
  String get pairAndConnect => 'CÜTLƏŞDİRİN VƏ BAĞLAYIN';

  @override
  String get autoScanningForRobots => 'Robotlar üçün avtomatik skan edilir...';

  @override
  String get scanningIdle => 'Skanlama boşdur';

  @override
  String get nearbyRobotsAppear =>
      'Yaxınlıqdakı robotlar burada avtomatik görünəcək.';

  @override
  String get yourNearbyRobotsAppear =>
      'Yaxınlıqdakı robotlarınız avtomatik olaraq burada görünəcək.';

  @override
  String get signalStrong => 'Güclü';

  @override
  String get signalGood => 'yaxşı';

  @override
  String get signalWeak => 'Zəif';

  @override
  String get addRobotIntro =>
      'Cütləşdirmək üçün aşağıda robot seçin. Cütləşdirmə rejimində yaxınlıqdakı istənilən robot avtomatik olaraq yuxarıda aşkar ediləcək.';

  @override
  String get autoDiscoveredRobot => 'AUTO KƏŞF EDİLMİŞ ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTO KƏŞF EDİLMİŞ ROBOTLAR';

  @override
  String readyCountBadge(Object count) {
    return '$count HAZIRDIR';
  }

  @override
  String get supportedRobots => 'DƏSTƏKLƏNƏN ROBOTLAR';

  @override
  String get clothesFoldingRobot => 'Paltar qatlanan robot';

  @override
  String get fabricaDescription =>
      'Avtomatlaşdırılmış geyim qovluğu, çoxlu geyim ön ayarları və toxunma tək düyməsi ilə işləyir.';

  @override
  String get fabricaPairingHint =>
      'Cütləşdirmə rejimi: Fabrica idarəetmə panelindəki istənilən düyməni 3 saniyə basıb saxlayın (Status LED-i sürətlə yanıb-sönəcək).';

  @override
  String get pairFabricaNow => 'FABRINI İNDİ CÖVLEDİN';

  @override
  String get backToHome => 'Evə qayıt';

  @override
  String get connReady => 'HAZIR';

  @override
  String get connConnecting => 'BAĞLANIR';

  @override
  String get connDiscovering => 'KƏŞF ETMƏK';

  @override
  String get connBonding => 'BAĞLAMA';

  @override
  String get connScanning => 'Skan edilir';

  @override
  String get connDisconnected => 'BAĞLANTI KESİDİ';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name ilə əlaqə kəsilsin?';
  }

  @override
  String get disconnectConfirmBody =>
      'İstənilən vaxt əsas ekrandan yenidən qoşula bilərsiniz.';

  @override
  String get cancelButton => 'LƏĞV EDİN';

  @override
  String get saveButton => 'SAXLAYIN';

  @override
  String get customNickname => 'Fərdi Ləqəb';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name cütləşdirilsin?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Bu, bu telefondakı Robotlarınızdan $name silinəcək. İstənilən vaxt onu yenidən əlavə edə bilərsiniz.\n\nQeyd: Robot yaddaşını tamamilə silmək və zavod parametrlərini bərpa etmək üçün \"Zavod parametrlərinə sıfırlama\" düyməsini istifadə edin.';
  }

  @override
  String get unpairButton => 'AYIRMA';

  @override
  String get machineIdle => 'BOŞ';

  @override
  String get machineRunning => 'KAÇIŞ';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'XƏTA';

  @override
  String get machineCalibrating => 'KALİBRASYON';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'SAXLANILDI';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'CÜTLƏŞDİRİLİR';

  @override
  String get ledConnected => 'BAĞLI';

  @override
  String get ledIdentify => 'MÜƏYYƏNDİRİN';

  @override
  String get identifyButton => 'MÜƏYYƏNDİRİN';

  @override
  String get identifyingToast => 'Robot LED 3 saniyə ərzində yanıb-sönür...';

  @override
  String get homingToast => 'Bütün qapaqları təyin etmək...';

  @override
  String get i2cFault => 'I2C XƏTƏSİ';

  @override
  String get storageFault => 'SAXLAMA XƏBƏRİ';

  @override
  String get estopLatched => 'E-STOP BAĞLI';

  @override
  String get presetButtonsTitle => 'ÖNCƏDƏN AYARLANAN DÜĞMƏLƏR';

  @override
  String customizePresetTitle(Object label) {
    return '$label fərdiləşdirin';
  }

  @override
  String get subtitleNameLabel => 'Altyazı Adı';

  @override
  String get subtitleNameHint => 'məs. Tez qatlama, köynəklər, xüsusi...';

  @override
  String get buttonColorLabel => 'Düymə Rəngi';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Addım $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'TƏCİLİ STOP';

  @override
  String get clearEstop => 'E-STOP-u TƏMİZ EDİN və AÇIN';

  @override
  String get clearEstopHint =>
      'Təcili dayanmağı sıfırlayır və robotu Boş rejimə qaytarır';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'PARÇA ARANJIMANI';

  @override
  String get editArrangement => 'ARRANJIMANI EDİN';

  @override
  String get addPanel => 'PANEL ƏLAVƏ EDİN';

  @override
  String get legendMotorized => 'Motorlu';

  @override
  String get legendFollower => 'İzləyici';

  @override
  String get legendBase => 'Baza';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Sıralar';

  @override
  String stepSelectedHint(Object step) {
    return 'Addım $step seçildi: Şəbəkədə 1-2 Motorlu panelə toxunun';
  }

  @override
  String get tapPanelsHint => 'Şəbəkədə 1-2 motor panelinə toxunun';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Ən azı 1 motorlu panel tələb olunur (maksimum 2)';

  @override
  String get selectedChangePanelsHint =>
      'Seçildi • Dəyişmək üçün şəbəkə panellərinə toxunun (maksimum 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Addım $step/$total';
  }

  @override
  String get removeStepTooltip => 'Addımı çıxarın';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutin Fabrica Arrangement-dən ən azı bir Motorlu modul tələb edir.';

  @override
  String get routineFull => 'TAM RUTİN (16/16 ADDIM)';

  @override
  String addStepCount(Object count) {
    return 'ADDIM ƏLAVƏ EDİN ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Rutini Robotda Saxlayın';

  @override
  String get selectButtonToProgram =>
      'Bu rejimlə proqramlaşdırmaq üçün fiziki robot düyməsini seçin:';

  @override
  String buttonNumber(Object slot) {
    return 'Düymə $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Avadanlıq düyməsi $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Düymə $slot Altyazı (İstəyə görə)';
  }

  @override
  String get saveToRobotButton => 'ROBOTDA YAXŞ EDİN';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Düymə $slot ($count addımlar)';
  }

  @override
  String get adultTshirtTemplate => 'Böyüklər üçün T-Shirt Şablonu';

  @override
  String get longSleeveTemplate => 'Uzunqol Şablonu';

  @override
  String get dualSweepTemplate => 'İkili Süpürmə Şablonu';

  @override
  String channelNumber(Object number) {
    return 'Kanal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count CÜTLƏŞDİRİLDİ';
  }

  @override
  String get moreHardwareOptions => 'Daha çox Avadanlıq Seçimləri';

  @override
  String get loadTemplate => 'Şablonu yükləyin';

  @override
  String get controllerLabel => 'Nəzarətçi';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'İZLƏYİCİ';

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
