import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../protocol/protocol_providers.dart';
import '../protocol/telemetry_packet.dart';
import '../theme/app_colors.dart';
import '../theme/app_tokens.dart';
import 'ble_providers.dart';
import 'ble_transport_interface.dart';

/// Developer Debug & Testing Screen.
///
/// Provides BLE discovery controls, connection lifecycle status,
/// live 31-byte telemetry inspection, fast-path Emergency Stop,
/// and raw hex command injection to FAB1.
class DeveloperDebugScreen extends ConsumerStatefulWidget {
  const DeveloperDebugScreen({super.key});

  @override
  ConsumerState<DeveloperDebugScreen> createState() =>
      _DeveloperDebugScreenState();
}

class _DeveloperDebugScreenState extends ConsumerState<DeveloperDebugScreen> {
  final TextEditingController _hexController = TextEditingController();
  final ScrollController _logScrollController = ScrollController();
  final List<String> _logs = [];
  bool _writeWithoutResponse = false;

  @override
  void dispose() {
    _hexController.dispose();
    _logScrollController.dispose();
    super.dispose();
  }

  void _addLog(String message) {
    setState(() {
      final timestamp = DateTime.now().toIso8601String().substring(11, 19);
      _logs.add('[$timestamp] $message');
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_logScrollController.hasClients) {
        _logScrollController.animateTo(
          _logScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Uint8List? _parseHex(String input) {
    final clean = input.replaceAll(RegExp(r'0[xX]|[\s,]'), '');
    if (clean.isEmpty || clean.length % 2 != 0) return null;

    final bytes = Uint8List(clean.length ~/ 2);
    for (var i = 0; i < clean.length; i += 2) {
      final byte = int.tryParse(clean.substring(i, i + 2), radix: 16);
      if (byte == null) return null;
      bytes[i ~/ 2] = byte;
    }
    return bytes;
  }

  Future<void> _sendHexCommand() async {
    final text = _hexController.text.trim();
    final bytes = _parseHex(text);

    if (bytes == null) {
      _addLog('ERR: Malformed hex string. Use format: "00 01" or "0E"');
      return;
    }

    final transport = ref.read(bleTransportProvider);
    final hexStr = bytes
        .map((b) => b.toRadixString(16).padLeft(2, '0').toUpperCase())
        .join(' ');

    _addLog('TX -> FAB1: [$hexStr] (noResp: $_writeWithoutResponse)');

    try {
      await transport.writeControlPoint(
        bytes,
        withoutResponse: _writeWithoutResponse,
      );
      _addLog('OK: Dispatched [$hexStr]');
    } catch (e) {
      _addLog('ERR: Dispatch failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final connectionStateAsync = ref.watch(bleConnectionStateProvider);
    final isScanningAsync = ref.watch(isScanningProvider);
    final discoveredRobotsAsync = ref.watch(discoveredRobotsProvider);
    final telemetryAsync = ref.watch(latestTelemetryProvider);
    final metricsAsync = ref.watch(telemetryMetricsProvider);

    final connectionManager = ref.read(bleConnectionManagerProvider);
    final scanner = ref.read(bleScannerProvider);
    final pipeline = ref.read(commandPipelineProvider);

    final connState =
        connectionStateAsync.value ?? connectionManager.currentState;
    final isScanning = isScanningAsync.value ?? false;
    final robots = discoveredRobotsAsync.value ?? scanner.discoveredRobots;
    final latestPacket =
        telemetryAsync.value ?? ref.read(telemetryBusProvider).latestPacket;
    final metrics =
        metricsAsync.value ?? ref.read(telemetryBusProvider).currentMetrics;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BLE Hardware Debugger'),
        actions: [
          IconButton(
            icon: Icon(isScanning ? Icons.stop : Icons.refresh),
            tooltip: isScanning ? 'Stop Scan' : 'Scan for Robots',
            onPressed: () {
              if (isScanning) {
                scanner.stopScan();
                _addLog('Scan stopped');
              } else {
                scanner.startScan();
                _addLog('Scanning for Fabrica-* / AIR-* peripherals...');
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: AppTokens.paddingScreen,
          children: [
            // 1. Connection Status Pill
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTokens.space16,
                  vertical: AppTokens.space12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.bluetooth,
                          color: _stateColor(connState),
                          size: 20,
                        ),
                        const SizedBox(width: AppTokens.space8),
                        Text(
                          connState.name.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _stateColor(connState),
                          ),
                        ),
                      ],
                    ),
                    if (connState != BleConnectionState.disconnected)
                      TextButton(
                        onPressed: () {
                          connectionManager.disconnect();
                          _addLog('Disconnected by user');
                        },
                        child: const Text(
                          'DISCONNECT',
                          style: TextStyle(color: AppColors.crimson),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTokens.space12),

            // 2. Discovered Robots List
            if (robots.isNotEmpty) ...[
              const Text(
                'DISCOVERED ROBOTS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: AppTokens.space4),
              Card(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: robots.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final robot = robots[index];
                    return ListTile(
                      dense: true,
                      leading: Icon(
                        robot.isPairingMode
                            ? Icons.bluetooth_searching
                            : Icons.bluetooth,
                        color: robot.isPairingMode
                            ? AppColors.amber
                            : AppColors.textSecondary,
                      ),
                      title: Row(
                        children: [
                          Text(
                            robot.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          if (robot.isPairingMode) ...[
                            const SizedBox(width: AppTokens.space8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.amber.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'PAIRING MODE ACTIVE (120s)',
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.amber,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      subtitle: Text(
                        'RSSI: ${robot.smoothedRssi.round()} dBm  •  ${robot.id}',
                        style: const TextStyle(fontSize: 11),
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(60, 32),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                        onPressed: () async {
                          _addLog(
                              'Connecting to ${robot.name} (${robot.id})...');
                          try {
                            await connectionManager.connect(robot);
                            _addLog(
                                'Connected & ready! MTU: ${connectionManager.gattInfo?.negotiatedMtu}');
                          } catch (e) {
                            _addLog('Connection error: $e');
                          }
                        },
                        child: const Text('CONNECT',
                            style: TextStyle(fontSize: 11)),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppTokens.space12),
            ],

            // 3. Quick Actions & Safety Controls
            Card(
              child: Padding(
                padding: AppTokens.paddingCard,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'QUICK ACTIONS & SAFETY',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cyan,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: AppTokens.space8),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.crimson,
                              foregroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10),
                            ),
                            icon: const Icon(Icons.emergency, size: 20),
                            label: const Text(
                              'EMERGENCY STOP',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            onPressed: () async {
                              _addLog(
                                  '🚨 FAST-PATH E-STOP TRIGGERED (<50ms)');
                              try {
                                await pipeline.emergencyStop();
                                _addLog(
                                    'OK: E-Stop sent without response');
                              } catch (e) {
                                _addLog('ERR: E-Stop failed: $e');
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: AppTokens.space8),
                        Expanded(
                          flex: 2,
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.amber,
                              side: const BorderSide(color: AppColors.amber),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10),
                            ),
                            icon: const Icon(Icons.stop, size: 18),
                            label: const Text('STOP',
                                style: TextStyle(fontSize: 12)),
                            onPressed: () async {
                              _addLog('Sending Soft Stop (0x02)...');
                              try {
                                await pipeline.stopSequence();
                                _addLog('OK: Stop sequence acknowledged');
                              } catch (e) {
                                _addLog('ERR: Stop failed: $e');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTokens.space8),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.surfaceHighlight,
                              foregroundColor: AppColors.cyan,
                            ),
                            onPressed: () async {
                              _addLog('Triggering Preset 1 (0x00 0x01)...');
                              try {
                                await pipeline.runPreset(1);
                                _addLog('OK: Preset 1 acknowledged');
                              } catch (e) {
                                _addLog('ERR: Preset 1 failed: $e');
                              }
                            },
                            child: const Text('RUN PRESET 1',
                                style: TextStyle(fontSize: 11)),
                          ),
                        ),
                        const SizedBox(width: AppTokens.space8),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.surfaceHighlight,
                              foregroundColor: AppColors.emerald,
                            ),
                            onPressed: () async {
                              _addLog('Triggering Identify (0x0E)...');
                              try {
                                await pipeline.identifyRobot();
                                _addLog('OK: Identify acknowledged');
                              } catch (e) {
                                _addLog('ERR: Identify failed: $e');
                              }
                            },
                            child: const Text('IDENTIFY',
                                style: TextStyle(fontSize: 11)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTokens.space12),

            // 4. Live Telemetry Inspector (FAB2)
            Card(
              child: Padding(
                padding: AppTokens.paddingCard,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'LIVE TELEMETRY INSPECTOR (FAB2)',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.cyan,
                            letterSpacing: 0.8,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: metrics.frequencyHz >= 5.0
                                ? AppColors.cyan.withValues(alpha: 0.2)
                                : AppColors.surfaceHighlight,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: metrics.frequencyHz >= 5.0
                                  ? AppColors.cyan
                                  : AppColors.border,
                            ),
                          ),
                          child: Text(
                            '${metrics.frequencyHz.toStringAsFixed(1)} Hz',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: metrics.frequencyHz >= 5.0
                                  ? AppColors.cyan
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTokens.space8),
                    if (latestPacket == null)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Awaiting telemetry notifications on FAB2...',
                          style: TextStyle(
                              fontSize: 12, color: AppColors.textMuted),
                        ),
                      )
                    else ...[
                      // State and Packet metadata row
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.stateColor(
                                      latestPacket.systemState.value)
                                  .withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: AppColors.stateColor(
                                    latestPacket.systemState.value),
                              ),
                            ),
                            child: Text(
                              latestPacket.systemState.displayName,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppColors.stateColor(
                                    latestPacket.systemState.value),
                              ),
                            ),
                          ),
                          const SizedBox(width: AppTokens.space8),
                          Expanded(
                            child: Text(
                              'Seq: #${latestPacket.sequenceCounter}  •  Drops: ${metrics.droppedPackets} (${metrics.dropRatePercent.toStringAsFixed(1)}%)',
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColors.textSecondary),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppTokens.space8),
                      // 4-Channel Flap Angles Grid
                      Container(
                        padding: const EdgeInsets.all(AppTokens.space8),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _AnglePill(
                                label: 'Ch0 (L)',
                                angle: latestPacket.channelAngles[0]),
                            _AnglePill(
                                label: 'Ch1 (R)',
                                angle: latestPacket.channelAngles[1]),
                            _AnglePill(
                                label: 'Ch2 (B)',
                                angle: latestPacket.channelAngles[2]),
                            _AnglePill(
                                label: 'Ch3 (T)',
                                angle: latestPacket.channelAngles[3]),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppTokens.space8),
                      // Hardware info row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Heap: ${latestPacket.freeHeapKb} KB',
                            style: const TextStyle(
                                fontSize: 11, color: AppColors.textMuted),
                          ),
                          Text(
                            'RSSI: ${latestPacket.bleRssiDbm} dBm',
                            style: const TextStyle(
                                fontSize: 11, color: AppColors.textMuted),
                          ),
                          Text(
                            'Status: ${latestPacket.lastCmdStatus.name.toUpperCase()}',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: latestPacket.lastCmdStatus == CmdStatus.ok
                                  ? AppColors.emerald
                                  : AppColors.crimson,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTokens.space12),

            // 5. Raw Hex Command Injector Box
            Card(
              child: Padding(
                padding: AppTokens.paddingCard,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'RAW HEX COMMAND INJECTOR (FAB1)',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cyan,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: AppTokens.space8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _hexController,
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 14,
                              color: AppColors.textPrimary,
                            ),
                            decoration: const InputDecoration(
                              hintText:
                                  'e.g. 0E (Identify) or 00 01 (Run P1)',
                              hintStyle: TextStyle(
                                color: AppColors.textMuted,
                                fontSize: 12,
                              ),
                              isDense: true,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppTokens.space8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.cyan,
                            foregroundColor: AppColors.textOnAccent,
                          ),
                          onPressed: _sendHexCommand,
                          child: const Text('SEND'),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTokens.space4),
                    Row(
                      children: [
                        Checkbox(
                          value: _writeWithoutResponse,
                          activeColor: AppColors.cyan,
                          onChanged: (val) {
                            setState(() {
                              _writeWithoutResponse = val ?? false;
                            });
                          },
                        ),
                        const Text(
                          'Write Without Response (Fast-Path <50ms)',
                          style: TextStyle(
                              fontSize: 11,
                              color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTokens.space12),

            // 6. Dispatch & Event Console Log
            const Text(
              'PACKET LOG',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: AppTokens.space4),
            SizedBox(
              height: 160,
              child: Container(
                padding: const EdgeInsets.all(AppTokens.space8),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: AppTokens.borderRadiusSm,
                  border: Border.all(color: AppColors.border),
                ),
                child: _logs.isEmpty
                    ? const Center(
                        child: Text(
                          'No packet activity yet. Initiate scan or send hex command.',
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      )
                    : ListView.builder(
                        controller: _logScrollController,
                        itemCount: _logs.length,
                        itemBuilder: (context, index) {
                          final log = _logs[index];
                          final isError = log.contains('ERR:');
                          final isTx = log.contains('TX ->');
                          final isOk = log.contains('OK:');

                          Color logColor = AppColors.textPrimary;
                          if (isError) logColor = AppColors.crimson;
                          if (isTx) logColor = AppColors.cyan;
                          if (isOk) logColor = AppColors.emerald;

                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              log,
                              style: TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 11,
                                color: logColor,
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _stateColor(BleConnectionState state) {
    switch (state) {
      case BleConnectionState.ready:
        return AppColors.emerald;
      case BleConnectionState.connecting:
      case BleConnectionState.discovering:
      case BleConnectionState.bonding:
      case BleConnectionState.scanning:
        return AppColors.amber;
      case BleConnectionState.reconnecting:
        return AppColors.purple;
      case BleConnectionState.disconnected:
      default:
        return AppColors.textMuted;
    }
  }
}

class _AnglePill extends StatelessWidget {
  final String label;
  final int angle;

  const _AnglePill({required this.label, required this.angle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: AppColors.textMuted),
        ),
        const SizedBox(height: 2),
        Text(
          '$angle°',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            fontFamily: 'monospace',
            color: AppColors.cyan,
          ),
        ),
      ],
    );
  }
}
