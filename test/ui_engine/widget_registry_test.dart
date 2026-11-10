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

    testWidgets('renders live Fabrica visualizer and sequencer widgets',
        (tester) async {
      final registry = WidgetRegistry();

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Consumer(
                builder: (context, ref, _) {
                  return SingleChildScrollView(
                    child: Column(
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
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('FLAP CANVAS'), findsOneWidget);
      expect(find.text('FOLDING TIMELINE'), findsOneWidget);
      expect(find.text('LIVE 60 FPS'), findsOneWidget);
      expect(find.text('PREVIEW ON ROBOT'), findsOneWidget);
    });
  });
}
