import 'dart:io';

import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/developer_debug_screen.dart';
import 'package:air_robotics_app/core/profile/profile_providers.dart';
import 'package:air_robotics_app/core/profile/profile_validator.dart';
import 'package:air_robotics_app/core/protocol/command_pipeline.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/ui_engine/dynamic_screen_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('DynamicScreenScaffold Dynamic Layout Tests', () {
    late MockBleTransport mockTransport;

    setUp(() {
      mockTransport = MockBleTransport();
    });

    tearDown(() {
      mockTransport.dispose();
    });

    testWidgets('renders adaptive navigation and switches screens dynamically',
        (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final schemaStr =
          File('assets/profiles/air-device-profile.schema.json')
              .readAsStringSync();
      final profileStr =
          File('assets/profiles/fabrica-devkit-v1.json').readAsStringSync();

      final profile = ProfileValidator.validateStrings(
        schemaString: schemaStr,
        profileString: profileStr,
      );

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport),
          ),
        ],
      );
      addTearDown(container.dispose);

      // Bind Fabrica profile to activeProfileProvider
      container.read(activeProfileProvider.notifier).selectProfile(profile);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: DynamicScreenScaffold(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Check App Bar metadata
      expect(find.text('Fabrica Cloth Folding Robot'), findsOneWidget);

      // Check Bottom Navigation Destinations
      expect(find.text('Control'), findsWidgets);
      expect(find.text('Sequencer'), findsWidgets);
      expect(find.text('Calibrate'), findsWidgets);
      expect(find.text('Diagnostics'), findsWidgets);

      // Screen 0: Control tab widgets
      expect(find.text('FOLDING PRESETS'), findsOneWidget);
      expect(find.text('EMERGENCY STOP'), findsOneWidget);

      // Switch to Screen 2: Calibrate
      await tester.tap(find.text('Calibrate').last);
      await tester.pumpAndSettle();

      expect(find.text('SERVO MANUAL JOG'), findsOneWidget);
      expect(find.text('Left Flap'), findsOneWidget);
      expect(find.text('Right Flap'), findsOneWidget);

      // Switch to Screen 3: Diagnostics
      await tester.tap(find.text('Diagnostics').last);
      await tester.pumpAndSettle();

      expect(find.text('PACKET CONSOLE'), findsOneWidget);
      expect(find.text('TRAJECTORY CHART'), findsOneWidget);

      // Tap BLE Debugger App Bar Icon
      final debugIcon = find.byIcon(Icons.bug_report);
      expect(debugIcon, findsOneWidget);
      await tester.tap(debugIcon);
      await tester.pumpAndSettle();

      expect(find.byType(DeveloperDebugScreen), findsOneWidget);
    });

    testWidgets('back button updates isViewingDevice to false', (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final schemaStr =
          File('assets/profiles/air-device-profile.schema.json')
              .readAsStringSync();
      final profileStr =
          File('assets/profiles/fabrica-devkit-v1.json').readAsStringSync();

      final profile = ProfileValidator.validateStrings(
        schemaString: schemaStr,
        profileString: profileStr,
      );

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          commandPipelineProvider.overrideWithValue(
            CommandPipeline(transport: mockTransport),
          ),
        ],
      );
      addTearDown(container.dispose);

      container.read(activeProfileProvider.notifier).selectProfile(profile);
      container.read(isViewingDeviceProvider.notifier).openDevice();
      expect(container.read(isViewingDeviceProvider), isTrue);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: DynamicScreenScaffold(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find back button
      final backButton = find.byTooltip('Back to Home');
      expect(backButton, findsOneWidget);

      await tester.tap(backButton);
      await tester.pumpAndSettle();

      expect(container.read(isViewingDeviceProvider), isFalse);
    });
  });
}
