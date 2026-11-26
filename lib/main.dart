import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/ble/ble_providers.dart';
import 'core/ble/ble_transport_interface.dart';
import 'core/localization/locale_provider.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_mode_provider.dart';
import 'l10n/app_localizations.dart';
import 'screens/landing_dashboard_screen.dart';
import 'ui_engine/dynamic_screen_scaffold.dart';

// coverage:ignore-start
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>(LocaleNotifier.boxName);
  runApp(const ProviderScope(child: AirRoboticsApp()));
}
// coverage:ignore-end

/// Root widget for the AIR Robotics mobile companion.
class AirRoboticsApp extends ConsumerWidget {
  const AirRoboticsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLocale = ref.watch(localeProvider);
    final selectedThemeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      onGenerateTitle: (context) =>
          AppLocalizations.of(context)?.appTitle ?? 'AIR Robotics',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: selectedThemeMode,
      locale: selectedLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: const AppHomeShell(),
    );
  }
}

/// Root shell dynamically switching between landing onboarding
/// and dynamic robot profile interface upon connection.
class AppHomeShell extends ConsumerWidget {
  const AppHomeShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isViewing = ref.watch(isViewingDeviceProvider);
    final connStateAsync = ref.watch(bleConnectionStateProvider);
    final connState = connStateAsync.value ??
        ref.read(bleConnectionManagerProvider).currentState;

    if (isViewing && connState == BleConnectionState.ready) {
      return const DynamicScreenScaffold();
    }
    return const LandingDashboardScreen();
  }
}

/// Backward compatibility alias for the landing dashboard.
typedef AirDashboardScreen = LandingDashboardScreen;
