// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Icelandic (`is`).
class AppLocalizationsIs extends AppLocalizations {
  AppLocalizationsIs([String locale = 'is']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Stillingar';

  @override
  String get appLanguageTitle => 'Tungumál apps';

  @override
  String get appVersionTitle => 'App útgáfa';

  @override
  String get languageSectionTitle => 'Tungumál';

  @override
  String get languageSystemDefault => 'Sjálfgefið kerfi (tungumál tækis)';

  @override
  String get selectLanguageHint => 'Veldu tungumál';

  @override
  String get addDeviceTitle => 'BÆTTA VIÐ NÝJU VÆLUM';

  @override
  String get addDeviceSubtitle => 'Paraðu AIR vélmenni';

  @override
  String get yourRobots => 'VÉLMENNIR ÞÍNIR';

  @override
  String get discoveredRobots => 'UPPFÖNDUÐAR VÉLMENNUR';

  @override
  String get noRobotsPairedYet => 'Engin vélmenni pöruð enn';

  @override
  String get noRobotsPairedSubtitle =>
      'Tengdu vélmennið þitt til að skoða fjarmælingar, stjórna forstillingum og stjórna aðgerðum.';

  @override
  String get addYourFirstRobot => 'BÆTTU VIÐ FYRSTU VÆLUM ÞÍNUM';

  @override
  String get autoScanning => 'SJÁLFSKÖNNUN';

  @override
  String get idleStatus => 'AÐGERÐ';

  @override
  String get tabControl => 'Stjórna';

  @override
  String get tabSequencer => 'Sequencer';

  @override
  String get tabCalibrator => 'Kvörðunartæki';

  @override
  String get tabDiagnostics => 'Greining';

  @override
  String get renameRobot => 'Endurnefna vélmenni';

  @override
  String get bleDiagnostics => 'BLE greining';

  @override
  String get erasePresets => 'Eyða vistuðum forstillingum';

  @override
  String get disconnect => 'Aftengjast';

  @override
  String get unpairRobot => 'Aftryggja vélmenni';

  @override
  String get factoryReset => 'Factory Reset';

  @override
  String get servoManualJog => 'SERVO HANDBOK SKOKK';

  @override
  String get homeAll => 'HEIM ALLIR';

  @override
  String get foldingTimeline => 'FELLING TÍMALÍNA';

  @override
  String get addStep => 'BÆTTA VIÐ SKREF';

  @override
  String get previewOnRobot => 'FORSÝNING Á VÆLJUM';

  @override
  String get saveToButton => 'VISTA Í HNAPP';

  @override
  String get themeTitle => 'Þema';

  @override
  String get themeSystem => 'Tæki';

  @override
  String get themeLight => 'Ljós';

  @override
  String get themeDark => 'Myrkur';

  @override
  String get connectedBadge => 'TENGST';

  @override
  String get inRangeBadge => 'Í FRÆÐI';

  @override
  String get offlineBadge => 'OFFLINE';

  @override
  String get openButton => 'OPNA';

  @override
  String get connectButton => 'TENGJA';

  @override
  String get reconnectButton => 'TENGJA aftur';

  @override
  String get pairAndConnect => 'PARA & TENGJA';

  @override
  String get autoScanningForRobots => 'Sjálfvirk skönnun fyrir vélmenni...';

  @override
  String get scanningIdle => 'Skannar aðgerðalaus';

  @override
  String get nearbyRobotsAppear =>
      'Nálæg vélmenni munu birtast hér sjálfkrafa.';

  @override
  String get yourNearbyRobotsAppear =>
      'Nálægt vélmenni munu birtast hér sjálfkrafa.';

  @override
  String get signalStrong => 'Sterkur';

  @override
  String get signalGood => 'Gott';

  @override
  String get signalWeak => 'Veik';

  @override
  String get addRobotIntro =>
      'Veldu vélmenni hér að neðan til að para. Sérhver nærliggjandi vélmenni í pörunarham verða sjálfkrafa uppgötvað efst.';

  @override
  String get autoDiscoveredRobot => 'SJÁLFVIRK UPPFÖNDUÐ VÆLJAN';

  @override
  String get autoDiscoveredRobots => 'SJÁLFVIÐ UPPFÖNDUÐAR VELMENUR';

  @override
  String readyCountBadge(Object count) {
    return '$count TILBÚIN';
  }

  @override
  String get supportedRobots => 'STUÐÐIR VÉLMENNUR';

  @override
  String get clothesFoldingRobot => 'Föt Folding Robot';

  @override
  String get fabricaDescription =>
      'Sjálfvirk fatamappa með forstillingum á mörgum flíkum og snertilegri aðgerð með einum hnappi.';

  @override
  String get fabricaPairingHint =>
      'Pörunarstilling: Haltu inni hvaða hnappi sem er á Fabrica stjórnborðinu í 3 sekúndur (Status LED blikkar hratt).';

  @override
  String get pairFabricaNow => 'PARAÐU DÚK NÚNA';

  @override
  String get backToHome => 'Aftur heim';

  @override
  String get connReady => 'TILBÚIN';

  @override
  String get connConnecting => 'TENGIR';

  @override
  String get connDiscovering => 'AÐ UPPGREIÐA';

  @override
  String get connBonding => 'BENDING';

  @override
  String get connScanning => 'SKANNA';

  @override
  String get connDisconnected => 'AFTENGUR';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Aftengjast $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Þú getur tengst aftur hvenær sem er af heimaskjánum.';

  @override
  String get cancelButton => 'HÆTTA við';

  @override
  String get saveButton => 'SPARA';

  @override
  String get customNickname => 'Sérsniðið gælunafn';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Afpörun $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Þetta mun fjarlægja $name úr Your Robots á þessum síma. Þú getur bætt því við aftur hvenær sem er.\n\nAthugið: Til að þurrka algjörlega af minni vélmenna og endurheimta sjálfgefið verksmiðju, notaðu „Factory Reset“.';
  }

