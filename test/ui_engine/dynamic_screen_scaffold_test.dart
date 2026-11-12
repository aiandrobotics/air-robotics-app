import 'dart:io';

import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/developer_debug_screen.dart';
import 'package:air_robotics_app/core/fleet/fleet_providers.dart';
import 'package:air_robotics_app/core/fleet/fleet_storage_service.dart';
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
    late InMemoryFleetStorageService mockFleetStorage;

    setUp(() {
      mockTransport = MockBleTransport();
      mockFleetStorage = InMemoryFleetStorageService();
    });

    tearDown(() {
      mockTransport.dispose();
      mockFleetStorage.close();
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
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
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
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
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

    testWidgets('Full Factory Reset (0x1F) dispatches opcode and removes device', (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final schemaStr = File('assets/profiles/air-device-profile.schema.json').readAsStringSync();
      final profileStr = File('assets/profiles/fabrica-devkit-v1.json').readAsStringSync();
      final profile = ProfileValidator.validateStrings(schemaString: schemaStr, profileString: profileStr);

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
          commandPipelineProvider.overrideWithValue(CommandPipeline(transport: mockTransport)),
        ],
      );
      addTearDown(container.dispose);

      container.read(activeProfileProvider.notifier).selectProfile(profile);
      container.read(isViewingDeviceProvider.notifier).openDevice();

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: DynamicScreenScaffold(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Open More Hardware Options popup
      final moreOptions = find.byTooltip('More Hardware Options');
      expect(moreOptions, findsOneWidget);
      await tester.tap(moreOptions);
      await tester.pumpAndSettle();

      // Tap Full Factory Reset (0x1F)
      final resetItem = find.text('Full Factory Reset (0x1F)');
      expect(resetItem, findsOneWidget);
      await tester.tap(resetItem);
      await tester.pumpAndSettle();

      // Confirm dialog is present
      expect(find.text('Full Hardware Factory Reset?'), findsOneWidget);

      // Tap CANCEL first
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();
      expect(find.text('Full Hardware Factory Reset?'), findsNothing);

      // Open popup again and proceed with RESET
      await tester.tap(moreOptions);
      await tester.pumpAndSettle();
      await tester.tap(resetItem);
      await tester.pumpAndSettle();

      await tester.tap(find.text('RESET EVERYTHING (0x1F)'));
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pumpAndSettle();

      // Opcode 0x1F must be transmitted to hardware!
      expect(mockTransport.writtenControlPointPayloads.any((p) => p.isNotEmpty && p.first == 0x1F), isTrue);
      expect(container.read(isViewingDeviceProvider), isFalse);
    });

    testWidgets('Erase Presets (0x0C), Identify (0x0E), and Disconnect actions', (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final schemaStr = File('assets/profiles/air-device-profile.schema.json').readAsStringSync();
      final profileStr = File('assets/profiles/fabrica-devkit-v1.json').readAsStringSync();
      final profile = ProfileValidator.validateStrings(schemaString: schemaStr, profileString: profileStr);

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
          commandPipelineProvider.overrideWithValue(CommandPipeline(transport: mockTransport)),
        ],
      );
      addTearDown(container.dispose);

      container.read(activeProfileProvider.notifier).selectProfile(profile);
      container.read(isViewingDeviceProvider.notifier).openDevice();

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: DynamicScreenScaffold(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // 1. Identify Robot (0x0E)
      final identifyIcon = find.byTooltip('Identify Robot (Pulse LED 3s)');
      expect(identifyIcon, findsOneWidget);
      await tester.tap(identifyIcon);
      await tester.pumpAndSettle();
      expect(mockTransport.writtenControlPointPayloads.any((p) => p.isNotEmpty && p.first == 0x0E), isTrue);

      // 2. Erase Presets (0x0C)
      final eraseIcon = find.byTooltip('Erase Presets in Firmware');
      expect(eraseIcon, findsOneWidget);
      await tester.tap(eraseIcon);
      await tester.pumpAndSettle();

      expect(find.text('Erase All Presets in Firmware?'), findsOneWidget);
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      await tester.tap(eraseIcon);
      await tester.pumpAndSettle();
      await tester.tap(find.text('ERASE IN FIRMWARE'));
      await tester.pumpAndSettle();
      expect(mockTransport.writtenControlPointPayloads.any((p) => p.isNotEmpty && p.first == 0x0C), isTrue);

      // 3. Disconnect
      final disconnectIcon = find.byTooltip('Disconnect Robot');
      expect(disconnectIcon, findsOneWidget);
      await tester.tap(disconnectIcon);
      await tester.pumpAndSettle();

      expect(find.text('Disconnect Robot?'), findsOneWidget);
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      await tester.tap(disconnectIcon);
      await tester.pumpAndSettle();
      await tester.tap(find.text('DISCONNECT'));
      await tester.pumpAndSettle();
      expect(container.read(isViewingDeviceProvider), isFalse);
    });
  });
}
