// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'AIR Robotics';

  @override
  String get homeHeader => 'AIR ROBOTICS';

  @override
  String get settingsTitle => '設定';

  @override
  String get appLanguageTitle => 'アプリの言語';

  @override
  String get appVersionTitle => 'アプリバージョン';

  @override
  String get languageSectionTitle => '言語';

  @override
  String get languageSystemDefault => 'システムデフォルト（デバイスの言語）';

  @override
  String get selectLanguageHint => '言語を選択';

  @override
  String get addDeviceTitle => '新しいロボットを追加';

  @override
  String get addDeviceSubtitle => 'AIRロボットをペアリング';

  @override
  String get yourRobots => 'あなたのロボット';

  @override
  String get discoveredRobots => '検出されたロボット';

  @override
  String get noRobotsPairedYet => 'ペアリングされたロボットはありません';

  @override
  String get noRobotsPairedSubtitle => 'ロボットを接続してテレメトリを表示し、プリセットを管理し、操作を制御します。';

  @override
  String get addYourFirstRobot => '最初のロボットを追加';

  @override
  String get autoScanning => '自動スキャン中';

  @override
  String get idleStatus => '待機中';

  @override
  String get tabControl => 'コントロール';

  @override
  String get tabSequencer => 'シーケンサー';

  @override
  String get tabCalibrator => 'キャリブレーター';

  @override
  String get tabDiagnostics => '診断';

  @override
  String get renameRobot => 'ロボット名を変更';

  @override
  String get bleDiagnostics => 'BLE診断';

  @override
  String get erasePresets => '保存済みプリセットを消去';

  @override
  String get disconnect => '切断';

  @override
  String get unpairRobot => 'ペアリング解除';

  @override
  String get factoryReset => '工場出荷時設定にリセット';

  @override
  String get servoManualJog => 'サーボ手動ジョグ';

  @override
  String get homeAll => 'すべてホーム';

  @override
  String get foldingTimeline => '折りたたみタイムライン';

  @override
  String get addStep => 'ステップを追加';

  @override
  String get previewOnRobot => 'ロボットでプレビュー';

  @override
  String get saveToButton => 'ボタンに保存';

  @override
  String get themeTitle => 'テーマ';

  @override
  String get themeSystem => 'デバイス';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get connectedBadge => '接続済み';

  @override
  String get inRangeBadge => '範囲内';

  @override
  String get offlineBadge => 'オフライン';

  @override
  String get openButton => '開く';

  @override
  String get connectButton => '接続';

  @override
  String get reconnectButton => '再接続';

  @override
  String get pairAndConnect => 'ペアリングして接続する';

  @override
  String get autoScanningForRobots => 'ロボットの自動スキャン...';

  @override
  String get scanningIdle => 'スキャンアイドル中';

  @override
  String get nearbyRobotsAppear => '近くのロボットがここに自動的に表示されます。';

  @override
  String get yourNearbyRobotsAppear => '近くのロボットが自動的にここに表示されます。';

  @override
  String get signalStrong => '強い';

  @override
  String get signalGood => '良い';

  @override
  String get signalWeak => '弱い';

  @override
  String get addRobotIntro =>
      'ペアリングするロボットを以下から選択します。ペアリング モードで近くにあるロボットは上部で自動的に検出されます。';

  @override
  String get autoDiscoveredRobot => '自動検出されたロボット';

  @override
  String get autoDiscoveredRobots => '自動検出されたロボット';

  @override
  String readyCountBadge(Object count) {
    return '$count 準備完了';
  }

  @override
  String get supportedRobots => 'サポートされているロボット';

  @override
  String get clothesFoldingRobot => '洋服たたみロボット';

  @override
  String get fabricaDescription => '複数の衣類のプリセットと触覚的なシングルボタン操作を備えた自動衣類フォルダ。';

  @override
  String get fabricaPairingHint =>
      'ペアリング モード: Fabrica コントロール パネルのいずれかのボタンを 3 秒間押し続けます (ステータス LED が速く点滅します)。';

  @override
  String get pairFabricaNow => '今すぐファブリックをペアリング';

  @override
  String get backToHome => 'ホームに戻る';

  @override
  String get connReady => '準備ができて';

  @override
  String get connConnecting => '接続中';

  @override
  String get connDiscovering => '発見する';

  @override
  String get connBonding => 'ボンディング';

  @override
  String get connScanning => '走査';

  @override
  String get connDisconnected => '切断されました';

  @override
  String disconnectConfirmTitle(Object name) {
    return '$name から切断しますか?';
  }

  @override
  String get disconnectConfirmBody => 'ホーム画面からいつでも再接続できます。';

  @override
  String get cancelButton => 'キャンセル';

  @override
  String get saveButton => '保存';

  @override
  String get customNickname => 'カスタムニックネーム';

  @override
  String unpairConfirmTitle(Object name) {
    return '$name のペアリングを解除しますか?';
  }

  @override
  String unpairConfirmBody(Object name) {
    return 'これにより、この電話のロボットから $name が削除されます。いつでも再追加できます。\n\n注: ロボットのメモリを完全に消去し、工場出荷時のデフォルトに戻すには、「工場出荷時の状態にリセット」を使用します。';
  }

  @override
  String get unpairButton => 'ペアリングを解除する';

  @override
  String get machineIdle => 'アイドル';

  @override
  String get machineRunning => 'ランニング中';

  @override
  String get machineEstop => '非常停止';

  @override
  String get machineError => 'エラー';

  @override
  String get machineCalibrating => '校正中';

  @override
  String ledLabel(Object state) {
    return 'LED: $state';
  }

  @override
  String get ledSaved => '保存されました';

  @override
  String get ledInputErr => '入力エラー';

  @override
  String get ledPairing => 'ペアリング';

  @override
  String get ledConnected => '接続済み';

  @override
  String get ledIdentify => '識別する';

  @override
  String get identifyButton => '識別する';

  @override
  String get identifyingToast => 'ロボット LED が 3 秒間点滅します...';

  @override
  String get homingToast => 'すべてのフラップをホーミングします...';

  @override
  String get i2cFault => 'I2C フォルト';

  @override
  String get storageFault => 'ストレージ障害';

  @override
  String get estopLatched => '非常停止ラッチ付き';

  @override
  String get presetButtonsTitle => 'プリセットボタン';

  @override
  String customizePresetTitle(Object label) {
    return '$label をカスタマイズする';
  }

  @override
  String get subtitleNameLabel => 'サブタイトル名';

  @override
  String get subtitleNameHint => '例えばクイックフォールド、シャツ、カスタム...';

  @override
  String get buttonColorLabel => 'ボタンの色';

  @override
  String stepProgressLabel(Object current, Object pct, Object total) {
    return 'ステップ $current/$total ($pct%)';
  }

  @override
  String get emergencyStop => '緊急停止';

  @override
  String get clearEstop => '非常停止をクリアしてラッチを解除する';

  @override
  String get clearEstopHint => '非常停止をリセットし、ロボットをアイドル状態に戻します';

  @override
  String get stopButton => '停止';

  @override
  String get fabricaArrangementTitle => 'ファブリカアレンジメント';

  @override
  String get editArrangement => 'アレンジメントを編集する';

  @override
  String get addPanel => 'パネルの追加';

  @override
  String get legendMotorized => '電動式';

  @override
  String get legendFollower => 'フォロワー';

  @override
  String get legendBase => 'ベース';

  @override
  String get colsLabel => 'コル';

  @override
  String get rowsLabel => '行';

  @override
  String stepSelectedHint(Object step) {
    return 'ステップ $step が選択されました: グリッド上の 1 ～ 2 個の電動パネルをタップします';
  }

  @override
  String get tapPanelsHint => 'グリッド上の 1 ～ 2 個のモーター パネルをタップします';

  @override
  String get dualBadge => 'デュアル';

  @override
  String get requiresMotorizedPanel => '少なくとも 1 つの電動パネルが必要です (最大 2 つ)';

  @override
  String get selectedChangePanelsHint => '選択済み • グリッドパネルをタップして変更します（最大 2 つ）';

  @override
  String stepOfTotal(Object step, Object total) {
    return 'ステップ $step/$total';
  }

  @override
  String get removeStepTooltip => 'ステップの削除';

  @override
  String get requiresMotorizedModuleWarning =>
      'ルーチンには、ファブリカ アレンジメントの電動モジュールが少なくとも 1 つ必要です。';

  @override
  String get routineFull => 'ルーチンフル (16/16 ステップ)';

  @override
  String addStepCount(Object count) {
    return 'ステップを追加 ($count/16)';
  }

  @override
  String get saveRoutineToRobot => 'ルーチンをロボットに保存';

  @override
  String get selectButtonToProgram => 'このルーチンでプログラムする物理的なロボット ボタンを選択します。';

  @override
  String buttonNumber(Object slot) {
    return 'ボタン$slot';
  }

  @override
  String hardwareButtonNumber(Object slot) {
    return 'ハードウェア ボタン $slot';
  }

  @override
  String buttonSubtitleLabel(Object slot) {
    return 'ボタン $slot サブタイトル (オプション)';
  }

  @override
  String get saveToRobotButton => 'ロボットに保存';

  @override
  String buttonNumberCount(Object count, Object slot) {
    return 'ボタン $slot ($count ステップ)';
  }

  @override
  String get adultTshirtTemplate => '大人用 T シャツ テンプレート';

  @override
  String get longSleeveTemplate => '長袖テンプレート';

  @override
  String get dualSweepTemplate => 'デュアル スイープ テンプレート';

  @override
  String channelNumber(Object number) {
    return 'チャンネル $number';
  }

  @override
  String pairedCountBadge(Object count) {
    return '$count ペアリングされました';
  }

  @override
  String get moreHardwareOptions => 'その他のハードウェア オプション';

  @override
  String get loadTemplate => 'テンプレートのロード';

  @override
  String get controllerLabel => 'コントローラ';

  @override
  String get motorBadge => 'モーター';

  @override
  String get followerBadge => 'フォロワー';

  @override
  String get baseBadge => 'ベース';

  @override
  String pairModelTitle(Object model) {
    return '$model をペアリング';
  }

  @override
  String get stopScan => 'スキャン停止';

  @override
  String get rescan => '再スキャン';

  @override
  String searchingForNearby(Object model) {
    return '近くの $model を検索中...';
  }

  @override
  String get scanPaused => 'スキャン一時停止';

  @override
  String filteringForBle(Object prefix) {
    return '\"$prefix*\" の BLE アドバタイズをフィルタリング中';
  }

  @override
  String get tapRefreshToRestart => '上部の更新ボタンをタップしてスキャンを再開します';

  @override
  String get fabricaPairingInstructions => 'FABRICA ペアリング手順';

  @override
  String get pairingProcedure => 'ペアリング手順';

  @override
  String get pairStep1Fabrica => 'Fabrica ロボットの電源を入れます。';

  @override
  String get pairStep2Fabrica =>
      'Fabrica コントロールパネルの任意のボタンを 3 秒間長押ししてペアリングモードに入ります。';

  @override
  String get pairStep3Fabrica => 'ペアリングモードが有効になると、ステータス LED が高速点滅します。';

  @override
  String pairStep1Generic(Object model) {
    return '$model ロボットの電源を入れます。';
  }

  @override
  String get pairStep2Generic =>
      'ロボットの Bluetooth ペアリングモードが有効になっていることを確認してください。';

  @override
  String searchingForModel(Object model) {
    return '$model を検索中...';
  }

  @override
  String get noMatchingRobotsYet => '一致するロボットはまだ見つかっていません';

  @override
  String get makeSureRobotPowered => 'ロボットの電源が入っており、範囲内にあることを確認してください。';

  @override
  String get checkPowerSwitch => '電源スイッチを確認し、右上のアイコンをタップして再スキャンしてください。';

  @override
  String failedToConnect(Object error, Object name) {
    return '$name への接続に失敗しました: $error';
  }

  @override
  String get restoreDefaultPresetsTitle => 'デフォルトのボタンプリセットを復元しますか？';

  @override
  String get restoreDefaultPresetsBody =>
      'ロボット上のカスタムボタンルーチンがすべて消去され、ボタン 1〜4 がデフォルトにリセットされます。\n\n続行してもよろしいですか？';

  @override
  String get presetsRestoredToast => 'ロボットのすべてのボタンプリセットがデフォルトに復元されました。';

  @override
  String get eraseAllPresetsButton => 'ロボットの全プリセットを消去';

  @override
  String get factoryResetTitle => 'Fabrica を工場出荷時設定にリセットしますか？';

  @override
  String get factoryResetBody =>
      'Fabrica を工場出荷時設定にリセットします：\n\n• メモリ内のカスタムルーチンをすべて消去します。\n• すべてのフラップをホーム位置 (0°) に戻します。\n• 保存された Bluetooth ペアリングキーを消去します。\n• Bluetooth を切断してペアリングモードを再開します。\n\nこの端末の「あなたのデバイス」からロボットが削除されます。';

  @override
  String get executingFactoryReset => 'Fabrica 工場出荷時リセットを実行中...';

  @override
  String get resetEverythingButton => 'すべてリセット';

  @override
  String get editFabricaArrangementTitle => 'Fabrica 配置を編集';

  @override
  String get doneButton => '完了';

  @override
  String moduleNumber(Object number) {
    return 'モジュール #$number';
  }

  @override
  String pairingModeHintError(Object name) {
    return '$name とペアリングできませんでした。ロボットがペアリングモード（LEDが高速点滅するまでボタンを3秒間長押し）になっていることを確認して再試行してください。';
  }
}
