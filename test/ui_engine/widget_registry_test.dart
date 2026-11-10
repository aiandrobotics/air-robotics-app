import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/ui_engine/widget_registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WidgetRegistry Engine Tests', () {
    testWidgets('resolves and builds standard registered widgets',
        (tester) async {
      final registry = WidgetRegistry();

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Consumer(
                builder: (context, ref, _) {
                  return registry.buildWidget(
                    context,
                    const AirWidgetConfig(
                      type: 'emergency-stop-button',
                      title: 'Stop Test',
                    ),
                    ref,
                  );
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('EMERGENCY STOP'), findsOneWidget);
    });

    testWidgets('allows custom widget registration and overrides',
        (tester) async {
      final registry = WidgetRegistry();

      registry.register('custom-dial', (context, config, ref) {
        return Container(
          key: const ValueKey('custom-dial-key'),
          child: Text('Custom Dial: ${config.title}'),
        );
      });

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Consumer(
                builder: (context, ref, _) {
                  return registry.buildWidget(
                    context,
                    const AirWidgetConfig(
                      type: 'custom-dial',
                      title: 'Speed Dial',
                    ),
                    ref,
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect(find.byKey(const ValueKey('custom-dial-key')), findsOneWidget);
      expect(find.text('Custom Dial: Speed Dial'), findsOneWidget);
    });

    testWidgets('renders safe fallback card for unknown widget types',
        (tester) async {
      final registry = WidgetRegistry();

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Consumer(
                builder: (context, ref, _) {
                  return registry.buildWidget(
                    context,
                    const AirWidgetConfig(
                      type: 'unsupported-mystery-gauge',
                      title: 'Mystery Gauge',
                    ),
                    ref,
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('Unsupported Widget: unsupported-mystery-gauge'),
          findsOneWidget);
      expect(find.text('Title: Mystery Gauge'), findsOneWidget);
    });

    testWidgets('renders placeholder cards for Phase 6 forward compatibility',
        (tester) async {
      final registry = WidgetRegistry();

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Consumer(
                builder: (context, ref, _) {
                  return Column(
                    children: [
                      registry.buildWidget(
                        context,
                        const AirWidgetConfig(
                          type: 'visualizer',
                          title: 'Flap Canvas',
                          props: {'visualizer_id': 'fabrica-flap-grid'},
                        ),
                        ref,
                      ),
                      registry.buildWidget(
                        context,
                        const AirWidgetConfig(
                          type: 'timeline-sequencer',
                          title: 'Folding Timeline',
                        ),
                        ref,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('Flap Canvas'), findsOneWidget);
      expect(find.text('Visualizer: fabrica-flap-grid'), findsOneWidget);
      expect(find.text('Folding Timeline'), findsOneWidget);
      expect(
          find.text('Multi-Step Timeline Sequencer & Flash Sync (Phase 6)'),
          findsOneWidget);
    });
  });
}
