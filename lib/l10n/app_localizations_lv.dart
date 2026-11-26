// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AppLocalizationsLv extends AppLocalizations {
  AppLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Iestatījumi';

  @override
  String get appLanguageTitle => 'Lietotnes valoda';

  @override
  String get appVersionTitle => 'Lietotnes versija';

  @override
  String get languageSectionTitle => 'Valoda';

  @override
  String get languageSystemDefault => 'Sistēmas noklusējums (ierīces valoda)';

  @override
  String get selectLanguageHint => 'Izvēlieties valodu';

  @override
  String get addDeviceTitle => 'PIEVIENOT JAUNU ROBOTU';

  @override
  String get addDeviceSubtitle => 'Savienojiet AIR robotus';

  @override
  String get yourRobots => 'JŪSU ROBOTI';

  @override
  String get discoveredRobots => 'ATKLĀTI ROBOTI';

  @override
  String get noRobotsPairedYet => 'Vēl nav izveidots neviens robots pārī';

  @override
  String get noRobotsPairedSubtitle =>
      'Pievienojiet savu robotu, lai skatītu telemetriju, pārvaldītu sākotnējos iestatījumus un kontrolētu darbības.';

  @override
  String get addYourFirstRobot => 'PIEVIENOT SAVU PIRMO ROBOTU';

  @override
  String get autoScanning => 'AUTOMĀTISKĀ SKENĒŠANA';

  @override
  String get idleStatus => 'DĪKŠGAITA';

  @override
  String get tabControl => 'Kontrole';

  @override
  String get tabSequencer => 'Sekvencētājs';

  @override
  String get tabCalibrator => 'Kalibrators';

  @override
  String get tabDiagnostics => 'Diagnostika';

  @override
  String get renameRobot => 'Pārdēvējiet robotu';

  @override
  String get bleDiagnostics => 'BLE diagnostika';

  @override
  String get erasePresets => 'Dzēst saglabātos sākotnējos iestatījumus';

  @override
  String get disconnect => 'Atvienot';

  @override
  String get unpairRobot => 'Atvienojiet robotu pārī';

  @override
  String get factoryReset => 'Rūpnīcas atiestatīšana';

  @override
  String get servoManualJog => 'SERVO MANUĀLĀ JOG';

  @override
  String get homeAll => 'MĀJAS VISI';

  @override
  String get foldingTimeline => 'LOKĀŠANAS LAIKA LIKNIJA';

  @override
  String get addStep => 'PIEVIENOT SOLI';

  @override
  String get previewOnRobot => 'PRIEKŠSKATĪJUMS ROBOTĀ';

  @override
  String get saveToButton => 'SAGLABĀT UZ POGU';

  @override
  String get themeTitle => 'Tēma';

  @override
  String get themeSystem => 'Ierīce';

  @override
  String get themeLight => 'Gaisma';

  @override
  String get themeDark => 'Tumšs';

  @override
  String get connectedBadge => 'SAVIENOTS';

  @override
  String get inRangeBadge => 'DARBĪBĀ';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'ATVĒRTS';

  @override
  String get connectButton => 'SAVIENOTIES';

  @override
  String get reconnectButton => 'ATKĀRTOTI SAVIENOT';

  @override
  String get pairAndConnect => 'SAVIENOT PĀRĀ UN SAVIENOT';

  @override
  String get autoScanningForRobots => 'Automātiska robotu meklēšana...';

  @override
  String get scanningIdle => 'Skenēšana dīkstāvē';

  @override
  String get nearbyRobotsAppear =>
      'Šeit automātiski parādīsies tuvumā esošie roboti.';

  @override
  String get yourNearbyRobotsAppear =>
      'Šeit automātiski parādīsies jūsu tuvumā esošie roboti.';

  @override
  String get signalStrong => 'Spēcīgs';

  @override
  String get signalGood => 'Labi';

  @override
  String get signalWeak => 'Vāja';

  @override
  String get addRobotIntro =>
      'Tālāk atlasiet robotu, lai izveidotu savienojumu pārī. Jebkurš tuvumā esošais robots savienošanas pārī režīmā tiks automātiski atklāts augšpusē.';

  @override
  String get autoDiscoveredRobot => 'AUTOMĀTI ATKLĀTS ROBOTS';

  @override
  String get autoDiscoveredRobots => 'AUTOMĀTI ATKLĀTI ROBOTI';

  @override
  String readyCountBadge(Object count) {
    return '$count GATAVS';
  }

  @override
  String get supportedRobots => 'ATBALSTĪTI ROBOTI';

  @override
  String get clothesFoldingRobot => 'Drēbju locīšanas robots';

  @override
  String get fabricaDescription =>
      'Automatizēta apģērba mape ar vairāku apģērba gabalu sākotnējiem iestatījumiem un taustāmu vienas pogas darbību.';

  @override
  String get fabricaPairingHint =>
      'Savienošanas pārī režīms: nospiediet un turiet jebkuru pogu Fabrica vadības panelī 3 sekundes (statusa LED ātri mirgos).';

  @override
  String get pairFabricaNow => 'SAVIENOT AUDUMUS TAGAD';

  @override
  String get backToHome => 'Atpakaļ uz sākumlapu';

  @override
  String get connReady => 'GATAVS';

  @override
  String get connConnecting => 'SAVIENOŠANA';

  @override
  String get connDiscovering => 'ATKLĀŠANA';

  @override
  String get connBonding => 'LĪDZĒŠANA';

  @override
  String get connScanning => 'SKENĒŠANA';

  @override
  String get connDisconnected => 'ATvienots';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Vai pārtraukt savienojumu ar $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Jebkurā laikā varat atkārtoti izveidot savienojumu no sākuma ekrāna.';

  @override
  String get cancelButton => 'ATCELT';

  @override
  String get saveButton => 'SAGLABĀT';

  @override
  String get customNickname => 'Pielāgots segvārds';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Atvienot pārī $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Tas noņems $name no jūsu robotiem šajā tālrunī. Jebkurā laikā varat to pievienot atkārtoti.\n\nPiezīme. Lai pilnībā izdzēstu robota atmiņu un atjaunotu rūpnīcas noklusējuma iestatījumus, izmantojiet “Rūpnīcas atiestatīšana”.';
  }

  @override
  String get unpairButton => 'ATVIETOT PĀRĀ';

  @override
  String get machineIdle => 'DĪKŠGAITA';

  @override
  String get machineRunning => 'SKRIEŠANA';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'KĻŪDA';

  @override
  String get machineCalibrating => 'KALIBRĒŠANA';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'SAGLABĀTS';

  @override
  String get ledInputErr => 'IEVADES KĻŪDA';

  @override
  String get ledPairing => 'SAVIENOŠANA PĀRĀ';

  @override
  String get ledConnected => 'SAVIENOTS';

  @override
  String get ledIdentify => 'Identificēt';

  @override
  String get identifyButton => 'Identificēt';

  @override
  String get identifyingToast => '3 sekundes mirgo robota LED...';

  @override
  String get homingToast => 'Tiek iestatīti visi atloki...';

  @override
  String get i2cFault => 'I2C KĻŪME';

  @override
  String get storageFault => 'GLABĀŠANAS KĻŪME';

  @override
  String get estopLatched => 'E-STOP AIZSLĒGTS';

  @override
  String get presetButtonsTitle => 'IEPRIEKŠIESTATĪTĀS POGAS';

  @override
  String customizePresetTitle(Object label) {
    return 'Pielāgot $label';
  }

  @override
  String get subtitleNameLabel => 'Apakšvirsraksta nosaukums';

  @override
  String get subtitleNameHint => 'piem. Ātri salokāmi, krekli, pielāgoti...';

  @override
  String get buttonColorLabel => 'Pogas krāsa';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Solis $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'AVĀRIJAS STOP';

  @override
  String get clearEstop => 'IZTĪRĪT UN ATVĒRT E-STOPU';

  @override
  String get clearEstopHint =>
      'Atiestata avārijas apturēšanu un atgriež robotu tukšgaitā';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'AUDUMU SAKĀRTOJUMS';

  @override
  String get editArrangement => 'REDIĢĒJUMS';

  @override
  String get addPanel => 'PIEVIENOT PANELI';

  @override
  String get legendMotorized => 'Motorizēts';

  @override
  String get legendFollower => 'Sekotājs';

  @override
  String get legendBase => 'Bāze';

  @override
  String get colsLabel => 'Kols';

  @override
  String get rowsLabel => 'Rindas';

  @override
  String stepSelectedHint(Object step) {
    return 'Atlasīts solis $step: pieskarieties 1–2 motorizētiem paneļiem režģī';
  }

  @override
  String get tapPanelsHint => 'Piesitiet 1–2 motora paneļiem uz režģa';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Nepieciešams vismaz 1 motorizēts panelis (ne vairāk kā 2)';

  @override
  String get selectedChangePanelsHint =>
      'Atlasīts • Pieskarieties režģa paneļiem, lai mainītu (ne vairāk kā 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return '$step. darbība no $total';
  }

  @override
  String get removeStepTooltip => 'Noņemt soli';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutīnai ir nepieciešams vismaz viens motorizēts modulis no Fabrica Arrangement.';

  @override
  String get routineFull => 'PILNĪGA RUTĪNA (16/16 SOĻI)';

  @override
  String addStepCount(Object count) {
    return 'PIEVIENOT SOLI ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Saglabājiet rutīnu robotā';

  @override
  String get selectButtonToProgram =>
      'Izvēlieties fiziska robota pogu, lai programmētu ar šo rutīnu:';

  @override
  String buttonNumber(Object slot) {
    return 'Poga $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Aparatūras poga $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Poga $slot Subtitri (neobligāti)';
  }

  @override
  String get saveToRobotButton => 'SAGLABĀT ROBOTĀ';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Poga $slot ($count soļi)';
  }

  @override
  String get adultTshirtTemplate => 'Pieaugušo T-krekla veidne';

  @override
  String get longSleeveTemplate => 'Veidne ar garām piedurknēm';

  @override
  String get dualSweepTemplate => 'Dual Sweep Template';

  @override
  String channelNumber(Object number) {
    return 'Kanāls $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PĀRĪ';
  }

  @override
  String get moreHardwareOptions => 'Vairāk aparatūras opciju';

  @override
  String get loadTemplate => 'Ielādēt veidni';

  @override
  String get controllerLabel => 'VADĪTĀJS';

  @override
  String get motorBadge => 'MOTORS';

  @override
  String get followerBadge => 'SEKOTĀJS';

  @override
  String get baseBadge => 'BĀZE';

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
