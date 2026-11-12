import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/ble/ble_providers.dart';
import '../core/ble/ble_transport_interface.dart';
import '../core/ble/developer_debug_screen.dart';
import '../core/fleet/fleet_providers.dart';
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

  void _confirmErasePresets(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusLg),
          side: const BorderSide(color: AppColors.border),
        ),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: AppColors.amber, size: 24),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Restore Factory Presets?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: const Text(
          'This will erase all custom routine sequences from memory and reset all button presets back to factory defaults.\n\nAre you sure you want to proceed?',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('CANCEL', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.crimson,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              try {
                await ref.read(commandPipelineProvider).restoreFactoryPresets();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('All presets successfully restored to factory defaults.'),
                      backgroundColor: AppColors.emerald,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to restore factory presets: $e'),
                      backgroundColor: AppColors.crimson,
                    ),
                  );
                }
              }
            },
            child: const Text('ERASE IN FIRMWARE'),
          ),
        ],
      ),
    );
  }

  void _confirmFactoryResetAll(BuildContext context) {
    final bleManager = ref.read(bleConnectionManagerProvider);
    final commandPipeline = ref.read(commandPipelineProvider);
    final robotsNotifier = ref.read(registeredRobotsProvider.notifier);
    final fleetStorage = ref.read(fleetStorageProvider);
    final bleTransport = ref.read(bleTransportProvider);
    final viewingNotifier = ref.read(isViewingDeviceProvider.notifier);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final activeProfile = ref.read(activeProfileProvider);

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusLg),
          side: const BorderSide(color: AppColors.crimson),
        ),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: AppColors.crimson, size: 26),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Full Hardware Factory Reset?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.crimson,
                ),
              ),
            ),
          ],
        ),
        content: const Text(
          'This will reset Fabrica to factory defaults:\n\n'
          '• Wipes all custom routines in memory & restores factory defaults.\n'
          '• Returns all flaps flat to home position (0°).\n'
          '• Clears saved Bluetooth pairing keys.\n'
          '• Disconnects Bluetooth and restarts pairing mode.\n\n'
          'The robot will be removed from Your Devices on this phone.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
            height: 1.4,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('CANCEL', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.crimson,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              scaffoldMessenger.showSnackBar(
                const SnackBar(
                  content: Text('Executing Full Factory Reset...'),
                  backgroundColor: AppColors.crimson,
                ),
              );

              // 1. Determine robot ID before link disconnects
              String? robotId = bleManager.connectedRobot?.id;
              robotId ??= await fleetStorage.getLastConnectedRobotId();

              // 2. Dispatch factory reset opcode to firmware FIRST while link and security bond are alive!
              try {
                await commandPipeline.factoryResetAll();
              } catch (_) {}

              // Give radio packet time to clear RF buffer before tearing down OS bond
              await Future<void>.delayed(const Duration(milliseconds: 350));

              // 3. Remove robot from mobile fleet storage and purge OS bond
              if (robotId != null) {
                try {
                  await bleTransport.removeBond(robotId);
                } catch (_) {}
                await robotsNotifier.removeRobot(robotId);
              } else {
                final allRegistered = await fleetStorage.getRegisteredRobots();
                for (final r in allRegistered) {
                  if (r.modelNumber == activeProfile.modelNumber || allRegistered.length == 1) {
                    try {
                      await bleTransport.removeBond(r.id);
                    } catch (_) {}
                    await robotsNotifier.removeRobot(r.id);
                  }
                }
              }
              await fleetStorage.setLastConnectedRobotId(null);

              // 4. Disconnect BLE manager and return to home screen
              try {
                await bleManager.disconnect();
              } catch (_) {}
              viewingNotifier.closeDevice();
            },
            child: const Text('RESET EVERYTHING'),
          ),
        ],
      ),
    );
  }

  void _confirmDisconnect(BuildContext context) {
    final bleManager = ref.read(bleConnectionManagerProvider);
    final viewingNotifier = ref.read(isViewingDeviceProvider.notifier);

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Disconnect Robot?'),
        content: const Text(
          'This will disconnect Bluetooth communication with the robot and return to the home screen.',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('CANCEL', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.crimson,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              await bleManager.disconnect();
              viewingNotifier.closeDevice();
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

    final registeredRobots = ref.watch(registeredRobotsProvider).value ?? [];
    final connectedRobot = ref.watch(bleConnectionManagerProvider).connectedRobot;
    final registeredMatch = registeredRobots
        .where((r) => r.id == connectedRobot?.id)
        .firstOrNull;
    final headerTitle =
        registeredMatch?.displayName ?? connectedRobot?.name ?? activeProfile.name;

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
          titleSpacing: 0,
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                headerTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: _connStateColor(connState),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      connState == BleConnectionState.ready
                          ? '${connState.name.toUpperCase()} • ${packet?.bleRssiDbm ?? 0} dBm'
                          : connState.name.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        color: _connStateColor(connState),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              icon: const Icon(Icons.flare, size: 20, color: AppColors.purple),
              tooltip: 'Identify Robot (Pulse LED 3s)',
              onPressed: () async {
                try {
                  await ref.read(commandPipelineProvider).identifyRobot();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Flashing robot LED for 3 seconds...'),
                        duration: Duration(seconds: 2),
                        backgroundColor: AppColors.purple,
                      ),
                    );
                  }
                } catch (_) {}
              },
            ),
            IconButton(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              icon: const Icon(Icons.delete_sweep, size: 20, color: AppColors.crimson),
              tooltip: 'Restore Factory Presets',
              onPressed: () => _confirmErasePresets(context),
            ),
            IconButton(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              icon: const Icon(Icons.link_off, size: 20, color: AppColors.textSecondary),
              tooltip: 'Disconnect Robot',
              onPressed: () => _confirmDisconnect(context),
            ),
            IconButton(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              icon: const Icon(Icons.bug_report, size: 20),
              tooltip: 'Hardware Debugger',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const DeveloperDebugScreen(),
                  ),
                );
              },
            ),
            PopupMenuButton<String>(
              tooltip: 'More Hardware Options',
              color: AppColors.surface,
              onSelected: (value) {
                switch (value) {
                  case 'factory_reset':
                    _confirmFactoryResetAll(context);
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'factory_reset',
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.warning_amber_rounded, size: 18, color: AppColors.crimson),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          'Full Factory Reset',
                          style: TextStyle(color: AppColors.crimson),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
      case 'gamepad' || 'control':
        return Icons.gamepad;
      case 'tune' || 'sequencer':
        return Icons.tune;
      case 'build' || 'calibrate':
        return Icons.build;
      case 'terminal' || 'diagnostics':
        return Icons.terminal;
      default:
        return Icons.dashboard;
    }
  }
}
