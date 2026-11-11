import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/ble/ble_providers.dart';
import '../core/ble/ble_transport_interface.dart';
import '../core/ble/developer_debug_screen.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_tokens.dart';

/// Consumer-facing landing dashboard for discovery, pairing, and offline simulation.
class LandingDashboardScreen extends ConsumerStatefulWidget {
  const LandingDashboardScreen({super.key});

  @override
  ConsumerState<LandingDashboardScreen> createState() =>
      _LandingDashboardScreenState();
}

class _LandingDashboardScreenState
    extends ConsumerState<LandingDashboardScreen>
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
  }

  @override
  void dispose() {
    _radarController.dispose();
    super.dispose();
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

  Future<void> _connectToRobot(DiscoveredRobot robot) async {
    setState(() => _connectingDeviceId = robot.id);
    try {
      final manager = ref.read(bleConnectionManagerProvider);
      await manager.connect(robot);
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
    final robotsAsync = ref.watch(discoveredRobotsProvider);
    final robots = robotsAsync.value ?? [];

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
            const Text(
              'AIR ROBOTICS',
              style: TextStyle(letterSpacing: 1.2, fontWeight: FontWeight.bold),
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
              // 1. Hardware Pairing Step Guide
              _buildPairingGuideCard(),

              const SizedBox(height: AppTokens.space16),

              // 3. BLE Discovery Section Header & Scan Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'DISCOVERED ROBOTS',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textSecondary,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(width: AppTokens.space8),
                      if (isScanning)
                        RotationTransition(
                          turns: _radarController,
                          child: const Icon(
                            Icons.radar,
                            size: 16,
                            color: AppColors.cyan,
                          ),
                        ),
                    ],
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.cyan,
                    ),
                    icon: Icon(
                      isScanning ? Icons.stop : Icons.refresh,
                      size: 16,
                    ),
                    label: Text(
                      isScanning ? 'STOP SCAN' : 'SCAN FOR ROBOTS',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      final scanner = ref.read(bleScannerProvider);
                      if (isScanning) {
                        scanner.stopScan();
                      } else {
                        scanner.startScan();
                      }
                    },
                  ),
                ],
              ),

              const SizedBox(height: AppTokens.space8),

              // 4. Discovered Robot List or Empty Prompt
              if (robots.isEmpty)
                _buildEmptyRobotListPrompt(isScanning)
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: robots.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppTokens.space8),
                  itemBuilder: (context, index) {
                    final robot = robots[index];
                    return _buildRobotCard(robot);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPairingGuideCard() {
    return Card(
      color: AppColors.surfaceHighlight,
      shape: RoundedRectangleBorder(
        borderRadius: AppTokens.borderRadiusLg,
        side: const BorderSide(color: AppColors.border),
      ),
      child: Padding(
        padding: AppTokens.paddingCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.touch_app, color: AppColors.amber, size: 20),
                SizedBox(width: AppTokens.space8),
                Text(
                  'HOW TO PAIR YOUR ROBOT',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.amber,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTokens.space12),
            _buildGuideStep(
              '1',
              'Hold the physical button on Fabrica for 3 seconds.',
            ),
            const SizedBox(height: 6),
            _buildGuideStep(
              '2',
              'The onboard status LED blinks rapidly in pairing mode.',
            ),
            const SizedBox(height: 6),
            _buildGuideStep(
              '3',
              'Select your robot in the list below and tap CONNECT.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideStep(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: AppColors.surface,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.border),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppTokens.space8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textPrimary,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyRobotListPrompt(bool isScanning) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceHighlight.withValues(alpha: 0.5),
        borderRadius: AppTokens.borderRadiusLg,
        border: Border.all(color: AppColors.border),
      ),
      child: Center(
        child: Column(
          children: [
            Icon(
              isScanning
                  ? Icons.bluetooth_searching
                  : Icons.bluetooth_disabled,
              size: 36,
              color: isScanning ? AppColors.cyan : AppColors.textMuted,
            ),
            const SizedBox(height: AppTokens.space12),
            Text(
              isScanning
                  ? 'Searching for nearby Fabrica robots...'
                  : 'No robots discovered yet',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppTokens.space4),
            Text(
              isScanning
                  ? 'Make sure pairing mode is active (120-second window).'
                  : 'Hold your robot button for 3 seconds, then tap "Scan for Robots".',
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

  Widget _buildRobotCard(DiscoveredRobot robot) {
    final isConnecting = _connectingDeviceId == robot.id;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
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
                size: 20,
                color:
                    robot.isPairingMode ? AppColors.emerald : AppColors.cyan,
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
                          ),
                        ),
                      ),
                      if (robot.isPairingMode) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 1),
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
                  Text(
                    'RSSI: ${robot.smoothedRssi.round()} dBm • ID: ${robot.id.substring(0, math.min(12, robot.id.length))}',
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cyan,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              ),
              onPressed: isConnecting ? null : () => _connectToRobot(robot),
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
}
