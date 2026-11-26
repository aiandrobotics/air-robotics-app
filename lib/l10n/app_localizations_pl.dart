// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get appLanguageTitle => 'Język aplikacji';

  @override
  String get appVersionTitle => 'Wersja aplikacji';

  @override
  String get languageSectionTitle => 'Język';

  @override
  String get languageSystemDefault => 'Domyślny systemowy (język urządzenia)';

  @override
  String get selectLanguageHint => 'Wybierz język';

  @override
  String get addDeviceTitle => 'DODAJ NOWEGO ROBOTA';

  @override
  String get addDeviceSubtitle => 'Połącz roboty AIR';

  @override
  String get yourRobots => 'TWOJE ROBOTY';

  @override
  String get discoveredRobots => 'WYKRYTE ROBOTY';

  @override
  String get noRobotsPairedYet => 'Nie sparowano jeszcze żadnych robotów';

  @override
  String get noRobotsPairedSubtitle =>
      'Podłącz robota, aby przeglądać dane telemetryczne, zarządzać ustawieniami wstępnymi i kontrolować operacje.';

  @override
  String get addYourFirstRobot => 'DODAJ SWOJEGO PIERWSZEGO ROBOTA';

  @override
  String get autoScanning => 'AUTOSKANOWANIE';

  @override
  String get idleStatus => 'BEZCZYNNOŚĆ';

  @override
  String get tabControl => 'Kontrola';

  @override
  String get tabSequencer => 'Sekwencer';

  @override
  String get tabCalibrator => 'Kalibrator';

  @override
  String get tabDiagnostics => 'Diagnostyka';

  @override
  String get renameRobot => 'Zmień nazwę robota';

  @override
  String get bleDiagnostics => 'Diagnostyka BLE';

  @override
  String get erasePresets => 'Usuń zapisane ustawienia wstępne';

  @override
  String get disconnect => 'Rozłącz';

  @override
  String get unpairRobot => 'Usuń sparowanie robota';

  @override
  String get factoryReset => 'Reset do ustawień fabrycznych';

  @override
  String get servoManualJog => 'SERWO RĘCZNE JOG';

  @override
  String get homeAll => 'DOM WSZYSTKO';

  @override
  String get foldingTimeline => 'SKŁADANA Oś czasu';

  @override
  String get addStep => 'DODAJ KROK';

  @override
  String get previewOnRobot => 'PODGLĄD NA ROBOCIE';

  @override
  String get saveToButton => 'ZAPISZ DO PRZYCISKU';

  @override
  String get themeTitle => 'Temat';

  @override
  String get themeSystem => 'Urządzenie';

  @override
  String get themeLight => 'Światło';

  @override
  String get themeDark => 'Ciemny';

  @override
  String get connectedBadge => 'POŁĄCZONE';

  @override
  String get inRangeBadge => 'W ZAKRESIE';

  @override
  String get offlineBadge => 'W trybie offline';

  @override
  String get openButton => 'OTWARTE';

  @override
  String get connectButton => 'POŁĄCZ';

  @override
  String get reconnectButton => 'POŁĄCZ PONOWNIE';

  @override
  String get pairAndConnect => 'SPARUJ I POŁĄCZ';

  @override
  String get autoScanningForRobots =>
      'Automatyczne skanowanie w poszukiwaniu robotów...';

  @override
  String get scanningIdle => 'Skanowanie bezczynne';

  @override
  String get nearbyRobotsAppear =>
      'Pobliskie roboty pojawią się tutaj automatycznie.';

  @override
  String get yourNearbyRobotsAppear =>
      'Twoje pobliskie roboty pojawią się tutaj automatycznie.';

  @override
  String get signalStrong => 'Silny';

  @override
  String get signalGood => 'Dobrze';

  @override
  String get signalWeak => 'Słaby';

  @override
  String get addRobotIntro =>
      'Wybierz robota poniżej do sparowania. Każdy pobliski robot w trybie parowania zostanie automatycznie wykryty na górze.';

  @override
  String get autoDiscoveredRobot => 'AUTOMATYCZNIE ODKRYTY ROBOT';

  @override
  String get autoDiscoveredRobots => 'AUTOMATYCZNIE ODKRYTE ROBOTY';

  @override
  String readyCountBadge(Object count) {
    return '$count GOTOWE';
  }

  @override
  String get supportedRobots => 'WSPIERANE ROBOTY';

  @override
  String get clothesFoldingRobot => 'Robot do składania ubrań';

  @override
  String get fabricaDescription =>
      'Automatyczna teczka odzieży z gotowymi ustawieniami wielu odzieży i dotykową obsługą za pomocą jednego przycisku.';

  @override
  String get fabricaPairingHint =>
      'Tryb parowania: Naciśnij i przytrzymaj dowolny przycisk na panelu sterowania Fabrica przez 3 sekundy (dioda LED stanu będzie szybko migać).';

  @override
  String get pairFabricaNow => 'SPARUJ TKANINĘ TERAZ';

  @override
  String get backToHome => 'Powrót do domu';

  @override
  String get connReady => 'GOTOWE';

  @override
  String get connConnecting => 'ŁĄCZENIE';

  @override
  String get connDiscovering => 'ODKRYWANIE';

  @override
  String get connBonding => 'WIĄZANIE';

  @override
  String get connScanning => 'SKANOWANIE';

  @override
  String get connDisconnected => 'ODŁĄCZONY';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Rozłączyć się z $name?';
  }

  @override
  String get disconnectConfirmBody =>
      'Możesz ponownie połączyć się w dowolnym momencie z poziomu ekranu głównego.';

  @override
  String get cancelButton => 'ANULUJ';

  @override
  String get saveButton => 'ZAPISZ';

  @override
  String get customNickname => 'Niestandardowy pseudonim';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Rozparować $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Spowoduje to usunięcie $name z Twoich robotów na tym telefonie. Możesz dodać go ponownie w dowolnym momencie.\n\nUwaga: Aby całkowicie wyczyścić pamięć robota i przywrócić ustawienia fabryczne, użyj „Resetu do ustawień fabrycznych”.';
  }

  @override
  String get unpairButton => 'ROZPARUJ';

  @override
  String get machineIdle => 'BEZCZYNNOŚĆ';

  @override
  String get machineRunning => 'BIEGANIE';

  @override
  String get machineEstop => 'ZATRZYMANIE EW';

  @override
  String get machineError => 'BŁĄD';

  @override
  String get machineCalibrating => 'KALIBRACJA';

  @override
  String ledLabel(Object state) {
    return 'Dioda: $state';
  }

  @override
  String get ledSaved => 'ZAPISANE';

  @override
  String get ledInputErr => 'BŁĄD WEJŚCIA';

  @override
  String get ledPairing => 'PAROWANIE';

  @override
  String get ledConnected => 'POŁĄCZONE';

  @override
  String get ledIdentify => 'IDENTYFIKOWAĆ';

  @override
  String get identifyButton => 'IDENTYFIKOWAĆ';

  @override
  String get identifyingToast => 'Miga dioda LED robota przez 3 sekundy...';

  @override
  String get homingToast => 'Ustawianie wszystkich klap...';

  @override
  String get i2cFault => 'AWARIA I2C';

  @override
  String get storageFault => 'BŁĄD PRZECHOWYWANIA';

  @override
  String get estopLatched => 'ZATRZYMANY E-STOP';

  @override
  String get presetButtonsTitle => 'PRZYCISKI USTAWIEŃ';

  @override
  String customizePresetTitle(Object label) {
    return 'Dostosuj $label';
  }

  @override
  String get subtitleNameLabel => 'Nazwa napisów';

  @override
  String get subtitleNameHint =>
      'np. Szybkie składanie, koszule, niestandardowe...';

  @override
  String get buttonColorLabel => 'Kolor przycisku';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Krok $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'ZATRZYMANIE AWARYJNE';

  @override
  String get clearEstop => 'WYCZYŚĆ I ODBLOKOWAĆ ZATRZYMACZ E-STOP';

  @override
  String get clearEstopHint =>
      'Resetuje zatrzymanie awaryjne i przywraca robota do stanu bezczynności';

  @override
  String get stopButton => 'ZATRZYMAJ się';

  @override
  String get fabricaArrangementTitle => 'UKŁAD TKANINY';

  @override
  String get editArrangement => 'EDYTUJ UKŁAD';

  @override
  String get addPanel => 'DODAJ PANEL';

  @override
  String get legendMotorized => 'Zmotoryzowany';

  @override
  String get legendFollower => 'Obserwujący';

  @override
  String get legendBase => 'Baza';

  @override
  String get colsLabel => 'Kol';

  @override
  String get rowsLabel => 'Rzędy';

  @override
  String stepSelectedHint(Object step) {
    return 'Wybrano krok $step: Naciśnij 1–2 panele zmotoryzowane na siatce';
  }

  @override
  String get tapPanelsHint => 'Dotknij 1–2 paneli silnika na siatce';

  @override
  String get dualBadge => 'PODWÓJNY';

  @override
  String get requiresMotorizedPanel =>
      'Wymaga co najmniej 1 panelu zmotoryzowanego (maks. 2)';

  @override
  String get selectedChangePanelsHint =>
      'Wybrane • Dotknij paneli siatki, aby zmienić (maks. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Krok $step z $total';
  }

  @override
  String get removeStepTooltip => 'Usuń krok';

  @override
  String get requiresMotorizedModuleWarning =>
      'Rutyna wymaga co najmniej jednego modułu zmotoryzowanego firmy Fabrica Arrangement.';

  @override
  String get routineFull => 'RUTYNA PEŁNA (16/16 KROKÓW)';

  @override
  String addStepCount(Object count) {
    return 'DODAJ KROK ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Zapisz procedurę w robocie';

  @override
  String get selectButtonToProgram =>
      'Wybierz fizyczny przycisk robota, który chcesz zaprogramować za pomocą tej procedury:';

  @override
  String buttonNumber(Object slot) {
    return 'Przycisk $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Przycisk sprzętowy $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Przycisk $slot Napisy (opcjonalnie)';
  }

  @override
  String get saveToRobotButton => 'ZAPISZ W ROBOCIE';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Przycisk $slot ($count kroków)';
  }

  @override
  String get adultTshirtTemplate => 'Szablon koszulki dla dorosłych';

  @override
  String get longSleeveTemplate => 'Szablon z długim rękawem';

  @override
  String get dualSweepTemplate => 'Szablon podwójnego przeciągnięcia';

  @override
  String channelNumber(Object number) {
    return 'Kanał $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PAROWANE';
  }

  @override
  String get moreHardwareOptions => 'Więcej opcji sprzętowych';

  @override
  String get loadTemplate => 'Załaduj szablon';

  @override
  String get controllerLabel => 'KONTROLER';

  @override
  String get motorBadge => 'SILNIK';

  @override
  String get followerBadge => 'ZWOLNIK';

  @override
  String get baseBadge => 'PODSTAWA';

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
