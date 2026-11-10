import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_colors.dart';
import '../theme/app_tokens.dart';
import 'ble_providers.dart';
import 'ble_transport_interface.dart';

/// Developer Debug & Testing Screen.
///
/// Provides BLE discovery controls, connection lifecycle status, and a
/// raw hex command injection console to dispatch test bytes directly to FAB1.
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
    final connectionManager = ref.read(bleConnectionManagerProvider);
    final scanner = ref.read(bleScannerProvider);

    final connState = connectionStateAsync.value ?? connectionManager.currentState;
    final isScanning = isScanningAsync.value ?? false;
    final robots = discoveredRobotsAsync.value ?? scanner.discoveredRobots;

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
        child: Padding(
          padding: AppTokens.paddingScreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemCount: robots.length,
                    itemBuilder: (context, index) {
                      final robot = robots[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: AppTokens.space4),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            robot.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                              _addLog('Connecting to ${robot.name} (${robot.id})...');
                              try {
                                await connectionManager.connect(robot);
                                _addLog('Connected & ready! MTU: ${connectionManager.gattInfo?.negotiatedMtu}');
                              } catch (e) {
                                _addLog('Connection error: $e');
                              }
                            },
                            child: const Text('CONNECT', style: TextStyle(fontSize: 11)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppTokens.space12),
              ],

              // 3. Raw Hex Command Injector Box
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
                                hintText: 'e.g. 0E (Identify) or 00 01 (Run P1)',
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
                            style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppTokens.space12),

              // 4. Dispatch & Event Console Log
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
              Expanded(
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
                              padding: const EdgeInsets.symmetric(vertical: 2.0),
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
