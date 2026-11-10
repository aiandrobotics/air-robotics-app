import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/profile/device_profile.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_tokens.dart';
import 'widget_catalog/emergency_stop_widget.dart';
import 'widget_catalog/jog_slider_bank_widget.dart';
import 'widget_catalog/preset_grid_widget.dart';
import 'widget_catalog/raw_hex_console_widget.dart';
import 'widget_catalog/status_banner_widget.dart';
import 'widget_catalog/telemetry_strip_chart_widget.dart';
import 'widget_catalog/timeline_sequencer_widget.dart';
import '../visualizers/fabrica/fabrica_flap_canvas.dart';

/// Signature for a dynamic SDUI widget builder function.
typedef SduiWidgetBuilder = Widget Function(
  BuildContext context,
  AirWidgetConfig config,
  WidgetRef ref,
);

/// Central registry mapping declarative widget type identifiers
/// to concrete Flutter UI implementations.
class WidgetRegistry {
  final Map<String, SduiWidgetBuilder> _builders = {};

  WidgetRegistry() {
    _registerStandardCatalog();
  }

  /// Registers a custom or overridden widget builder for [type].
  void register(String type, SduiWidgetBuilder builder) {
    _builders[type] = builder;
  }

  /// Builds a widget for [config]. If the type is unrecognized,
  /// returns a safe fallback card rather than throwing an exception.
  Widget buildWidget(
    BuildContext context,
    AirWidgetConfig config,
    WidgetRef ref,
  ) {
    final builder = _builders[config.type];
    if (builder != null) {
      return builder(context, config, ref);
    }
    return _buildFallback(context, config);
  }

  void _registerStandardCatalog() {
    register('status-banner', (context, config, ref) {
      return StatusBannerWidget(config: config);
    });

    register('emergency-stop-button', (context, config, ref) {
      return EmergencyStopWidget(config: config);
    });

    register('preset-grid', (context, config, ref) {
      return PresetGridWidget(config: config);
    });

    register('jog-slider-bank', (context, config, ref) {
      return JogSliderBankWidget(config: config);
    });

    register('raw-hex-console', (context, config, ref) {
      return RawHexConsoleWidget(config: config);
    });

    register('telemetry-strip-chart', (context, config, ref) {
      return TelemetryStripChartWidget(config: config);
    });

    register('visualizer', (context, config, ref) {
      return FabricaFlapVisualizerWidget(config: config);
    });

    register('timeline-sequencer', (context, config, ref) {
      return TimelineSequencerWidget(config: config);
    });
  }

  Widget _buildFallback(BuildContext context, AirWidgetConfig config) {
    return Card(
      color: AppColors.surfaceHighlight,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: AppTokens.paddingCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.warning_amber_rounded,
                    color: AppColors.amber, size: 20),
                const SizedBox(width: AppTokens.space8),
                Text(
                  'Unsupported Widget: ${config.type}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.amber,
                  ),
                ),
              ],
            ),
            if (config.title.isNotEmpty) ...[
              const SizedBox(height: AppTokens.space4),
              Text(
                'Title: ${config.title}',
                style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Provider exposing the application [WidgetRegistry].
final widgetRegistryProvider = Provider<WidgetRegistry>((ref) {
  return WidgetRegistry();
});
