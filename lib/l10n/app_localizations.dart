import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_af.dart';
import 'app_localizations_am.dart';
import 'app_localizations_ar.dart';
import 'app_localizations_as.dart';
import 'app_localizations_az.dart';
import 'app_localizations_be.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_bo.dart';
import 'app_localizations_bs.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_cy.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_eu.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ga.dart';
import 'app_localizations_gl.dart';
import 'app_localizations_gsw.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_hy.dart';
import 'app_localizations_id.dart';
import 'app_localizations_is.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ka.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_km.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ky.dart';
import 'app_localizations_lo.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_mk.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mn.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_my.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_ne.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_no.dart';
import 'app_localizations_or.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_ps.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_si.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sq.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tl.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ug.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_uz.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';
import 'app_localizations_zu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('af'),
    Locale('am'),
    Locale('ar'),
    Locale('as'),
    Locale('az'),
    Locale('be'),
    Locale('bg'),
    Locale('bn'),
    Locale('bo'),
    Locale('bs'),
    Locale('ca'),
    Locale('cs'),
    Locale('cy'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('et'),
    Locale('eu'),
    Locale('fa'),
    Locale('fi'),
    Locale('fil'),
    Locale('fr'),
    Locale('ga'),
    Locale('gl'),
    Locale('gsw'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('hy'),
    Locale('id'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('kk'),
    Locale('km'),
    Locale('kn'),
    Locale('ko'),
    Locale('ky'),
    Locale('lo'),
    Locale('lt'),
    Locale('lv'),
    Locale('mk'),
    Locale('ml'),
    Locale('mn'),
    Locale('mr'),
    Locale('ms'),
    Locale('my'),
    Locale('nb'),
    Locale('ne'),
    Locale('nl'),
    Locale('no'),
    Locale('or'),
    Locale('pa'),
    Locale('pl'),
    Locale('ps'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('si'),
    Locale('sk'),
    Locale('sl'),
    Locale('sq'),
    Locale('sr'),
    Locale('sv'),
    Locale('sw'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tl'),
    Locale('tr'),
    Locale('ug'),
    Locale('uk'),
    Locale('ur'),
    Locale('uz'),
    Locale('vi'),
    Locale('zh'),
    Locale('zu'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'AIR Robotics'**
  String get appTitle;

  /// No description provided for @homeHeader.
  ///
  /// In en, this message translates to:
  /// **'AIR ROBOTICS'**
  String get homeHeader;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @appLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get appLanguageTitle;

  /// No description provided for @appVersionTitle.
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get appVersionTitle;

  /// No description provided for @languageSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSectionTitle;

  /// No description provided for @languageSystemDefault.
  ///
  /// In en, this message translates to:
  /// **'System Default (Device Language)'**
  String get languageSystemDefault;

  /// No description provided for @selectLanguageHint.
  ///
  /// In en, this message translates to:
  /// **'Select a language'**
  String get selectLanguageHint;

  /// No description provided for @addDeviceTitle.
  ///
  /// In en, this message translates to:
  /// **'ADD NEW ROBOT'**
  String get addDeviceTitle;

  /// No description provided for @addDeviceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pair AIR robots'**
  String get addDeviceSubtitle;

  /// No description provided for @yourRobots.
  ///
  /// In en, this message translates to:
  /// **'YOUR ROBOTS'**
  String get yourRobots;

  /// No description provided for @discoveredRobots.
  ///
  /// In en, this message translates to:
  /// **'DISCOVERED ROBOTS'**
  String get discoveredRobots;

  /// No description provided for @noRobotsPairedYet.
  ///
  /// In en, this message translates to:
  /// **'No Robots Paired Yet'**
  String get noRobotsPairedYet;

  /// No description provided for @noRobotsPairedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect your robot to view telemetry, manage presets, and control operations.'**
  String get noRobotsPairedSubtitle;

  /// No description provided for @addYourFirstRobot.
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR FIRST ROBOT'**
  String get addYourFirstRobot;

  /// No description provided for @autoScanning.
  ///
  /// In en, this message translates to:
  /// **'AUTO-SCANNING'**
  String get autoScanning;

  /// No description provided for @idleStatus.
  ///
  /// In en, this message translates to:
  /// **'IDLE'**
  String get idleStatus;

  /// No description provided for @tabControl.
  ///
  /// In en, this message translates to:
  /// **'Control'**
  String get tabControl;

  /// No description provided for @tabSequencer.
  ///
  /// In en, this message translates to:
  /// **'Sequencer'**
  String get tabSequencer;

  /// No description provided for @tabCalibrator.
  ///
  /// In en, this message translates to:
  /// **'Calibrator'**
  String get tabCalibrator;

  /// No description provided for @tabDiagnostics.
  ///
  /// In en, this message translates to:
  /// **'Diagnostics'**
  String get tabDiagnostics;

  /// No description provided for @renameRobot.
  ///
  /// In en, this message translates to:
  /// **'Rename Robot'**
  String get renameRobot;

  /// No description provided for @bleDiagnostics.
  ///
  /// In en, this message translates to:
  /// **'BLE Diagnostics'**
  String get bleDiagnostics;

  /// No description provided for @erasePresets.
  ///
  /// In en, this message translates to:
  /// **'Erase Saved Presets'**
  String get erasePresets;

  /// No description provided for @disconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get disconnect;

  /// No description provided for @unpairRobot.
  ///
  /// In en, this message translates to:
  /// **'Unpair Robot'**
  String get unpairRobot;

  /// No description provided for @factoryReset.
  ///
  /// In en, this message translates to:
  /// **'Factory Reset'**
  String get factoryReset;

  /// No description provided for @servoManualJog.
  ///
  /// In en, this message translates to:
  /// **'SERVO MANUAL JOG'**
  String get servoManualJog;

  /// No description provided for @homeAll.
  ///
  /// In en, this message translates to:
  /// **'HOME ALL'**
  String get homeAll;

  /// No description provided for @foldingTimeline.
  ///
  /// In en, this message translates to:
  /// **'FOLDING TIMELINE'**
  String get foldingTimeline;

  /// No description provided for @addStep.
  ///
  /// In en, this message translates to:
  /// **'ADD STEP'**
  String get addStep;

  /// No description provided for @previewOnRobot.
  ///
  /// In en, this message translates to:
  /// **'PREVIEW ON ROBOT'**
  String get previewOnRobot;

  /// No description provided for @saveToButton.
  ///
  /// In en, this message translates to:
  /// **'SAVE TO BUTTON'**
  String get saveToButton;

  /// No description provided for @themeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeTitle;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @connectedBadge.
  ///
  /// In en, this message translates to:
  /// **'CONNECTED'**
  String get connectedBadge;

  /// No description provided for @inRangeBadge.
  ///
  /// In en, this message translates to:
  /// **'IN RANGE'**
  String get inRangeBadge;

  /// No description provided for @offlineBadge.
  ///
  /// In en, this message translates to:
  /// **'OFFLINE'**
  String get offlineBadge;

  /// No description provided for @openButton.
  ///
  /// In en, this message translates to:
  /// **'OPEN'**
  String get openButton;

  /// No description provided for @connectButton.
  ///
  /// In en, this message translates to:
  /// **'CONNECT'**
  String get connectButton;

  /// No description provided for @reconnectButton.
  ///
  /// In en, this message translates to:
  /// **'RECONNECT'**
  String get reconnectButton;

  /// No description provided for @pairAndConnect.
  ///
  /// In en, this message translates to:
  /// **'PAIR & CONNECT'**
  String get pairAndConnect;

  /// No description provided for @autoScanningForRobots.
  ///
  /// In en, this message translates to:
  /// **'Auto-scanning for robots...'**
  String get autoScanningForRobots;

  /// No description provided for @scanningIdle.
  ///
  /// In en, this message translates to:
  /// **'Scanning idle'**
  String get scanningIdle;

  /// No description provided for @nearbyRobotsAppear.
  ///
  /// In en, this message translates to:
  /// **'Nearby robots will appear here automatically.'**
  String get nearbyRobotsAppear;

  /// No description provided for @yourNearbyRobotsAppear.
  ///
  /// In en, this message translates to:
  /// **'Your nearby robots will appear here automatically.'**
  String get yourNearbyRobotsAppear;

  /// No description provided for @signalStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get signalStrong;

  /// No description provided for @signalGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get signalGood;

  /// No description provided for @signalWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get signalWeak;

  /// No description provided for @addRobotIntro.
  ///
  /// In en, this message translates to:
  /// **'Select a robot below to pair. Any nearby robot in pairing mode will be automatically discovered at the top.'**
  String get addRobotIntro;

  /// No description provided for @autoDiscoveredRobot.
  ///
  /// In en, this message translates to:
  /// **'AUTO DISCOVERED ROBOT'**
  String get autoDiscoveredRobot;

  /// No description provided for @autoDiscoveredRobots.
  ///
  /// In en, this message translates to:
  /// **'AUTO DISCOVERED ROBOTS'**
  String get autoDiscoveredRobots;

  /// No description provided for @readyCountBadge.
  ///
  /// In en, this message translates to:
  /// **'{count} READY'**
  String readyCountBadge(Object count);

  /// No description provided for @supportedRobots.
  ///
  /// In en, this message translates to:
  /// **'SUPPORTED ROBOTS'**
  String get supportedRobots;

  /// No description provided for @clothesFoldingRobot.
  ///
  /// In en, this message translates to:
  /// **'Clothes Folding Robot'**
  String get clothesFoldingRobot;

  /// No description provided for @fabricaDescription.
  ///
  /// In en, this message translates to:
  /// **'Automated garment folder with multi-garment presets and tactile single-button operation.'**
  String get fabricaDescription;

  /// No description provided for @fabricaPairingHint.
  ///
  /// In en, this message translates to:
  /// **'Pairing mode: Press and hold any button on the Fabrica control panel for 3 seconds (Status LED will blink rapidly).'**
  String get fabricaPairingHint;

  /// No description provided for @pairFabricaNow.
  ///
  /// In en, this message translates to:
  /// **'PAIR FABRICA NOW'**
  String get pairFabricaNow;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @connReady.
  ///
  /// In en, this message translates to:
  /// **'READY'**
  String get connReady;

  /// No description provided for @connConnecting.
  ///
  /// In en, this message translates to:
  /// **'CONNECTING'**
  String get connConnecting;

  /// No description provided for @connDiscovering.
  ///
  /// In en, this message translates to:
  /// **'DISCOVERING'**
  String get connDiscovering;

  /// No description provided for @connBonding.
  ///
  /// In en, this message translates to:
  /// **'BONDING'**
  String get connBonding;

  /// No description provided for @connScanning.
  ///
  /// In en, this message translates to:
  /// **'SCANNING'**
  String get connScanning;

  /// No description provided for @connDisconnected.
  ///
  /// In en, this message translates to:
  /// **'DISCONNECTED'**
  String get connDisconnected;

  /// No description provided for @disconnectConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Disconnect from {name}?'**
  String disconnectConfirmTitle(Object name);

  /// No description provided for @disconnectConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'You can reconnect anytime from the home screen.'**
  String get disconnectConfirmBody;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'CANCEL'**
  String get cancelButton;

  /// No description provided for @saveButton.
  ///
  /// In en, this message translates to:
  /// **'SAVE'**
  String get saveButton;

  /// No description provided for @customNickname.
  ///
  /// In en, this message translates to:
  /// **'Custom Nickname'**
  String get customNickname;

  /// No description provided for @unpairConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Unpair {name}?'**
  String unpairConfirmTitle(Object name);

  /// No description provided for @unpairConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'This will remove {name} from Your Robots on this phone. You can re-add it at any time.\n\nNote: To completely wipe robot memory and restore factory defaults, use \"Factory Reset\".'**
  String unpairConfirmBody(Object name);

  /// No description provided for @unpairButton.
  ///
  /// In en, this message translates to:
  /// **'UNPAIR'**
  String get unpairButton;

  /// No description provided for @machineIdle.
  ///
  /// In en, this message translates to:
  /// **'IDLE'**
  String get machineIdle;

  /// No description provided for @machineRunning.
  ///
  /// In en, this message translates to:
  /// **'RUNNING'**
  String get machineRunning;

  /// No description provided for @machineEstop.
  ///
  /// In en, this message translates to:
  /// **'E-STOP'**
  String get machineEstop;

  /// No description provided for @machineError.
  ///
  /// In en, this message translates to:
  /// **'ERROR'**
  String get machineError;

  /// No description provided for @machineCalibrating.
  ///
  /// In en, this message translates to:
  /// **'CALIBRATING'**
  String get machineCalibrating;

  /// No description provided for @ledLabel.
  ///
  /// In en, this message translates to:
  /// **'LED: {state}'**
  String ledLabel(Object state);

  /// No description provided for @ledSaved.
  ///
  /// In en, this message translates to:
  /// **'SAVED'**
  String get ledSaved;

  /// No description provided for @ledInputErr.
  ///
  /// In en, this message translates to:
  /// **'INPUT ERR'**
  String get ledInputErr;

  /// No description provided for @ledPairing.
  ///
  /// In en, this message translates to:
  /// **'PAIRING'**
  String get ledPairing;

  /// No description provided for @ledConnected.
  ///
  /// In en, this message translates to:
  /// **'CONNECTED'**
  String get ledConnected;

  /// No description provided for @ledIdentify.
  ///
  /// In en, this message translates to:
  /// **'IDENTIFY'**
  String get ledIdentify;

  /// No description provided for @identifyButton.
  ///
  /// In en, this message translates to:
  /// **'IDENTIFY'**
  String get identifyButton;

  /// No description provided for @identifyingToast.
  ///
  /// In en, this message translates to:
  /// **'Flashing robot LED for 3 seconds...'**
  String get identifyingToast;

  /// No description provided for @homingToast.
  ///
  /// In en, this message translates to:
  /// **'Homing all flaps...'**
  String get homingToast;

  /// No description provided for @i2cFault.
  ///
  /// In en, this message translates to:
  /// **'I2C FAULT'**
  String get i2cFault;

  /// No description provided for @storageFault.
  ///
  /// In en, this message translates to:
  /// **'STORAGE FAULT'**
  String get storageFault;

  /// No description provided for @estopLatched.
  ///
  /// In en, this message translates to:
  /// **'E-STOP LATCHED'**
  String get estopLatched;

  /// No description provided for @presetButtonsTitle.
  ///
  /// In en, this message translates to:
  /// **'PRESET BUTTONS'**
  String get presetButtonsTitle;

  /// No description provided for @customizePresetTitle.
  ///
  /// In en, this message translates to:
  /// **'Customize {label}'**
  String customizePresetTitle(Object label);

  /// No description provided for @subtitleNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Subtitle Name'**
  String get subtitleNameLabel;

  /// No description provided for @subtitleNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Quick Fold, Shirts, Custom...'**
  String get subtitleNameHint;

  /// No description provided for @buttonColorLabel.
  ///
  /// In en, this message translates to:
  /// **'Button Color'**
  String get buttonColorLabel;

  /// No description provided for @stepProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Step {current}/{total} ({pct}%)'**
  String stepProgressLabel(Object current, Object pct, Object total);

  /// No description provided for @emergencyStop.
  ///
  /// In en, this message translates to:
  /// **'EMERGENCY STOP'**
  String get emergencyStop;

  /// No description provided for @clearEstop.
  ///
  /// In en, this message translates to:
  /// **'CLEAR & UNLATCH E-STOP'**
  String get clearEstop;

  /// No description provided for @clearEstopHint.
  ///
  /// In en, this message translates to:
  /// **'Resets emergency stop and returns robot to Idle'**
  String get clearEstopHint;

  /// No description provided for @stopButton.
  ///
  /// In en, this message translates to:
  /// **'STOP'**
  String get stopButton;

  /// No description provided for @fabricaArrangementTitle.
  ///
  /// In en, this message translates to:
  /// **'FABRICA ARRANGEMENT'**
  String get fabricaArrangementTitle;

  /// No description provided for @editArrangement.
  ///
  /// In en, this message translates to:
  /// **'EDIT ARRANGEMENT'**
  String get editArrangement;

  /// No description provided for @addPanel.
  ///
  /// In en, this message translates to:
  /// **'ADD PANEL'**
  String get addPanel;

  /// No description provided for @legendMotorized.
  ///
  /// In en, this message translates to:
  /// **'Motorized'**
  String get legendMotorized;

  /// No description provided for @legendFollower.
  ///
  /// In en, this message translates to:
  /// **'Follower'**
  String get legendFollower;

  /// No description provided for @legendBase.
  ///
  /// In en, this message translates to:
  /// **'Base'**
  String get legendBase;

  /// No description provided for @colsLabel.
  ///
  /// In en, this message translates to:
  /// **'Cols'**
  String get colsLabel;

  /// No description provided for @rowsLabel.
  ///
  /// In en, this message translates to:
  /// **'Rows'**
  String get rowsLabel;

  /// No description provided for @stepSelectedHint.
  ///
  /// In en, this message translates to:
  /// **'Step {step} selected: Tap 1–2 Motorized panels on the grid'**
  String stepSelectedHint(Object step);

  /// No description provided for @tapPanelsHint.
  ///
  /// In en, this message translates to:
  /// **'Tap 1–2 motor panels on grid'**
  String get tapPanelsHint;

  /// No description provided for @dualBadge.
  ///
  /// In en, this message translates to:
  /// **'DUAL'**
  String get dualBadge;

  /// No description provided for @requiresMotorizedPanel.
  ///
  /// In en, this message translates to:
  /// **'Requires at least 1 motorized panel (max 2)'**
  String get requiresMotorizedPanel;

  /// No description provided for @selectedChangePanelsHint.
  ///
  /// In en, this message translates to:
  /// **'Selected • Tap grid panels to change (max 2)'**
  String get selectedChangePanelsHint;

  /// No description provided for @stepOfTotal.
  ///
  /// In en, this message translates to:
  /// **'Step {step} of {total}'**
  String stepOfTotal(Object step, Object total);

  /// No description provided for @removeStepTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove Step'**
  String get removeStepTooltip;

  /// No description provided for @requiresMotorizedModuleWarning.
  ///
  /// In en, this message translates to:
  /// **'Routine requires at least one Motorized module from Fabrica Arrangement.'**
  String get requiresMotorizedModuleWarning;

  /// No description provided for @routineFull.
  ///
  /// In en, this message translates to:
  /// **'ROUTINE FULL (16/16 STEPS)'**
  String get routineFull;

  /// No description provided for @addStepCount.
  ///
  /// In en, this message translates to:
  /// **'ADD STEP ({count}/16)'**
  String addStepCount(Object count);

  /// No description provided for @saveRoutineToRobot.
  ///
  /// In en, this message translates to:
  /// **'Save Routine to Robot'**
  String get saveRoutineToRobot;

  /// No description provided for @selectButtonToProgram.
  ///
  /// In en, this message translates to:
  /// **'Select a physical robot button to program with this routine:'**
  String get selectButtonToProgram;

  /// No description provided for @buttonNumber.
  ///
  /// In en, this message translates to:
  /// **'Button {slot}'**
  String buttonNumber(Object slot);

  /// No description provided for @hardwareButtonNumber.
  ///
  /// In en, this message translates to:
  /// **'Hardware Button {slot}'**
  String hardwareButtonNumber(Object slot);

  /// No description provided for @buttonSubtitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Button {slot} Subtitle (Optional)'**
  String buttonSubtitleLabel(Object slot);

  /// No description provided for @saveToRobotButton.
  ///
  /// In en, this message translates to:
  /// **'SAVE TO ROBOT'**
  String get saveToRobotButton;

  /// No description provided for @buttonNumberCount.
  ///
  /// In en, this message translates to:
  /// **'Button {slot} ({count} steps)'**
  String buttonNumberCount(Object count, Object slot);

  /// No description provided for @adultTshirtTemplate.
  ///
  /// In en, this message translates to:
  /// **'Adult T-Shirt Template'**
  String get adultTshirtTemplate;

  /// No description provided for @longSleeveTemplate.
  ///
  /// In en, this message translates to:
  /// **'Long Sleeve Template'**
  String get longSleeveTemplate;

  /// No description provided for @dualSweepTemplate.
  ///
  /// In en, this message translates to:
  /// **'Dual Sweep Template'**
  String get dualSweepTemplate;

  /// No description provided for @channelNumber.
  ///
  /// In en, this message translates to:
  /// **'Channel {number}'**
  String channelNumber(Object number);

  /// No description provided for @pairedCountBadge.
  ///
  /// In en, this message translates to:
  /// **'{count} PAIRED'**
  String pairedCountBadge(Object count);

  /// No description provided for @moreHardwareOptions.
  ///
  /// In en, this message translates to:
  /// **'More Hardware Options'**
  String get moreHardwareOptions;

  /// No description provided for @loadTemplate.
  ///
  /// In en, this message translates to:
  /// **'Load Template'**
  String get loadTemplate;

  /// No description provided for @controllerLabel.
  ///
  /// In en, this message translates to:
  /// **'CONTROLLER'**
  String get controllerLabel;

  /// No description provided for @motorBadge.
  ///
  /// In en, this message translates to:
  /// **'MOTOR'**
  String get motorBadge;

  /// No description provided for @followerBadge.
  ///
  /// In en, this message translates to:
  /// **'FOLLOWER'**
  String get followerBadge;

  /// No description provided for @baseBadge.
  ///
  /// In en, this message translates to:
  /// **'BASE'**
  String get baseBadge;

  /// No description provided for @pairModelTitle.
  ///
  /// In en, this message translates to:
  /// **'PAIR {model}'**
  String pairModelTitle(Object model);

  /// No description provided for @stopScan.
  ///
  /// In en, this message translates to:
  /// **'Stop Scan'**
  String get stopScan;

  /// No description provided for @rescan.
  ///
  /// In en, this message translates to:
  /// **'Rescan'**
  String get rescan;

  /// No description provided for @searchingForNearby.
  ///
  /// In en, this message translates to:
  /// **'SEARCHING FOR NEARBY {model}...'**
  String searchingForNearby(Object model);

  /// No description provided for @scanPaused.
  ///
  /// In en, this message translates to:
  /// **'SCAN PAUSED'**
  String get scanPaused;

  /// No description provided for @filteringForBle.
  ///
  /// In en, this message translates to:
  /// **'Filtering for \"{prefix}*\" BLE advertisements'**
  String filteringForBle(Object prefix);

  /// No description provided for @tapRefreshToRestart.
  ///
  /// In en, this message translates to:
  /// **'Tap the refresh button in the top bar to restart scan'**
  String get tapRefreshToRestart;

  /// No description provided for @fabricaPairingInstructions.
  ///
  /// In en, this message translates to:
  /// **'FABRICA PAIRING INSTRUCTIONS'**
  String get fabricaPairingInstructions;

  /// No description provided for @pairingProcedure.
  ///
  /// In en, this message translates to:
  /// **'PAIRING PROCEDURE'**
  String get pairingProcedure;

  /// No description provided for @pairStep1Fabrica.
  ///
  /// In en, this message translates to:
  /// **'Power on your Fabrica robot.'**
  String get pairStep1Fabrica;

  /// No description provided for @pairStep2Fabrica.
  ///
  /// In en, this message translates to:
  /// **'Press and hold any button on the Fabrica control panel for 3 seconds to enter pairing mode.'**
  String get pairStep2Fabrica;

  /// No description provided for @pairStep3Fabrica.
  ///
  /// In en, this message translates to:
  /// **'The status LED will blink rapidly to confirm pairing mode is active.'**
  String get pairStep3Fabrica;

  /// No description provided for @pairStep1Generic.
  ///
  /// In en, this message translates to:
  /// **'Power on your {model} robot.'**
  String pairStep1Generic(Object model);

  /// No description provided for @pairStep2Generic.
  ///
  /// In en, this message translates to:
  /// **'Ensure Bluetooth pairing mode is active on the robot.'**
  String get pairStep2Generic;

  /// No description provided for @searchingForModel.
  ///
  /// In en, this message translates to:
  /// **'Searching for {model}...'**
  String searchingForModel(Object model);

  /// No description provided for @noMatchingRobotsYet.
  ///
  /// In en, this message translates to:
  /// **'No matching robots discovered yet'**
  String get noMatchingRobotsYet;

  /// No description provided for @makeSureRobotPowered.
  ///
  /// In en, this message translates to:
  /// **'Make sure your robot is powered on and within range.'**
  String get makeSureRobotPowered;

  /// No description provided for @checkPowerSwitch.
  ///
  /// In en, this message translates to:
  /// **'Check power switch and tap the top right icon to restart scan.'**
  String get checkPowerSwitch;

  /// No description provided for @failedToConnect.
  ///
  /// In en, this message translates to:
  /// **'Failed to connect to {name}: {error}'**
  String failedToConnect(Object error, Object name);

  /// No description provided for @restoreDefaultPresetsTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore Default Button Presets?'**
  String get restoreDefaultPresetsTitle;

  /// No description provided for @restoreDefaultPresetsBody.
  ///
  /// In en, this message translates to:
  /// **'This will erase all custom button routines on the robot and reset Buttons 1–4 back to their default presets.\n\nAre you sure you want to proceed?'**
  String get restoreDefaultPresetsBody;

  /// No description provided for @presetsRestoredToast.
  ///
  /// In en, this message translates to:
  /// **'All button presets on the robot have been restored to defaults.'**
  String get presetsRestoredToast;

  /// No description provided for @eraseAllPresetsButton.
  ///
  /// In en, this message translates to:
  /// **'ERASE ALL PRESETS ON ROBOT'**
  String get eraseAllPresetsButton;

  /// No description provided for @factoryResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Fabrica Factory Reset?'**
  String get factoryResetTitle;

  /// No description provided for @factoryResetBody.
  ///
  /// In en, this message translates to:
  /// **'This will reset Fabrica to factory defaults:\n\n• Wipes all custom routines in memory & restores factory defaults.\n• Returns all flaps flat to home position (0°).\n• Clears saved Bluetooth pairing keys.\n• Disconnects Bluetooth and restarts pairing mode.\n\nThe robot will be removed from Your Devices on this phone.'**
  String get factoryResetBody;

  /// No description provided for @executingFactoryReset.
  ///
  /// In en, this message translates to:
  /// **'Executing Fabrica Factory Reset...'**
  String get executingFactoryReset;

  /// No description provided for @resetEverythingButton.
  ///
  /// In en, this message translates to:
  /// **'RESET EVERYTHING'**
  String get resetEverythingButton;

  /// No description provided for @editFabricaArrangementTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Fabrica Arrangement'**
  String get editFabricaArrangementTitle;

  /// No description provided for @doneButton.
  ///
  /// In en, this message translates to:
  /// **'DONE'**
  String get doneButton;

  /// No description provided for @moduleNumber.
  ///
  /// In en, this message translates to:
  /// **'Module #{number}'**
  String moduleNumber(Object number);

  /// No description provided for @pairingModeHintError.
  ///
  /// In en, this message translates to:
  /// **'Could not pair with {name}. Make sure the robot is in pairing mode (hold any button for 3 seconds until the LED blinks rapidly) and try again.'**
  String pairingModeHintError(Object name);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'af',
    'am',
    'ar',
    'as',
    'az',
    'be',
    'bg',
    'bn',
    'bo',
    'bs',
    'ca',
    'cs',
    'cy',
    'da',
    'de',
    'el',
    'en',
    'es',
    'et',
    'eu',
    'fa',
    'fi',
    'fil',
    'fr',
    'ga',
    'gl',
    'gsw',
    'gu',
    'he',
    'hi',
    'hr',
    'hu',
    'hy',
    'id',
    'is',
    'it',
    'ja',
    'ka',
    'kk',
    'km',
    'kn',
    'ko',
    'ky',
    'lo',
    'lt',
    'lv',
    'mk',
    'ml',
    'mn',
    'mr',
    'ms',
    'my',
    'nb',
    'ne',
    'nl',
    'no',
    'or',
    'pa',
    'pl',
    'ps',
    'pt',
    'ro',
    'ru',
    'si',
    'sk',
    'sl',
    'sq',
    'sr',
    'sv',
    'sw',
    'ta',
    'te',
    'th',
    'tl',
    'tr',
    'ug',
    'uk',
    'ur',
    'uz',
    'vi',
    'zh',
    'zu',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af':
      return AppLocalizationsAf();
    case 'am':
      return AppLocalizationsAm();
    case 'ar':
      return AppLocalizationsAr();
    case 'as':
      return AppLocalizationsAs();
    case 'az':
      return AppLocalizationsAz();
    case 'be':
      return AppLocalizationsBe();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'bo':
      return AppLocalizationsBo();
    case 'bs':
      return AppLocalizationsBs();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'cy':
      return AppLocalizationsCy();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'et':
      return AppLocalizationsEt();
    case 'eu':
      return AppLocalizationsEu();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'ga':
      return AppLocalizationsGa();
    case 'gl':
      return AppLocalizationsGl();
    case 'gsw':
      return AppLocalizationsGsw();
    case 'gu':
      return AppLocalizationsGu();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'hy':
      return AppLocalizationsHy();
    case 'id':
      return AppLocalizationsId();
    case 'is':
      return AppLocalizationsIs();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ka':
      return AppLocalizationsKa();
    case 'kk':
      return AppLocalizationsKk();
    case 'km':
      return AppLocalizationsKm();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'ky':
      return AppLocalizationsKy();
    case 'lo':
      return AppLocalizationsLo();
    case 'lt':
      return AppLocalizationsLt();
    case 'lv':
      return AppLocalizationsLv();
    case 'mk':
      return AppLocalizationsMk();
    case 'ml':
      return AppLocalizationsMl();
    case 'mn':
      return AppLocalizationsMn();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'my':
      return AppLocalizationsMy();
    case 'nb':
      return AppLocalizationsNb();
    case 'ne':
      return AppLocalizationsNe();
    case 'nl':
      return AppLocalizationsNl();
    case 'no':
      return AppLocalizationsNo();
    case 'or':
      return AppLocalizationsOr();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'ps':
      return AppLocalizationsPs();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'si':
      return AppLocalizationsSi();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sq':
      return AppLocalizationsSq();
    case 'sr':
      return AppLocalizationsSr();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tl':
      return AppLocalizationsTl();
    case 'tr':
      return AppLocalizationsTr();
    case 'ug':
      return AppLocalizationsUg();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'uz':
      return AppLocalizationsUz();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
    case 'zu':
      return AppLocalizationsZu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
