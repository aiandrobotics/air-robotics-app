import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/ble/ble_providers.dart';
import '../../core/ble/ble_transport_interface.dart';
import '../../core/profile/device_profile.dart';
import '../../core/protocol/protocol_providers.dart';
import '../../core/protocol/telemetry_packet.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_tokens.dart';
import '../../l10n/app_localizations.dart';

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
                        color: _stateColor(context, systemState, connState),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: AppTokens.space8),
                    Text(
                      connState == BleConnectionState.ready
                          ? _stateLabel(context, systemState)
                          : _connStateLabel(context, connState),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: _stateColor(context, systemState, connState),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                if (showRssi && connState == BleConnectionState.ready)
                  Row(
                    children: [
                      _buildSignalBars(context, rssi),
                      const SizedBox(width: 5),
                      Text(
                        _rssiLabel(context, rssi),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: _rssiColor(context, rssi),
                        ),
                      ),
                    ],
                  ),
              ],
            ),

            const SizedBox(height: AppTokens.space12),

            // Middle Row: Hardware LED Mirror + Quick Actions
            Wrap(
              spacing: AppTokens.space8,
              runSpacing: AppTokens.space8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if (showLed) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _ledColor(context, ledState).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: _ledColor(context, ledState).withValues(alpha: 0.6),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _ledColor(context, ledState),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: _ledColor(context, ledState),
                                blurRadius: 4,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          AppLocalizations.of(context)?.ledLabel(
                                _ledName(context, ledState),
                              ) ??
                              'LED: ${_ledName(context, ledState)}',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: _ledColor(context, ledState),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _BannerActionChip(
                    icon: Icons.flare,
                    label: AppLocalizations.of(context)?.identifyButton ?? 'IDENTIFY',
                    color: AppColors.of(context).purple,
                    onTap: () async {
                      try {
                        await ref.read(commandPipelineProvider).identifyRobot();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                AppLocalizations.of(context)?.identifyingToast ??
                                    'Flashing robot LED for 3 seconds...',
                              ),
                              duration: const Duration(seconds: 2),
                              backgroundColor: AppColors.of(context).purple,
                            ),
                          );
                        }
                      } catch (_) {}
                    },
                  ),
                  _BannerActionChip(
                    icon: Icons.home,
                    label: AppLocalizations.of(context)?.homeAll ?? 'HOME ALL',
                    color: AppColors.of(context).amber,
                    onTap: () async {
                      try {
                        await ref.read(commandPipelineProvider).stopSequence();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                AppLocalizations.of(context)?.homingToast ??
                                    'Homing all flaps...',
                              ),
                              duration: const Duration(seconds: 2),
                              backgroundColor: AppColors.of(context).amber,
                            ),
                          );
                        }
                      } catch (_) {}
                    },
                  ),
                ],
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
                  color: AppColors.of(context).crimson.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.of(context).crimson),
                ),
                child: Wrap(
                  spacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.warning, size: 16, color: AppColors.of(context).crimson),
                    if (errorCode & TelemetryPacket.faultBitI2c != 0)
                      Text(
                        AppLocalizations.of(context)?.i2cFault ?? 'I2C FAULT',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.of(context).crimson,
                        ),
                      ),
                    if (errorCode & TelemetryPacket.faultBitNvs != 0)
                      Text(
                        AppLocalizations.of(context)?.storageFault ?? 'STORAGE FAULT',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.of(context).crimson,
                        ),
                      ),
                    if (errorCode & TelemetryPacket.faultBitEstop != 0)
                      Text(
                        AppLocalizations.of(context)?.estopLatched ?? 'E-STOP LATCHED',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.of(context).crimson,
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

  String _connStateLabel(BuildContext context, BleConnectionState state) {
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

  String _stateLabel(BuildContext context, SystemState state) {
    final l10n = AppLocalizations.of(context);
    switch (state) {
      case SystemState.idle:
        return l10n?.machineIdle ?? 'IDLE';
      case SystemState.runningMotion:
        return l10n?.machineRunning ?? 'RUNNING';
      case SystemState.estop:
        return l10n?.machineEstop ?? 'E-STOP';
      case SystemState.error:
        return l10n?.machineError ?? 'ERROR';
      case SystemState.calibrating:
        return l10n?.machineCalibrating ?? 'CALIBRATING';
    }
  }

  Color _stateColor(BuildContext context, SystemState state, BleConnectionState connState) {
    if (connState != BleConnectionState.ready) {
      return AppColors.of(context).textMuted;
    }
    switch (state) {
      case SystemState.idle:
        return AppColors.of(context).emerald;
      case SystemState.runningMotion:
        return AppColors.of(context).amber;
      case SystemState.estop:
      case SystemState.error:
        return AppColors.of(context).crimson;
      case SystemState.calibrating:
        return AppColors.of(context).cyan;
    }
  }

  Color _ledColor(BuildContext context, LedState led) {
    switch (led) {
      case LedState.idle:
        return AppColors.of(context).textMuted;
      case LedState.running:
        return AppColors.of(context).amber;
      case LedState.saveSuccess:
        return AppColors.of(context).emerald;
      case LedState.inputError:
      case LedState.estop:
        return AppColors.of(context).crimson;
      case LedState.pairing:
        return AppColors.of(context).purple;
      case LedState.connected:
        return AppColors.of(context).cyan;
      case LedState.identify:
        return AppColors.of(context).textPrimary;
    }
  }

  String _ledName(BuildContext context, LedState led) {
    final l10n = AppLocalizations.of(context);
    switch (led) {
      case LedState.idle:
        return l10n?.machineIdle ?? 'IDLE';
      case LedState.running:
        return l10n?.machineRunning ?? 'RUNNING';
      case LedState.saveSuccess:
        return l10n?.ledSaved ?? 'SAVED';
      case LedState.inputError:
        return l10n?.ledInputErr ?? 'INPUT ERR';
      case LedState.estop:
        return l10n?.machineEstop ?? 'E-STOP';
      case LedState.pairing:
        return l10n?.ledPairing ?? 'PAIRING';
      case LedState.connected:
        return l10n?.ledConnected ?? 'CONNECTED';
      case LedState.identify:
        return l10n?.ledIdentify ?? 'IDENTIFY';
    }
  }

  String _rssiLabel(BuildContext context, int rssi) {
    final l10n = AppLocalizations.of(context);
    if (rssi >= -65) return l10n?.signalStrong ?? 'Strong';
    if (rssi >= -75) return l10n?.signalGood ?? 'Good';
    return l10n?.signalWeak ?? 'Weak';
  }

  Color _rssiColor(BuildContext context, int rssi) {
    if (rssi >= -65) return AppColors.of(context).emerald;
    if (rssi >= -75) return AppColors.of(context).amber;
    return AppColors.of(context).crimson;
  }

  Widget _buildSignalBars(BuildContext context, int rssi) {
    final bars = rssi >= -65 ? 3 : (rssi >= -75 ? 2 : 1);
    final activeColor = _rssiColor(context, rssi);
    final inactiveColor = AppColors.of(context).border;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(3, (index) {
        final active = index < bars;
        return Container(
          margin: const EdgeInsets.only(right: 1.5),
          width: 3,
          height: 5.0 + (index * 3.5),
          decoration: BoxDecoration(
            color: active ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(1),
          ),
        );
      }),
    );
  }
}

class _BannerActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _BannerActionChip({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color.withValues(alpha: 0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: color,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
