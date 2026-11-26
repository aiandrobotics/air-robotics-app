// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Armenian (`hy`).
class AppLocalizationsHy extends AppLocalizations {
  AppLocalizationsHy([String locale = 'hy']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Կարգավորումներ';

  @override
  String get appLanguageTitle => 'Հավելվածի լեզուն';

  @override
  String get appVersionTitle => 'Հավելվածի տարբերակը';

  @override
  String get languageSectionTitle => 'Լեզու';

  @override
  String get languageSystemDefault => 'Համակարգի լռելյայն (սարքի լեզու)';

  @override
  String get selectLanguageHint => 'Ընտրեք լեզու';

  @override
  String get addDeviceTitle => 'ԱՎԵԼԱՑՆԵԼ ՆՈՐ ՌՈԲՈՏ';

  @override
  String get addDeviceSubtitle => 'Զուգավորել AIR ռոբոտները';

  @override
  String get yourRobots => 'ՔՈ ՌՈԲՈՏՆԵՐԸ';

  @override
  String get discoveredRobots => 'ԳՏՆՎԱԾ ՌՈԲՈՏՆԵՐ';

  @override
  String get noRobotsPairedYet => 'Դեռևս ռոբոտներ չկան';

  @override
  String get noRobotsPairedSubtitle =>
      'Միացրեք ձեր ռոբոտը՝ հեռաչափությունը դիտելու, նախադրյալները կառավարելու և գործողությունները կառավարելու համար:';

  @override
  String get addYourFirstRobot => 'ԱՎԵԼԱՑՐԵՔ ՁԵՐ ԱՌԱՋԻՆ ՌՈԲՈՏԸ';

  @override
  String get autoScanning => 'ԱՎՏՈՍԿԱՆՈՒՄ';

  @override
  String get idleStatus => 'ՊԱՐԶ';

  @override
  String get tabControl => 'Վերահսկողություն';

  @override
  String get tabSequencer => 'Հաջորդականացնող';

  @override
  String get tabCalibrator => 'Կալիբրատոր';

  @override
  String get tabDiagnostics => 'Ախտորոշում';

  @override
  String get renameRobot => 'Վերանվանել ռոբոտը';

  @override
  String get bleDiagnostics => 'BLE ախտորոշում';

  @override
  String get erasePresets => 'Ջնջել պահպանված նախադրյալները';

  @override
  String get disconnect => 'Անջատել';

  @override
  String get unpairRobot => 'Անջատել ռոբոտը';

  @override
  String get factoryReset => 'Գործարանային վերակայում';

  @override
  String get servoManualJog => 'ՍԵՐՎՈ ՁԵՌՆԱՐԿ ՋՈԳ';

  @override
  String get homeAll => 'ՏՈՒՆ ԲՈԼՈՐ';

  @override
  String get foldingTimeline => 'Ծալովի ԺԱՄԱՆԱԿԱԳԻՐ';

  @override
  String get addStep => 'ԱՎԵԼԱՑՆԵԼ ՔԱՅԼ';

  @override
  String get previewOnRobot => 'ՆԱԽԱԴԻՏՈՒՄ ՌՈԲՈՏՈՒՄ';

  @override
  String get saveToButton => 'ՊԱՀՊԱՆԵԼ ԿՈՂՋՈՒՄ';

  @override
  String get themeTitle => 'Թեմա';

  @override
  String get themeSystem => 'Սարք';

  @override
  String get themeLight => 'Լույս';

  @override
  String get themeDark => 'Մութ';

  @override
  String get connectedBadge => 'ԿԱՊՎԱԾ Է';

  @override
  String get inRangeBadge => 'ՇՐՋԱՆԱԿՈՒՄ';

  @override
  String get offlineBadge => 'ՕՖԼԱՅՆ';

  @override
  String get openButton => 'ԲԱՑ';

  @override
  String get connectButton => 'ՄԻԱՑՆԵԼ';

  @override
  String get reconnectButton => 'ՎԵՐԱՄԻՑԵԼ';

  @override
  String get pairAndConnect => 'ԶՈՒՅԳԵԼ ԵՎ ՄԻԱՑԵԼ';

  @override
  String get autoScanningForRobots => 'Ավտոմատ սկանավորում ռոբոտների համար...';

  @override
  String get scanningIdle => 'Սկանավորումն անգործուն է';

  @override
  String get nearbyRobotsAppear =>
      'Մոտակա ռոբոտները կհայտնվեն այստեղ ավտոմատ կերպով:';

  @override
  String get yourNearbyRobotsAppear =>
      'Ձեր մոտակայքում գտնվող ռոբոտները ավտոմատ կերպով կհայտնվեն այստեղ:';

  @override
  String get signalStrong => 'Ուժեղ';

  @override
  String get signalGood => 'Լավ';

  @override
  String get signalWeak => 'Թույլ';

  @override
  String get addRobotIntro =>
      'Զուգավորելու համար ստորև ընտրեք ռոբոտ: Ցանկացած մոտակա ռոբոտ, որը գտնվում է զուգակցման ռեժիմում, ավտոմատ կերպով կհայտնաբերվի վերևում:';

  @override
  String get autoDiscoveredRobot => 'ԱՎՏՈ ՀԱՅՏՆԱԲԵՐՎԵԼ Է ՌՈԲՈՏ';

  @override
  String get autoDiscoveredRobots => 'ԱՎՏՈ ԳՏՆՎԱԾ ՌՈԲՈՏՆԵՐ';

  @override
  String readyCountBadge(Object count) {
    return '$count ՊԱՏՐԱՍՏ';
  }

  @override
  String get supportedRobots => 'ԱՋԱԿՑվող ՌՈԲՈՏՆԵՐ';

  @override
  String get clothesFoldingRobot => 'Հագուստի ծալովի ռոբոտ';

  @override
  String get fabricaDescription =>
      'Հագուստի ավտոմատացված թղթապանակ մի քանի հագուստի նախադրյալներով և շոշափելի մեկ կոճակով:';

  @override
  String get fabricaPairingHint =>
      'Զուգակցման ռեժիմ. Սեղմեք և պահեք Fabrica-ի կառավարման վահանակի ցանկացած կոճակ 3 վայրկյան (կարգավիճակի լուսադիոդը արագ թարթելու է):';

  @override
  String get pairFabricaNow => 'ԶՈՒՅԳ ԿԱՏԱՐԵՔ ՀԻՄԱ';

  @override
  String get backToHome => 'Վերադարձ դեպի տուն';

  @override
  String get connReady => 'ՊԱՏՐԱՍՏ';

  @override
  String get connConnecting => 'ՄԻԱՑՈՒՄ';

  @override
  String get connDiscovering => 'ԲԱՑԱՀԱՅՏՈՒՄ';

  @override
  String get connBonding => 'ԿԱՊԱԿՑՈՒՄ';

  @override
  String get connScanning => 'ՍԿԱՆՈՒՄ';

  @override
  String get connDisconnected => 'ԱՆՋԱՏՎԱԾ';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Անջատե՞լ $name-ից:';
  }

