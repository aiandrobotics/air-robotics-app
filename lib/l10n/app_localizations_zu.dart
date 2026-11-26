// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Zulu (`zu`).
class AppLocalizationsZu extends AppLocalizations {
  AppLocalizationsZu([String locale = 'zu']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Izilungiselelo';

  @override
  String get appLanguageTitle => 'Ulimi Lokusebenza';

  @override
  String get appVersionTitle => 'Inguqulo yohlelo lokusebenza';

  @override
  String get languageSectionTitle => 'Ulimi';

  @override
  String get languageSystemDefault =>
      'Okuzenzakalelayo Kwesistimu (Ulimi Lwedivayisi)';

  @override
  String get selectLanguageHint => 'Khetha ulimi';

  @override
  String get addDeviceTitle => 'ENGEZA IROBOTHI ELISHA';

  @override
  String get addDeviceSubtitle => 'Bhangqa amarobhothi e-AIR';

  @override
  String get yourRobots => 'AMARObhothi AKHO';

  @override
  String get discoveredRobots => 'AMARObhothi atholwe';

  @override
  String get noRobotsPairedYet => 'Awekho Amarobhothi Abhanqiwe Okwamanje';

  @override
  String get noRobotsPairedSubtitle =>
      'Xhuma irobhothi lakho ukuze ubuke i-telemetry, uphathe ukusetha ngaphambilini, futhi ulawule imisebenzi.';

  @override
  String get addYourFirstRobot => 'ENGEZA IROBOTHI LAKHO LOKUQALA';

  @override
  String get autoScanning => 'UKUSKENA NGOKUZENZAKALELAYO';

  @override
  String get idleStatus => 'I-IDLE';

  @override
  String get tabControl => 'Lawula';

  @override
  String get tabSequencer => 'Isilandeleli';

  @override
  String get tabCalibrator => 'I-Calibrator';

  @override
  String get tabDiagnostics => 'Ukuxilonga';

  @override
  String get renameRobot => 'Qamba kabusha Irobhothi';

  @override
  String get bleDiagnostics => 'I-BLE Diagnostics';

  @override
  String get erasePresets => 'Sula Okusethiwe Ngaphambilini Okulondoloziwe';

  @override
  String get disconnect => 'Nqamula';

  @override
  String get unpairRobot => 'Irobhothi elingabhanqiwe';

  @override
  String get factoryReset => 'Ukusetha kabusha kwasefekthri';

  @override
  String get servoManualJog => 'I-SERVO MANUAL JOG';

  @override
  String get homeAll => 'EKHAYA LONKE';

  @override
  String get foldingTimeline => 'UMUGQA WESIKHATHI OSONWAYO';

  @override
  String get addStep => 'ENGEZA ISINYATHELO';

  @override
  String get previewOnRobot => 'BUKA KUQALA KUROBOTHI';

  @override
  String get saveToButton => 'LONDOLOZA ENKINOBENI';

  @override
  String get themeTitle => 'Itimu';

  @override
  String get themeSystem => 'Idivayisi';

  @override
  String get themeLight => 'Ukukhanya';

  @override
  String get themeDark => 'Kumnyama';

  @override
  String get connectedBadge => 'XHUNYIWE';

  @override
  String get inRangeBadge => 'NGOBANZI';

  @override
  String get offlineBadge => 'OKUNGAxhumekile ku-inthanethi';

  @override
  String get openButton => 'VULA';

  @override
  String get connectButton => 'XHUMANA';

  @override
  String get reconnectButton => 'XHUMANA KABUSHA';

  @override
  String get pairAndConnect => 'BHANGANI FUTHI XHUMANA';

  @override
  String get autoScanningForRobots => 'Iskena ngokuzenzakalela amarobhothi...';

  @override
  String get scanningIdle => 'Ukuskena akusebenzi';

  @override
  String get nearbyRobotsAppear =>
      'Amarobhothi aseduze azovela lapha ngokuzenzakalelayo.';

  @override
  String get yourNearbyRobotsAppear =>
      'Amarobhothi akho aseduze azovela lapha ngokuzenzakalelayo.';

  @override
  String get signalStrong => 'Iqinile';

  @override
  String get signalGood => 'Kuhle';

  @override
  String get signalWeak => 'Buthaka';

  @override
  String get addRobotIntro =>
      'Khetha irobhothi ngezansi ukuze ubhanqe. Noma yiliphi irobhothi eliseduze elikumodi yokumatanisa lizotholwa ngokuzenzakalelayo phezulu.';

  @override
  String get autoDiscoveredRobot => 'IROBOTHI EZITHOLA NGOKUZENZAKALELAYO';

  @override
  String get autoDiscoveredRobots => 'AMARObhothi AZITHOLA NGOKUZENZAKALELAYO';

  @override
  String readyCountBadge(Object count) {
    return '$count ILUNGILE';
  }

  @override
  String get supportedRobots => 'AMARObhothi Asekelwe';

  @override
  String get clothesFoldingRobot => 'Irobhothi Lokugoqa Izingubo';

  @override
  String get fabricaDescription =>
      'Ifolda yengubo ezenzakalelayo enokusetha ngaphambilini kwezingubo eziningi kanye nokusebenza kwenkinobho eyodwa ethintekayo.';

  @override
  String get fabricaPairingHint =>
      'Imodi yokumatanisa: Cindezela futhi ubambe noma iyiphi inkinobho kuphaneli yokulawula ye-Fabrica imizuzwana emi-3 (Isimo se-LED sizocwayiza ngokushesha).';

  @override
  String get pairFabricaNow => 'BHANISA IFABRICA MANJE';

  @override
  String get backToHome => 'Buyela Ekhaya';

  @override
  String get connReady => 'LUNGILE';

  @override
  String get connConnecting => 'UKUXHUMANA';

  @override
  String get connDiscovering => 'UKUTHOLA';

  @override
  String get connBonding => 'I-BODING';

  @override
  String get connScanning => 'UKUSKENA';

  @override
  String get connDisconnected => 'AKUXHUNYIWE';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Nqamula ku-$name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Ungakwazi ukuxhuma kabusha noma nini esikrinini sasekhaya.';

  @override
  String get cancelButton => 'KHANSELA';

  @override
  String get saveButton => 'GCINA';

  @override
  String get customNickname => 'Isiteketiso sangokwezifiso';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Susa ukubhanqa $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Lokhu kuzosusa i-$name kumarobhothi akho kule foni. Ungaphinda uyengeze noma kunini.\n\nQaphela: Ukuze usule ngokuphelele inkumbulo yerobhothi futhi ubuyisele okumisiwe kwasembonini, sebenzisa \"Ukusetha kabusha kwasefekthri\".';
  }

