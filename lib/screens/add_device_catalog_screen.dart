import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/ble/ble_providers.dart';
import '../core/ble/ble_transport_interface.dart';
import '../core/fleet/fleet_providers.dart';
import '../core/fleet/registered_robot.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_tokens.dart';
import 'pair_robot_screen.dart';

/// Catalog screen presenting live discovered hardware at top for 1-tap pairing,
/// supported Day 1 robots, and upcoming AIR Robotics hardware.
class AddDeviceCatalogScreen extends ConsumerStatefulWidget {
  const AddDeviceCatalogScreen({super.key});

  @override
  ConsumerState<AddDeviceCatalogScreen> createState() =>
      _AddDeviceCatalogScreenState();
}

class _AddDeviceCatalogScreenState extends ConsumerState<AddDeviceCatalogScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _radarController;
  String? _connectingDeviceId;

  @override
  void initState() {
    super.initState();
    _radarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Auto-start scan on screen entry if not already scanning
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isScanning = ref.read(isScanningProvider).value ?? false;
      if (!isScanning) {
        ref.read(bleScannerProvider).startScan(timeout: const Duration(seconds: 45));
      }
    });
  }

  @override
  void dispose() {
    _radarController.dispose();
    super.dispose();
  }

  Future<void> _pairAndConnect(DiscoveredRobot robot) async {
    setState(() => _connectingDeviceId = robot.id);
    ref.read(bleConnectionManagerProvider).resetManualDisconnect();
    try {
      final manager = ref.read(bleConnectionManagerProvider);
      await manager.connect(robot);
      await ref.read(fleetStorageProvider).setLastConnectedRobotId(robot.id);

      final registeredRobot = RegisteredRobot(
        id: robot.id,
        name: robot.name,
        modelNumber: robot.name.toLowerCase().startsWith('fabrica')
            ? 'Fabrica-DevKit-v1'
            : 'AIR-Generic',
        pairedAt: DateTime.now(),
      );
      await ref.read(registeredRobotsProvider.notifier).addRobot(registeredRobot);

      if (mounted) {
        ref.read(isViewingDeviceProvider.notifier).openDevice();
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
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

    final isScanningAsync = ref.watch(isScanningProvider);
    final isScanning = isScanningAsync.value ?? false;

    final registeredAsync = ref.watch(registeredRobotsProvider);
    final registeredList = registeredAsync.value ?? [];
    final registeredIds = registeredList.map((r) => r.id).toSet();

    final discoveredAsync = ref.watch(discoveredRobotsProvider);
    final allDiscovered = discoveredAsync.value ?? [];

    // Candidate robots that are not yet in user's saved fleet
    final candidateDiscovered = allDiscovered
        .where((d) => !registeredIds.contains(d.id))
        .toList();

    // Check if any candidate is a Fabrica unit
    final fabricaCandidate = candidateDiscovered
        .where((d) => d.name.toLowerCase().startsWith('fabrica'))
        .firstOrNull;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADD NEW ROBOT',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          IconButton(
            icon: isScanning
                ? RotationTransition(
                    turns: _radarController,
                    child: const Icon(Icons.refresh, size: 20, color: AppColors.cyan),
                  )
                : const Icon(Icons.refresh, size: 20),
            tooltip: isScanning ? 'Scanning...' : 'Restart Scan',
            onPressed: () {
              ref.read(bleScannerProvider).startScan(timeout: const Duration(seconds: 45));
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
              // Header description
              Container(
                padding: const EdgeInsets.all(AppTokens.space12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppTokens.borderRadiusMd,
                  border: Border.all(color: AppColors.border),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.hub_outlined,
                      color: AppColors.cyan,
                      size: 22,
                    ),
                    SizedBox(width: AppTokens.space12),
                    Expanded(
                      child: Text(
                        'Discovered robots appear at top for instant 1-tap pairing. Or select a model below to view step-by-step setup.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTokens.space20),

              // 1. DISCOVERED ROBOTS SECTION (AT TOP - SKIPS 1 STEP!)
              _buildSectionHeader(
                title: 'DISCOVERED NEARBY',
                badgeText: candidateDiscovered.isNotEmpty
                    ? '${candidateDiscovered.length} READY'
                    : (isScanning ? 'SCANNING' : 'IDLE'),
                badgeColor: candidateDiscovered.isNotEmpty
                    ? AppColors.emerald
                    : (isScanning ? AppColors.cyan : AppColors.textMuted),
                icon: Icons.radar,
                isScanning: isScanning && candidateDiscovered.isEmpty,
              ),
              const SizedBox(height: AppTokens.space8),

              if (candidateDiscovered.isEmpty)
                _buildScanningPromptCard(isScanning)
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

              const SizedBox(height: AppTokens.space24),

              // 2. SUPPORTED ROBOTS SECTION (ROBOT TYPES AT BOTTOM)
              _buildSectionHeader(
                title: 'SUPPORTED ROBOTS (DAY 1)',
                badgeText: fabricaCandidate != null ? '1 FOUND' : null,
                badgeColor: AppColors.emerald,
                icon: Icons.check_circle_outline,
              ),
              const SizedBox(height: AppTokens.space8),

              // Fabrica Card
              _buildFabricaCard(context, fabricaCandidate),

              const SizedBox(height: AppTokens.space24),

              // 3. UPCOMING ROBOTS SECTION (FUTURE VISION)
              const Row(
                children: [
                  Icon(Icons.auto_awesome, size: 14, color: AppColors.purple),
                  SizedBox(width: AppTokens.space4),
                  Text(
                    'UPCOMING ROBOTS',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTokens.space8),

              _buildFutureRobotCard(
                title: 'AIR ARM-X1',
                subtitle: '6-Axis Desktop Robotic Arm',
                status: 'IN DEVELOPMENT',
                icon: Icons.precision_manufacturing_outlined,
                specs: ['6-DOF', 'Direct Kinematics', 'Payload 500g'],
              ),
              const SizedBox(height: AppTokens.space8),
              _buildFutureRobotCard(
                title: 'AIR ROVER-S',
                subtitle: 'Autonomous Mobile Research Platform',
                status: 'COMING SOON',
                icon: Icons.toys_outlined,
                specs: ['Omni-Drive', 'LiDAR Nav', 'Telemetry Bus'],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    String? badgeText,
    Color badgeColor = AppColors.cyan,
    required IconData icon,
    bool isScanning = false,
  }) {
    return Row(
      children: [
        Icon(icon, size: 14, color: badgeColor),
        const SizedBox(width: AppTokens.space4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: AppColors.textSecondary,
            letterSpacing: 0.8,
          ),
        ),
        const Spacer(),
        if (badgeText != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: badgeColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: badgeColor.withValues(alpha: 0.4)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isScanning) ...[
                  RotationTransition(
                    turns: _radarController,
                    child: Icon(Icons.radar, size: 10, color: badgeColor),
                  ),
                  const SizedBox(width: 4),
                ],
                Text(
                  badgeText,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: badgeColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
      ],
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
              ? AppColors.emerald.withValues(alpha: 0.8)
              : AppColors.cyan.withValues(alpha: 0.5),
          width: robot.isPairingMode ? 1.5 : 1.0,
        ),
        boxShadow: robot.isPairingMode
            ? [
                BoxShadow(
                  color: AppColors.emerald.withValues(alpha: 0.12),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
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
                            border: Border.all(
                              color: AppColors.emerald.withValues(alpha: 0.6),
                            ),
                          ),
                          child: const Text(
                            'PAIRING READY',
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
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: robot.isPairingMode
                    ? AppColors.emerald
                    : AppColors.cyan,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: AppTokens.borderRadiusSm,
                ),
              ),
              icon: isConnecting
                  ? const SizedBox.shrink()
                  : const Icon(Icons.bluetooth_connected, size: 14),
              label: isConnecting
                  ? const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.black,
                      ),
                    )
                  : const Text(
                      'PAIR & CONNECT',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              onPressed: isConnecting ? null : () => _pairAndConnect(robot),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScanningPromptCard(bool isScanning) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
                size: 28,
                color: isScanning ? AppColors.cyan : AppColors.textMuted,
              ),
            ),
            const SizedBox(height: AppTokens.space8),
            Text(
              isScanning
                  ? 'Auto-scanning for nearby robots...'
                  : 'Scan idle',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppTokens.space4),
            Text(
              isScanning
                  ? 'New robot (0 bonds): Stays in pairing mode continuously.\nAdding 2nd–4th device: Hold Button 1 for 3s (120s window).'
                  : 'Check power switch and tap refresh in the top right to scan.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFabricaCard(BuildContext context, DiscoveredRobot? candidate) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppTokens.borderRadiusLg,
        border: Border.all(
          color: candidate != null
              ? AppColors.emerald.withValues(alpha: 0.8)
              : AppColors.cyan.withValues(alpha: 0.6),
          width: candidate != null ? 2.0 : 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: (candidate != null ? AppColors.emerald : AppColors.cyan)
                .withValues(alpha: 0.12),
            blurRadius: 16,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: AppTokens.paddingCard,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceHighlight,
                      borderRadius: AppTokens.borderRadiusMd,
                      border: Border.all(
                        color: candidate != null
                            ? AppColors.emerald
                            : AppColors.cyan,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.precision_manufacturing,
                        color: candidate != null
                            ? AppColors.emerald
                            : AppColors.cyan,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppTokens.space12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'FABRICA',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.emerald.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: AppColors.emerald.withValues(alpha: 0.6),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.radio_button_checked,
                                    size: 10,
                                    color: AppColors.emerald,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    candidate != null
                                        ? 'READY TO PAIR (${candidate.name})'
                                        : 'READY TO PAIR',
                                    style: const TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.emerald,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          '4-Panel Planar Cloth Folding Robot',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTokens.space12),
              const Text(
                'Automated garment folder with real-time planar flap kinematics, multi-garment presets, and tactile single-button operation.',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textPrimary,
                  height: 1.35,
                ),
              ),
              const SizedBox(height: AppTokens.space12),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  _buildSpecChip('DevKit v1'),
                  _buildSpecChip('4 Flap Servos'),
                  _buildSpecChip('BLE 5.0 Direct'),
                  _buildSpecChip('100% Offline'),
                ],
              ),
              const SizedBox(height: AppTokens.space16),

              // Action buttons: If discovered nearby, offer 1-tap quick pair + step-by-step guide
              if (candidate != null) ...[
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.emerald,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppTokens.borderRadiusSm,
                      ),
                    ),
                    icon: const Icon(Icons.bolt, size: 18),
                    label: Text(
                      'PAIR ${candidate.name.toUpperCase()} (1-TAP)',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                    onPressed: () => _pairAndConnect(candidate),
                  ),
                ),
                const SizedBox(height: AppTokens.space8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textSecondary,
                      side: const BorderSide(color: AppColors.border),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppTokens.borderRadiusSm,
                      ),
                    ),
                    icon: const Icon(Icons.menu_book, size: 16),
                    label: const Text(
                      'STEP-BY-STEP PAIRING GUIDE',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => const PairRobotScreen(
                            targetModel: 'Fabrica-DevKit-v1',
                            namePrefix: 'Fabrica-',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ] else ...[
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.cyan,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppTokens.borderRadiusSm,
                      ),
                    ),
                    icon: const Icon(Icons.bluetooth_searching, size: 18),
                    label: const Text(
                      'PAIR FABRICA NOW',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => const PairRobotScreen(
                            targetModel: 'Fabrica-DevKit-v1',
                            namePrefix: 'Fabrica-',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.surfaceHighlight,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          color: AppColors.textSecondary,
          fontFamily: 'monospace',
        ),
      ),
    );
  }

  Widget _buildFutureRobotCard({
    required String title,
    required String subtitle,
    required String status,
    required IconData icon,
    required List<String> specs,
  }) {
    return Container(
      padding: AppTokens.paddingCard,
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.6),
        borderRadius: AppTokens.borderRadiusLg,
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.surfaceHighlight.withValues(alpha: 0.5),
              borderRadius: AppTokens.borderRadiusMd,
              border: Border.all(color: AppColors.border),
            ),
            child: Icon(icon, color: AppColors.textMuted, size: 24),
          ),
          const SizedBox(width: AppTokens.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textSecondary,
                        letterSpacing: 0.8,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceHighlight,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textMuted,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 4,
                  children: specs
                      .map((s) => Text(
                            '• $s ',
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppColors.textMuted,
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
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
        for (int i = 1; i <= 3; i++)
          Container(
            width: 3,
            height: 4.0 + (i * 3.0),
            margin: const EdgeInsets.only(right: 1.5),
            decoration: BoxDecoration(
              color: i <= bars ? color : AppColors.surfaceHighlight,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        const SizedBox(width: 4),
        Text(
          '$rounded dBm',
          style: TextStyle(
            fontSize: 10,
            fontFamily: 'monospace',
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
