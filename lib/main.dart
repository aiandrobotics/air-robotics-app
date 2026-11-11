import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/ble/ble_providers.dart';
import 'core/ble/ble_transport_interface.dart';
import 'core/theme/app_theme.dart';
import 'screens/landing_dashboard_screen.dart';
import 'ui_engine/dynamic_screen_scaffold.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: AirRoboticsApp()));
}

/// Root widget for the AIR Robotics mobile companion.
class AirRoboticsApp extends StatelessWidget {
  const AirRoboticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AIR Robotics',
      theme: AppTheme.darkTheme,
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
