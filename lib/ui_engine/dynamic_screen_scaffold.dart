import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/ble/ble_providers.dart';
import '../core/ble/ble_transport_interface.dart';
import '../core/ble/developer_debug_screen.dart';
import '../core/profile/device_profile.dart';
import '../core/profile/profile_providers.dart';
import '../core/protocol/protocol_providers.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_tokens.dart';
import 'widget_registry.dart';

/// Dynamic, profile-driven screen and tab scaffold.
///
/// Constructs adaptive bottom navigators and component bodies directly from
/// the declarative `DeviceProfile.screens` specification.
class DynamicScreenScaffold extends ConsumerStatefulWidget {
  const DynamicScreenScaffold({super.key});

  @override
  ConsumerState<DynamicScreenScaffold> createState() =>
      _DynamicScreenScaffoldState();
}

class _DynamicScreenScaffoldState extends ConsumerState<DynamicScreenScaffold> {
  int _selectedScreenIndex = 0;

  void _confirmDisconnect(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Disconnect Robot?'),
        content: const Text(
          'This will disconnect Bluetooth communication with the robot and return to the home screen.',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('CANCEL', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.crimson,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
              await ref.read(bleConnectionManagerProvider).disconnect();
              ref.read(isViewingDeviceProvider.notifier).closeDevice();
            },
            child: const Text('DISCONNECT'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeProfile = ref.watch(activeProfileProvider);
    final registry = ref.watch(widgetRegistryProvider);
    final connStateAsync = ref.watch(bleConnectionStateProvider);
    final telemetryAsync = ref.watch(latestTelemetryProvider);

    final connState = connStateAsync.value ??
        ref.read(bleConnectionManagerProvider).currentState;
    final packet =
        telemetryAsync.value ?? ref.read(telemetryBusProvider).latestPacket;

    final screens = activeProfile.screens;
    final safeIndex = _selectedScreenIndex.clamp(
      0,
      screens.isEmpty ? 0 : screens.length - 1,
    );
    final currentScreen = screens.isNotEmpty ? screens[safeIndex] : null;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        ref.read(isViewingDeviceProvider.notifier).closeDevice();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Back to Home',
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
              ref.read(isViewingDeviceProvider.notifier).closeDevice();
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                activeProfile.name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _connStateColor(connState),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    connState == BleConnectionState.ready
                        ? '${connState.name.toUpperCase()} • ${packet?.bleRssiDbm ?? 0} dBm'
                        : connState.name.toUpperCase(),
                    style: TextStyle(
                      fontSize: 11,
                      color: _connStateColor(connState),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.link_off, size: 20, color: AppColors.textSecondary),
              tooltip: 'Disconnect Robot',
              onPressed: () => _confirmDisconnect(context),
            ),
            IconButton(
              icon: const Icon(Icons.bug_report),
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
          child: currentScreen == null
              ? const Center(child: Text('No screens defined in profile'))
              : _buildScreenContent(context, currentScreen, registry),
        ),
        bottomNavigationBar: screens.length > 1
            ? NavigationBar(
                selectedIndex: safeIndex,
                onDestinationSelected: (index) {
                  setState(() => _selectedScreenIndex = index);
                },
                destinations: screens.map((screen) {
                  return NavigationDestination(
                    icon: Icon(_iconForName(screen.icon)),
                    label: screen.title,
                  );
                }).toList(),
              )
            : null,
      ),
    );
  }

  Widget _buildScreenContent(
    BuildContext context,
    AirScreenConfig screen,
    WidgetRegistry registry,
  ) {
    return ListView.separated(
      key: ValueKey(screen.id),
      padding: AppTokens.paddingScreen,
      itemCount: screen.widgets.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppTokens.space12),
      itemBuilder: (context, index) {
        final widgetConfig = screen.widgets[index];
        return registry.buildWidget(context, widgetConfig, ref);
      },
    );
  }

  Color _connStateColor(BleConnectionState state) {
    switch (state) {
      case BleConnectionState.ready:
        return AppColors.emerald;
      case BleConnectionState.connecting:
      case BleConnectionState.discovering:
      case BleConnectionState.bonding:
      case BleConnectionState.scanning:
        return AppColors.amber;
      case BleConnectionState.reconnecting:
        return AppColors.purple;
      case BleConnectionState.disconnected:
      default:
        return AppColors.textMuted;
    }
  }

  IconData _iconForName(String icon) {
    switch (icon.toLowerCase()) {
      case 'gamepad':
      case 'control':
        return Icons.gamepad;
      case 'tune':
      case 'sequencer':
        return Icons.tune;
      case 'build':
      case 'calibrate':
        return Icons.build;
      case 'terminal':
      case 'diagnostics':
        return Icons.terminal;
      default:
        return Icons.dashboard;
    }
  }
}
