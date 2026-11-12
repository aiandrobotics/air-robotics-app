import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/ble/ble_providers.dart';
import '../core/ble/ble_transport_interface.dart';
import '../core/fleet/fleet_providers.dart';
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
  @override
  void initState() {
    super.initState();

    // Auto-start continuous scan on screen entry if not already scanning
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isScanning = ref.read(isScanningProvider).value ?? false;
      if (!isScanning) {
        ref.read(bleScannerProvider).startScan(timeout: const Duration(seconds: 45));
      }
    });
  }

  void _navigateToPairScreen(DiscoveredRobot robot) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => PairRobotScreen(
          targetModel: robot.name.toLowerCase().startsWith('fabrica')
              ? 'Fabrica-DevKit-v1'
              : 'AIR-Generic',
          namePrefix: robot.name.contains('-')
              ? '${robot.name.split('-').first}-'
              : 'Fabrica-',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<bool>>(isScanningProvider, (prev, next) {
      final isScanning = next.value ?? false;

      // Keep discovery running continuously in the background on this screen
      if (!isScanning && mounted && (ModalRoute.of(context)?.isCurrent ?? false)) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (!mounted) return;
          ref.read(bleScannerProvider).startScan(timeout: const Duration(seconds: 45));
        });
      }
    });

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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _navigateToPairScreen(robot),
        borderRadius: AppTokens.borderRadiusMd,
        child: Container(
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
                  icon: const Icon(Icons.arrow_forward, size: 14),
                  label: const Text(
                    'PAIR',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => _navigateToPairScreen(robot),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFabricaCard(BuildContext context) {
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
                      Icons.precision_manufacturing,
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
