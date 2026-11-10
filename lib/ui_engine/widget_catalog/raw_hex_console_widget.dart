import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/profile/device_profile.dart';
import '../../core/protocol/protocol_providers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_tokens.dart';

/// Engineering diagnostic console with live packet stream logging,
/// packet loss & frequency metrics, and direct raw hex command injection to FAB1.
class RawHexConsoleWidget extends ConsumerStatefulWidget {
  final AirWidgetConfig config;

  const RawHexConsoleWidget({super.key, required this.config});

  @override
  ConsumerState<RawHexConsoleWidget> createState() =>
      _RawHexConsoleWidgetState();
}

class _RawHexConsoleWidgetState extends ConsumerState<RawHexConsoleWidget> {
  final TextEditingController _hexController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<String> _logLines = [];
  bool _withoutResponse = false;
  int _lastLoggedSeq = -1;

  @override
  void dispose() {
    _hexController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _addLog(String text) {
    final bufferSize =
        (widget.config.props['buffer_size'] as num?)?.toInt() ?? 250;
    setState(() {
      final time = DateTime.now().toIso8601String().substring(11, 19);
      _logLines.add('[$time] $text');
      if (_logLines.length > bufferSize) {
        _logLines.removeRange(0, _logLines.length - bufferSize);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendHexCommand() async {
    final text = _hexController.text.trim();
    if (text.isEmpty) return;

    final cleaned = text.replaceAll(RegExp(r'[^0-9a-fA-F]'), '');
    if (cleaned.length % 2 != 0) {
      _addLog('ERR: Odd hex string length');
      return;
    }

    final bytes = <int>[];
    for (int i = 0; i < cleaned.length; i += 2) {
      bytes.add(int.parse(cleaned.substring(i, i + 2), radix: 16));
    }

    final hexDisplay = bytes
        .map((b) => b.toRadixString(16).padLeft(2, '0').toUpperCase())
        .join(' ');
    _addLog('TX -> FAB1: [$hexDisplay] (noResp: $_withoutResponse)');

    try {
      final pipeline = ref.read(commandPipelineProvider);
      await pipeline.sendRawControlPoint(
        Uint8List.fromList(bytes),
        withoutResponse: _withoutResponse,
      );
      _addLog('OK: Dispatched $hexDisplay');
    } catch (e) {
      _addLog('ERR: Dispatch failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final metricsAsync = ref.watch(telemetryMetricsProvider);
    final telemetryAsync = ref.watch(latestTelemetryProvider);

    final metrics =
        metricsAsync.value ?? ref.read(telemetryBusProvider).currentMetrics;
    final packet =
        telemetryAsync.value ?? ref.read(telemetryBusProvider).latestPacket;

    // Log new telemetry packets as they arrive
    if (packet != null && packet.sequenceCounter != _lastLoggedSeq) {
      _lastLoggedSeq = packet.sequenceCounter;
      final seqStr = packet.sequenceCounter.toString().padLeft(5, '0');
      final stateStr = packet.systemState.displayName;
      final statusStr = packet.lastCmdStatus.name.toUpperCase();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _addLog(
          'RX #$seqStr | State: $stateStr | Status: $statusStr | RSSI: ${packet.bleRssiDbm} dBm',
        );
      });
    }

    return Card(
      child: Padding(
        padding: AppTokens.paddingCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header & Stream Statistics
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.terminal, color: AppColors.cyan, size: 20),
                    const SizedBox(width: AppTokens.space8),
                    Text(
                      widget.config.title.isNotEmpty
                          ? widget.config.title.toUpperCase()
                          : 'PACKET CONSOLE (FAB1 / FAB2)',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cyan,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    setState(() => _logLines.clear());
                  },
                  child: const Text('CLEAR', style: TextStyle(fontSize: 11)),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // Live Performance Metrics Row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: metrics.frequencyHz >= 5.0
                        ? AppColors.cyan.withValues(alpha: 0.15)
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
                const SizedBox(width: AppTokens.space8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: metrics.droppedPackets > 0
                        ? AppColors.crimson.withValues(alpha: 0.15)
                        : AppColors.surfaceHighlight,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: metrics.droppedPackets > 0
                          ? AppColors.crimson
                          : AppColors.border,
                    ),
                  ),
                  child: Text(
                    'Drops: ${metrics.droppedPackets} (${metrics.dropRatePercent.toStringAsFixed(1)}%)',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: metrics.droppedPackets > 0
                          ? AppColors.crimson
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
                const SizedBox(width: AppTokens.space8),
                Text(
                  'Total: ${metrics.totalPackets}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textMuted,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppTokens.space12),

            // Scrollable Log Console
            Container(
              height: 180,
              width: double.infinity,
              padding: const EdgeInsets.all(AppTokens.space8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.border),
              ),
              child: _logLines.isEmpty
                  ? const Center(
                      child: Text(
                        'Awaiting telemetry notifications or hex commands...',
                        style: TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 11,
                          fontFamily: 'monospace',
                        ),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: _logLines.length,
                      itemBuilder: (context, index) {
                        final line = _logLines[index];
                        final isTx = line.contains('TX ->');
                        final isErr = line.contains('ERR:');
                        final isOk = line.contains('OK:');

                        Color color = AppColors.textSecondary;
                        if (isTx) color = AppColors.cyan;
                        if (isErr) color = AppColors.crimson;
                        if (isOk) color = AppColors.emerald;

                        return Text(
                          line,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 10,
                            color: color,
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: AppTokens.space12),

            // Raw Hex Injection Form
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _hexController,
                    decoration: const InputDecoration(
                      labelText: 'Hex Opcode / Payload',
                      hintText: 'e.g. 0E or 00 01',
                      isDense: true,
                    ),
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                    ),
                    onSubmitted: (_) => _sendHexCommand(),
                  ),
                ),
                const SizedBox(width: AppTokens.space8),
                ElevatedButton(
                  onPressed: _sendHexCommand,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.cyan,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('SEND'),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _withoutResponse,
                  onChanged: (val) {
                    setState(() => _withoutResponse = val ?? false);
                  },
                ),
                const Text(
                  'Write Without Response (Fast Path)',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
