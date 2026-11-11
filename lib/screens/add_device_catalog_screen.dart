import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_tokens.dart';
import 'pair_robot_screen.dart';

/// Catalog screen presenting available and upcoming AIR Robotics hardware.
/// On Day 1, Fabrica is the primary active, pairable robot.
class AddDeviceCatalogScreen extends StatelessWidget {
  const AddDeviceCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        'Select a robot model below to start Bluetooth scanning and guided hardware pairing.',
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

              // Active Ready Hardware Section
              const Row(
                children: [
                  Icon(Icons.check_circle_outline,
                      size: 14, color: AppColors.emerald),
                  SizedBox(width: AppTokens.space4),
                  Text(
                    'SUPPORTED ROBOTS (DAY 1)',
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

              // Fabrica Card
              _buildFabricaCard(context),

              const SizedBox(height: AppTokens.space24),

              // Upcoming Ecosystem Section (Futuristic Vision)
              const Row(
                children: [
                  Icon(Icons.auto_awesome, size: 14, color: AppColors.purple),
                  SizedBox(width: AppTokens.space4),
                  Text(
                    'UPCOMING ECOSYSTEM',
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

  Widget _buildFabricaCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppTokens.borderRadiusLg,
        border: Border.all(color: AppColors.cyan.withValues(alpha: 0.6), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.cyan.withValues(alpha: 0.1),
            blurRadius: 16,
            spreadRadius: 1,
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
                builder: (context) => const PairRobotScreen(
                  targetModel: 'Fabrica-DevKit-v1',
                  namePrefix: 'Fabrica-',
                ),
              ),
            );
          },
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
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.radio_button_checked,
                                      size: 10,
                                      color: AppColors.emerald,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'READY TO PAIR',
                                      style: TextStyle(
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
}
