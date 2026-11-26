// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Nustatymai';

  @override
  String get appLanguageTitle => 'Programos kalba';

  @override
  String get appVersionTitle => 'Programos versija';

  @override
  String get languageSectionTitle => 'Kalba';

  @override
  String get languageSystemDefault => 'Sistemos numatytoji (įrenginio kalba)';

  @override
  String get selectLanguageHint => 'Pasirinkite kalbą';

  @override
  String get addDeviceTitle => 'PRIDĖTI NAUJĄ ROBOTĄ';

  @override
  String get addDeviceSubtitle => 'Suporuokite AIR robotus';

  @override
  String get yourRobots => 'JŪSŲ ROBOTAI';

  @override
  String get discoveredRobots => 'ATRASTI ROBOTAI';

  @override
  String get noRobotsPairedYet => 'Dar nėra suporuotų robotų';

  @override
  String get noRobotsPairedSubtitle =>
      'Prijunkite savo robotą, kad galėtumėte peržiūrėti telemetriją, valdyti išankstinius nustatymus ir valdyti operacijas.';

  @override
  String get addYourFirstRobot => 'PRIDĖKITE SAVO PIRMĄJĄ ROBOTĄ';

  @override
  String get autoScanning => 'AUTOMATINIS NUSKAITYMAS';

  @override
  String get idleStatus => 'TUŠTINGA';

  @override
  String get tabControl => 'Kontrolė';

  @override
  String get tabSequencer => 'Sekvencinis';

  @override
  String get tabCalibrator => 'Kalibratorius';

  @override
  String get tabDiagnostics => 'Diagnostika';

  @override
  String get renameRobot => 'Pervardykite robotą';

  @override
  String get bleDiagnostics => 'BLE diagnostika';

  @override
  String get erasePresets => 'Ištrinkite išsaugotus išankstinius nustatymus';

  @override
  String get disconnect => 'Atsijungti';

  @override
  String get unpairRobot => 'Atsieti robotą';

  @override
  String get factoryReset => 'Atstatyti gamyklinius nustatymus';

  @override
  String get servoManualJog => 'SERVO MANUAL BĖGIMAS';

  @override
  String get homeAll => 'NAMAI VISI';

  @override
  String get foldingTimeline => 'SULANKSTAMAS LAIKAS';

  @override
  String get addStep => 'PRIDĖTI STEP';

  @override
  String get previewOnRobot => 'PERŽIŪRA ROBOTE';

  @override
  String get saveToButton => 'MYGTUKAS IŠSAUGOTI';

  @override
  String get themeTitle => 'tema';

  @override
  String get themeSystem => 'Įrenginys';

  @override
  String get themeLight => 'Šviesa';

  @override
  String get themeDark => 'Tamsus';

  @override
  String get connectedBadge => 'PRISIJUNGTA';

  @override
  String get inRangeBadge => 'RANGE';

  @override
  String get offlineBadge => 'PRISIJUNGTI';

  @override
  String get openButton => 'ATIDARYTI';

  @override
  String get connectButton => 'PRISIJUNGTI';

  @override
  String get reconnectButton => 'PRISIJUNGTI';

  @override
  String get pairAndConnect => 'SUSIRUOTI IR PRIJUNGTI';

  @override
  String get autoScanningForRobots => 'Automatinis robotų nuskaitymas...';

  @override
  String get scanningIdle => 'Nuskaitymas tuščiąja eiga';

  @override
  String get nearbyRobotsAppear =>
      'Netoliese esantys robotai čia pasirodys automatiškai.';

  @override
  String get yourNearbyRobotsAppear =>
      'Čia automatiškai pasirodys netoliese esantys robotai.';

  @override
  String get signalStrong => 'Stiprus';

  @override
  String get signalGood => 'Gerai';

  @override
  String get signalWeak => 'Silpnas';

  @override
  String get addRobotIntro =>
      'Toliau pasirinkite robotą, kurį norite susieti. Bet kuris netoliese esantis robotas, veikiantis poravimo režimu, bus automatiškai aptiktas viršuje.';

  @override
  String get autoDiscoveredRobot => 'AUTOMATINIS ATRASTAS ROBOTAS';

  @override
  String get autoDiscoveredRobots => 'AUTOMATINIAI ATRASTI ROBOTAI';

  @override
  String readyCountBadge(Object count) {
    return '$count PASIRENGTAS';
  }

  @override
  String get supportedRobots => 'PARAMOS ROBOTAI';

  @override
  String get clothesFoldingRobot => 'Drabužių lankstymo robotas';

  @override
  String get fabricaDescription =>
      'Automatizuotas drabužių aplankas su kelių drabužių išankstiniais nustatymais ir liečiamu vieno mygtuko valdymu.';

  @override
  String get fabricaPairingHint =>
      'Susiejimo režimas: paspauskite ir 3 sekundes palaikykite bet kurį mygtuką Fabrica valdymo skydelyje (būsenos šviesos diodas greitai mirksės).';

  @override
  String get pairFabricaNow => 'SUporuokite AUDINIUS DABAR';

  @override
  String get backToHome => 'Grįžti į pagrindinį puslapį';

  @override
  String get connReady => 'PASIRUOŠTA';

  @override
  String get connConnecting => 'JUNGIAMAS';

  @override
  String get connDiscovering => 'ATRADAMAS';

  @override
  String get connBonding => 'KLIJAVIMAS';

  @override
  String get connScanning => 'SKAENAVIMAS';

  @override
  String get connDisconnected => 'ATJUNGTA';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Atsijungti nuo $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Galite bet kada iš naujo prisijungti iš pagrindinio ekrano.';

  @override
  String get cancelButton => 'ATŠAUKTI';

  @override
  String get saveButton => 'IŠSAUGOTI';

  @override
  String get customNickname => 'Pasirinktinis slapyvardis';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Atsieti $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Tai pašalins $name iš jūsų robotų šiame telefone. Galite bet kada jį pridėti iš naujo.\n\nPastaba: Norėdami visiškai išvalyti roboto atmintį ir atkurti gamyklinius numatytuosius nustatymus, naudokite „Gamyklinių parametrų atkūrimas“.';
  }

  @override
  String get unpairButton => 'ATSIJUNGTI';

  @override
  String get machineIdle => 'TUŠTINGA';

  @override
  String get machineRunning => 'BĖGANTIS';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'KLAIDA';

  @override
  String get machineCalibrating => 'KALIBRAVIMAS';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'IŠSAUGOTA';

  @override
  String get ledInputErr => 'Įvesties klaida';

  @override
  String get ledPairing => 'SUSIJUNGIMAS';

  @override
  String get ledConnected => 'PRISIJUNGTA';

  @override
  String get ledIdentify => 'IDENTIFIKUOTI';

  @override
  String get identifyButton => 'IDENTIFIKUOTI';

  @override
  String get identifyingToast => 'Mirksi roboto šviesos diodas 3 sekundes...';

  @override
  String get homingToast => 'Visų atvartų nustatymas...';

  @override
  String get i2cFault => 'I2C GEDIMAS';

  @override
  String get storageFault => 'SAUGOJIMO KLAIDA';

  @override
  String get estopLatched => 'E-STOP UŽSTRAUKTAS';

  @override
  String get presetButtonsTitle => 'IŠANKSTINIAI MYGTUKAI';

  @override
  String customizePresetTitle(Object label) {
    return 'Tinkinti $label';
  }

  @override
  String get subtitleNameLabel => 'Subtitrų pavadinimas';

  @override
  String get subtitleNameHint =>
      'pvz. Greitai sulankstomi, marškiniai, pagal užsakymą...';

  @override
  String get buttonColorLabel => 'Mygtuko spalva';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return '$current/$total veiksmas ($pct%)';
  }

  @override
  String get emergencyStop => 'AVARINIS STOP';

  @override
  String get clearEstop => 'IŠVALYTI IR ATSISAKYTI E-STOP';

  @override
  String get clearEstopHint =>
      'Iš naujo nustato avarinį sustabdymą ir grąžina robotą į tuščiąją eigą';

  @override
  String get stopButton => 'STOP';

  @override
  String get fabricaArrangementTitle => 'AUDINIŲ IŠDĖSTYMAS';

  @override
  String get editArrangement => 'REdaguoti susitarimą';

  @override
  String get addPanel => 'PRIDĖTI SKYDELĮ';

  @override
  String get legendMotorized => 'Motorizuotas';

  @override
  String get legendFollower => 'Sekėjas';

  @override
  String get legendBase => 'Bazė';

  @override
  String get colsLabel => 'plk';

  @override
  String get rowsLabel => 'Eilutės';

  @override
  String stepSelectedHint(Object step) {
    return 'Pasirinktas veiksmas $step: tinklelyje palieskite 1–2 motorizuotus skydelius';
  }

  @override
  String get tapPanelsHint => 'Bakstelėkite 1–2 variklio plokštes į tinklelį';

  @override
  String get dualBadge => 'DUAL';

  @override
  String get requiresMotorizedPanel =>
      'Reikia bent 1 motorizuoto skydelio (daugiausia 2)';

  @override
  String get selectedChangePanelsHint =>
      'Pasirinkta • Palieskite tinklelio plokštes, kad pakeistumėte (maks. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return '$step veiksmas iš $total';
  }

  @override
  String get removeStepTooltip => 'Pašalinti žingsnį';

  @override
  String get requiresMotorizedModuleWarning =>
      'Įprastai veiklai reikalingas bent vienas motorizuotas modulis iš „Fabrica Arrangement“.';

  @override
  String get routineFull => 'RUTINA VISĄ (16/16 ŽINGSNIŲ)';

  @override
  String addStepCount(Object count) {
    return 'PRIDĖTI STEP ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Išsaugokite kasdienybę robote';

  @override
  String get selectButtonToProgram =>
      'Pasirinkite fizinio roboto mygtuką, kurį norite programuoti pagal šią rutiną:';

  @override
  String buttonNumber(Object slot) {
    return 'Mygtukas $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Aparatūros mygtukas $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Mygtukas $slot Subtitrai (pasirenkama)';
  }

  @override
  String get saveToRobotButton => 'IŠSAUGOTI ROBOTE';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Mygtukas $slot ($count žingsniai)';
  }

  @override
  String get adultTshirtTemplate => 'Suaugusiųjų marškinėlių šablonas';

  @override
  String get longSleeveTemplate => 'Šablonas ilgomis rankovėmis';

  @override
  String get dualSweepTemplate => 'Dvigubo šlavimo šablonas';

  @override
  String channelNumber(Object number) {
    return 'Kanalas $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count SUporuotas';
  }

  @override
  String get moreHardwareOptions => 'Daugiau aparatūros parinkčių';

  @override
  String get loadTemplate => 'Įkelti šabloną';

  @override
  String get controllerLabel => 'VALDIKLIS';

  @override
  String get motorBadge => 'VARIKLIS';

  @override
  String get followerBadge => 'SEKĖJAS';

  @override
  String get baseBadge => 'BAZĖ';

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
