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
import '../l10n/app_localizations.dart';
import '../visualizers/fabrica/fabrica_arrangement_provider.dart';
import '../visualizers/fabrica/sequencer_programming_provider.dart';
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
        backgroundColor: AppColors.of(context).surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusLg),
          side: BorderSide(color: AppColors.of(context).border),
        ),
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: AppColors.of(context).amber, size: 24),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                AppLocalizations.of(context)?.restoreDefaultPresetsTitle ??
                    'Restore Default Button Presets?',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: Text(
          AppLocalizations.of(context)?.restoreDefaultPresetsBody ??
              'This will erase all custom button routines on the robot and reset Buttons 1–4 back to their default presets.\n\nAre you sure you want to proceed?',
          style: TextStyle(color: AppColors.of(context).textSecondary, fontSize: 13, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              AppLocalizations.of(context)?.cancelButton ?? 'CANCEL',
              style: TextStyle(color: AppColors.of(context).textSecondary),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.of(context).crimson,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              try {
                await ref.read(commandPipelineProvider).restoreFactoryPresets();
                ref.read(savedButtonRoutinesProvider.notifier).clear();
                ref.read(sequencerProgrammingProvider.notifier).resetToDefaults();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        AppLocalizations.of(context)?.presetsRestoredToast ??
                            'All button presets on the robot have been restored to defaults.',
                      ),
                      backgroundColor: AppColors.of(context).emerald,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to reset button presets: $e'),
                      backgroundColor: AppColors.of(context).crimson,
                    ),
                  );
                }
              }
            },
            child: Text(
              AppLocalizations.of(context)?.eraseAllPresetsButton ??
                  'ERASE ALL PRESETS ON ROBOT',
            ),
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
    final profileStorage = ref.read(profileStorageProvider);
    final presetNamesNotifier = ref.read(presetNamesProvider.notifier);
    final presetColorsNotifier = ref.read(presetColorsProvider.notifier);
    final arrangementNotifier = ref.read(fabricaArrangementProvider.notifier);
    final savedRoutinesNotifier = ref.read(savedButtonRoutinesProvider.notifier);
    final sequencerNotifier = ref.read(sequencerProgrammingProvider.notifier);

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.of(context).surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusLg),
          side: BorderSide(color: AppColors.of(context).crimson),
        ),
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: AppColors.of(context).crimson, size: 26),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                AppLocalizations.of(context)?.factoryResetTitle ??
                    'Fabrica Factory Reset?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.of(context).crimson,
                ),
              ),
            ),
          ],
        ),
        content: Text(
          AppLocalizations.of(context)?.factoryResetBody ??
              'This will reset Fabrica to factory defaults:\n\n'
                  '• Wipes all custom routines in memory & restores factory defaults.\n'
                  '• Returns all flaps flat to home position (0°).\n'
                  '• Clears saved Bluetooth pairing keys.\n'
                  '• Disconnects Bluetooth and restarts pairing mode.\n\n'
                  'The robot will be removed from Your Devices on this phone.',
          style: TextStyle(
            color: AppColors.of(context).textSecondary,
            fontSize: 13,
            height: 1.4,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              AppLocalizations.of(context)?.cancelButton ?? 'CANCEL',
              style: TextStyle(color: AppColors.of(context).textSecondary),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.of(context).crimson,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              scaffoldMessenger.showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context)?.executingFactoryReset ??
                        'Executing Fabrica Factory Reset...',
                  ),
                  backgroundColor: AppColors.of(context).crimson,
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

              // 3. Remove robot from mobile fleet storage, clear local device data, and purge OS bond
              final clearedModels = <String>{activeProfile.modelNumber};
              if (robotId != null) {
                try {
                  await bleTransport.removeBond(robotId);
                } catch (_) {}
                await robotsNotifier.removeRobot(robotId);
              } else {
                final allRegistered = await fleetStorage.getRegisteredRobots();
                for (final r in allRegistered) {
                  if (r.modelNumber == activeProfile.modelNumber || allRegistered.length == 1) {
                    clearedModels.add(r.modelNumber);
                    try {
                      await bleTransport.removeBond(r.id);
                    } catch (_) {}
                    await robotsNotifier.removeRobot(r.id);
                  }
                }
              }
              await fleetStorage.setLastConnectedRobotId(null);
              for (final model in clearedModels) {
                await profileStorage.clearDeviceData(model);
              }
              await presetNamesNotifier.clear();
              await presetColorsNotifier.clear();
              savedRoutinesNotifier.clear();
              sequencerNotifier.resetToDefaults();
              arrangementNotifier.resetDefault3x4();

              // 4. Disconnect BLE manager and return to home screen
              try {
                await bleManager.disconnect();
              } catch (_) {}
              viewingNotifier.closeDevice();
            },
            child: Text(
              AppLocalizations.of(context)?.resetEverythingButton ??
                  'RESET EVERYTHING',
            ),
          ),
        ],
      ),
    );
  }

  void _confirmDisconnect(BuildContext context) {
    final bleManager = ref.read(bleConnectionManagerProvider);
    final viewingNotifier = ref.read(isViewingDeviceProvider.notifier);

    final l10n = AppLocalizations.of(context);
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.of(context).surface,
        title: Text(l10n?.disconnect ?? 'Disconnect Robot?'),
        content: Text(
          l10n?.disconnectConfirmBody ??
              'This will disconnect Bluetooth communication with the robot and return you to the home screen.',
          style: TextStyle(color: AppColors.of(context).textSecondary, fontSize: 13),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              l10n?.cancelButton ?? 'CANCEL',
              style: TextStyle(color: AppColors.of(context).textSecondary),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.of(context).crimson,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              await bleManager.disconnect();
              viewingNotifier.closeDevice();
            },
            child: Text(l10n?.disconnect ?? 'DISCONNECT'),
          ),
        ],
      ),
    );
  }

  void _showRenameDialog(BuildContext context, String robotId, String currentName) {
    final textController = TextEditingController(text: currentName);
    final l10n = AppLocalizations.of(context);
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.of(context).surface,
        title: Text(
          l10n?.renameRobot ?? 'Rename Robot',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: textController,
          autofocus: true,
          style: TextStyle(color: AppColors.of(context).textPrimary),
          decoration: InputDecoration(
            labelText: l10n?.customNickname ?? 'Custom Nickname',
            hintText: currentName,
            hintStyle: TextStyle(color: AppColors.of(context).textMuted),
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              l10n?.cancelButton ?? 'CANCEL',
              style: TextStyle(color: AppColors.of(context).textSecondary),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.of(context).cyan,
              foregroundColor: AppColors.of(context).textOnAccent,
            ),
            onPressed: () {
              final newName = textController.text.trim();
              if (newName.isNotEmpty && robotId.isNotEmpty) {
                ref.read(registeredRobotsProvider.notifier).renameRobot(robotId, newName);
              }
              Navigator.of(dialogContext).pop();
            },
            child: Text(l10n?.saveButton ?? 'SAVE'),
          ),
        ],
      ),
    );
  }

  void _confirmUnpair(BuildContext context, String robotId, String robotName) {
    final bleManager = ref.read(bleConnectionManagerProvider);
    final fleetStorage = ref.read(fleetStorageProvider);
    final robotsNotifier = ref.read(registeredRobotsProvider.notifier);
    final viewingNotifier = ref.read(isViewingDeviceProvider.notifier);
    final profileStorage = ref.read(profileStorageProvider);
    final activeProfile = ref.read(activeProfileProvider);
    final presetNamesNotifier = ref.read(presetNamesProvider.notifier);
    final presetColorsNotifier = ref.read(presetColorsProvider.notifier);
    final arrangementNotifier = ref.read(fabricaArrangementProvider.notifier);
    final savedRoutinesNotifier = ref.read(savedButtonRoutinesProvider.notifier);
    final sequencerNotifier = ref.read(sequencerProgrammingProvider.notifier);
    final registeredRobots = ref.read(registeredRobotsProvider).value ?? [];
    final matchingModel = registeredRobots
        .where((r) => r.id == robotId)
        .firstOrNull
        ?.modelNumber;

    final l10n = AppLocalizations.of(context);
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.of(context).surface,
        title: Text(
          l10n?.unpairConfirmTitle(robotName) ?? 'Unpair $robotName?',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: Text(
          l10n?.unpairConfirmBody(robotName) ??
              'This will remove $robotName from Your Robots on this phone. You can re-add it at any time.\n\nNote: To completely wipe robot memory and restore factory defaults, use "Factory Reset".',
          style: TextStyle(fontSize: 13, color: AppColors.of(context).textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              l10n?.cancelButton ?? 'CANCEL',
              style: TextStyle(color: AppColors.of(context).textSecondary),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.of(context).crimson,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              try {
                await bleManager.disconnect();
              } catch (_) {}
              if (robotId.isNotEmpty) {
                final lastId = await fleetStorage.getLastConnectedRobotId();
                if (lastId == robotId) {
                  await fleetStorage.setLastConnectedRobotId(null);
                }
                await robotsNotifier.removeRobot(robotId);
              }
              final modelsToClear = <String>{
                activeProfile.modelNumber,
                if (matchingModel != null && matchingModel.isNotEmpty) matchingModel,
              };
              for (final model in modelsToClear) {
                await profileStorage.clearDeviceData(model);
              }
              await presetNamesNotifier.clear();
              await presetColorsNotifier.clear();
              savedRoutinesNotifier.clear();
              sequencerNotifier.resetToDefaults();
              arrangementNotifier.resetDefault3x4();
              viewingNotifier.closeDevice();
            },
            child: const Text('UNPAIR'),
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

    final connState = connStateAsync.value ??
        ref.read(bleConnectionManagerProvider).currentState;

    final registeredRobots = ref.watch(registeredRobotsProvider).value ?? [];
    final connectedRobot = ref.watch(bleConnectionManagerProvider).connectedRobot;
    final registeredMatch = registeredRobots
        .where((r) => r.id == connectedRobot?.id)
        .firstOrNull ?? (registeredRobots.isNotEmpty ? registeredRobots.first : null);
    final effectiveRobotId = connectedRobot?.id ??
        registeredMatch?.id ??
        '';
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
            tooltip: AppLocalizations.of(context)?.backToHome ?? 'Back to Home',
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
                      _localizedConnState(context, connState),
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
            PopupMenuButton<String>(
              tooltip: AppLocalizations.of(context)?.moreHardwareOptions ??
                  'More Hardware Options',
              color: AppColors.of(context).surface,
              onSelected: (value) async {
                switch (value) {
                  case 'rename':
                    _showRenameDialog(context, effectiveRobotId, headerTitle);
                    break;
                  case 'diagnostics':
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const DeveloperDebugScreen(),
                      ),
                    );
                    break;
                  case 'restore_presets':
                    _confirmErasePresets(context);
                    break;
                  case 'disconnect':
                    _confirmDisconnect(context);
                    break;
                  case 'unpair':
                    _confirmUnpair(context, effectiveRobotId, headerTitle);
                    break;
                  case 'factory_reset':
                    _confirmFactoryResetAll(context);
                    break;
                }
              },
              itemBuilder: (context) {
                final l10n = AppLocalizations.of(context);
                return [
                  PopupMenuItem(
                    value: 'rename',
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.edit, size: 18, color: AppColors.of(context).cyan),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            l10n?.renameRobot ?? 'Rename Robot',
                            style: TextStyle(color: AppColors.of(context).textPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'restore_presets',
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.delete_sweep, size: 18, color: AppColors.of(context).amber),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            l10n?.erasePresets ?? 'Restore Default Button Presets',
                            style: TextStyle(color: AppColors.of(context).textPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'disconnect',
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.link_off, size: 18, color: AppColors.of(context).amber),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            l10n?.disconnect ?? 'Disconnect',
                            style: TextStyle(color: AppColors.of(context).amber),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'unpair',
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.link_off, size: 18, color: AppColors.of(context).crimson),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            l10n?.unpairRobot ?? 'Unpair Robot',
                            style: TextStyle(color: AppColors.of(context).crimson),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'factory_reset',
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.warning_amber_rounded, size: 18, color: AppColors.of(context).crimson),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            l10n?.factoryReset ?? 'Fabrica Factory Reset',
                            style: TextStyle(color: AppColors.of(context).crimson),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'diagnostics',
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.bug_report, size: 18, color: AppColors.of(context).cyan),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            l10n?.bleDiagnostics ?? 'Diagnostics & Debugger',
                            style: TextStyle(color: AppColors.of(context).textPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ];
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
                    label: _localizedScreenTitle(context, screen),
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

  String _localizedScreenTitle(BuildContext context, AirScreenConfig screen) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return screen.title;
    final id = screen.id.toLowerCase();
    if (id.contains('control') || id.contains('dashboard')) {
      return l10n.tabControl;
    }
    if (id.contains('sequencer')) {
      return l10n.tabSequencer;
    }
    if (id.contains('calibrat')) {
      return l10n.tabCalibrator;
    }
    if (id.contains('diagnost') || id.contains('debug')) {
      return l10n.tabDiagnostics;
    }
    return screen.title;
  }

  String _localizedConnState(BuildContext context, BleConnectionState state) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return state.name.toUpperCase();
    switch (state) {
      case BleConnectionState.ready:
        return l10n.connReady;
      case BleConnectionState.connected:
        return l10n.connectedBadge;
      case BleConnectionState.connecting:
        return l10n.connConnecting;
      case BleConnectionState.reconnecting:
        return l10n.reconnectButton;
      case BleConnectionState.discovering:
        return l10n.connDiscovering;
      case BleConnectionState.bonding:
        return l10n.connBonding;
      case BleConnectionState.scanning:
        return l10n.connScanning;
      case BleConnectionState.disconnected:
        return l10n.connDisconnected;
    }
  }

  Color _connStateColor(BleConnectionState state) {
    switch (state) {
      case BleConnectionState.ready:
        return AppColors.of(context).emerald;
      case BleConnectionState.connecting:
      case BleConnectionState.discovering:
      case BleConnectionState.bonding:
      case BleConnectionState.scanning:
        return AppColors.of(context).amber;
      case BleConnectionState.reconnecting:
        return AppColors.of(context).purple;
      case BleConnectionState.disconnected:
      default:
        return AppColors.of(context).textMuted;
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
