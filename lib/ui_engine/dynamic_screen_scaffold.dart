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
      builder: (context) => AlertDialog(
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
                'Erase All Presets in Firmware?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: const Text(
          'This will send opcode 0x0C to Fabrica to erase all custom routine sequences from NVS flash memory and reset all button slots back to factory defaults.\n\nAre you sure you want to proceed?',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4),
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Erasing presets in firmware (0x0C)...'),
                  duration: Duration(seconds: 1),
                ),
              );
              try {
                await ref.read(commandPipelineProvider).restoreFactoryPresets();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('All presets successfully erased and restored to factory defaults.'),
                      backgroundColor: AppColors.emerald,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to erase presets in firmware: $e'),
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
          'This will send opcode 0x1F to Fabrica:\n\n'
          '• Wipes all custom routines in flash & restores factory defaults.\n'
          '• Homes all 16 flap servos to 0°.\n'
          '• Erases all bonded phone encryption keys from flash.\n'
          '• Terminates Bluetooth link and restarts indefinite pairing mode.\n\n'
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
                  content: Text('Executing Full Factory Reset (0x1F)...'),
                  backgroundColor: AppColors.crimson,
                ),
              );

              // 1. Determine robot ID before link disconnects
              String? robotId = bleManager.connectedRobot?.id;
              robotId ??= await fleetStorage.getLastConnectedRobotId();

              // 2. Remove robot from mobile fleet storage immediately
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

              // 3. Dispatch opcode 0x1F to firmware
              try {
                await commandPipeline.factoryResetAll();
              } catch (_) {}

              // 4. Disconnect BLE manager and return to home screen
              try {
                await bleManager.disconnect();
              } catch (_) {}
              viewingNotifier.closeDevice();
            },
            child: const Text('RESET EVERYTHING (0x1F)'),
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
                headerTitle,
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
              icon: const Icon(Icons.flare, size: 20, color: AppColors.purple),
              tooltip: 'Identify Robot (Pulse LED 3s)',
              onPressed: () async {
                try {
                  await ref.read(commandPipelineProvider).identifyRobot();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Flashing robot LED for 3s (Opcode 0x0E)...'),
                        duration: Duration(seconds: 2),
                        backgroundColor: AppColors.purple,
                      ),
                    );
                  }
                } catch (_) {}
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete_sweep, size: 22, color: AppColors.crimson),
              tooltip: 'Erase Presets in Firmware',
              onPressed: () => _confirmErasePresets(context),
            ),
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
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, size: 20),
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
                    children: [
                      Icon(Icons.warning_amber_rounded, size: 18, color: AppColors.crimson),
                      SizedBox(width: 8),
                      Text(
                        'Full Factory Reset (0x1F)',
                        style: TextStyle(color: AppColors.crimson),
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