  @override
  String get unpairButton => 'KUNGAVUMI';

  @override
  String get machineIdle => 'I-IDLE';

  @override
  String get machineRunning => 'IYAGIJIMA';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'IPHUTHA';

  @override
  String get machineCalibrating => 'UKUKHALA';

  @override
  String ledLabel(Object state) {
    return 'I-LED: $state';
  }

  @override
  String get ledSaved => 'KUSINDISIWE';

  @override
  String get ledInputErr => 'IPHUTHA LOKUFAKA';

  @override
  String get ledPairing => 'AMABANI';

  @override
  String get ledConnected => 'XHUNYIWE';

  @override
  String get ledIdentify => 'KHOMBA';

  @override
  String get identifyButton => 'KHOMBA';

  @override
  String get identifyingToast =>
      'I-LED yerobhothi ekhanyayo imizuzwana emi-3...';

  @override
  String get homingToast => 'Ivula wonke ama-flap...';

  @override
  String get i2cFault => 'I-I2C FAULT';

  @override
  String get storageFault => 'IPHUTHA LOKUGCINA';

  @override
  String get estopLatched => 'I-E-STOP LATCHED';

  @override
  String get presetButtonsTitle => 'IZINKONZO ZOKULUNGISELELA';

  @override
  String customizePresetTitle(Object label) {
    return 'Enza ngendlela oyifisayo i-$label';
  }

