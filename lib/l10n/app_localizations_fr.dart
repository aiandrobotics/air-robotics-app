// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get appLanguageTitle => 'Langue de l\'application';

  @override
  String get appVersionTitle => 'Version de l\'application';

  @override
  String get languageSectionTitle => 'Langue';

  @override
  String get languageSystemDefault =>
      'Par défaut du système (langue de l\'appareil)';

  @override
  String get selectLanguageHint => 'Sélectionner une langue';

  @override
  String get addDeviceTitle => 'AJOUTER UN NOUVEAU ROBOT';

  @override
  String get addDeviceSubtitle => 'Associer des robots AIR';

  @override
  String get yourRobots => 'VOS ROBOTS';

  @override
  String get discoveredRobots => 'ROBOTS DÉCOUVERTS';

  @override
  String get noRobotsPairedYet => 'Aucun robot associé pour le moment';

  @override
  String get noRobotsPairedSubtitle =>
      'Connectez votre robot pour voir la télémétrie, gérer les préréglages et contrôler les opérations.';

  @override
  String get addYourFirstRobot => 'AJOUTER VOTRE PREMIER ROBOT';

  @override
  String get autoScanning => 'ANALYSE AUTO';

  @override
  String get idleStatus => 'INACTIF';

  @override
  String get tabControl => 'Contrôle';

  @override
  String get tabSequencer => 'Séquenceur';

  @override
  String get tabCalibrator => 'Calibrateur';

  @override
  String get tabDiagnostics => 'Diagnostic';

  @override
  String get renameRobot => 'Renommer le robot';

  @override
  String get bleDiagnostics => 'Diagnostics BLE';

  @override
  String get erasePresets => 'Effacer les préréglages';

  @override
  String get disconnect => 'Déconnecter';

  @override
  String get unpairRobot => 'Dissocier le robot';

  @override
  String get factoryReset => 'Réinitialisation d\'usine';

  @override
  String get servoManualJog => 'CONTRÔLE MANUEL SERVO';

  @override
  String get homeAll => 'TOUT ACCUEIL';

  @override
  String get foldingTimeline => 'CHRONOLOGIE DE PLIAGE';

  @override
  String get addStep => 'AJOUTER UNE ÉTAPE';

  @override
  String get previewOnRobot => 'APERÇU SUR LE ROBOT';

  @override
  String get saveToButton => 'ENREGISTRER SUR BOUTON';

  @override
  String get themeTitle => 'Thème';

  @override
  String get themeSystem => 'Appareil';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get connectedBadge => 'CONNECTÉ';

  @override
  String get inRangeBadge => 'À PORTÉE';

  @override
  String get offlineBadge => 'HORS LIGNE';

  @override
  String get openButton => 'OUVRIR';

  @override
  String get connectButton => 'CONNECTER';

  @override
  String get reconnectButton => 'RECONNECTER';

  @override
  String get pairAndConnect => 'ASSOCIER ET CONNECTER';

  @override
  String get autoScanningForRobots => 'Scan automatique pour les robots...';

  @override
  String get scanningIdle => 'Numérisation inactive';

  @override
  String get nearbyRobotsAppear =>
      'Les robots à proximité apparaîtront ici automatiquement.';

  @override
  String get yourNearbyRobotsAppear =>
      'Vos robots à proximité apparaîtront ici automatiquement.';

  @override
  String get signalStrong => 'Fort';

  @override
  String get signalGood => 'Bon';

  @override
  String get signalWeak => 'Faible';

  @override
  String get addRobotIntro =>
      'Sélectionnez un robot ci-dessous à associer. Tout robot à proximité en mode couplage sera automatiquement découvert en haut.';

  @override
  String get autoDiscoveredRobot => 'ROBOT DÉCOUVERT AUTOMATIQUEMENT';

  @override
  String get autoDiscoveredRobots => 'ROBOTS DÉCOUVERTS AUTOMATIQUEMENT';

  @override
  String readyCountBadge(Object count) {
    return '$count PRÊT';
  }

  @override
  String get supportedRobots => 'ROBOTS PRIS EN CHARGE';

  @override
  String get clothesFoldingRobot => 'Robot pliant de vêtements';

  @override
  String get fabricaDescription =>
      'Plieuse de vêtements automatisée avec préréglages multi-vêtements et commande tactile à un seul bouton.';

  @override
  String get fabricaPairingHint =>
      'Mode d\'appairage : appuyez et maintenez n\'importe quel bouton du panneau de commande Fabrica pendant 3 secondes (la LED d\'état clignotera rapidement).';

  @override
  String get pairFabricaNow => 'APPAIREZ LE TISSU MAINTENANT';

  @override
  String get backToHome => 'Retour à la maison';

  @override
  String get connReady => 'PRÊT';

  @override
  String get connConnecting => 'CONNEXION';

  @override
  String get connDiscovering => 'DÉCOUVRIR';

  @override
  String get connBonding => 'LIAISON';

  @override
  String get connScanning => 'NUMÉRISATION';

  @override
  String get connDisconnected => 'DÉCONNECTÉ';

  @override
  String disconnectConfirmTitle(Object name) {
    return 'Se déconnecter de $name ?';
  }

  @override
  String get disconnectConfirmBody =>
      'Vous pouvez vous reconnecter à tout moment depuis l\'écran d\'accueil.';

  @override
  String get cancelButton => 'ANNULER';

  @override
  String get saveButton => 'ENREGISTRER';

  @override
  String get customNickname => 'Surnom personnalisé';

  @override
  String unpairConfirmTitle(Object name) {
    return 'Dissocier $name ?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'Cela supprimera $name de vos robots sur ce téléphone. Vous pouvez le rajouter à tout moment.\n\nRemarque : Pour effacer complètement la mémoire du robot et restaurer les paramètres d\'usine, utilisez « Factory Reset ».';
  }

  @override
  String get unpairButton => 'DÉSAPPAIRER';

  @override
  String get machineIdle => 'RALENTI';

  @override
  String get machineRunning => 'COURIR';

  @override
  String get machineEstop => 'ARRÊT D\'URGENCE';

  @override
  String get machineError => 'ERREUR';

  @override
  String get machineCalibrating => 'CALIBRAGE';

  @override
  String ledLabel(Object state) {
    return 'LED : $state';
  }

  @override
  String get ledSaved => 'ENREGISTRÉ';

  @override
  String get ledInputErr => 'ERREUR D\'ENTRÉE';

  @override
  String get ledPairing => 'ACCOMPAGNEMENT';

  @override
  String get ledConnected => 'CONNECTÉ';

  @override
  String get ledIdentify => 'IDENTIFIER';

  @override
  String get identifyButton => 'IDENTIFIER';

  @override
  String get identifyingToast => 'LED robot clignotante pendant 3 secondes...';

  @override
  String get homingToast => 'Retour à tous les volets...';

  @override
  String get i2cFault => 'DÉFAUT I2C';

  @override
  String get storageFault => 'DEFAUT DE STOCKAGE';

  @override
  String get estopLatched => 'E-STOP VERROUILLÉ';

  @override
  String get presetButtonsTitle => 'BOUTONS PRÉRÉGLÉS';

  @override
  String customizePresetTitle(Object label) {
    return 'Personnaliser $label';
  }

  @override
  String get subtitleNameLabel => 'Nom du sous-titre';

  @override
  String get subtitleNameHint =>
      'par ex. Pliage Rapide, Chemises, Personnalisé...';

  @override
  String get buttonColorLabel => 'Couleur du bouton';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'Étape $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => 'ARRÊT D\'URGENCE';

  @override
  String get clearEstop => 'EFFACER ET DÉVERROUILLER L\'E-STOP';

  @override
  String get clearEstopHint =>
      'Réinitialise l\'arrêt d\'urgence et remet le robot en mode veille';

  @override
  String get stopButton => 'ARRÊTER';

  @override
  String get fabricaArrangementTitle => 'ARRANGEMENT EN TISSU';

  @override
  String get editArrangement => 'MODIFIER L\'ARRANGEMENT';

  @override
  String get addPanel => 'AJOUTER UN PANNEAU';

  @override
  String get legendMotorized => 'Motorisé';

  @override
  String get legendFollower => 'Suiveur';

  @override
  String get legendBase => 'Socle';

  @override
  String get colsLabel => 'Cols';

  @override
  String get rowsLabel => 'Lignes';

  @override
  String stepSelectedHint(Object step) {
    return 'Étape $step sélectionnée : appuyez sur 1 à 2 panneaux motorisés sur la grille.';
  }

  @override
  String get tapPanelsHint =>
      'Appuyez sur 1 à 2 panneaux de moteur sur la grille';

  @override
  String get dualBadge => 'DOUBLE';

  @override
  String get requiresMotorizedPanel =>
      'Nécessite au moins 1 panneau motorisé (max 2)';

  @override
  String get selectedChangePanelsHint =>
      'Sélectionné  • Appuyez sur les panneaux de grille pour les modifier (max 2)';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'Étape $step de $total';
  }

  @override
  String get removeStepTooltip => 'Supprimer l\'étape';

  @override
  String get requiresMotorizedModuleWarning =>
      'La routine nécessite au moins un module motorisé de Fabrica Arrangement.';

  @override
  String get routineFull => 'ROUTINE COMPLÈTE (16/16 ÉTAPES)';

  @override
  String addStepCount(Object count) {
    return 'AJOUTER UNE ÉTAPE ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'Enregistrer la routine sur le robot';

  @override
  String get selectButtonToProgram =>
      'Sélectionnez un bouton physique du robot à programmer avec cette routine :';

  @override
  String buttonNumber(Object slot) {
    return 'Bouton $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'Bouton matériel $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'Bouton $slot Sous-titre (facultatif)';
  }

  @override
  String get saveToRobotButton => 'ENREGISTRER SUR LE ROBOT';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'Bouton $slot (étapes $count)';
  }

  @override
  String get adultTshirtTemplate => 'Modèle de t-shirt pour adultes';

  @override
  String get longSleeveTemplate => 'Modèle à manches longues';

  @override
  String get dualSweepTemplate => 'Modèle à double balayage';

  @override
  String channelNumber(Object number) {
    return 'Canal $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count COUPÉ';
  }

  @override
  String get moreHardwareOptions => 'Plus d\'options matérielles';

  @override
  String get loadTemplate => 'Charger le modèle';

  @override
  String get controllerLabel => 'CONTRÔLEUR';

  @override
  String get motorBadge => 'MOTEUR';

  @override
  String get followerBadge => 'SUIVANT';

  @override
  String get baseBadge => 'SOCLE';

  @override
  String pairModelTitle(Object model) {
    return 'APPAIRER $model';
  }

  @override
  String get stopScan => 'Arrêter l\'analyse';

  @override
  String get rescan => 'Analyser à nouveau';

  @override
  String searchingForNearby(Object model) {
    return 'RECHERCHE DE $model À PROXIMITÉ...';
  }

  @override
  String get scanPaused => 'ANALYSE EN PAUSE';

  @override
  String filteringForBle(Object prefix) {
    return 'Filtrage des annonces BLE « $prefix* »';
  }

  @override
  String get tapRefreshToRestart =>
      'Appuyez sur le bouton d\'actualisation dans la barre supérieure pour relancer l\'analyse';

  @override
  String get fabricaPairingInstructions => 'INSTRUCTIONS D\'APPAIRAGE FABRICA';

  @override
  String get pairingProcedure => 'PROCÉDURE D\'APPAIRAGE';

  @override
  String get pairStep1Fabrica => 'Allumez votre robot Fabrica.';

  @override
  String get pairStep2Fabrica =>
      'Maintenez enfoncé n\'importe quel bouton du panneau de commande Fabrica pendant 3 secondes pour passer en mode d\'appairage.';

  @override
  String get pairStep3Fabrica =>
      'La LED d\'état clignotera rapidement pour confirmer que le mode d\'appairage est actif.';

  @override
  String pairStep1Generic(Object model) {
    return 'Allumez votre robot $model.';
  }

  @override
  String get pairStep2Generic =>
      'Assurez-vous que le mode d\'appairage Bluetooth est actif sur le robot.';

  @override
  String searchingForModel(Object model) {
    return 'Recherche de $model...';
  }

  @override
  String get noMatchingRobotsYet =>
      'Aucun robot correspondant détecté pour l\'instant';

  @override
  String get makeSureRobotPowered =>
      'Assurez-vous que votre robot est allumé et à portée.';

  @override
  String get checkPowerSwitch =>
      'Vérifiez l\'interrupteur et appuyez sur l\'icône en haut à droite pour relancer l\'analyse.';

  @override
  String failedToConnect(Object error, Object name) {
    return 'Échec de la connexion à $name : $error';
  }

  @override
  String get restoreDefaultPresetsTitle =>
      'Restaurer les préréglages de boutons par défaut ?';

  @override
  String get restoreDefaultPresetsBody =>
      'Cela effacera toutes les routines personnalisées sur le robot et réinitialisera les boutons 1 à 4 par défaut.\n\nVoulez-vous vraiment continuer ?';

  @override
  String get presetsRestoredToast =>
      'Tous les préréglages de boutons du robot ont été restaurés.';

  @override
  String get eraseAllPresetsButton => 'EFFACER TOUS LES PRÉRÉGLAGES DU ROBOT';

  @override
  String get factoryResetTitle => 'Réinitialisation d\'usine Fabrica ?';

  @override
  String get factoryResetBody =>
      'Cela réinitialisera Fabrica aux paramètres d\'usine :\n\n• Efface toutes les routines personnalisées en mémoire et restaure les paramètres d\'usine.\n• Ramène tous les volets à plat en position d\'origine (0°).\n• Efface les clés d\'appairage Bluetooth enregistrées.\n• Déconnecte le Bluetooth et relance le mode d\'appairage.\n\nLe robot sera supprimé de Vos appareils sur ce téléphone.';

  @override
  String get executingFactoryReset =>
      'Réinitialisation d\'usine Fabrica en cours...';

  @override
  String get resetEverythingButton => 'TOUT RÉINITIALISER';

  @override
  String get editFabricaArrangementTitle => 'Modifier la disposition Fabrica';

  @override
  String get doneButton => 'TERMINÉ';

  @override
  String moduleNumber(Object number) {
    return 'Module #$number';
  }

  @override
  String pairingModeHintError(Object name) {
    return 'Impossible d\'appairer avec $name. Assurez-vous que le robot est en mode appairage (maintenez un bouton 3 secondes jusqu\'à ce que la LED clignote rapidement) puis réessayez.';
  }
}
