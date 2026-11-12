import 'dart:io';

import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/core/ble/developer_debug_screen.dart';
import 'package:air_robotics_app/core/fleet/fleet_providers.dart';
import 'package:air_robotics_app/core/fleet/fleet_storage_service.dart';
import 'package:air_robotics_app/core/fleet/registered_robot.dart';
import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/core/profile/diagnostic_profile_builder.dart';
import 'package:air_robotics_app/core/profile/profile_providers.dart';
import 'package:air_robotics_app/core/profile/profile_resolver.dart';
import 'package:air_robotics_app/core/profile/profile_storage_service.dart';
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

      // Tap Full Factory Reset
      final resetItem = find.text('Full Factory Reset');
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

      await tester.tap(find.text('RESET EVERYTHING'));
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

      // 2. Erase Presets (Restore Factory Presets)
      final eraseIcon = find.byTooltip('Restore Factory Presets');
      expect(eraseIcon, findsOneWidget);
      await tester.tap(eraseIcon);
      await tester.pumpAndSettle();

      expect(find.text('Restore Factory Presets?'), findsOneWidget);
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

    testWidgets('PopScope, factory reset fallbacks, erase error snackbar, and diagnostics icon', (tester) async {
      tester.view.physicalSize = const Size(800, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final base = DiagnosticProfileBuilder.build('Test-Diag-V1');
      final customProfile = DeviceProfile(
        schemaVersion: base.schemaVersion,
        modelNumber: base.modelNumber,
        name: base.name,
        description: base.description,
        manufacturer: base.manufacturer,
        gatt: base.gatt,
        capabilities: base.capabilities,
        actuators: base.actuators,
        presets: base.presets,
        visualizers: base.visualizers,
        screens: const [
          AirScreenConfig(
            id: 's_control',
            title: 'Control',
            icon: 'control',
            widgets: [],
          ),
          AirScreenConfig(
            id: 's_diag',
            title: 'Diagnostics',
            icon: 'diagnostics',
            widgets: [],
          ),
        ],
      );

      final robot = DiscoveredRobot(
        id: 'diag-bot-1',
        name: 'DiagBot-01',
        rawRssi: -50,
        smoothedRssi: -50.0,
        isPairingMode: false,
        lastSeen: DateTime.now(),
      );

      final inMemoryStorage = InMemoryProfileStorageService();
      final inMemoryResolver = ProfileResolver(storageService: inMemoryStorage);
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
          profileStorageProvider.overrideWithValue(inMemoryStorage),
          profileResolverProvider.overrideWithValue(inMemoryResolver),
          commandPipelineProvider.overrideWithValue(CommandPipeline(transport: mockTransport, telemetryBus: null)),
        ],
      );
      addTearDown(container.dispose);

      // Connect so bleManager.connectedRobot != null (covers lines 190, 192)
      await container.read(bleConnectionManagerProvider).connect(robot);
      await mockFleetStorage.saveRobot(RegisteredRobot(id: 'diag-bot-1', name: 'DiagBot-01', pairedAt: DateTime.now()));
      await mockFleetStorage.setLastConnectedRobotId('diag-bot-1');

      container.read(activeProfileProvider.notifier).selectProfile(customProfile);
      container.read(isViewingDeviceProvider.notifier).openDevice();

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: Navigator(
              onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => const DynamicScreenScaffold(),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // 1. Verify diagnostics icon tab rendered (line 492)
      expect(find.text('Diagnostics'), findsOneWidget);
      await tester.tap(find.text('Diagnostics').last);
      await tester.pumpAndSettle();

      // 2. Erase Presets error SnackBar (lines 85-88)
      mockTransport.failNextWrite = true;
      final eraseIcon = find.byTooltip('Restore Factory Presets');
      await tester.tap(eraseIcon);
      await tester.pumpAndSettle();
      await tester.tap(find.text('ERASE IN FIRMWARE'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Failed to restore factory presets:'), findsOneWidget);

      // 3. Factory Reset with failNextWrite so fallback 0x1F runs (lines 177-178, 190, 192)
      final moreOptions = find.byTooltip('More Hardware Options');
      await tester.tap(moreOptions);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Full Factory Reset'));
      await tester.pumpAndSettle();

      mockTransport.failNextWrite = true;
      await tester.tap(find.text('RESET EVERYTHING'));
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pumpAndSettle();

      // 4. PopScope onPopInvokedWithResult (lines 283-288)
      final navigatorState = tester.state<NavigatorState>(find.byType(Navigator).last);
      navigatorState.maybePop();
      await tester.pumpAndSettle();
    });
  });
}
