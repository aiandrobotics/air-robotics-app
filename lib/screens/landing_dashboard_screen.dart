import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/ble/ble_providers.dart';
import '../core/ble/ble_transport_interface.dart';
import '../core/fleet/fleet_providers.dart';
import '../core/fleet/registered_robot.dart';
import '../core/profile/profile_providers.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_tokens.dart';
import '../l10n/app_localizations.dart';
import '../visualizers/fabrica/fabrica_arrangement_provider.dart';
import 'add_device_catalog_screen.dart';
import 'settings_screen.dart';

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
    scanner.startScan();
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
      }
    } catch (_) {
      // Silently ignore; will retry on next advertisement
    } finally {
      if (mounted) {
        setState(() => _isAutoConnecting = false);
      }
    }
  }

  Future<void> _connectToDiscoveredRobot(DiscoveredRobot robot) async {
    setState(() => _connectingDeviceId = robot.id);
    ref.read(bleConnectionManagerProvider).resetManualDisconnect();
    try {
      await ref.read(bleScannerProvider).stopScan();
      final manager = ref.read(bleConnectionManagerProvider);
      await manager.connect(robot);
      await ref.read(fleetStorageProvider).setLastConnectedRobotId(robot.id);

      // Auto-register newly connected robot in user's saved fleet
      final registered = RegisteredRobot(
        id: robot.id,
        name: robot.name,
        modelNumber: robot.name.toLowerCase().startsWith('fabrica')
            ? 'Fabrica'
            : 'AIR-Generic',
        pairedAt: DateTime.now(),
      );
      await ref.read(registeredRobotsProvider.notifier).addRobot(registered);
      ref.read(isViewingDeviceProvider.notifier).openDevice();
    } catch (e) {
      if (mounted) {
        final msg = e.toString().toLowerCase();
        final isPairingDrop = msg.contains('disconnected') ||
            msg.contains('pairing') ||
            msg.contains('bond') ||
            msg.contains('19') ||
            msg.contains('133');
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isPairingDrop
                  ? (l10n?.pairingModeHintError(robot.name) ??
                      'Could not pair with ${robot.name}. Make sure the robot is in pairing mode (hold any button for 3 seconds until the LED blinks rapidly) and try again.')
                  : (l10n?.failedToConnect(robot.name, e.toString()) ??
                      'Failed to connect to ${robot.name}: $e'),
            ),
            backgroundColor: AppColors.of(context).crimson,
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
            backgroundColor: AppColors.of(context).crimson,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _connectingDeviceId = null);
      }
    }
  }

  void _showUnpairConfirmation(BuildContext context, RegisteredRobot robot) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.of(context).surface,
        title: Text(
          'Unpair ${robot.displayName}?',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: Text(
          'This will remove ${robot.displayName} from Your Robots on this phone. You can re-add it at any time.\n\nNote: To completely wipe robot memory and restore factory defaults, use "Factory Reset".',
          style: TextStyle(fontSize: 13, color: AppColors.of(context).textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('CANCEL', style: TextStyle(color: AppColors.of(context).textSecondary)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.of(context).crimson,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              final manager = ref.read(bleConnectionManagerProvider);
              final fleetStorage = ref.read(fleetStorageProvider);
              final robotsNotifier = ref.read(registeredRobotsProvider.notifier);
              final profileStorage = ref.read(profileStorageProvider);
              final presetNamesNotifier = ref.read(presetNamesProvider.notifier);
              final presetColorsNotifier = ref.read(presetColorsProvider.notifier);
              final arrangementNotifier = ref.read(fabricaArrangementProvider.notifier);

              if (manager.connectedRobot?.id == robot.id) {
                await manager.disconnect();
              }
              final lastId = await fleetStorage.getLastConnectedRobotId();
              if (lastId == robot.id) {
                await fleetStorage.setLastConnectedRobotId(null);
              }
              await robotsNotifier.removeRobot(robot.id);
              await profileStorage.clearDeviceData(robot.modelNumber);
              await presetNamesNotifier.clear();
              await presetColorsNotifier.clear();
              arrangementNotifier.resetDefault3x4();
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
                color: AppColors.of(context).cyan,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.of(context).cyan.withValues(alpha: 0.8),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppTokens.space8),
            Text(
              AppLocalizations.of(context)?.homeHeader ?? 'AIR ROBOTICS',
              style: const TextStyle(
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: AppLocalizations.of(context)?.settingsTitle ?? 'Settings',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const SettingsScreen(),
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

              // 2. "YOUR ROBOTS" Section
              _buildSectionHeader(
                title: AppLocalizations.of(context)?.yourRobots ?? 'YOUR ROBOTS',
                badgeText: AppLocalizations.of(context)
                        ?.pairedCountBadge(registeredList.length) ??
                    '${registeredList.length} PAIRED',
                icon: Icons.precision_manufacturing,
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

              // 3. "DISCOVERED ROBOTS" Section (Only shown when 0 devices are paired)
              if (registeredList.isEmpty) ...[
                const SizedBox(height: AppTokens.space24),
                _buildSectionHeader(
                  title: AppLocalizations.of(context)?.discoveredRobots ??
                      'DISCOVERED ROBOTS',
                  badgeText: isScanning
                      ? (AppLocalizations.of(context)?.autoScanning ??
                          'AUTO-SCANNING')
                      : (AppLocalizations.of(context)?.idleStatus ?? 'IDLE'),
                  badgeColor: isScanning ? AppColors.of(context).cyan : AppColors.of(context).textMuted,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddDeviceHero(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.of(context).surface,
        borderRadius: AppTokens.borderRadiusLg,
        border: Border.all(color: AppColors.of(context).cyan.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: AppColors.of(context).cyan.withValues(alpha: 0.08),
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
                    color: AppColors.of(context).cyan.withValues(alpha: 0.15),
                    borderRadius: AppTokens.borderRadiusMd,
                    border: Border.all(color: AppColors.of(context).cyan),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add_circle_outline,
                      color: AppColors.of(context).cyan,
                      size: 26,
                    ),
                  ),
                ),
                const SizedBox(width: AppTokens.space16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)?.addDeviceTitle ??
                            'ADD NEW ROBOT',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.of(context).textPrimary,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        AppLocalizations.of(context)?.addDeviceSubtitle ??
                            'Pair AIR robots',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.of(context).textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.of(context).cyan,
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
    Color? badgeColor,
    required IconData icon,
    bool isScanning = false,
  }) {
    final effectiveBadgeColor = badgeColor ?? AppColors.of(context).cyan;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.of(context).textSecondary,
                letterSpacing: 0.9,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: effectiveBadgeColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: effectiveBadgeColor.withValues(alpha: 0.4)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isScanning) ...[
                RotationTransition(
                  turns: _radarController,
                  child: Icon(icon, size: 12, color: effectiveBadgeColor),
                ),
                const SizedBox(width: 4),
              ],
              Text(
                badgeText,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: effectiveBadgeColor,
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
        color: AppColors.of(context).surface,
        borderRadius: AppTokens.borderRadiusLg,
        border: Border.all(color: AppColors.of(context).border),
      ),
      child: Column(
        children: [
          Icon(
            Icons.precision_manufacturing_outlined,
            size: 38,
            color: AppColors.of(context).textMuted.withValues(alpha: 0.7),
          ),
          const SizedBox(height: AppTokens.space8),
          Text(
            AppLocalizations.of(context)?.noRobotsPairedYet ??
                'No Robots Paired Yet',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.of(context).textPrimary,
            ),
          ),
          const SizedBox(height: AppTokens.space4),
          Text(
            AppLocalizations.of(context)?.noRobotsPairedSubtitle ??
                'Connect your robot to view telemetry, manage presets, and control operations.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: AppColors.of(context).textSecondary,
            ),
          ),
          const SizedBox(height: AppTokens.space12),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.of(context).cyan,
              side: BorderSide(color: AppColors.of(context).cyan),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: AppTokens.borderRadiusSm,
              ),
            ),
            icon: const Icon(Icons.add, size: 16),
            label: Text(
              AppLocalizations.of(context)?.addYourFirstRobot ??
                  'ADD YOUR FIRST ROBOT',
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
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
    final isConnected = (connState == BleConnectionState.ready ||
            connState == BleConnectionState.connected) &&
        manager.connectedRobot?.id == robot.id;
    final isInRange = liveMatch != null || isConnected;
    final rssi = liveMatch?.smoothedRssi;
    final isFabrica = robot.modelNumber.toLowerCase().contains('fabrica') ||
        robot.name.toLowerCase().contains('fabrica');

    return Container(
      decoration: BoxDecoration(
        color: AppColors.of(context).surface,
        borderRadius: AppTokens.borderRadiusMd,
        border: Border.all(
          color: isConnected
              ? AppColors.of(context).cyan.withValues(alpha: 0.8)
              : (isInRange
                  ? AppColors.of(context).cyan.withValues(alpha: 0.5)
                  : AppColors.of(context).border),
          width: isConnected ? 1.5 : 1.0,
        ),
        boxShadow: isConnected
            ? [
                BoxShadow(
                  color: AppColors.of(context).cyan.withValues(alpha: 0.15),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ]
            : (isInRange
                ? [
                    BoxShadow(
                      color: AppColors.of(context).cyan.withValues(alpha: 0.08),
                      blurRadius: 8,
                    ),
                  ]
                : null),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppTokens.borderRadiusMd,
          onTap: isConnecting
              ? null
              : () {
                  if (isConnected) {
                    ref.read(isViewingDeviceProvider.notifier).openDevice();
                  } else {
                    _connectToRegisteredRobot(robot, liveMatch);
                  }
                },
          onLongPress: () => _showUnpairConfirmation(context, robot),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isConnected
                        ? AppColors.of(context).cyan.withValues(alpha: 0.25)
                        : (isInRange
                            ? AppColors.of(context).cyan.withValues(alpha: 0.15)
                            : AppColors.of(context).surfaceHighlight),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isConnected || isInRange
                          ? AppColors.of(context).cyan
                          : AppColors.of(context).border,
                    ),
                  ),
                  child: Icon(
                    isFabrica
                        ? Icons.dry_cleaning
                        : Icons.precision_manufacturing,
                    size: 22,
                    color: isConnected || isInRange
                        ? AppColors.of(context).cyan
                        : AppColors.of(context).textSecondary,
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
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.of(context).textPrimary,
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
                                  ? AppColors.of(context).cyan.withValues(alpha: 0.25)
                                  : (isInRange
                                      ? AppColors.of(context).cyan.withValues(alpha: 0.15)
                                      : AppColors.of(context).surfaceHighlight),
                              borderRadius: BorderRadius.circular(3),
                              border: isConnected
                                  ? Border.all(
                                      color: AppColors.of(context).cyan.withValues(alpha: 0.7))
                                  : null,
                            ),
                            child: Text(
                              isConnected
                                  ? (AppLocalizations.of(context)?.connectedBadge ?? 'CONNECTED')
                                  : (isInRange
                                      ? (AppLocalizations.of(context)?.inRangeBadge ?? 'IN RANGE')
                                      : (AppLocalizations.of(context)?.offlineBadge ?? 'OFFLINE')),
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: isConnected || isInRange
                                    ? AppColors.of(context).cyan
                                    : AppColors.of(context).textMuted,
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
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.of(context).textSecondary,
                            ),
                          ),
                          if (isInRange && rssi != null) ...[
                            Text(' • ', style: TextStyle(color: AppColors.of(context).textMuted, fontSize: 10)),
                            _buildRssiBadge(rssi),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppTokens.space8),
                if (isConnected)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.of(context).cyan,
                      borderRadius: AppTokens.borderRadiusSm,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.tune, size: 14, color: AppColors.of(context).textOnAccent),
                        const SizedBox(width: 4),
                        Text(
                          AppLocalizations.of(context)?.openButton ?? 'OPEN',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.of(context).textOnAccent,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isInRange
                          ? AppColors.of(context).cyan.withValues(alpha: 0.2)
                          : AppColors.of(context).surfaceHighlight,
                      borderRadius: AppTokens.borderRadiusSm,
                      border: Border.all(
                        color: isInRange
                            ? AppColors.of(context).cyan.withValues(alpha: 0.5)
                            : AppColors.of(context).border,
                      ),
                    ),
                    child: isConnecting
                        ? SizedBox(
                            width: 14,
                            height: 14,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.of(context).cyan,
                            ),
                          )
                        : Text(
                            isInRange
                                ? (AppLocalizations.of(context)?.connectButton ?? 'CONNECT')
                                : (AppLocalizations.of(context)?.reconnectButton ?? 'RECONNECT'),
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: isInRange ? AppColors.of(context).cyan : AppColors.of(context).textSecondary,
                            ),
                          ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiscoveredCandidateCard(DiscoveredRobot robot) {
    final isConnecting = _connectingDeviceId == robot.id;
    final isFabrica = robot.name.toLowerCase().contains('fabrica');

    return Container(
      decoration: BoxDecoration(
        color: AppColors.of(context).surface,
        borderRadius: AppTokens.borderRadiusMd,
        border: Border.all(
          color: robot.isPairingMode
              ? AppColors.of(context).emerald.withValues(alpha: 0.7)
              : AppColors.of(context).border,
          width: robot.isPairingMode ? 1.5 : 1.0,
        ),
        boxShadow: robot.isPairingMode
            ? [
                BoxShadow(
                  color: AppColors.of(context).emerald.withValues(alpha: 0.12),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppTokens.borderRadiusMd,
          onTap: isConnecting ? null : () => _connectToDiscoveredRobot(robot),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: robot.isPairingMode
                        ? AppColors.of(context).emerald.withValues(alpha: 0.15)
                        : AppColors.of(context).surfaceHighlight,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: robot.isPairingMode
                          ? AppColors.of(context).emerald
                          : AppColors.of(context).border,
                    ),
                  ),
                  child: Icon(
                    isFabrica
                        ? Icons.dry_cleaning
                        : Icons.precision_manufacturing,
                    size: 22,
                    color: AppColors.of(context).emerald,
                  ),
                ),
                const SizedBox(width: AppTokens.space12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        robot.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.of(context).textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'ID: ${robot.id.substring(0, math.min(10, robot.id.length))}',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'monospace',
                          color: AppColors.of(context).textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppTokens.space8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.of(context).emerald,
                    borderRadius: AppTokens.borderRadiusSm,
                  ),
                  child: isConnecting
                      ? SizedBox(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.of(context).textOnAccent,
                          ),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppLocalizations.of(context)?.pairAndConnect ?? 'PAIR & CONNECT',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppColors.of(context).textOnAccent,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              size: 13,
                              color: AppColors.of(context).textOnAccent,
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyDiscoveredPrompt(bool isScanning) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.of(context).surface,
        borderRadius: AppTokens.borderRadiusLg,
        border: Border.all(color: AppColors.of(context).border),
      ),
      child: Center(
        child: Column(
          children: [
            RotationTransition(
              turns: _radarController,
              child: Icon(
                Icons.bluetooth_searching,
                size: 32,
                color: isScanning ? AppColors.of(context).cyan : AppColors.of(context).textMuted,
              ),
            ),
            const SizedBox(height: AppTokens.space12),
            Text(
              isScanning
                  ? (AppLocalizations.of(context)?.autoScanningForRobots ?? 'Auto-scanning for robots...')
                  : (AppLocalizations.of(context)?.scanningIdle ?? 'Scanning idle'),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.of(context).textPrimary,
              ),
            ),
            const SizedBox(height: AppTokens.space4),
            Text(
              isScanning
                  ? (AppLocalizations.of(context)?.nearbyRobotsAppear ?? 'Nearby robots will appear here automatically.')
                  : (AppLocalizations.of(context)?.yourNearbyRobotsAppear ?? 'Your nearby robots will appear here automatically.'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: AppColors.of(context).textSecondary,
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
        ? AppColors.of(context).emerald
        : (bars == 2 ? AppColors.of(context).amber : AppColors.of(context).crimson);
    final l10n = AppLocalizations.of(context);
    final label = bars == 3
        ? (l10n?.signalStrong ?? 'Strong')
        : (bars == 2
            ? (l10n?.signalGood ?? 'Good')
            : (l10n?.signalWeak ?? 'Weak'));

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
                color: active ? color : AppColors.of(context).border,
                borderRadius: BorderRadius.circular(1),
              ),
            );
          }),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}
