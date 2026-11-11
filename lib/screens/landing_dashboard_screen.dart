import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/ble/ble_providers.dart';
import '../core/ble/ble_transport_interface.dart';
import '../core/ble/developer_debug_screen.dart';
import '../core/fleet/fleet_providers.dart';
import '../core/fleet/registered_robot.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_tokens.dart';
import 'add_device_catalog_screen.dart';

/// Consumer-facing landing dashboard featuring registered fleet management,
/// continuous auto-discovery of candidate robots, and direct pairing flows.
class LandingDashboardScreen extends ConsumerStatefulWidget {
  const LandingDashboardScreen({super.key});

  @override
  ConsumerState<LandingDashboardScreen> createState() =>
      _LandingDashboardScreenState();
}

class _LandingDashboardScreenState extends ConsumerState<LandingDashboardScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _radarController;
  String? _connectingDeviceId;
  bool _isAutoConnecting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _radarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Auto-scan continuously on screen mount without requiring manual scan button
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startContinuousAutoScan();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _radarController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // User returned to the app: reset manual disconnect and search to auto-connect
      ref.read(bleConnectionManagerProvider).resetManualDisconnect();
      _startContinuousAutoScan();
      final currentDiscovered = ref.read(discoveredRobotsProvider).value ?? [];
      _checkAndAutoConnect(currentDiscovered);
    }
  }

  void _startContinuousAutoScan() {
    final connState = ref.read(bleConnectionManagerProvider).currentState;
    if (connState == BleConnectionState.ready ||
        connState == BleConnectionState.connecting ||
        connState == BleConnectionState.connected ||
        connState == BleConnectionState.discovering) {
      return;
    }
    final scanner = ref.read(bleScannerProvider);
    scanner.startScan(timeout: const Duration(seconds: 60));
  }

  Future<void> _checkAndAutoConnect(List<DiscoveredRobot> discoveredList) async {
    final manager = ref.read(bleConnectionManagerProvider);
    if (manager.currentState != BleConnectionState.disconnected) return;
    if (manager.isManualDisconnect) return;
    if (_isAutoConnecting) return;

    _isAutoConnecting = true;
    try {
      final registeredList = ref.read(registeredRobotsProvider).value ?? [];
      if (registeredList.isEmpty) return;

      final registeredMap = {for (var r in registeredList) r.id: r};
      final lastId = await ref.read(fleetStorageProvider).getLastConnectedRobotId();

      DiscoveredRobot? candidate;
      if (lastId != null) {
        candidate = discoveredList.where((d) => d.id == lastId).firstOrNull;
      }
      candidate ??= discoveredList.where((d) => registeredMap.containsKey(d.id)).firstOrNull;

      if (candidate != null && mounted) {
        await manager.connect(candidate);
        await ref.read(fleetStorageProvider).setLastConnectedRobotId(candidate.id);
        ref.read(isViewingDeviceProvider.notifier).openDevice();
      }
    } catch (_) {
      // Silently ignore; will retry on next advertisement
    } finally {
      if (mounted) {
        setState(() => _isAutoConnecting = false);
      }
    }
  }

  void _showPermissionInfo(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Row(
          children: [
            Icon(Icons.bluetooth_searching, color: AppColors.cyan, size: 24),
            SizedBox(width: AppTokens.space8),
            Flexible(child: Text('Local Hardware Access')),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AIR Robotics uses Bluetooth Low Energy (BLE) strictly for direct local radio communication with your robot.\n',
              style: TextStyle(fontSize: 13, color: AppColors.textPrimary),
            ),
            Text(
              '• 100% Offline: Commands travel directly over the air without internet.\n'
              '• Zero Tracking: Your device location and identities are never recorded.\n'
              '• No Cloud Account: All garment sequences are stored locally on your device.',
              style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.cyan,
              foregroundColor: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('UNDERSTOOD'),
          ),
        ],
      ),
    );
  }

  Future<void> _connectToDiscoveredRobot(DiscoveredRobot robot) async {
    setState(() => _connectingDeviceId = robot.id);
    ref.read(bleConnectionManagerProvider).resetManualDisconnect();
    try {
      final manager = ref.read(bleConnectionManagerProvider);
      await manager.connect(robot);
      await ref.read(fleetStorageProvider).setLastConnectedRobotId(robot.id);

      // Auto-register newly connected robot in user's saved fleet
      final registered = RegisteredRobot(
        id: robot.id,
        name: robot.name,
        modelNumber: robot.name.toLowerCase().startsWith('fabrica')
            ? 'Fabrica-DevKit-v1'
            : 'AIR-Generic',
        pairedAt: DateTime.now(),
      );
      await ref.read(registeredRobotsProvider.notifier).addRobot(registered);
      ref.read(isViewingDeviceProvider.notifier).openDevice();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to connect to ${robot.name}: $e'),
            backgroundColor: AppColors.crimson,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _connectingDeviceId = null);
      }
    }
  }

  Future<void> _connectToRegisteredRobot(RegisteredRobot registered, DiscoveredRobot? liveMatch) async {
    setState(() => _connectingDeviceId = registered.id);
    ref.read(bleConnectionManagerProvider).resetManualDisconnect();
    try {
      final manager = ref.read(bleConnectionManagerProvider);
      final candidate = liveMatch ??
          DiscoveredRobot(
            id: registered.id,
            name: registered.name,
            rawRssi: -70,
            smoothedRssi: -70.0,
            isPairingMode: false,
            lastSeen: DateTime.now(),
          );
      await manager.connect(candidate);
      await ref.read(fleetStorageProvider).setLastConnectedRobotId(registered.id);
      ref.read(isViewingDeviceProvider.notifier).openDevice();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not reach ${registered.displayName}: $e'),
            backgroundColor: AppColors.crimson,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _connectingDeviceId = null);
      }
    }
  }

  void _showRenameDialog(BuildContext context, RegisteredRobot robot) {
    final textController = TextEditingController(text: robot.customNickname ?? robot.name);
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text(
          'Rename Robot',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: textController,
          autofocus: true,
          style: const TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            labelText: 'Custom Nickname',
            hintText: robot.name,
            hintStyle: const TextStyle(color: AppColors.textMuted),
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('CANCEL', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.cyan,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              final newName = textController.text.trim();
              ref.read(registeredRobotsProvider.notifier).renameRobot(robot.id, newName);
              Navigator.of(context).pop();
            },
            child: const Text('SAVE'),
          ),
        ],
      ),
    );
  }

  void _showUnpairConfirmation(BuildContext context, RegisteredRobot robot) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          'Unpair ${robot.displayName}?',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: Text(
          'This will remove ${robot.displayName} (${robot.id}) from Your Devices. You can re-add it at any time.',
          style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
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
              final manager = ref.read(bleConnectionManagerProvider);
              if (manager.connectedRobot?.id == robot.id ||
                  manager.currentState != BleConnectionState.disconnected) {
                await manager.disconnect();
              }
              try {
                await ref.read(bleTransportProvider).removeBond(robot.id);
              } catch (_) {}
              ref.read(registeredRobotsProvider.notifier).removeRobot(robot.id);
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
            child: const Text('UNPAIR'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<bool>>(isScanningProvider, (prev, next) {
      final isScanning = next.value ?? false;
      if (isScanning && !_radarController.isAnimating) {
        _radarController.repeat();
      } else if (!isScanning && _radarController.isAnimating) {
        _radarController.stop();
        _radarController.reset();
      }
    });

    // Opportunistically auto-connect to registered fleet robot when detected in scan
    ref.listen<AsyncValue<List<DiscoveredRobot>>>(discoveredRobotsProvider, (prev, next) {
      final discoveredList = next.value ?? [];
      _checkAndAutoConnect(discoveredList);
    });

    final isScanningAsync = ref.watch(isScanningProvider);
    final isScanning = isScanningAsync.value ?? false;

    final registeredAsync = ref.watch(registeredRobotsProvider);
    final registeredList = registeredAsync.value ?? [];

    final discoveredAsync = ref.watch(discoveredRobotsProvider);
    final allDiscovered = discoveredAsync.value ?? [];

    // Filter discovered robots: Candidate robots that are NOT yet in Your Devices
    final registeredIds = registeredList.map((r) => r.id).toSet();
    final candidateDiscovered = allDiscovered
        .where((d) => !registeredIds.contains(d.id))
        .toList();

    // Map of live discovered robots by ID for quick status matching in Your Devices
    final discoveredMap = {for (var d in allDiscovered) d.id: d};

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: AppColors.cyan,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.cyan.withValues(alpha: 0.8),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppTokens.space8),
            const Text(
              'AIR ROBOTICS',
              style: TextStyle(
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, size: 20),
            tooltip: 'Permission & Privacy Info',
            onPressed: () => _showPermissionInfo(context),
          ),
          IconButton(
            icon: const Icon(Icons.bug_report, size: 20),
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
        child: SingleChildScrollView(
          padding: AppTokens.paddingScreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Futuristic "ADD DEVICE" Hero Action Banner
              _buildAddDeviceHero(context),

              const SizedBox(height: AppTokens.space24),

              // 2. "YOUR DEVICES" Section
              _buildSectionHeader(
                title: 'YOUR DEVICES',
                badgeText: '${registeredList.length} PAIRED',
                icon: Icons.phonelink,
              ),
              const SizedBox(height: AppTokens.space8),

              if (registeredList.isEmpty)
                _buildEmptyFleetCard(context)
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: registeredList.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppTokens.space8),
                  itemBuilder: (context, index) {
                    final robot = registeredList[index];
                    final liveMatch = discoveredMap[robot.id];
                    return _buildRegisteredRobotCard(
                      robot: robot,
                      liveMatch: liveMatch,
                      isConnecting: _connectingDeviceId == robot.id,
                    );
                  },
                ),

              const SizedBox(height: AppTokens.space24),

              // 3. "DISCOVERED ROBOTS" Section (Continuous Auto-Scan, no manual button needed)
              _buildSectionHeader(
                title: 'DISCOVERED ROBOTS',
                badgeText: isScanning ? 'AUTO-SCANNING' : 'IDLE',
                badgeColor: isScanning ? AppColors.cyan : AppColors.textMuted,
                icon: Icons.radar,
                isScanning: isScanning,
              ),
              const SizedBox(height: AppTokens.space8),

              if (candidateDiscovered.isEmpty)
                _buildEmptyDiscoveredPrompt(isScanning)
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: candidateDiscovered.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppTokens.space8),
                  itemBuilder: (context, index) {
                    final robot = candidateDiscovered[index];
                    return _buildDiscoveredCandidateCard(robot);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddDeviceHero(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppTokens.borderRadiusLg,
        border: Border.all(color: AppColors.cyan.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: AppColors.cyan.withValues(alpha: 0.08),
            blurRadius: 16,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppTokens.borderRadiusLg,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const AddDeviceCatalogScreen(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(AppTokens.space16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.cyan.withValues(alpha: 0.15),
                    borderRadius: AppTokens.borderRadiusMd,
                    border: Border.all(color: AppColors.cyan),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add_circle_outline,
                      color: AppColors.cyan,
                      size: 26,
                    ),
                  ),
                ),
                const SizedBox(width: AppTokens.space16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ADD NEW DEVICE',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Pair Fabrica cloth folder or AIR ecosystem robots',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.cyan,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required String badgeText,
    Color badgeColor = AppColors.cyan,
    required IconData icon,
    bool isScanning = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
                letterSpacing: 0.9,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: badgeColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: badgeColor.withValues(alpha: 0.4)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isScanning) ...[
                RotationTransition(
                  turns: _radarController,
                  child: Icon(icon, size: 12, color: badgeColor),
                ),
                const SizedBox(width: 4),
              ],
              Text(
                badgeText,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: badgeColor,
                  letterSpacing: 0.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyFleetCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTokens.space20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppTokens.borderRadiusLg,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(
            Icons.precision_manufacturing_outlined,
            size: 38,
            color: AppColors.textMuted.withValues(alpha: 0.7),
          ),
          const SizedBox(height: AppTokens.space8),
          const Text(
            'No Devices Paired Yet',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTokens.space4),
          const Text(
            'Add your Fabrica cloth folder to view telemetry, presets, and control flap routines.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppTokens.space12),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.cyan,
              side: const BorderSide(color: AppColors.cyan),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: AppTokens.borderRadiusSm,
              ),
            ),
            icon: const Icon(Icons.add, size: 16),
            label: const Text(
              'ADD YOUR FIRST ROBOT',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const AddDeviceCatalogScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRegisteredRobotCard({
    required RegisteredRobot robot,
    required DiscoveredRobot? liveMatch,
    required bool isConnecting,
  }) {
    final manager = ref.read(bleConnectionManagerProvider);
    final connStateAsync = ref.watch(bleConnectionStateProvider);
    final connState = connStateAsync.value ?? manager.currentState;
    final isConnected = connState == BleConnectionState.ready &&
        manager.connectedRobot?.id == robot.id;
    final isInRange = liveMatch != null || isConnected;
    final rssi = liveMatch?.smoothedRssi;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppTokens.borderRadiusMd,
        border: Border.all(
          color: isConnected
              ? AppColors.emerald.withValues(alpha: 0.8)
              : (isInRange
                  ? AppColors.emerald.withValues(alpha: 0.5)
                  : AppColors.border),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isConnected
                    ? AppColors.emerald.withValues(alpha: 0.25)
                    : (isInRange
                        ? AppColors.emerald.withValues(alpha: 0.15)
                        : AppColors.surfaceHighlight),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isConnected || isInRange
                      ? AppColors.emerald
                      : AppColors.border,
                ),
              ),
              child: Icon(
                Icons.precision_manufacturing,
                size: 22,
                color: isConnected || isInRange
                    ? AppColors.emerald
                    : AppColors.textSecondary,
              ),
            ),
            const SizedBox(width: AppTokens.space12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          robot.displayName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 1.5,
                        ),
                        decoration: BoxDecoration(
                          color: isConnected
                              ? AppColors.emerald.withValues(alpha: 0.25)
                              : (isInRange
                                  ? AppColors.emerald.withValues(alpha: 0.2)
                                  : AppColors.surfaceHighlight),
                          borderRadius: BorderRadius.circular(3),
                          border: isConnected
                              ? Border.all(
                                  color: AppColors.emerald.withValues(alpha: 0.7))
                              : null,
                        ),
                        child: Text(
                          isConnected
                              ? 'CONNECTED'
                              : (isInRange ? 'IN RANGE' : 'OFFLINE'),
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: isConnected || isInRange
                                ? AppColors.emerald
                                : AppColors.textMuted,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        robot.modelNumber,
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      if (isInRange && rssi != null) ...[
                        const Text(' • ', style: TextStyle(color: AppColors.textMuted, fontSize: 10)),
                        _buildRssiBadge(rssi),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppTokens.space8),
            if (isConnected)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.emerald,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppTokens.borderRadiusSm,
                  ),
                ),
                icon: const Icon(Icons.tune, size: 14),
                label: const Text(
                  'OPEN',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  ref.read(isViewingDeviceProvider.notifier).openDevice();
                },
              )
            else
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isInRange ? AppColors.cyan : AppColors.surfaceHighlight,
                  foregroundColor: isInRange ? Colors.black : AppColors.textSecondary,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppTokens.borderRadiusSm,
                  ),
                ),
                onPressed: isConnecting ? null : () => _connectToRegisteredRobot(robot, liveMatch),
                child: isConnecting
                    ? const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      )
                    : Text(
                        isInRange ? 'CONNECT' : 'RECONNECT',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, size: 18, color: AppColors.textSecondary),
              color: AppColors.surface,
              onSelected: (action) async {
                if (action == 'disconnect') {
                  await ref.read(bleConnectionManagerProvider).disconnect();
                } else if (action == 'rename') {
                  _showRenameDialog(context, robot);
                } else if (action == 'unpair') {
                  _showUnpairConfirmation(context, robot);
                }
              },
              itemBuilder: (context) => [
                if (isConnected)
                  const PopupMenuItem(
                    value: 'disconnect',
                    child: Row(
                      children: [
                        Icon(Icons.link_off, size: 16, color: AppColors.amber),
                        SizedBox(width: 8),
                        Text('Disconnect', style: TextStyle(fontSize: 13, color: AppColors.amber)),
                      ],
                    ),
                  ),
                const PopupMenuItem(
                  value: 'rename',
                  child: Row(
                    children: [
                      Icon(Icons.edit, size: 16, color: AppColors.cyan),
                      SizedBox(width: 8),
                      Text('Rename', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'unpair',
                  child: Row(
                    children: [
                      Icon(Icons.link_off, size: 16, color: AppColors.crimson),
                      SizedBox(width: 8),
                      Text('Unpair', style: TextStyle(fontSize: 13, color: AppColors.crimson)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscoveredCandidateCard(DiscoveredRobot robot) {
    final isConnecting = _connectingDeviceId == robot.id;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppTokens.borderRadiusMd,
        border: Border.all(
          color: robot.isPairingMode
              ? AppColors.emerald.withValues(alpha: 0.6)
              : AppColors.border,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: robot.isPairingMode
                    ? AppColors.emerald.withValues(alpha: 0.15)
                    : AppColors.surfaceHighlight,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: robot.isPairingMode
                      ? AppColors.emerald
                      : AppColors.border,
                ),
              ),
              child: Icon(
                Icons.precision_manufacturing,
                size: 22,
                color: robot.isPairingMode ? AppColors.emerald : AppColors.cyan,
              ),
            ),
            const SizedBox(width: AppTokens.space12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          robot.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      if (robot.isPairingMode) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 1.5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.emerald.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const Text(
                            'PAIRING',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: AppColors.emerald,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      _buildRssiBadge(robot.smoothedRssi),
                      const Text(' • ', style: TextStyle(color: AppColors.textMuted, fontSize: 10)),
                      Text(
                        'ID: ${robot.id.substring(0, math.min(10, robot.id.length))}',
                        style: const TextStyle(
                          fontSize: 10,
                          fontFamily: 'monospace',
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppTokens.space8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cyan,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: AppTokens.borderRadiusSm,
                ),
              ),
              onPressed: isConnecting ? null : () => _connectToDiscoveredRobot(robot),
              child: isConnecting
                  ? const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.black,
                      ),
                    )
                  : const Text(
                      'CONNECT',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyDiscoveredPrompt(bool isScanning) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppTokens.borderRadiusLg,
        border: Border.all(color: AppColors.border),
      ),
      child: Center(
        child: Column(
          children: [
            RotationTransition(
              turns: _radarController,
              child: Icon(
                Icons.bluetooth_searching,
                size: 32,
                color: isScanning ? AppColors.cyan : AppColors.textMuted,
              ),
            ),
            const SizedBox(height: AppTokens.space12),
            Text(
              isScanning
                  ? 'Auto-scanning for candidate hardware...'
                  : 'Scanning idle',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppTokens.space4),
            Text(
              isScanning
                  ? 'Hold robot button for 3s to enter pairing mode.'
                  : 'Your nearby robots will appear here automatically.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRssiBadge(double smoothedRssi) {
    final rounded = smoothedRssi.round();
    final bars = rounded >= -65 ? 3 : (rounded >= -80 ? 2 : 1);
    final color = bars == 3
        ? AppColors.emerald
        : (bars == 2 ? AppColors.amber : AppColors.crimson);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(3, (index) {
            final active = index < bars;
            return Container(
              margin: const EdgeInsets.only(right: 1.5),
              width: 2.5,
              height: 4.0 + (index * 2.5),
              decoration: BoxDecoration(
                color: active ? color : AppColors.border,
                borderRadius: BorderRadius.circular(1),
              ),
            );
          }),
        ),
        const SizedBox(width: 4),
        Text(
          '$rounded dBm',
          style: TextStyle(
            fontSize: 10,
            fontFamily: 'monospace',
            color: color,
          ),
        ),
      ],
    );
  }
}
