// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'הגדרות';

  @override
  String get appLanguageTitle => 'שפת האפליקציה';

  @override
  String get appVersionTitle => 'גרסת האפליקציה';

  @override
  String get languageSectionTitle => 'שפה';

  @override
  String get languageSystemDefault => 'ברירת מחדל של המערכת (שפת המכשיר)';

  @override
  String get selectLanguageHint => 'בחר שפה';

  @override
  String get addDeviceTitle => 'הוסף רובוט חדש';

  @override
  String get addDeviceSubtitle => 'זוג רובוטי AIR';

  @override
  String get yourRobots => 'הרובוטים שלך';

  @override
  String get discoveredRobots => 'רובוטים שהתגלו';

  @override
  String get noRobotsPairedYet => 'עדיין לא הוצמדו רובוטים';

  @override
  String get noRobotsPairedSubtitle =>
      'חבר את הרובוט שלך כדי להציג טלמטריה, לנהל הגדרות מוגדרות מראש ולשלוט בפעולות.';

  @override
  String get addYourFirstRobot => 'הוסף את הרובוט הראשון שלך';

  @override
  String get autoScanning => 'סריקה אוטומטית';

  @override
  String get idleStatus => 'בטלה';

  @override
  String get tabControl => 'שליטה';

  @override
  String get tabSequencer => 'רצף';

  @override
  String get tabCalibrator => 'כייל';

  @override
  String get tabDiagnostics => 'אבחון';

  @override
  String get renameRobot => 'שנה שם רובוט';

  @override
  String get bleDiagnostics => 'אבחון BLE';

  @override
  String get erasePresets => 'מחק קביעות מוגדרות מראש שמורות';

  @override
  String get disconnect => 'התנתק';

  @override
  String get unpairRobot => 'בטל התאמה לרובוט';

  @override
  String get factoryReset => 'איפוס להגדרות היצרן';

  @override
  String get servoManualJog => 'ריצה ידנית לשרת';

  @override
  String get homeAll => 'בית הכל';

  @override
  String get foldingTimeline => 'ציר זמן מתקפל';

  @override
  String get addStep => 'הוסף שלב';

  @override
  String get previewOnRobot => 'תצוגה מקדימה על רובוט';

  @override
  String get saveToButton => 'כפתור שמור אל';

  @override
  String get themeTitle => 'נושא';

  @override
  String get themeSystem => 'מכשיר';

  @override
  String get themeLight => 'אור';

  @override
  String get themeDark => 'כהה';

  @override
  String get connectedBadge => 'מחובר';

  @override
  String get inRangeBadge => 'בטווח';

  @override
  String get offlineBadge => 'אופליין';

  @override
  String get openButton => 'פתוח';

  @override
  String get connectButton => 'התחבר';

  @override
  String get reconnectButton => 'התחבר מחדש';

  @override
  String get pairAndConnect => 'זוג וחיבור';

  @override
  String get autoScanningForRobots => 'סריקה אוטומטית עבור רובוטים...';

  @override
  String get scanningIdle => 'סריקה סרק';

  @override
  String get nearbyRobotsAppear =>
      'רובוטים בקרבת מקום יופיעו כאן באופן אוטומטי.';

  @override
  String get yourNearbyRobotsAppear =>
      'הרובוטים הקרובים שלך יופיעו כאן באופן אוטומטי.';

  @override
  String get signalStrong => 'חזק';

  @override
  String get signalGood => 'טוב';

  @override
  String get signalWeak => 'חלש';

  @override
  String get addRobotIntro =>
      'בחר רובוט למטה להתאמה. כל רובוט קרוב במצב התאמה יתגלה אוטומטית בחלק העליון.';

  @override
  String get autoDiscoveredRobot => 'רובוט מתגלה אוטומטי';

  @override
  String get autoDiscoveredRobots => 'רובוטים שהתגלו אוטומטית';

  @override
  String readyCountBadge(Object count) {
    return '$count מוכן';
  }

  @override
  String get supportedRobots => 'רובוטים נתמכים';

  @override
  String get clothesFoldingRobot => 'רובוט מתקפל בגדים';

  @override
  String get fabricaDescription =>
      'תיקיית בגדים אוטומטית עם הגדרות קבועות מראש של ריבוי בגדים והפעלה בלחיצת כפתור בודדת.';

  @override
  String get fabricaPairingHint =>
      'מצב התאמה: לחץ והחזק כל לחצן בלוח הבקרה של Fabrica למשך 3 שניות (נורית המצב תהבהב במהירות).';

  @override
  String get pairFabricaNow => 'זוג בדים עכשיו';

  @override
  String get backToHome => 'חזרה לבית';

  @override
  String get connReady => 'מוכן';

  @override
  String get connConnecting => 'מתחבר';

  @override
  String get connDiscovering => 'גילוי';

  @override
  String get connBonding => 'התקשרות';

  @override
  String get connScanning => 'סריקה';

  @override
  String get connDisconnected => 'מנותק';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'להתנתק מ-$name?';
  }

  @override
  String get disconnectConfirmBody => 'אתה יכול להתחבר מחדש בכל עת ממסך הבית.';

  @override
  String get cancelButton => 'ביטול';

  @override
  String get saveButton => 'שמור';

  @override
  String get customNickname => 'כינוי מותאם אישית';

  @override
  String unpairConfirmTitle(Object name) {
    return 'לבטל את ההתאמה של $name?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'פעולה זו תסיר את $name מהרובוטים שלך בטלפון זה. אתה יכול להוסיף אותו מחדש בכל עת.\n\nהערה: כדי למחוק לחלוטין את זיכרון הרובוט ולשחזר את ברירת המחדל של היצרן, השתמש ב\"איפוס להגדרות היצרן\".';
  }

  @override
  String get unpairButton => 'בטל התאמה';

  @override
  String get machineIdle => 'בטלה';

  @override
  String get machineRunning => 'ריצה';

  @override
  String get machineEstop => 'E-STOP';

  @override
  String get machineError => 'שגיאה';

  @override
  String get machineCalibrating => 'מכייל';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => 'נשמר';

  @override
  String get ledInputErr => 'שגיאת קלט';

  @override
  String get ledPairing => 'זיווג';

  @override
  String get ledConnected => 'מחובר';

  @override
  String get ledIdentify => 'זיהוי';

  @override
  String get identifyButton => 'זיהוי';

  @override
  String get identifyingToast => 'LED רובוט מהבהב למשך 3 שניות...';

  @override
  String get homingToast => 'מפנה את כל הדשים...';

  @override
  String get i2cFault => 'I2C תקלה';

  @override
  String get storageFault => 'תקלת אחסון';

  @override
  String get estopLatched => 'E-STOP ננעל';

  @override
  String get presetButtonsTitle => 'כפתורים מוגדרים מראש';

  @override
  String customizePresetTitle(Object label) {
    return 'התאמה אישית של $label';
  }

  @override
  String get subtitleNameLabel => 'שם כתוביות';

  @override
  String get subtitleNameHint => 'למשל קיפול מהיר, חולצות, בהתאמה אישית...';

  @override
  String get buttonColorLabel => 'צבע כפתור';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'שלב $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'עצירת חירום';

  @override
  String get clearEstop => 'נקה ופתח עצירה אלקטרונית';

  @override
  String get clearEstopHint => 'מאפס את עצירת החירום ומחזיר את הרובוט למצב סרק';

  @override
  String get stopButton => 'עצור';

  @override
  String get fabricaArrangementTitle => 'סידור פבריקה';

  @override
  String get editArrangement => 'עריכת הסדר';

  @override
  String get addPanel => 'הוסף פאנל';

  @override
  String get legendMotorized => 'ממונע';

  @override
  String get legendFollower => 'עוקב';

  @override
  String get legendBase => 'בסיס';

  @override
  String get colsLabel => 'קולס';

  @override
  String get rowsLabel => 'שורות';

  @override
  String stepSelectedHint(Object step) {
    return 'שלב $step נבחר: הקש על 1-2 לוחות ממונעים ברשת';
  }

  @override
  String get tapPanelsHint => 'הקש על 1-2 לוחות מנוע על הרשת';

  @override
  String get dualBadge => 'כפול';

  @override
  String get requiresMotorizedPanel => 'דורש פאנל ממונע אחד לפחות (מקסימום 2)';

  @override
  String get selectedChangePanelsHint =>
      'נבחר • הקש על לוחות רשת כדי לשנות (מקסימום 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'שלב $step מתוך $total';
  }

  @override
  String get removeStepTooltip => 'הסר את שלב';

  @override
  String get requiresMotorizedModuleWarning =>
      'השגרה דורשת לפחות מודול ממונע אחד מ-Fabrica Arrangement.';

  @override
  String get routineFull => 'שגרה מלאה (16/16 צעדים)';

  @override
  String addStepCount(Object count) {
    return 'הוסף שלב ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'שמור שגרה לרובוט';

  @override
  String get selectButtonToProgram => 'בחר כפתור רובוט פיזי לתכנת בשגרה זו:';

  @override
  String buttonNumber(Object slot) {
    return 'לחצן $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'לחצן חומרה $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'לחצן $slot כתוביות (אופציונלי)';
  }

  @override
  String get saveToRobotButton => 'שמור לרובוט';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'לחצן $slot ($count צעדים)';
  }

  @override
  String get adultTshirtTemplate => 'תבנית חולצה למבוגרים';

  @override
  String get longSleeveTemplate => 'תבנית שרוול ארוך';

  @override
  String get dualSweepTemplate => 'תבנית סריקה כפולה';

  @override
  String channelNumber(Object number) {
    return 'ערוץ $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count מזווג';
  }

  @override
  String get moreHardwareOptions => 'אפשרויות חומרה נוספות';

  @override
  String get loadTemplate => 'טען תבנית';

  @override
  String get controllerLabel => 'בקר';

  @override
  String get motorBadge => 'מנוע';

  @override
  String get followerBadge => 'עוקב';

  @override
  String get baseBadge => 'בסיס';

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
