import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/ble/ble_providers.dart';
import '../../core/ble/ble_transport_interface.dart';
import '../../core/profile/device_profile.dart';
import '../../core/protocol/protocol_providers.dart';
import '../../core/protocol/telemetry_packet.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_tokens.dart';

/// Real-time status banner displaying machine state, LED pattern mirror,
/// BLE signal strength, and hardware fault alerts.
class StatusBannerWidget extends ConsumerWidget {
  final AirWidgetConfig config;

  const StatusBannerWidget({super.key, required this.config});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showLed = config.props['show_led_mirror'] as bool? ?? true;
    final showRssi = config.props['show_rssi'] as bool? ?? true;

    final connStateAsync = ref.watch(bleConnectionStateProvider);
    final telemetryAsync = ref.watch(latestTelemetryProvider);

    final connState = connStateAsync.value ??
        ref.read(bleConnectionManagerProvider).currentState;
    final packet =
        telemetryAsync.value ?? ref.read(telemetryBusProvider).latestPacket;

    final systemState = packet?.systemState ?? SystemState.idle;
    final ledState = packet?.ledState ?? LedState.idle;
    final rssi = packet?.bleRssiDbm ?? 0;
    final errorCode = packet?.errorCode ?? 0;

    return Card(
      elevation: 2,
      child: Padding(
        padding: AppTokens.paddingCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Machine State Pill + RSSI / Link Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _stateColor(systemState, connState),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: AppTokens.space8),
                    Text(
                      connState == BleConnectionState.ready
                          ? systemState.displayName
                          : connState.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: _stateColor(systemState, connState),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                if (showRssi && connState == BleConnectionState.ready)
                  Row(
                    children: [
                      Icon(
                        _rssiIcon(rssi),
                        size: 16,
                        color: _rssiColor(rssi),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _rssiLabel(rssi),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: _rssiColor(rssi),
                        ),
                      ),
                    ],
                  ),
              ],
            ),

            const SizedBox(height: AppTokens.space12),

            // Middle Row: Hardware LED Mirror + Heap Metric
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showLed)
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _ledColor(ledState).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: _ledColor(ledState).withValues(alpha: 0.6),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _ledColor(ledState),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: _ledColor(ledState),
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'LED: ${_ledName(ledState)}',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: _ledColor(ledState),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppTokens.space8),
                      InkWell(
                        onTap: () async {
                          try {
                            await ref.read(commandPipelineProvider).identifyRobot();
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Flashing robot LED for 3 seconds...'),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: AppColors.purple,
                                ),
                              );
                            }
                          } catch (_) {}
                        },
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.purple.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: AppColors.purple.withValues(alpha: 0.5),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.flare, size: 12, color: AppColors.purple),
                              SizedBox(width: 4),
                              Text(
                                'IDENTIFY',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.purple,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                if (packet != null)
                  Text(
                    'Heap: ${packet.freeHeapKb} KB',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textMuted,
                      fontFamily: 'monospace',
                    ),
                  ),
              ],
            ),

            // Bottom Alert: Active Fault Warnings
            if (errorCode != 0) ...[
              const SizedBox(height: AppTokens.space8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTokens.space8,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.crimson.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.crimson),
                ),
                child: Wrap(
                  spacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.warning, size: 16, color: AppColors.crimson),
                    if (errorCode & TelemetryPacket.faultBitI2c != 0)
                      const Text(
                        'I2C FAULT',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.crimson,
                        ),
                      ),
                    if (errorCode & TelemetryPacket.faultBitNvs != 0)
                      const Text(
                        'STORAGE FAULT',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.crimson,
                        ),
                      ),
                    if (errorCode & TelemetryPacket.faultBitEstop != 0)
                      const Text(
                        'E-STOP LATCHED',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.crimson,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _stateColor(SystemState state, BleConnectionState connState) {
    if (connState != BleConnectionState.ready) {
      return AppColors.textMuted;
    }
    switch (state) {
      case SystemState.idle:
        return AppColors.emerald;
      case SystemState.runningMotion:
        return AppColors.amber;
      case SystemState.estop:
      case SystemState.error:
        return AppColors.crimson;
      case SystemState.calibrating:
        return AppColors.cyan;
    }
  }

  Color _ledColor(LedState led) {
    switch (led) {
      case LedState.idle:
        return AppColors.textMuted;
      case LedState.running:
        return AppColors.amber;
      case LedState.saveSuccess:
        return AppColors.emerald;
      case LedState.inputError:
      case LedState.estop:
        return AppColors.crimson;
      case LedState.pairing:
        return AppColors.purple;
      case LedState.connected:
        return AppColors.cyan;
      case LedState.identify:
        return Colors.white;
    }
  }

  String _ledName(LedState led) {
    switch (led) {
      case LedState.idle:
        return 'IDLE';
      case LedState.running:
        return 'RUNNING';
      case LedState.saveSuccess:
        return 'SAVED';
      case LedState.inputError:
        return 'INPUT_ERR';
      case LedState.estop:
        return 'ESTOP';
      case LedState.pairing:
        return 'PAIRING';
      case LedState.connected:
        return 'CONNECTED';
      case LedState.identify:
        return 'IDENTIFY';
    }
  }

  String _rssiLabel(int rssi) {
    if (rssi >= -65) return 'Strong';
    if (rssi >= -75) return 'Good';
    return 'Weak';
  }

  Color _rssiColor(int rssi) {
    if (rssi >= -65) return AppColors.emerald;
    if (rssi >= -75) return AppColors.amber;
    return AppColors.crimson;
  }

  IconData _rssiIcon(int rssi) {
    if (rssi >= -65) return Icons.network_wifi;
    if (rssi >= -75) return Icons.network_wifi_3_bar;
    return Icons.network_wifi_1_bar;
  }
}
