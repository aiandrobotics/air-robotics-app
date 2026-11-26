// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => '설정';

  @override
  String get appLanguageTitle => '앱 언어';

  @override
  String get appVersionTitle => '앱 버전';

  @override
  String get languageSectionTitle => '언어';

  @override
  String get languageSystemDefault => '시스템 기본값(기기 언어)';

  @override
  String get selectLanguageHint => '언어 선택';

  @override
  String get addDeviceTitle => '새 로봇 추가';

  @override
  String get addDeviceSubtitle => 'AIR 로봇 페어링';

  @override
  String get yourRobots => '내 로봇';

  @override
  String get discoveredRobots => '검색된 로봇';

  @override
  String get noRobotsPairedYet => '페어링된 로봇 없음';

  @override
  String get noRobotsPairedSubtitle =>
      '로봇을 연결하여 원격 측정을 보고, 사전 설정을 관리하고, 작업을 제어하세요.';

  @override
  String get addYourFirstRobot => '첫 번째 로봇 추가';

  @override
  String get autoScanning => '자동 스캔';

  @override
  String get idleStatus => '게으른';

  @override
  String get tabControl => '제어';

  @override
  String get tabSequencer => '시퀀서';

  @override
  String get tabCalibrator => '교정기';

  @override
  String get tabDiagnostics => '진단';

  @override
  String get renameRobot => '로봇 이름 바꾸기';

  @override
  String get bleDiagnostics => 'BLE 진단';

  @override
  String get erasePresets => '저장된 사전 설정 지우기';

  @override
  String get disconnect => '연결 끊기';

  @override
  String get unpairRobot => '로봇 페어링 해제';

  @override
  String get factoryReset => '공장 초기화';

  @override
  String get servoManualJog => '서보 수동 조그';

  @override
  String get homeAll => '홈 전체';

  @override
  String get foldingTimeline => '접는 타임라인';

  @override
  String get addStep => '단계 추가';

  @override
  String get previewOnRobot => '로봇에 대한 미리보기';

  @override
  String get saveToButton => '버튼에 저장';

  @override
  String get themeTitle => '주제';

  @override
  String get themeSystem => '장치';

  @override
  String get themeLight => '빛';

  @override
  String get themeDark => '어두운';

  @override
  String get connectedBadge => '연결됨';

  @override
  String get inRangeBadge => '범위 내';

  @override
  String get offlineBadge => '오프라인';

  @override
  String get openButton => '열려 있는';

  @override
  String get connectButton => '연결하다';

  @override
  String get reconnectButton => '다시 연결';

  @override
  String get pairAndConnect => '페어링 및 연결';

  @override
  String get autoScanningForRobots => '로봇 자동 스캔 중...';

  @override
  String get scanningIdle => '유휴 스캔 중';

  @override
  String get nearbyRobotsAppear => '주변 로봇이 여기에 자동으로 나타납니다.';

  @override
  String get yourNearbyRobotsAppear => '근처에 있는 로봇이 여기에 자동으로 나타납니다.';

  @override
  String get signalStrong => '강한';

  @override
  String get signalGood => '좋은';

  @override
  String get signalWeak => '약한';

  @override
  String get addRobotIntro =>
      '아래에서 페어링할 로봇을 선택하세요. 근처에 페어링 모드인 로봇이 있으면 상단에서 자동으로 검색됩니다.';

  @override
  String get autoDiscoveredRobot => '자동으로 발견된 로봇';

  @override
  String get autoDiscoveredRobots => '자동으로 발견된 로봇';

  @override
  String readyCountBadge(Object count) {
    return '$count 준비됨';
  }

  @override
  String get supportedRobots => '지원되는 로봇';

  @override
  String get clothesFoldingRobot => '옷 접는 로봇';

  @override
  String get fabricaDescription =>
      '여러 의류 사전 설정 및 촉각 단일 버튼 작동 기능을 갖춘 자동화된 의류 폴더입니다.';

  @override
  String get fabricaPairingHint =>
      '페어링 모드: Fabrica 제어판의 아무 버튼이나 3초 동안 길게 누릅니다(상태 LED가 빠르게 깜박입니다).';

  @override
  String get pairFabricaNow => '지금 FABRICA를 페어링하세요';

  @override
  String get backToHome => '홈으로 돌아가기';

  @override
  String get connReady => '준비가 된';

  @override
  String get connConnecting => '연결 중';

  @override
  String get connDiscovering => '발견';

  @override
  String get connBonding => '본딩';

  @override
  String get connScanning => '스캐닝';

  @override
  String get connDisconnected => '연결이 끊김';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name에서 연결을 끊으시겠습니까?';
  }

  @override
  String get disconnectConfirmBody => '홈 화면에서 언제든지 다시 연결할 수 있습니다.';

  @override
  String get cancelButton => '취소';

  @override
  String get saveButton => '구하다';

  @override
  String get customNickname => '맞춤 닉네임';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name 페어링을 해제하시겠습니까?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return '이 휴대전화의 로봇에서 $name이(가) 제거됩니다. 언제든지 다시 추가할 수 있습니다.\n\n참고: 로봇 메모리를 완전히 지우고 공장 기본값으로 복원하려면 \"공장 재설정\"을 사용하십시오.';
  }

  @override
  String get unpairButton => '페어링 해제';

  @override
  String get machineIdle => '게으른';

  @override
  String get machineRunning => '달리기';

  @override
  String get machineEstop => '비상 정지';

  @override
  String get machineError => '오류';

  @override
  String get machineCalibrating => '교정 중';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => '저장됨';

  @override
  String get ledInputErr => '입력 오류';

  @override
  String get ledPairing => '편성';

  @override
  String get ledConnected => '연결됨';

  @override
  String get ledIdentify => '식별하다';

  @override
  String get identifyButton => '식별하다';

  @override
  String get identifyingToast => '로봇 LED가 3초 동안 깜박입니다...';

  @override
  String get homingToast => '모든 플랩 원점 복귀...';

  @override
  String get i2cFault => 'I2C 오류';

  @override
  String get storageFault => '저장 오류';

  @override
  String get estopLatched => '비상 정지 래치';

  @override
  String get presetButtonsTitle => '사전 설정 버튼';

  @override
  String customizePresetTitle(Object label) {
    return '$label 맞춤설정';
  }

  @override
  String get subtitleNameLabel => '자막 이름';

  @override
  String get subtitleNameHint => '예를 들어 빠른 접기, 셔츠, 맞춤...';

  @override
  String get buttonColorLabel => '버튼 색상';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return '단계 $current/$total($pct%)';
  }

  @override
  String get emergencyStop => '비상정지';

  @override
  String get clearEstop => '지우기 및 잠금 해제 비상 정지';

  @override
  String get clearEstopHint => '비상 정지를 재설정하고 로봇을 유휴 상태로 되돌립니다.';

  @override
  String get stopButton => '멈추다';

  @override
  String get fabricaArrangementTitle => '패브릭 배열';

  @override
  String get editArrangement => '배열 수정';

  @override
  String get addPanel => '패널 추가';

  @override
  String get legendMotorized => '전동식';

  @override
  String get legendFollower => '수행원';

  @override
  String get legendBase => '베이스';

  @override
  String get colsLabel => '콜스';

  @override
  String get rowsLabel => '행';

  @override
  String stepSelectedHint(Object step) {
    return '$step 단계 선택: 그리드에서 1~2 전동 패널을 탭합니다.';
  }

  @override
  String get tapPanelsHint => '그리드에서 1~2개의 모터 패널을 탭합니다.';

  @override
  String get dualBadge => '듀얼';

  @override
  String get requiresMotorizedPanel => '최소 1개의 전동 패널 필요(최대 2개)';

  @override
  String get selectedChangePanelsHint => '선택됨 • 그리드 패널을 탭하여 변경(최대 2개)';

  @override
  String stepOfTotal(Object step, Object total) {
    return '$total의 $step 단계';
  }

  @override
  String get removeStepTooltip => '단계 제거';

  @override
  String get requiresMotorizedModuleWarning =>
      '루틴에는 Fabrica 배열의 전동 모듈이 하나 이상 필요합니다.';

  @override
  String get routineFull => '루틴 전체(16/16단계)';

  @override
  String addStepCount(Object count) {
    return '단계 추가($count/16)';
  }

  @override
  String get saveRoutineToRobot => '루틴을 로봇에 저장';

  @override
  String get selectButtonToProgram => '이 루틴으로 프로그래밍할 실제 로봇 버튼을 선택하세요.';

  @override
  String buttonNumber(Object slot) {
    return '버튼 $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return '하드웨어 버튼 $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return '버튼 $slot 자막(선택사항)';
  }

  @override
  String get saveToRobotButton => '로봇에 저장';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return '버튼 $slot($count 단계)';
  }

  @override
  String get adultTshirtTemplate => '성인 티셔츠 템플릿';

  @override
  String get longSleeveTemplate => '긴팔 템플릿';

  @override
  String get dualSweepTemplate => '이중 스윕 템플릿';

  @override
  String channelNumber(Object number) {
    return '채널 $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count 페어링됨';
  }

  @override
  String get moreHardwareOptions => '추가 하드웨어 옵션';

  @override
  String get loadTemplate => '템플릿 로드';

  @override
  String get controllerLabel => '제어 장치';

  @override
  String get motorBadge => '모터';

  @override
  String get followerBadge => '수행원';

  @override
  String get baseBadge => '베이스';

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
