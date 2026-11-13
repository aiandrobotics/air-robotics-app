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

/// Catalog screen presenting supported robots and dynamically showing
/// auto-discovered nearby robots at the top when detected.
class AddDeviceCatalogScreen extends ConsumerStatefulWidget {
  const AddDeviceCatalogScreen({super.key});

  @override
  ConsumerState<AddDeviceCatalogScreen> createState() =>
      _AddDeviceCatalogScreenState();
}

class _AddDeviceCatalogScreenState extends ConsumerState<AddDeviceCatalogScreen> {
  String? _connectingDeviceId;

  @override
  void initState() {
    super.initState();

    // Auto-start continuous scan on screen entry if not already scanning
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bleScannerProvider).startScan();
    });
  }

  Future<void> _pairAndConnect(DiscoveredRobot robot) async {
    setState(() => _connectingDeviceId = robot.id);
    ref.read(bleConnectionManagerProvider).resetManualDisconnect();
    try {
      await ref.read(bleScannerProvider).stopScan();
      final manager = ref.read(bleConnectionManagerProvider);
      await manager.connect(robot);
      await ref.read(fleetStorageProvider).setLastConnectedRobotId(robot.id);

      final registeredRobot = RegisteredRobot(
        id: robot.id,
        name: robot.name,
        modelNumber: robot.name.toLowerCase().startsWith('fabrica')
            ? 'Fabrica'
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
    final registeredAsync = ref.watch(registeredRobotsProvider);
    final registeredList = registeredAsync.value ?? [];
    final registeredIds = registeredList.map((r) => r.id).toSet();

    final discoveredAsync = ref.watch(discoveredRobotsProvider);
    final allDiscovered = discoveredAsync.value ?? [];

    // Candidate robots that are not yet in user's saved fleet
    final candidateDiscovered = allDiscovered
        .where((d) => !registeredIds.contains(d.id))
        .toList();

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
                        'Select a robot below to pair. Any nearby robot in pairing mode will be automatically discovered at the top.',
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

              // 1. AUTO DISCOVERED ROBOT(S) SECTION (SHOWN ONLY WHEN DISCOVERED)
              if (candidateDiscovered.isNotEmpty) ...[
                _buildSectionHeader(
                  title: candidateDiscovered.length > 1
                      ? 'AUTO DISCOVERED ROBOTS'
                      : 'AUTO DISCOVERED ROBOT',
                  badgeText: '${candidateDiscovered.length} READY',
                  badgeColor: AppColors.emerald,
                  icon: Icons.radar,
                ),
                const SizedBox(height: AppTokens.space8),
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
              ],

              // 2. SUPPORTED ROBOTS SECTION
              _buildSectionHeader(
                title: 'SUPPORTED ROBOTS',
                icon: Icons.check_circle_outline,
              ),
              const SizedBox(height: AppTokens.space8),

              // Fabrica Card
              _buildFabricaCard(context),
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
            child: Text(
              badgeText,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: badgeColor,
                letterSpacing: 0.5,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDiscoveredCandidateCard(DiscoveredRobot robot) {
    final isConnecting = _connectingDeviceId == robot.id;
    final isFabrica = robot.name.toLowerCase().contains('fabrica');

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppTokens.borderRadiusMd,
        border: Border.all(
          color: robot.isPairingMode
              ? AppColors.emerald.withValues(alpha: 0.7)
              : AppColors.border,
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppTokens.borderRadiusMd,
          onTap: isConnecting ? null : () => _pairAndConnect(robot),
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
                    isFabrica
                        ? Icons.dry_cleaning
                        : Icons.precision_manufacturing,
                    size: 22,
                    color: robot.isPairingMode
                        ? AppColors.emerald
                        : AppColors.cyan,
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
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
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
                ),
                const SizedBox(width: AppTokens.space8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: robot.isPairingMode
                        ? AppColors.emerald
                        : AppColors.cyan,
                    borderRadius: AppTokens.borderRadiusSm,
                  ),
                  child: isConnecting
                      ? const SizedBox(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.black,
                          ),
                        )
                      : const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'PAIR & CONNECT',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              size: 13,
                              color: Colors.black,
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

  Widget _buildFabricaCard(BuildContext context) {
    void navigateToPairFabrica() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => const PairRobotScreen(
            targetModel: 'Fabrica',
            namePrefix: 'Fabrica-',
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppTokens.borderRadiusLg,
        border: Border.all(
          color: AppColors.cyan.withValues(alpha: 0.6),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.cyan.withValues(alpha: 0.12),
            blurRadius: 16,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppTokens.borderRadiusLg,
          onTap: navigateToPairFabrica,
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
                        border: Border.all(color: AppColors.cyan),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.dry_cleaning,
                          color: AppColors.cyan,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppTokens.space12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FABRICA',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Cloths Folding Robot',
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
                  'Automated garment folder with multi-garment presets and tactile single-button operation.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textPrimary,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: AppTokens.space12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.amber.withValues(alpha: 0.1),
                    borderRadius: AppTokens.borderRadiusSm,
                    border: Border.all(
                      color: AppColors.amber.withValues(alpha: 0.3),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.touch_app_outlined,
                        size: 16,
                        color: AppColors.amber,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Pairing mode: Press and hold any button on the Fabrica control panel for 3 seconds (Status LED will blink rapidly).',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.amber,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppTokens.space16),
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
                    onPressed: navigateToPairFabrica,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
