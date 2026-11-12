import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:air_robotics_app/core/ble/ble_connection_manager.dart';
import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/core/fleet/fleet_providers.dart';
import 'package:air_robotics_app/core/fleet/fleet_storage_service.dart';
import 'package:air_robotics_app/core/fleet/registered_robot.dart';
import 'package:air_robotics_app/core/profile/profile_providers.dart';
import 'package:air_robotics_app/core/profile/profile_resolver.dart';
import 'package:air_robotics_app/core/profile/profile_storage_service.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:air_robotics_app/ui_engine/dynamic_screen_scaffold.dart';

import '../mocks/mock_ble_transport.dart';

class _MapAssetBundle extends CachingAssetBundle {
  final Map<String, String> assets;
  _MapAssetBundle(this.assets);

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    final content = assets[key];
    if (content == null) throw ArgumentError('Asset not found: $key');
    return content;
  }

  @override
  Future<ByteData> load(String key) async {
    final content = assets[key];
    if (content == null) throw ArgumentError('Asset not found: $key');
    return ByteData.sublistView(Uint8List.fromList(utf8.encode(content)));
  }
}

void main() {
  group('Multi-Device State Isolation & Command Routing Tests', () {
    late MockBleTransport mockTransport;
    late InMemoryFleetStorageService mockFleetStorage;
    late InMemoryProfileStorageService mockProfileStorage;
    late ProfileResolver mockResolver;

    final robotFabrica1 = DiscoveredRobot(
      id: '04:B2:47:05:50:8A',
      name: 'Fabrica-508A',
      rawRssi: -55,
      smoothedRssi: -55.0,
      isPairingMode: false,
      lastSeen: DateTime.now(),
    );

    final robotFabrica2 = DiscoveredRobot(
      id: '04:B2:47:05:99:99',
      name: 'Fabrica-9999',
      rawRssi: -62,
      smoothedRssi: -62.0,
      isPairingMode: false,
      lastSeen: DateTime.now(),
    );

    final robotOtherDevice = DiscoveredRobot(
      id: 'AA:BB:CC:11:22:33',
      name: 'AIR-Arm-X1',
      rawRssi: -70,
      smoothedRssi: -70.0,
      isPairingMode: false,
      lastSeen: DateTime.now(),
    );

    setUp(() {
      final schemaFile = File('assets/profiles/air-device-profile.schema.json');
      final fabricaFile = File('assets/profiles/fabrica-devkit-v1.json');
      final assets = <String, String>{
        'assets/profiles/air-device-profile.schema.json': schemaFile.readAsStringSync(),
        'assets/profiles/fabrica-devkit-v1.json': fabricaFile.readAsStringSync(),
      };

      mockTransport = MockBleTransport();
      mockFleetStorage = InMemoryFleetStorageService();
      mockProfileStorage = InMemoryProfileStorageService();
      mockResolver = ProfileResolver(
        storageService: mockProfileStorage,
        assetBundle: _MapAssetBundle(assets),
      );
    });

    tearDown(() {
      mockTransport.dispose();
      mockFleetStorage.close();
      mockProfileStorage.close();
    });

    test('maintains separate fleet registrations and nicknames without crosstalk', () async {
      final reg1 = RegisteredRobot(
        id: robotFabrica1.id,
        name: robotFabrica1.name,
        modelNumber: 'Fabrica-DevKit-v1',
        pairedAt: DateTime.now(),
        customNickname: 'Living Room Fabrica',
      );
      final reg2 = RegisteredRobot(
        id: robotFabrica2.id,
        name: robotFabrica2.name,
        modelNumber: 'Fabrica-DevKit-v1',
        pairedAt: DateTime.now(),
        customNickname: 'Basement Fabrica',
      );
      final reg3 = RegisteredRobot(
        id: robotOtherDevice.id,
        name: robotOtherDevice.name,
        modelNumber: 'AIR-Arm-Diagnostic',
        pairedAt: DateTime.now(),
      );

      await mockFleetStorage.saveRobot(reg1);
      await mockFleetStorage.saveRobot(reg2);
      await mockFleetStorage.saveRobot(reg3);

      var fleet = await mockFleetStorage.getRegisteredRobots();
      expect(fleet.length, equals(3));

      // Update nickname on device 1 only
      await mockFleetStorage.updateNickname(robotFabrica1.id, 'Upstairs Master Fabrica');
      fleet = await mockFleetStorage.getRegisteredRobots();

      final updated1 = fleet.firstWhere((r) => r.id == robotFabrica1.id);
      final untouched2 = fleet.firstWhere((r) => r.id == robotFabrica2.id);
      final untouched3 = fleet.firstWhere((r) => r.id == robotOtherDevice.id);

      expect(updated1.displayName, equals('Upstairs Master Fabrica'));
      expect(untouched2.displayName, equals('Basement Fabrica'));
      expect(untouched3.displayName, equals('AIR-Arm-X1'));

      // Remove device 2; verify devices 1 and 3 remain intact
      await mockFleetStorage.removeRobot(robotFabrica2.id);
      fleet = await mockFleetStorage.getRegisteredRobots();
      expect(fleet.length, equals(2));
      expect(fleet.any((r) => r.id == robotFabrica2.id), isFalse);
      expect(fleet.any((r) => r.id == robotFabrica1.id), isTrue);
      expect(fleet.any((r) => r.id == robotOtherDevice.id), isTrue);
    });

    test('BleConnectionManager cleanly switches active connection when targeting different robot', () async {
      final manager = BleConnectionManager(transport: mockTransport);
      addTearDown(() => manager.dispose());

      // 1. Connect to Fabrica 1
      await manager.connect(robotFabrica1);
      expect(manager.currentState, equals(BleConnectionState.ready));
      expect(manager.connectedRobot?.id, equals(robotFabrica1.id));
      expect(mockTransport.currentConnectionState, equals(BleConnectionState.connected));

      // 2. Connect to Fabrica 2 - must cleanly disconnect Fabrica 1 and connect to Fabrica 2
      await manager.connect(robotFabrica2);
      expect(manager.currentState, equals(BleConnectionState.ready));
      expect(manager.connectedRobot?.id, equals(robotFabrica2.id));
      expect(mockTransport.connectedRobot?.id, equals(robotFabrica2.id));

      // 3. Re-connecting to Fabrica 2 while already ready is a safe no-op
      await manager.connect(robotFabrica2);
      expect(manager.currentState, equals(BleConnectionState.ready));
      expect(manager.connectedRobot?.id, equals(robotFabrica2.id));
    });

    test('commands are dispatched strictly to currently connected device and not leaking to others', () async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
          profileStorageProvider.overrideWithValue(mockProfileStorage),
        ],
      );
      addTearDown(() => container.dispose());

      final manager = container.read(bleConnectionManagerProvider);
      final pipeline = container.read(commandPipelineProvider);

      // Connect to Fabrica 1
      await manager.connect(robotFabrica1);
      expect(manager.connectedRobot?.id, equals(robotFabrica1.id));

      // Send emergency stop (0x03) to Fabrica 1
      await pipeline.emergencyStop();

      // Verify command recorded under Fabrica 1
      expect(mockTransport.deviceWrittenControlPointPayloads[robotFabrica1.id]?.length, equals(1));
      expect(mockTransport.deviceWrittenControlPointPayloads[robotFabrica1.id]?.first, equals(Uint8List.fromList([0x03])));
      expect(mockTransport.deviceWrittenControlPointPayloads[robotFabrica2.id], isNull);

      // Switch connection to Fabrica 2
      await manager.connect(robotFabrica2);
      expect(manager.connectedRobot?.id, equals(robotFabrica2.id));

      // Send jog motor command to Fabrica 2
      await pipeline.jogMotor(channel: 0, angleDeg: 90);

      // Verify command recorded under Fabrica 2 only
      expect(mockTransport.deviceWrittenControlPointPayloads[robotFabrica2.id]?.length, equals(1));
      expect(mockTransport.deviceWrittenControlPointPayloads[robotFabrica2.id]?.first, equals(Uint8List.fromList([0x0D, 0x00, 0x5A])));
      // Fabrica 1 command count remained 1
      expect(mockTransport.deviceWrittenControlPointPayloads[robotFabrica1.id]?.length, equals(1));
    });

    test('telemetry packets and metrics reset completely between device connections', () async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
          profileStorageProvider.overrideWithValue(mockProfileStorage),
        ],
      );
      addTearDown(() => container.dispose());

      container.listen(bleConnectionStateProvider, (_, _) {});
      container.listen(latestTelemetryProvider, (_, _) {});

      final manager = container.read(bleConnectionManagerProvider);
      final bus = container.read(telemetryBusProvider);

      await manager.connect(robotFabrica1);
      await pumpEventQueue();

      // Ingest telemetry packet for Fabrica 1
      final packetFab1 = Uint8List(31);
      packetFab1[0] = 1; // system_state = running
      packetFab1[27] = 200; // rssi
      packetFab1[29] = 42; // sequence counter = 42
      bus.ingestBytes(packetFab1);
      await pumpEventQueue();

      expect(bus.latestPacket?.systemState, equals(SystemState.runningMotion));
      expect(bus.latestPacket?.sequenceCounter, equals(42));
      expect(bus.currentMetrics.totalPackets, equals(1));

      // Switch to Fabrica 2
      await manager.connect(robotFabrica2);
      await pumpEventQueue();

      // On disconnect/switch, bus metrics and latest packet are reset
      expect(bus.latestPacket, isNull);
      expect(bus.currentMetrics.totalPackets, equals(0));

      // Ingest packet for Fabrica 2
      final packetFab2 = Uint8List(31);
      packetFab2[0] = 0; // system_state = idle
      packetFab2[29] = 1; // sequence counter = 1
      bus.ingestBytes(packetFab2);
      await pumpEventQueue();

      expect(bus.latestPacket?.systemState, equals(SystemState.idle));
      expect(bus.latestPacket?.sequenceCounter, equals(1));
      expect(bus.currentMetrics.totalPackets, equals(1));
    });

    test('profile binding dynamically adapts when switching between Fabrica and other robot models', () async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
          profileStorageProvider.overrideWithValue(mockProfileStorage),
          profileResolverProvider.overrideWithValue(mockResolver),
        ],
      );
      addTearDown(() => container.dispose());

      container.listen(activeProfileProvider, (_, _) {});
      container.listen(bleConnectionStateProvider, (_, _) {});

      final manager = container.read(bleConnectionManagerProvider);

      // 1. Connect to Fabrica
      mockTransport.mockModelNumber = 'Fabrica-DevKit-v1';
      await manager.connect(robotFabrica1);
      await pumpEventQueue();

      final fabricaProfile = container.read(activeProfileProvider);
      expect(fabricaProfile.modelNumber, equals('Fabrica-DevKit-v1'));
      expect(fabricaProfile.screens.any((s) => s.id == 'screen_control'), isTrue);

      // 2. Switch to generic robotic arm
      mockTransport.mockModelNumber = 'AIR-Arm-X1';
      await manager.connect(robotOtherDevice);
      await pumpEventQueue();

      final armProfile = container.read(activeProfileProvider);
      expect(armProfile.modelNumber, equals('AIR-Arm-X1'));

      // 3. Switch back to Fabrica 2
      mockTransport.mockModelNumber = 'Fabrica-DevKit-v1';
      await manager.connect(robotFabrica2);
      await pumpEventQueue();

      final restoredFabricaProfile = container.read(activeProfileProvider);
      expect(restoredFabricaProfile.modelNumber, equals('Fabrica-DevKit-v1'));
    });

    testWidgets('DynamicScreenScaffold renders device custom nickname in header to distinguish multiple robots',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final savedFabrica2 = RegisteredRobot(
        id: robotFabrica2.id,
        name: robotFabrica2.name,
        modelNumber: 'Fabrica-DevKit-v1',
        pairedAt: DateTime.now(),
        customNickname: 'Guest Room Fabrica',
      );
      await mockFleetStorage.saveRobot(savedFabrica2);

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          fleetStorageProvider.overrideWithValue(mockFleetStorage),
          profileStorageProvider.overrideWithValue(mockProfileStorage),
        ],
      );
      addTearDown(() => container.dispose());

      // Connect to Fabrica 2 with nickname
      final manager = container.read(bleConnectionManagerProvider);
      await manager.connect(robotFabrica2);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: DynamicScreenScaffold(),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Verifies custom nickname is rendered in the AppBar title
      expect(find.text('Guest Room Fabrica'), findsOneWidget);
      expect(find.textContaining('READY'), findsOneWidget);
    });
  });
}
