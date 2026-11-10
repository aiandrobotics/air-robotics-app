import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/ble/developer_debug_screen.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/app_tokens.dart';

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
      home: const AirDashboardScreen(),
    );
  }
}

/// Landing dashboard showing connection state, theme tokens, and diagnostics.
class AirDashboardScreen extends StatelessWidget {
  const AirDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: AppColors.cyan,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppTokens.space8),
            const Text('AIR ROBOTICS'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bluetooth_searching),
            tooltip: 'BLE Hardware Debugger',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const DeveloperDebugScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: AppTokens.paddingScreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: AppTokens.paddingCard,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Fabrica Cloth Folder',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppTokens.space8,
                              vertical: AppTokens.space4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceHighlight,
                              borderRadius: AppTokens.borderRadiusSm,
                              border: Border.all(color: AppColors.border),
                            ),
                            child: const Text(
                              'READY (PHASE 1)',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppColors.emerald,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppTokens.space8),
                      const Text(
                        'Protocol codecs, IEEE 802.3 CRC32, and device profile schema initialized.',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppTokens.space16),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings_input_antenna,
                        size: 64,
                        color: AppColors.cyan.withValues(alpha: 0.6),
                      ),
                      const SizedBox(height: AppTokens.space16),
                      const Text(
                        'Universal Companion Ready',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: AppTokens.space8),
                      const Text(
                        'Waiting for robot BLE advertisement (Phase 2)',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
