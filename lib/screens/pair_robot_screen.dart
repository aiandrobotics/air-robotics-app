import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/ble/ble_providers.dart';
import '../core/ble/ble_transport_interface.dart';
import '../core/fleet/fleet_providers.dart';
import '../core/fleet/registered_robot.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_tokens.dart';

/// Dedicated pairing flow screen for discovering and connecting to a specific robot model.
class PairRobotScreen extends ConsumerStatefulWidget {
  final String targetModel;
  final String namePrefix;

  const PairRobotScreen({
    super.key,
    this.targetModel = 'Fabrica',
    this.namePrefix = 'Fabrica-',
  });

  @override
  ConsumerState<PairRobotScreen> createState() => _PairRobotScreenState();
}

class _PairRobotScreenState extends ConsumerState<PairRobotScreen>
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

    // Auto-start scan on screen entry
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScan();
    });
  }

  @override
  void dispose() {
    _radarController.dispose();
    super.dispose();
  }

  void _startScan() {
    final scanner = ref.read(bleScannerProvider);
    scanner.startScan(timeout: const Duration(seconds: 45));
  }

  Future<void> _connectAndRegister(DiscoveredRobot robot) async {
    setState(() => _connectingDeviceId = robot.id);
    try {
      // 1. Explicitly stop scanning so radio is completely dedicated to GATT link
      await ref.read(bleScannerProvider).stopScan();

      final manager = ref.read(bleConnectionManagerProvider);
      manager.resetManualDisconnect();
      await manager.connect(robot);
      await ref.read(fleetStorageProvider).setLastConnectedRobotId(robot.id);

      // Save to registered fleet
      final registeredRobot = RegisteredRobot(
        id: robot.id,
        name: robot.name,
        modelNumber: widget.targetModel,
        pairedAt: DateTime.now(),
      );
      await ref.read(registeredRobotsProvider.notifier).addRobot(registeredRobot);

      if (mounted) {
        // Pop pairing flow back to root shell, where connection ready state
        // dynamically presents the robot's control profile.
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
    final allRobotsAsync = ref.watch(discoveredRobotsProvider);
    final allRobots = allRobotsAsync.value ?? [];

    final registeredAsync = ref.watch(registeredRobotsProvider);
    final registeredList = registeredAsync.value ?? [];
    final registeredIds = registeredList.map((r) => r.id).toSet();

    // Filter discovered robots: matching target prefix and NOT already paired
    final matchingRobots = allRobots
        .where((r) =>
            !registeredIds.contains(r.id) &&
            (widget.namePrefix.isEmpty ||
                r.name.toLowerCase().startsWith(widget.namePrefix.toLowerCase())))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PAIR ${widget.targetModel.toUpperCase()}',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isScanning ? Icons.stop : Icons.refresh,
              color: AppColors.cyan,
              size: 20,
            ),
            tooltip: isScanning ? 'Stop Scan' : 'Rescan',
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppTokens.paddingScreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Hardware Step-by-Step Instructions
              _buildPairingInstructionsCard(),

              const SizedBox(height: AppTokens.space20),

              // Active Radar Status
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppTokens.borderRadiusMd,
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    RotationTransition(
                      turns: _radarController,
                      child: Icon(
                        Icons.radar,
                        size: 20,
                        color: isScanning ? AppColors.cyan : AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(width: AppTokens.space12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isScanning
                                ? 'SEARCHING FOR NEARBY ${widget.targetModel.toUpperCase()}...'
                                : 'SCAN PAUSED',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                              color: isScanning
                                  ? AppColors.cyan
                                  : AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            isScanning
                                ? 'Filtering for "${widget.namePrefix}*" BLE advertisements'
                                : 'Tap the refresh button in the top bar to restart scan',
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTokens.space16),

              const Row(
                children: [
                  Icon(Icons.precision_manufacturing, size: 14, color: AppColors.cyan),
                  SizedBox(width: AppTokens.space4),
                  Text(
                    'DISCOVERED ROBOTS',
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

              if (matchingRobots.isEmpty)
                _buildEmptyCandidatePrompt(isScanning)
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: matchingRobots.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppTokens.space8),
                  itemBuilder: (context, index) {
                    final robot = matchingRobots[index];
                    return _buildRobotCandidateCard(robot);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPairingInstructionsCard() {
    final isFabrica = widget.targetModel.toLowerCase().contains('fabrica') ||
        widget.namePrefix.toLowerCase().contains('fabrica');

    return Container(
      padding: AppTokens.paddingCard,
      decoration: BoxDecoration(
        color: AppColors.surfaceHighlight,
        borderRadius: AppTokens.borderRadiusLg,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.touch_app, color: AppColors.amber, size: 20),
              const SizedBox(width: AppTokens.space8),
              Text(
                isFabrica ? 'FABRICA PAIRING INSTRUCTIONS' : 'PAIRING PROCEDURE',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.amber,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTokens.space12),
          if (isFabrica) ...[
            _buildInstructionStep(
              '1',
              'Power on your Fabrica robot.',
            ),
            const SizedBox(height: 8),
            _buildInstructionStep(
              '2',
              'Press and hold any button on the Fabrica control panel for 3 seconds to enter pairing mode.',
            ),
            const SizedBox(height: 8),
            _buildInstructionStep(
              '3',
              'The status LED will blink rapidly to confirm pairing mode is active.',
            ),
          ] else ...[
            _buildInstructionStep(
              '1',
              'Power on your ${widget.targetModel} robot.',
            ),
            const SizedBox(height: 8),
            _buildInstructionStep(
              '2',
              'Ensure Bluetooth pairing mode is active on the robot.',
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInstructionStep(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.surface,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.amber.withValues(alpha: 0.6)),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.amber,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppTokens.space12),
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

  Widget _buildEmptyCandidatePrompt(bool isScanning) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
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
              size: 40,
              color: isScanning ? AppColors.cyan : AppColors.textMuted,
            ),
            const SizedBox(height: AppTokens.space12),
            Text(
              isScanning
                  ? 'Searching for ${widget.targetModel}...'
                  : 'No matching robots discovered yet',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppTokens.space4),
            Text(
              isScanning
                  ? 'Make sure your robot is powered on and within range.'
                  : 'Check power switch and tap the top right icon to restart scan.',
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

  Widget _buildRobotCandidateCard(DiscoveredRobot robot) {
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
          onTap: isConnecting ? null : () => _connectAndRegister(robot),
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
}
