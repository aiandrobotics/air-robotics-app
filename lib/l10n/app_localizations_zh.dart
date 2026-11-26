// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => '设置';

  @override
  String get appLanguageTitle => '应用语言';

  @override
  String get appVersionTitle => '应用版本';

  @override
  String get languageSectionTitle => '语言';

  @override
  String get languageSystemDefault => '系统默认（设备语言）';

  @override
  String get selectLanguageHint => '选择语言';

  @override
  String get addDeviceTitle => '添加新机器人';

  @override
  String get addDeviceSubtitle => '配对 AIR 机器人';

  @override
  String get yourRobots => '您的机器人';

  @override
  String get discoveredRobots => '发现的机器人';

  @override
  String get noRobotsPairedYet => '尚未配对机器人';

  @override
  String get noRobotsPairedSubtitle => '连接您的机器人以查看遥测、管理预设并控制操作。';

  @override
  String get addYourFirstRobot => '添加您的第一个机器人';

  @override
  String get autoScanning => '自动扫描中';

  @override
  String get idleStatus => '空闲';

  @override
  String get tabControl => '控制';

  @override
  String get tabSequencer => '序列器';

  @override
  String get tabCalibrator => '校准器';

  @override
  String get tabDiagnostics => '诊断';

  @override
  String get renameRobot => '重命名机器人';

  @override
  String get bleDiagnostics => 'BLE 诊断';

  @override
  String get erasePresets => '清除已保存预设';

  @override
  String get disconnect => '断开连接';

  @override
  String get unpairRobot => '取消配对机器人';

  @override
  String get factoryReset => '恢复出厂设置';

  @override
  String get servoManualJog => '舵机手动微调';

  @override
  String get homeAll => '全部归位';

  @override
  String get foldingTimeline => '折叠时间线';

  @override
  String get addStep => '添加步骤';

  @override
  String get previewOnRobot => '在机器人上预览';

  @override
  String get saveToButton => '保存到按钮';

  @override
  String get themeTitle => '主题';

  @override
  String get themeSystem => '跟随设备';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get connectedBadge => '已连接';

  @override
  String get inRangeBadge => '在范围内';

  @override
  String get offlineBadge => '离线';

  @override
  String get openButton => '打开';

  @override
  String get connectButton => '连接';

  @override
  String get reconnectButton => '重新连接';

  @override
  String get pairAndConnect => '配对和连接';

  @override
  String get autoScanningForRobots => '自动扫描机器人...';

  @override
  String get scanningIdle => '扫描空闲';

  @override
  String get nearbyRobotsAppear => '附近的机器人会自动出现在这里。';

  @override
  String get yourNearbyRobotsAppear => '您附近的机器人将自动出现在此处。';

  @override
  String get signalStrong => '强的';

  @override
  String get signalGood => '好的';

  @override
  String get signalWeak => '虚弱的';

  @override
  String get addRobotIntro => '选择下面的机器人进行配对。任何附近处于配对模式的机器人都会在顶部自动发现。';

  @override
  String get autoDiscoveredRobot => '自动发现的机器人';

  @override
  String get autoDiscoveredRobots => '自动发现的机器人';

  @override
  String readyCountBadge(Object count) {
    return '$count 准备就绪';
  }

  @override
  String get supportedRobots => '支持的机器人';

  @override
  String get clothesFoldingRobot => '叠衣服机器人';

  @override
  String get fabricaDescription => '具有多服装预设和触觉单按钮操作的自动服装文件夹。';

  @override
  String get fabricaPairingHint =>
      '配对模式：按住 Fabrica 控制面板上的任意按钮 3 秒钟（状态 LED 将快速闪烁）。';

  @override
  String get pairFabricaNow => '立即配对织物';

  @override
  String get backToHome => '返回首页';

  @override
  String get connReady => '准备好';

  @override
  String get connConnecting => '连接';

  @override
  String get connDiscovering => '发现';

  @override
  String get connBonding => '粘合';

  @override
  String get connScanning => '扫描';

  @override
  String get connDisconnected => '已断开连接';

  @override
  String disconnectConfirmTitle(Object name) {
    return '与 $name 断开连接？';
  }

  @override
  String get disconnectConfirmBody => '您可以随时从主屏幕重新连接。';

  @override
  String get cancelButton => '取消';

  @override
  String get saveButton => '节省';

  @override
  String get customNickname => '自定义昵称';

  @override
  String unpairConfirmTitle(Object name) {
    return '取消配对 $name？';
  }

  @override
  String unpairConfirmBody(Object name) {
    return '这将从这部手机上的您的机器人中删除 $name。您可以随时重新添加它。\n\n注意：要完全擦除机器人内存并恢复出厂默认设置，请使用“恢复出厂设置”。';
  }

  @override
  String get unpairButton => '取消配对';

  @override
  String get machineIdle => '闲置的';

  @override
  String get machineRunning => '跑步';

  @override
  String get machineEstop => '急停';

  @override
  String get machineError => '错误';

  @override
  String get machineCalibrating => '校准';

  @override
  String ledLabel(Object state) {
    return 'LED：$state';
  }

  @override
  String get ledSaved => '已保存';

  @override
  String get ledInputErr => '输入错误';

  @override
  String get ledPairing => '配对';

  @override
  String get ledConnected => '连接';

  @override
  String get ledIdentify => '确认';

  @override
  String get identifyButton => '确认';

  @override
  String get identifyingToast => '机器人 LED 闪烁 3 秒...';

  @override
  String get homingToast => '使所有襟翼归位...';

  @override
  String get i2cFault => 'I2C 故障';

  @override
  String get storageFault => '存储故障';

  @override
  String get estopLatched => '急停锁定';

  @override
  String get presetButtonsTitle => '预设按钮';

  @override
  String customizePresetTitle(Object label) {
    return '自定义 $label';
  }

  @override
  String get subtitleNameLabel => '字幕名称';

  @override
  String get subtitleNameHint => '例如快速折叠、衬衫、定制...';

  @override
  String get buttonColorLabel => '按钮颜色';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return '步骤 $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => '紧急停止';

  @override
  String get clearEstop => '清除并解锁紧急停止按钮';

  @override
  String get clearEstopHint => '重置紧急停止并使机器人返回空闲状态';

  @override
  String get stopButton => '停止';

  @override
  String get fabricaArrangementTitle => '面料安排';

  @override
  String get editArrangement => '编辑安排';

  @override
  String get addPanel => '添加面板';

  @override
  String get legendMotorized => '机动化';

  @override
  String get legendFollower => '追随者';

  @override
  String get legendBase => '根据';

  @override
  String get colsLabel => '科尔斯';

  @override
  String get rowsLabel => '行数';

  @override
  String stepSelectedHint(Object step) {
    return '选择步骤 $step：点击网格上的 1-2 个电动面板';
  }

  @override
  String get tapPanelsHint => '点击网格上的 1-2 个电机面板';

  @override
  String get dualBadge => '双重的';

  @override
  String get requiresMotorizedPanel => '需要至少 1 个电动面板（最多 2 个）';

  @override
  String get selectedChangePanelsHint => '已选择 • 点击网格面板进行更改（最多 2 个）';

  @override
  String stepOfTotal(Object step, Object total) {
    return '$total 的步骤 $step';
  }

  @override
  String get removeStepTooltip => '删除步骤';

  @override
  String get requiresMotorizedModuleWarning =>
      '日常工作需要至少一个 Fabrica Arrangement 的电动模块。';

  @override
  String get routineFull => '完整例程（16/16 步骤）';

  @override
  String addStepCount(Object count) {
    return '添加步骤 ($count/16)';
  }

  @override
  String get saveRoutineToRobot => '将例程保存到机器人';

  @override
  String get selectButtonToProgram => '选择一个物理机器人按钮以使用此例程进行编程：';

  @override
  String buttonNumber(Object slot) {
    return '按钮 $slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return '硬件按钮 $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return '按钮 $slot 字幕（可选）';
  }

  @override
  String get saveToRobotButton => '保存到机器人';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return '按钮 $slot（$count 步骤）';
  }

  @override
  String get adultTshirtTemplate => '成人 T 恤模板';

  @override
  String get longSleeveTemplate => '长袖模板';

  @override
  String get dualSweepTemplate => '双扫模板';

  @override
  String channelNumber(Object number) {
    return '通道 $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count 已配对';
  }

  @override
  String get moreHardwareOptions => '更多硬件选项';

  @override
  String get loadTemplate => '加载模板';

  @override
  String get controllerLabel => '控制器';

  @override
  String get motorBadge => '发动机';

  @override
  String get followerBadge => '追随者';

  @override
  String get baseBadge => '根据';

  @override
  String pairModelTitle(Object model) {
    return '配对 $model';
  }

  @override
  String get stopScan => '停止扫描';

  @override
  String get rescan => '重新扫描';

  @override
  String searchingForNearby(Object model) {
    return '正在搜索附近的 $model...';
  }

  @override
  String get scanPaused => '扫描已暂停';

  @override
  String filteringForBle(Object prefix) {
    return '正在筛选 \"$prefix*\" BLE 广播';
  }

  @override
  String get tapRefreshToRestart => '点击顶部栏中的刷新按钮以重新开始扫描';

  @override
  String get fabricaPairingInstructions => 'FABRICA 配对说明';

  @override
  String get pairingProcedure => '配对步骤';

  @override
  String get pairStep1Fabrica => '打开您的 Fabrica 机器人电源。';

  @override
  String get pairStep2Fabrica => '按住 Fabrica 控制面板上的任意按钮 3 秒钟以进入配对模式。';

  @override
  String get pairStep3Fabrica => '状态 LED 将快速闪烁以确认配对模式已激活。';

  @override
  String pairStep1Generic(Object model) {
    return '打开您的 $model 机器人电源。';
  }

  @override
  String get pairStep2Generic => '确保机器人上的蓝牙配对模式已激活。';

  @override
  String searchingForModel(Object model) {
    return '正在搜索 $model...';
  }

  @override
  String get noMatchingRobotsYet => '尚未发现匹配的机器人';

  @override
  String get makeSureRobotPowered => '请确保您的机器人已开机并在范围内。';

  @override
  String get checkPowerSwitch => '检查电源开关并点击右上角图标重新扫描。';

  @override
  String failedToConnect(Object error, Object name) {
    return '无法连接到 $name：$error';
  }

  @override
  String get restoreDefaultPresetsTitle => '恢复默认按钮预设？';

  @override
  String get restoreDefaultPresetsBody =>
      '这将清除机器人上的所有自定义按钮例程，并将按钮 1–4 重置为默认预设。\n\n确定要继续吗？';

  @override
  String get presetsRestoredToast => '机器人上的所有按钮预设已恢复为默认值。';

  @override
  String get eraseAllPresetsButton => '清除机器人上的所有预设';

  @override
  String get factoryResetTitle => 'Fabrica 恢复出厂设置？';

  @override
  String get factoryResetBody =>
      '这将把 Fabrica 恢复为出厂默认设置：\n\n• 清除内存中的所有自定义例程并恢复出厂默认设置。\n• 将所有翻板放平恢复至初始位置 (0°)。\n• 清除已保存的蓝牙配对密钥。\n• 断开蓝牙并重新启动配对模式。\n\n机器人将从此手机的“您的设备”中移除。';

  @override
  String get executingFactoryReset => '正在执行 Fabrica 恢复出厂设置...';

  @override
  String get resetEverythingButton => '重置所有内容';

  @override
  String get editFabricaArrangementTitle => '编辑 Fabrica 布局';

  @override
  String get doneButton => '完成';

  @override
  String moduleNumber(Object number) {
    return '模块 #$number';
  }

  @override
  String pairingModeHintError(Object name) {
    return '无法与 $name 配对。请确保机器人处于配对模式（按住任意按钮 3 秒直到 LED 快速闪烁），然后重试。';
  }
}
