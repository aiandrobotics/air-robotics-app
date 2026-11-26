import 'dart:io';

import 'package:air_robotics_app/core/ble/ble_providers.dart';
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
import 'package:air_robotics_app/core/protocol/routine_models.dart';
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
          profileStorageProvider.overrideWithValue(InMemoryProfileStorageService()),
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

      // Check Bottom Navigation Destinations (only Control, Sequencer, Calibrate)
      expect(find.text('Control'), findsWidgets);
      expect(find.text('Sequencer'), findsWidgets);
      expect(find.text('Calibrate'), findsWidgets);
      expect(find.text('Diagnostics'), findsNothing);

      // Header should only have the 3-dot menu, not individual action icons
      expect(find.byTooltip('Identify Robot (Pulse LED 3s)'), findsNothing);
      expect(find.byTooltip('Restore Factory Presets'), findsNothing);
      expect(find.byTooltip('Disconnect Robot'), findsNothing);
      expect(find.byTooltip('Hardware Debugger'), findsNothing);

      // Screen 0: Control tab widgets
      expect(find.text('FOLDING PRESETS'), findsOneWidget);
      expect(find.text('EMERGENCY STOP'), findsOneWidget);

      // Switch to Screen 2: Calibrate
      await tester.tap(find.text('Calibrate').last);
      await tester.pumpAndSettle();

      expect(find.text('SERVO MANUAL JOG'), findsOneWidget);
      expect(find.text('Channel 1'), findsOneWidget);
      expect(find.text('Channel 2'), findsOneWidget);
      expect(find.text('#1'), findsOneWidget);
      expect(find.text('#7'), findsOneWidget);

      // Open 3-dot menu and navigate to unified Diagnostics & Debugger page
      await tester.tap(find.byTooltip('More Hardware Options'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Diagnostics & Debugger'));
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
          profileStorageProvider.overrideWithValue(InMemoryProfileStorageService()),
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
          profileStorageProvider.overrideWithValue(InMemoryProfileStorageService()),
          commandPipelineProvider.overrideWithValue(CommandPipeline(transport: mockTransport)),
        ],
      );
      addTearDown(container.dispose);

      container.read(activeProfileProvider.notifier).selectProfile(profile);
      container.read(isViewingDeviceProvider.notifier).openDevice();
      await mockFleetStorage.saveRobot(RegisteredRobot(id: 'fab-robot-1', name: 'Fabrica-01', modelNumber: 'Fabrica-DevKit-v1', pairedAt: DateTime.now()));
      await mockFleetStorage.setLastConnectedRobotId('fab-robot-1');

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: DynamicScreenScaffold(key: UniqueKey()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Open More Hardware Options popup
      final moreOptions = find.byTooltip('More Hardware Options');
      expect(moreOptions, findsOneWidget);
      await tester.tap(moreOptions);
      await tester.pumpAndSettle();

      // Tap Fabrica Factory Reset
      final resetItem = find.text('Fabrica Factory Reset');
      expect(resetItem, findsOneWidget);
      await tester.tap(resetItem);
      await tester.pumpAndSettle();

      // Confirm dialog is present
      expect(find.text('Fabrica Factory Reset?'), findsOneWidget);

      // Tap CANCEL first
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();
      expect(find.text('Fabrica Factory Reset?'), findsNothing);

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
          profileStorageProvider.overrideWithValue(InMemoryProfileStorageService()),
          commandPipelineProvider.overrideWithValue(CommandPipeline(transport: mockTransport)),
        ],
      );
      addTearDown(container.dispose);

      container.read(activeProfileProvider.notifier).selectProfile(profile);
      container.read(isViewingDeviceProvider.notifier).openDevice();
      await mockFleetStorage.saveRobot(RegisteredRobot(id: 'fab-robot-1', name: 'Fabrica-01', modelNumber: 'Fabrica-DevKit-v1', pairedAt: DateTime.now()));
      await mockFleetStorage.setLastConnectedRobotId('fab-robot-1');

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: DynamicScreenScaffold(key: UniqueKey()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // 1. Erase Presets (Restore Default Button Presets) via 3-dot menu
      final moreOptions = find.byTooltip('More Hardware Options');
      await tester.tap(moreOptions);
      await tester.pumpAndSettle();
      expect(find.text('Identify Robot'), findsNothing);
      await tester.tap(find.text('Restore Default Button Presets'));
      await tester.pumpAndSettle();

      expect(find.text('Restore Default Button Presets?'), findsOneWidget);
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      await tester.tap(moreOptions);
      await tester.pumpAndSettle();
      container.read(savedButtonRoutinesProvider.notifier).setRoutine(
            1,
            FoldRoutine.fromSteps([FoldStep.dual(0, 1)]),
          );
      await tester.tap(find.text('Restore Default Button Presets'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('ERASE ALL PRESETS ON ROBOT'));
      await tester.pumpAndSettle();
      expect(mockTransport.writtenControlPointPayloads.any((p) => p.isNotEmpty && p.first == 0x0C), isTrue);
      expect(container.read(savedButtonRoutinesProvider), isEmpty);

      // 3. Disconnect via 3-dot menu
      await tester.tap(moreOptions);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Disconnect'));
      await tester.pumpAndSettle();

      expect(find.text('Disconnect Robot?'), findsOneWidget);
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      await tester.tap(moreOptions);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Disconnect'));
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

      // Save robot with null lastConnectedRobotId and disconnected bleManager so robotId is null (covers lines 190-198)
      await mockFleetStorage.saveRobot(RegisteredRobot(
        id: 'diag-bot-1',
        name: 'DiagBot-01',
        modelNumber: 'Fabrica-DevKit-v1',
        pairedAt: DateTime.now(),
      ));

      container.read(activeProfileProvider.notifier).selectProfile(customProfile);
      container.read(isViewingDeviceProvider.notifier).openDevice();

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: Builder(
              builder: (ctx) => Scaffold(
                body: ElevatedButton(
                  onPressed: () => Navigator.of(ctx).push(
                    MaterialPageRoute<void>(builder: (_) => const DynamicScreenScaffold()),
                  ),
                  child: const Text('OPEN SCAFFOLD'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('OPEN SCAFFOLD'));
      await tester.pumpAndSettle();

      // 1. Verify diagnostics icon tab rendered (line 488)
      expect(find.text('Diagnostics'), findsOneWidget);
      await tester.tap(find.text('Diagnostics').last);
      await tester.pumpAndSettle();

      // 2. Erase Presets error SnackBar (lines 85-88) via 3-dot menu
      mockTransport.failNextWrite = true;
      final moreOptions = find.byTooltip('More Hardware Options');
      await tester.tap(moreOptions);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Restore Default Button Presets'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('ERASE ALL PRESETS ON ROBOT'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Failed to reset button presets:'), findsOneWidget);

      // 3. Factory Reset with robotId == null fallback (lines 190-198)
      await tester.tap(moreOptions);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Fabrica Factory Reset'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('RESET EVERYTHING'));
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pumpAndSettle();

      // 4. Back button pop (line 294) and PopScope (line 282)
      await tester.tap(find.byTooltip('Back to Home'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('OPEN SCAFFOLD'));
      await tester.pumpAndSettle();
      final navigatorState = tester.state<NavigatorState>(find.byType(Navigator).last);
      navigatorState.maybePop();
      await tester.pumpAndSettle();
    });

    testWidgets('More Hardware Options menu: rename, disconnect, and unpair',
        (tester) async {
      final schemaStr = File('assets/profiles/air-device-profile.schema.json').readAsStringSync();
      final profileStr = File('assets/profiles/fabrica-devkit-v1.json').readAsStringSync();
      final profile = ProfileValidator.validateStrings(schemaString: schemaStr, profileString: profileStr);

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
          profileStorageProvider.overrideWithValue(InMemoryProfileStorageService()),
          commandPipelineProvider.overrideWithValue(CommandPipeline(transport: mockTransport)),
        ],
      );
      addTearDown(container.dispose);

      container.read(activeProfileProvider.notifier).selectProfile(profile);
      container.read(isViewingDeviceProvider.notifier).openDevice();
      await mockFleetStorage.saveRobot(RegisteredRobot(
        id: 'fab-robot-menu-1',
        name: 'Fabrica-LivingRoom',
        modelNumber: 'Fabrica',
        pairedAt: DateTime.now(),
      ));
      await mockFleetStorage.setLastConnectedRobotId('fab-robot-menu-1');

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: DynamicScreenScaffold(key: UniqueKey()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // 1. Rename via menu
      await tester.tap(find.byTooltip('More Hardware Options'));
      await tester.pumpAndSettle();

      expect(find.text('Rename Robot'), findsOneWidget);
      expect(find.text('Identify Robot'), findsNothing);
      expect(find.text('Restore Default Button Presets'), findsOneWidget);
      expect(find.text('Disconnect'), findsOneWidget);
      expect(find.text('Unpair Robot'), findsOneWidget);
      expect(find.text('Fabrica Factory Reset'), findsOneWidget);
      expect(find.text('Diagnostics & Debugger'), findsOneWidget);

      // Diagnostics & Debugger is at the end of the 3-dot menu
      final factoryResetY = tester.getTopLeft(find.text('Fabrica Factory Reset')).dy;
      final diagnosticsY = tester.getTopLeft(find.text('Diagnostics & Debugger')).dy;
      expect(diagnosticsY, greaterThan(factoryResetY));

      await tester.tap(find.text('Rename Robot'));
      await tester.pumpAndSettle();

      expect(find.text('Rename Robot'), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'My Fabrica Custom');
      await tester.tap(find.text('SAVE'));
      await tester.pumpAndSettle();

      expect(find.text('My Fabrica Custom'), findsOneWidget);

      // 2. Disconnect via menu
      await tester.tap(find.byTooltip('More Hardware Options'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Disconnect'));
      await tester.pumpAndSettle();

      expect(find.text('Disconnect Robot?'), findsOneWidget);
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      // 3. Save custom preset name & calibration, then Unpair via menu
      await container.read(presetNamesProvider.notifier).renamePreset(1, 'Custom Fold');
      await container.read(profileStorageProvider).saveCalibration(profile.modelNumber, {0: 15});
      expect(container.read(presetNamesProvider)[1], 'Custom Fold');

      await tester.tap(find.byTooltip('More Hardware Options'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Unpair Robot'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Unpair My Fabrica Custom?'), findsOneWidget);
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('More Hardware Options'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Unpair Robot'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('UNPAIR'));
      await tester.pumpAndSettle();

      expect(container.read(isViewingDeviceProvider), isFalse);
      expect(container.read(presetNamesProvider), isEmpty);
      expect(
        await container.read(profileStorageProvider).getPresetNames(profile.modelNumber),
        isEmpty,
      );
      expect(
        await container.read(profileStorageProvider).getCalibration(profile.modelNumber),
        isNull,
      );
      final remaining = await mockFleetStorage.getRegisteredRobots();
      expect(remaining.any((r) => r.id == 'fab-robot-menu-1'), isFalse);
    });
  });
}