  @override
  String get unpairButton => 'AFSLÁTA';

  @override
  String get machineIdle => 'AÐGERÐ';

  @override
  String get machineRunning => 'HLAUPUR';

  @override
  String get machineEstop => 'E-STOPP';

  @override
  String get machineError => 'VILLA';

  @override
  String get machineCalibrating => 'KVARÐIÐ';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'VISTAÐ';

  @override
  String get ledInputErr => 'INNSLAGSVILLA';

  @override
  String get ledPairing => 'PÖRUN';

  @override
  String get ledConnected => 'TENGST';

  @override
  String get ledIdentify => 'ÞEKKJA';

  @override
  String get identifyButton => 'ÞEKKJA';

  @override
  String get identifyingToast => 'Blikkandi LED vélmenni í 3 sekúndur...';

  @override
  String get homingToast => 'Heima alla flaps...';

  @override
  String get i2cFault => 'I2C BILLING';

  @override
  String get storageFault => 'GEYMSLUNNI';

  @override
  String get estopLatched => 'E-STOP LÆST';

  @override
  String get presetButtonsTitle => 'FORSETI HNAPPAR';

  @override
  String customizePresetTitle(Object label) {
    return 'Sérsníða $label';
  }

  @override
  String get subtitleNameLabel => 'Nafn texta';

  @override
  String get subtitleNameHint => 't.d. Fljótlegt brot, skyrtur, sérsniðin...';

  @override
  String get buttonColorLabel => 'Litur hnappa';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Skref $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'NEYÐARSTÖÐ';

  @override
  String get clearEstop => 'HREINA & AFLEGA NÁTTSTÖÐU';

  @override
  String get clearEstopHint =>
      'Núllstillir neyðarstöðvun og setur vélmenni aftur í Idle';

  @override
  String get stopButton => 'HÆTTU';

  @override
  String get fabricaArrangementTitle => 'FABRÍKAFYRIRKOMULAG';

  @override
  String get editArrangement => 'Breyta fyrirkomulagi';

  @override
  String get addPanel => 'BÆTTA VIÐ PÁLI';

  @override
  String get legendMotorized => 'Vélknúinn';

  @override
  String get legendFollower => 'Fylgismaður';

  @override
  String get legendBase => 'Grunnur';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Raðir';

  @override
  String stepSelectedHint(Object step) {
    return 'Skref $step valið: Pikkaðu á 1–2 vélknúin spjöld á ristinni';
  }

  @override
  String get tapPanelsHint => 'Bankaðu á 1–2 mótorspjöld á rist';

  @override
  String get dualBadge => 'TVÖFULLT';

  @override
  String get requiresMotorizedPanel =>
      'Þarf að minnsta kosti 1 vélknúið spjald (hámark 2)';

  @override
  String get selectedChangePanelsHint =>
      'Valið • Ýttu á töfluspjöld til að breyta (hámark 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Skref $step af $total';
  }

  @override
  String get removeStepTooltip => 'Fjarlægðu skref';

  @override
  String get requiresMotorizedModuleWarning =>
      'Venjulega þarf að minnsta kosti eina vélknúna einingu frá Fabrica Arrangement.';

  @override
  String get routineFull => 'RÚTÍNA FULLT (16/16 SKREF)';

  @override
  String addStepCount(Object count) {
    return 'BÆTA SKREF VIÐ ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Vista rútínu í vélmenni';

  @override
  String get selectButtonToProgram =>
      'Veldu líkamlegan vélmennahnapp til að forrita með þessari venju:';

  @override
  String buttonNumber(Object slot) {
    return 'Hnappur $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Vélbúnaðarhnappur $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Hnappur $slot Texti (valfrjálst)';
  }

  @override
  String get saveToRobotButton => 'VISTA Í VÆLJÓT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Hnappur $slot ($count skref)';
  }

  @override
  String get adultTshirtTemplate =>
      'Sniðmát fyrir stuttermabol fyrir fullorðna';

  @override
  String get longSleeveTemplate => 'Sniðmát með löngum ermum';

  @override
  String get dualSweepTemplate => 'Tvöfalt sópa sniðmát';

  @override
  String channelNumber(Object number) {
    return 'Rás $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PÖRÐ';
  }

  @override
  String get moreHardwareOptions => 'Fleiri vélbúnaðarvalkostir';

  @override
  String get loadTemplate => 'Hlaða sniðmát';

  @override
  String get controllerLabel => 'STJÓRNANDI';

  @override
  String get motorBadge => 'MÓTOR';

  @override
  String get followerBadge => 'Fylgismaður';

  @override
  String get baseBadge => 'BASE';

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