  @override
  String get disconnectConfirmBody =>
      'Դուք ցանկացած ժամանակ կարող եք նորից միանալ հիմնական էկրանից:';

  @override
  String get cancelButton => 'ՉԵՂԱՐԿԵԼ';

  @override
  String get saveButton => 'ՊԱՀՊԱՆԵԼ';

  @override
  String get customNickname => 'Պատվերով մականուն';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Չեղարկե՞լ $name-ը:';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Սա կհեռացնի $name-ն այս հեռախոսի Ձեր ռոբոտներից: Դուք կարող եք նորից ավելացնել այն ցանկացած ժամանակ:\n\nՆշում. Ռոբոտի հիշողությունն ամբողջությամբ ջնջելու և գործարանային կարգավորումները վերականգնելու համար օգտագործեք «Factory Reset»:';
  }

  @override
  String get unpairButton => 'ՉԶՈՒՅԳԱՑՎԵԼ';

  @override
  String get machineIdle => 'ՊԱՐԶ';

  @override
  String get machineRunning => 'ՎԱԶՈՒՄ';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'ՍԽԱԼ';

  @override
  String get machineCalibrating => 'ԿԱԼԻԲՐԱՑՈՒՄ';

  @override
  String ledLabel(Object state) {
    return 'LED՝ $state';
  }

  @override
  String get ledSaved => 'ՊԱՀՎԱԾ Է';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'ԶՈՒՅԳ';

  @override
  String get ledConnected => 'ԿԱՊՎԱԾ Է';

  @override
  String get ledIdentify => 'ՆՈՒՅՆԱՑՆԵԼ';

  @override
  String get identifyButton => 'ՆՈՒՅՆԱՑՆԵԼ';

  @override
  String get identifyingToast => 'Թարթում է ռոբոտի լուսադիոդը 3 վայրկյան...';

  @override
  String get homingToast => 'Բոլոր կափույրների տեղափոխում...';

  @override
  String get i2cFault => 'I2C սխալ';

  @override
  String get storageFault => 'ՊԱՀՊԱՆՄԱՆ անսարքություն';

  @override
  String get estopLatched => 'E-STOP LACHED';

  @override
  String get presetButtonsTitle => 'Նախադրված կոճակներ';

  @override
  String customizePresetTitle(Object label) {
    return 'Անհատականացնել $label';
  }

  @override
  String get subtitleNameLabel => 'Ենթավերնագիր Անուն';

  @override
  String get subtitleNameHint => 'օր. Արագ ծալում, վերնաշապիկներ, անհատական...';

  @override
  String get buttonColorLabel => 'Կոճակի գույնը';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Քայլ $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'ՇՏԱՊ ԿԱՆԳՆԱՑՈՒՄ';

  @override
  String get clearEstop => 'ՄԱՔՐ ԵՎ ԱԶԱՏԵՔ E-STOP-ը';

  @override
  String get clearEstopHint =>
      'Վերակայում է վթարային կանգառը և ռոբոտին վերադարձնում է անգործուն ռեժիմ';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'ՖԱԲՐԻԿԱ ԿԱԶՄԱԿԵՐՊՈՒՄ';

  @override
  String get editArrangement => 'ԽՄԲԱԳՐԵԼ ԿԱԶՄԱԿԵՐՊՈՒԹՅՈՒՆԸ';

  @override
  String get addPanel => 'ԱՎԵԼԱՑՆԵԼ ՎԱՂԱՆԱԿ';

  @override
  String get legendMotorized => 'Շարժիչային';

  @override
  String get legendFollower => 'Հետևորդ';

  @override
  String get legendBase => 'Հիմք';

  @override
  String get colsLabel => 'գնդ';

  @override
  String get rowsLabel => 'Շարքեր';

  @override
  String stepSelectedHint(Object step) {
    return 'Ընտրված է $step քայլը. Ցանցի վրա հպեք 1–2 շարժիչային վահանակներին';
  }

  @override
  String get tapPanelsHint => 'Ցանցի վրա հպեք 1–2 շարժիչի վահանակին';

  @override
  String get dualBadge => 'ԵՐԿԵԿԱՆ';

  @override
  String get requiresMotorizedPanel =>
      'Պահանջվում է առնվազն 1 շարժիչային վահանակ (առավելագույնը 2)';

  @override
  String get selectedChangePanelsHint =>
      'Ընտրված է • Հպեք ցանցի վահանակներին՝ փոխելու համար (առավելագույնը 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Քայլ $step $total-ից';
  }

  @override
  String get removeStepTooltip => 'Հեռացնել քայլը';

  @override
  String get requiresMotorizedModuleWarning =>
      'Առօրյան պահանջում է Fabrica Arrangement-ից առնվազն մեկ շարժիչային մոդուլ:';

  @override
  String get routineFull => 'ՌՈՒՏԻՆԱ ԼԻՎ (16/16 ՔԱՅԼ)';

  @override
  String addStepCount(Object count) {
    return 'ԱՎԵԼԱՑՆԵԼ ՔԱՅԼ ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Պահպանեք ռեժիմը ռոբոտում';

  @override
  String get selectButtonToProgram =>
      'Ընտրեք ֆիզիկական ռոբոտի կոճակ՝ այս ռեժիմով ծրագրավորելու համար.';

  @override
  String buttonNumber(Object slot) {
    return 'Կոճակ $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Սարքավորման կոճակ $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Կոճակ $slot Ենթագրեր (ըստ ցանկության)';
  }

  @override
  String get saveToRobotButton => 'ՊԱՀԵԼ ՌՈԲՈՏՈՒՄ';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Կոճակ $slot ($count քայլ)';
  }

  @override
  String get adultTshirtTemplate => 'Մեծահասակների շապիկի ձևանմուշ';

  @override
  String get longSleeveTemplate => 'Երկար թեւ կաղապար';

  @override
  String get dualSweepTemplate => 'Կրկնակի մաքրման ձևանմուշ';

  @override
  String channelNumber(Object number) {
    return 'Ալիք $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count ԶՈՒՅԳ';
  }

  @override
  String get moreHardwareOptions => 'Սարքավորման ավելի շատ տարբերակներ';

  @override
  String get loadTemplate => 'Բեռնել ձևանմուշը';

  @override
  String get controllerLabel => 'ԿԱՐԳԱՎՈՐՈՂ';

  @override
  String get motorBadge => 'ՄՈՏՈՐ';

  @override
  String get followerBadge => 'ՀԵՏԵՎՈՐԴ';

  @override
  String get baseBadge => 'ՀԻՄԱՆ';

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
