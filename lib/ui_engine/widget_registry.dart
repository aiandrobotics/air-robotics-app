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

    // Phase 6 forward compatibility placeholders
    register('visualizer', (context, config, ref) {
      final visualizerId = config.props['visualizer_id'] as String? ?? 'default';
      return Card(
        child: Padding(
          padding: AppTokens.paddingCard,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.view_in_ar, color: AppColors.cyan),
                  const SizedBox(width: AppTokens.space8),
                  Text(
                    config.title.isNotEmpty ? config.title : 'Kinematic Visualizer',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: AppTokens.space8),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surfaceHighlight,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.motion_photos_on,
                          size: 36, color: AppColors.cyan),
                      const SizedBox(height: AppTokens.space8),
                      Text(
                        'Visualizer: $visualizerId',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: AppTokens.space4),
                      const Text(
                        'Interactive 2D Flap Canvas (Phase 6)',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppColors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });

    register('timeline-sequencer', (context, config, ref) {
      return Card(
        child: Padding(
          padding: AppTokens.paddingCard,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.tune, color: AppColors.cyan),
                  const SizedBox(width: AppTokens.space8),
                  Text(
                    config.title.isNotEmpty ? config.title : 'Sequence Editor',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: AppTokens.space8),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surfaceHighlight,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.movie_creation_outlined,
                          size: 28, color: AppColors.textMuted),
                      SizedBox(height: AppTokens.space4),
                      Text(
                        'Multi-Step Timeline Sequencer & Flash Sync (Phase 6)',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppColors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
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
