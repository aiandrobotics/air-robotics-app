// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get appLanguageTitle => 'Γλώσσα εφαρμογής';

  @override
  String get appVersionTitle => 'Έκδοση εφαρμογής';

  @override
  String get languageSectionTitle => 'Γλώσσα';

  @override
  String get languageSystemDefault => 'Προεπιλογή συστήματος (γλώσσα συσκευής)';

  @override
  String get selectLanguageHint => 'Επιλέξτε γλώσσα';

  @override
  String get addDeviceTitle => 'ΠΡΟΣΘΗΚΗ ΝΕΟΥ ΡΟΜΠΟΤ';

  @override
  String get addDeviceSubtitle => 'Ζεύγος ρομπότ AIR';

  @override
  String get yourRobots => 'ΤΑ ΡΟΜΠΟΤ ΣΑΣ';

  @override
  String get discoveredRobots => 'ΑΝΑΚΑΛΥΨΑΝ ΡΟΜΠΟΤ';

  @override
  String get noRobotsPairedYet => 'Κανένα ρομπότ δεν έχει συζευχθεί ακόμα';

  @override
  String get noRobotsPairedSubtitle =>
      'Συνδέστε το ρομπότ σας για προβολή τηλεμετρίας, διαχείριση προεπιλογών και έλεγχο λειτουργιών.';

  @override
  String get addYourFirstRobot => 'ΠΡΟΣΘΕΣΤΕ ΤΟ ΠΡΩΤΟ ΣΑΣ ΡΟΜΠΟΤ';

  @override
  String get autoScanning => 'ΑΥΤΟΜΑΤΗ ΣΑΡΩΣΗ';

  @override
  String get idleStatus => 'ρελαντί';

  @override
  String get tabControl => 'Έλεγχος';

  @override
  String get tabSequencer => 'Sequencer';

  @override
  String get tabCalibrator => 'Βαθμονομητής';

  @override
  String get tabDiagnostics => 'Διαγνωστικά';

  @override
  String get renameRobot => 'Μετονομασία ρομπότ';

  @override
  String get bleDiagnostics => 'BLE Diagnostics';

  @override
  String get erasePresets => 'Διαγραφή αποθηκευμένων προεπιλογών';

  @override
  String get disconnect => 'Αποσύνδεση';

  @override
  String get unpairRobot => 'Αποσύζευξη ρομπότ';

  @override
  String get factoryReset => 'Επαναφορά εργοστασιακών ρυθμίσεων';

  @override
  String get servoManualJog => 'SERVO MANUAL JOG';

  @override
  String get homeAll => 'ΣΠΙΤΙ ΟΛΟΙ';

  @override
  String get foldingTimeline => 'ΠΤΥΠΛΩΜΕΝΟ ΧΡΟΝΟΛΟΓΙΟ';

  @override
  String get addStep => 'ΠΡΟΣΘΗΚΗ ΒΗΜΑΤΟΣ';

  @override
  String get previewOnRobot => 'ΠΡΟΕΠΙΣΚΟΠΗΣΗ ΣΤΟ ΡΟΜΠΟΤ';

  @override
  String get saveToButton => 'ΑΠΟΘΗΚΕΥΣΗ ΣΤΟ ΚΟΥΜΠΙ';

  @override
  String get themeTitle => 'Θέμα';

  @override
  String get themeSystem => 'Συσκευή';

  @override
  String get themeLight => 'Φως';

  @override
  String get themeDark => 'Σκοτεινό';

  @override
  String get connectedBadge => 'ΣΥΝΔΕΘΗΚΕ';

  @override
  String get inRangeBadge => 'ΣΕ ΕΜΒΕΛΕΙΑ';

  @override
  String get offlineBadge => 'ΕΚΤΟΣ ΣΥΝΔΕΣΗΣ';

  @override
  String get openButton => 'ΑΝΟΙΧΤΟ';

  @override
  String get connectButton => 'ΣΥΝΔΕΣΗ';

  @override
  String get reconnectButton => 'ΕΠΑΝΑΣΥΝΔΕΣΗ';

  @override
  String get pairAndConnect => 'ΣΥΖΕΥΞΗ & ΣΥΝΔΕΣΗ';

  @override
  String get autoScanningForRobots => 'Αυτόματη σάρωση για ρομπότ...';

  @override
  String get scanningIdle => 'Σάρωση σε αδράνεια';

  @override
  String get nearbyRobotsAppear =>
      'Τα κοντινά ρομπότ θα εμφανίζονται εδώ αυτόματα.';

  @override
  String get yourNearbyRobotsAppear =>
      'Τα κοντινά ρομπότ σας θα εμφανιστούν εδώ αυτόματα.';

  @override
  String get signalStrong => 'Δυνατός';

  @override
  String get signalGood => 'Καλό';

  @override
  String get signalWeak => 'Αδύναμος';

  @override
  String get addRobotIntro =>
      'Επιλέξτε ένα ρομπότ παρακάτω για σύζευξη. Οποιοδήποτε κοντινό ρομπότ σε λειτουργία σύζευξης θα ανακαλυφθεί αυτόματα στην κορυφή.';

  @override
  String get autoDiscoveredRobot => 'ΑΥΤΟΜΑΤΟ ΑΝΑΚΑΛΥΨΕ ΡΟΜΠΟΤ';

  @override
  String get autoDiscoveredRobots => 'ΑΥΤΟΜΑΤΑ ΑΝΑΚΑΛΥΨΕ ΡΟΜΠΟΤ';

  @override
  String readyCountBadge(Object count) {
    return '$count ΕΤΟΙΜΟ';
  }

  @override
  String get supportedRobots => 'ΥΠΟΣΤΗΡΙΖΟΝΤΑ ΡΟΜΠΟΤ';

  @override
  String get clothesFoldingRobot => 'Ρομπότ Πτυσσόμενο Ρούχα';

  @override
  String get fabricaDescription =>
      'Αυτοματοποιημένος φάκελος ρούχων με προεπιλογές πολλών ενδυμάτων και απτική λειτουργία με ένα κουμπί.';

  @override
  String get fabricaPairingHint =>
      'Λειτουργία σύζευξης: Πατήστε παρατεταμένα οποιοδήποτε κουμπί στον πίνακα ελέγχου Fabrica για 3 δευτερόλεπτα (το LED κατάστασης θα αναβοσβήνει γρήγορα).';

  @override
  String get pairFabricaNow => 'ΖΕΥΓΑΡΙΣΤΕ ΥΦΑΣΜΑ ΤΩΡΑ';

  @override
  String get backToHome => 'Επιστροφή στο σπίτι';

  @override
  String get connReady => 'ΕΤΟΙΜΟΙ';

  @override
  String get connConnecting => 'ΣΥΝΔΕΣΗ';

  @override
  String get connDiscovering => 'ΑΝΑΚΑΛΥΠΤΩΝΤΑΣ';

  @override
  String get connBonding => 'ΣΥΓΚΟΛΛΗΣΗ';

  @override
  String get connScanning => 'ΣΑΡΩΣΗ';

  @override
  String get connDisconnected => 'ΑΠΟΣΥΝΔΕΣΗ';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Αποσύνδεση από $name;';
  }

  @override
  String get disconnectConfirmBody =>
      'Μπορείτε να συνδεθείτε ξανά ανά πάσα στιγμή από την αρχική οθόνη.';

  @override
  String get cancelButton => 'ΑΚΥΡΩΣΗ';

  @override
  String get saveButton => 'ΑΠΟΘΗΚΕΥΣΗ';

  @override
  String get customNickname => 'Προσαρμοσμένο ψευδώνυμο';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Κατάργηση σύζευξης $name;';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Αυτό θα αφαιρέσει το $name από τα ρομπότ σας σε αυτό το τηλέφωνο. Μπορείτε να το προσθέσετε ξανά ανά πάσα στιγμή.\n\nΣημείωση: Για να διαγράψετε πλήρως τη μνήμη ρομπότ και να επαναφέρετε τις εργοστασιακές προεπιλογές, χρησιμοποιήστε την \"Επαναφορά εργοστασιακών ρυθμίσεων\".';
  }

  @override
  String get unpairButton => 'ΑΠΟΖΕΥΞΗ';

  @override
  String get machineIdle => 'ρελαντί';

  @override
  String get machineRunning => 'ΤΡΕΞΙΜΟ';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'ΣΦΑΛΜΑ';

  @override
  String get machineCalibrating => 'ΒΑΘΜΟΝΟΜΗΣΗ';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'ΑΠΟΘΗΚΕΥΘΗΚΕ';

  @override
  String get ledInputErr => 'INPUT ERR';

  @override
  String get ledPairing => 'PAIRING';

  @override
  String get ledConnected => 'ΣΥΝΔΕΘΗΚΕ';

  @override
  String get ledIdentify => 'ΤΑΥΤΟΠΟΙΗΣΤΕ';

  @override
  String get identifyButton => 'ΤΑΥΤΟΠΟΙΗΣΤΕ';

  @override
  String get identifyingToast =>
      'Αναβοσβήνει το LED ρομπότ για 3 δευτερόλεπτα...';

  @override
  String get homingToast => 'Φιλοξενώντας όλα τα πτερύγια...';

  @override
  String get i2cFault => 'ΒΛΑΒΗ I2C';

  @override
  String get storageFault => 'ΣΦΑΛΜΑ ΑΠΟΘΗΚΕΥΣΗΣ';

  @override
  String get estopLatched => 'E-STOP ΜΑΝΔΑΛΩΜΕΝΟ';

  @override
  String get presetButtonsTitle => 'ΚΟΥΜΠΙΑ ΠΡΟΡΕΤ';

  @override
  String customizePresetTitle(Object label) {
    return 'Προσαρμογή $label';
  }

  @override
  String get subtitleNameLabel => 'Όνομα υπότιτλου';

  @override
  String get subtitleNameHint =>
      'π.χ. Γρήγορη αναδίπλωση, Πουκάμισα, Προσαρμοσμένα...';

  @override
  String get buttonColorLabel => 'Χρώμα κουμπιού';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Βήμα $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'ΕΚΤΑΚΤΗΣ ΣΤΑΣΗ';

  @override
  String get clearEstop => 'CLEAR & UNLTCH E-STOP';

  @override
  String get clearEstopHint =>
      'Επαναφέρει τη διακοπή έκτακτης ανάγκης και επαναφέρει το ρομπότ στην κατάσταση αδράνειας';

  @override
  String get stopButton => 'ΣΤΑΜΑΤΗΣΤΕ';

  @override
  String get fabricaArrangementTitle => 'ΣΥΣΚΕΥΗ ΥΦΑΣΜΑΤΟΣ';

  @override
  String get editArrangement => 'ΕΠΕΞΕΡΓΑΣΙΑ ΡΥΘΜΙΣΗΣ';

  @override
  String get addPanel => 'ΠΡΟΣΘΗΚΗ ΠΙΝΑΚΑΣ';

  @override
  String get legendMotorized => 'Μηχανοκίνητο';

  @override
  String get legendFollower => 'Οπαδός';

  @override
  String get legendBase => 'Βάση';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Σειρές';

  @override
  String stepSelectedHint(Object step) {
    return 'Επιλεγμένο βήμα $step: Πατήστε 1–2 Μηχανοκίνητα πάνελ στο πλέγμα';
  }

  @override
  String get tapPanelsHint => 'Πατήστε 1–2 πάνελ κινητήρα στο πλέγμα';

  @override
  String get dualBadge => 'ΔΙΠΛΟ';

  @override
  String get requiresMotorizedPanel =>
      'Απαιτεί τουλάχιστον 1 μηχανοκίνητο πάνελ (μέγιστο 2)';

  @override
  String get selectedChangePanelsHint =>
      'Επιλεγμένα • Πατήστε τα πάνελ πλέγματος για αλλαγή (μέγ. 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Βήμα $step από $total';
  }

  @override
  String get removeStepTooltip => 'Κατάργηση Βήματος';

  @override
  String get requiresMotorizedModuleWarning =>
      'Η ρουτίνα απαιτεί τουλάχιστον ένα Motorized module από την Fabrica Arrangement.';

  @override
  String get routineFull => 'ΡΟΥΤΙΝΗ ΠΛΗΡΗΣ (16/16 ΒΗΜΑΤΑ)';

  @override
  String addStepCount(Object count) {
    return 'ΠΡΟΣΘΗΚΗ ΒΗΜΑΤΟΣ ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Αποθήκευση ρουτίνας στο ρομπότ';

  @override
  String get selectButtonToProgram =>
      'Επιλέξτε ένα φυσικό κουμπί ρομπότ για προγραμματισμό με αυτήν τη ρουτίνα:';

  @override
  String buttonNumber(Object slot) {
    return 'Κουμπί $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Κουμπί υλικού $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Κουμπί $slot Υπότιτλος (Προαιρετικό)';
  }

  @override
  String get saveToRobotButton => 'ΑΠΟΘΗΚΕΥΣΗ ΣΤΟ ΡΟΜΠΟΤ';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Κουμπί $slot ($count βήματα)';
  }

  @override
  String get adultTshirtTemplate => 'Πρότυπο T-Shirt για ενήλικες';

  @override
  String get longSleeveTemplate => 'Πρότυπο με μακριά μανίκια';

  @override
  String get dualSweepTemplate => 'Πρότυπο διπλής σάρωσης';

  @override
  String channelNumber(Object number) {
    return 'Κανάλι $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count PAIRED';
  }

  @override
  String get moreHardwareOptions => 'Περισσότερες επιλογές υλικού';

  @override
  String get loadTemplate => 'Φόρτωση προτύπου';

  @override
  String get controllerLabel => 'ΕΛΕΓΚΤΗΣ';

  @override
  String get motorBadge => 'ΜΟΤΕΡ';

  @override
  String get followerBadge => 'ΑΚΟΛΟΥΘΟΣ';

  @override
  String get baseBadge => 'ΒΑΣΗ';

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