  @override
  String get subtitleNameLabel => 'Igama lombhalo ongezansi';

  @override
  String get subtitleNameHint =>
      'isib. Ukugoqa Ngokushesha, Amahembe, Ngokwezifiso...';

  @override
  String get buttonColorLabel => 'Umbala Wenkinobho';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Isinyathelo $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'UKUMISA OKUPHUTHUMAYO';

  @override
  String get clearEstop => 'SULA FUTHI UPHUMELE I-E-STOP';

  @override
  String get clearEstopHint =>
      'Isetha kabusha isitobhi esiphuthumayo futhi ibuyisela irobhothi ku-Idle';

  @override
  String get stopButton => 'MISA';

  @override
  String get fabricaArrangementTitle => 'I-FABRICA AMALUNGISELELO';

  @override
  String get editArrangement => 'HLELA AMALUNGISELELO';

  @override
  String get addPanel => 'ENGEZA IPHENELI';

  @override
  String get legendMotorized => 'Imoto';

  @override
  String get legendFollower => 'Umlandeli';

  @override
  String get legendBase => 'Isisekelo';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Imigqa';

  @override
  String stepSelectedHint(Object step) {
    return 'Isinyathelo $step esikhethiwe: Thepha amaphaneli ezimoto angu-1–2 kugridi';
  }

  @override
  String get tapPanelsHint => 'Thepha amaphaneli enjini angu-1–2 kugridi';

  @override
  String get dualBadge => 'OKUMBILI';

  @override
  String get requiresMotorizedPanel =>
      'Idinga okungenani iphaneli enenjini engu-1 (ubukhulu obungu-2)';

  @override
  String get selectedChangePanelsHint =>
      'Kukhethiwe • Thepha amaphaneli egridi ukuze ushintshe (ubukhulu obungu-2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Isinyathelo $step kwezingu-$total';
  }

  @override
  String get removeStepTooltip => 'Susa Isinyathelo';

  @override
  String get requiresMotorizedModuleWarning =>
      'Umjikelezo udinga okungenani imojula eyodwa Yezithuthuthu evela ku-Fabrica Arrangement.';

  @override
  String get routineFull => 'UMGWAQO NGOKUGCWELE (16/16 IZINYATHELO)';

  @override
  String addStepCount(Object count) {
    return 'ENGEZA ISINYATHELO ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Londoloza Umjikelezo Kurobhothi';

  @override
  String get selectButtonToProgram =>
      'Khetha inkinobho yerobhothi eliphathekayo ukuze uhlele ngalo mjikelezo:';

  @override
  String buttonNumber(Object slot) {
    return 'Inkinobho $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Inkinobho yezingxenyekazi zekhompuyutha $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Inkinobho $slot Umbhalo ongezansi (Ongakukhetha)';
  }

  @override
  String get saveToRobotButton => 'GCINA KUROBOTHI';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Inkinobho $slot ($count izinyathelo)';
  }

  @override
  String get adultTshirtTemplate => 'Isifanekiso Sesikibha Sabantu Abadala';

  @override
  String get longSleeveTemplate => 'Isifanekiso Semikhono Emide';

  @override
  String get dualSweepTemplate => 'Isifanekiso Sokushanela Okukabili';

  @override
  String channelNumber(Object number) {
    return 'Isiteshi $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count Ibhanqiwe';
  }

  @override
  String get moreHardwareOptions => 'Izinketho Eziningi Zekhompuyutha';

  @override
  String get loadTemplate => 'Layisha Isifanekiso';

  @override
  String get controllerLabel => 'ISILAWULI';

  @override
  String get motorBadge => 'MOTOR';

  @override
  String get followerBadge => 'UMLANDELI';

  @override
  String get baseBadge => 'ISISEKELO';

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
