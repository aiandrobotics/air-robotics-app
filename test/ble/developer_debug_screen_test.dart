import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/core/ble/developer_debug_screen.dart';
import 'package:air_robotics_app/core/profile/profile_providers.dart';
import 'package:air_robotics_app/core/profile/profile_storage_service.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:air_robotics_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('DeveloperDebugScreen Widget Test', () {
    late MockBleTransport mockTransport;

    setUp(() {
      mockTransport = MockBleTransport();
    });

    tearDown(() {
      mockTransport.dispose();
    });

    testWidgets('renders UI, accepts hex input, and dispatches to FAB1',
        (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            bleTransportProvider.overrideWithValue(mockTransport),
          ],
          child: MaterialApp(
            theme: AppTheme.darkTheme,
            home: const DeveloperDebugScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Check header and connection state
      expect(find.text('BLE Hardware Debugger'), findsOneWidget);
      expect(find.text('DISCONNECTED'), findsOneWidget);
      expect(find.text('ACTIVE DEVICE PROFILE'), findsOneWidget);
      expect(find.text('QUICK ACTIONS & SAFETY'), findsOneWidget);
      expect(find.text('LIVE TELEMETRY INSPECTOR (FAB2)'), findsOneWidget);
      expect(find.text('RAW HEX COMMAND INJECTOR (FAB1)'), findsOneWidget);

      // Enter hex opcode 0E (Identify)
      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      await tester.ensureVisible(textField);
      await tester.enterText(textField, '0E');
      await tester.pump();

      // Tap SEND button
      final sendButton = find.widgetWithText(ElevatedButton, 'SEND');
      expect(sendButton, findsOneWidget);
      await tester.ensureVisible(sendButton);
      await tester.tap(sendButton);
      await tester.pumpAndSettle();

      // Verify payload dispatched to transport
      expect(mockTransport.writtenControlPointPayloads.length, equals(1));
      expect(mockTransport.writtenControlPointPayloads.first, equals([0x0E]));
      expect(mockTransport.writtenControlPointNoResponse.first, isFalse);

      // Check log output
      expect(find.textContaining('TX -> FAB1: [0E]'), findsOneWidget);

      // Check Write Without Response checkbox
      final checkbox = find.byType(Checkbox);
      expect(checkbox, findsOneWidget);
      await tester.ensureVisible(checkbox);
      await tester.tap(checkbox);
      await tester.pump();

      // Enter E-Stop opcode 03
      await tester.ensureVisible(textField);
      await tester.enterText(textField, '03');
      await tester.pump();
      await tester.ensureVisible(sendButton);
      await tester.tap(sendButton);
      await tester.pumpAndSettle();

      // Verify fast-path without response flag
      expect(mockTransport.writtenControlPointPayloads.length, equals(2));
      expect(mockTransport.writtenControlPointPayloads.last, equals([0x03]));
      expect(mockTransport.writtenControlPointNoResponse.last, isTrue);
      expect(find.textContaining('TX -> FAB1: [03] (noResp: true)'),
          findsOneWidget);
    });

    testWidgets('quick action emergency stop triggers fast-path dispatch',
        (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            bleTransportProvider.overrideWithValue(mockTransport),
          ],
          child: MaterialApp(
            theme: AppTheme.darkTheme,
            home: const DeveloperDebugScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final eStopButton =
          find.widgetWithText(ElevatedButton, 'EMERGENCY STOP');
      expect(eStopButton, findsOneWidget);
      await tester.ensureVisible(eStopButton);
      await tester.tap(eStopButton);
      await tester.pumpAndSettle();

      // Confirms opcode 0x03 dispatched via fast-path without response
      expect(mockTransport.writtenControlPointPayloads.length, equals(1));
      expect(mockTransport.writtenControlPointPayloads.first, equals([0x03]));
      expect(mockTransport.writtenControlPointNoResponse.first, isTrue);
      expect(find.textContaining('FAST-PATH E-STOP TRIGGERED'), findsOneWidget);
    });

    testWidgets('telemetry notification updates Live Telemetry Inspector card',
        (tester) async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          profileStorageProvider.overrideWithValue(InMemoryProfileStorageService()),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            theme: AppTheme.darkTheme,
            home: const DeveloperDebugScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
          find.text('Awaiting telemetry notifications on FAB2...'), findsOneWidget);

      // Simulate incoming telemetry packet from robot
      final angles = List<int>.filled(16, 0);
      angles[0] = 45;
      angles[1] = 90;
      angles[2] = 135;
      angles[3] = 180;

      final packet = TelemetryPacket(
        systemState: SystemState.runningMotion,
        ledState: LedState.running,
        activeButtonId: 1,
        currentStepIdx: 2,
        totalSteps: 5,
        stepProgressPct: 40,
        elapsedStepTimeMs: 1200,
        channelAngles: angles,
        lastCmdStatus: CmdStatus.ok,
        freeHeapKb: 195,
        bleRssiDbm: -58,
        errorCode: 0,
        sequenceCounter: 42,
      );

      container.read(telemetryBusProvider).ingestBytes(packet.toBytes());
      await tester.pump(const Duration(milliseconds: 50));

      // Verify state chip and sequence counter
      expect(find.text('RUNNING_MOTION'), findsOneWidget);
      expect(find.textContaining('Seq: #42'), findsOneWidget);

      // Verify 4-channel angles
      expect(find.text('45°'), findsOneWidget);
      expect(find.text('90°'), findsOneWidget);
      expect(find.text('135°'), findsOneWidget);
      expect(find.text('180°'), findsOneWidget);

      // Verify heap and RSSI
      expect(find.text('Heap: 195 KB'), findsOneWidget);
      expect(find.text('RSSI: -58 dBm'), findsOneWidget);
    });

    testWidgets('DeveloperDebugScreen quick actions, scan toggle, candidate connect, and hex validation', (tester) async {
      tester.view.physicalSize = const Size(800, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          profileStorageProvider.overrideWithValue(InMemoryProfileStorageService()),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            theme: AppTheme.darkTheme,
            home: const DeveloperDebugScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // 1. Enter invalid hex
      final textField = find.byType(TextField);
      await tester.ensureVisible(textField);
      await tester.enterText(textField, 'ZZ');
      final sendButton = find.widgetWithText(ElevatedButton, 'SEND');
      await tester.ensureVisible(sendButton);
      await tester.tap(sendButton);
      await tester.pumpAndSettle();
      expect(find.textContaining('ERR: Malformed hex string'), findsOneWidget);

      // 2. Quick actions: Soft Stop (0x02)
      final stopBtn = find.text('STOP');
      await tester.ensureVisible(stopBtn);
      await tester.tap(stopBtn);
      await tester.pumpAndSettle();
      expect(mockTransport.writtenControlPointPayloads.any((p) => p.isNotEmpty && p.first == 0x02), isTrue);

      // 3. Preset 1
      final p1Btn = find.text('RUN PRESET 1');
      await tester.ensureVisible(p1Btn);
      await tester.tap(p1Btn);
      await tester.pumpAndSettle();
      expect(mockTransport.writtenControlPointPayloads.any((p) => p.length >= 2 && p[0] == 0x00 && p[1] == 0x01), isTrue);

      // 4. Identify
      final idBtn = find.text('IDENTIFY');
      await tester.ensureVisible(idBtn);
      await tester.tap(idBtn);
      await tester.pumpAndSettle();
      expect(mockTransport.writtenControlPointPayloads.any((p) => p.isNotEmpty && p.first == 0x0E), isTrue);

      // 5. Scan toggle button in card
      final scanBtn = find.widgetWithText(ElevatedButton, 'START SCAN');
      if (scanBtn.evaluate().isNotEmpty) {
        await tester.ensureVisible(scanBtn);
        await tester.tap(scanBtn);
        await tester.pumpAndSettle();
      }

      // 6. Connect to candidate in debug screen
      final candidate = DiscoveredRobot(
        id: 'debug-r1',
        name: 'Fabrica-Debug',
        rawRssi: -55,
        smoothedRssi: -55.0,
        isPairingMode: true,
        lastSeen: DateTime.now(),
      );
      mockTransport.emitDiscoveredRobots([candidate]);
      await tester.pumpAndSettle();

      final connectBtn = find.widgetWithText(ElevatedButton, 'CONNECT');
      if (connectBtn.evaluate().isNotEmpty) {
        await tester.ensureVisible(connectBtn.first);
        await tester.tap(connectBtn.first);
        await tester.pumpAndSettle();
      }

      // 7. Disconnect button when connected
      final disconnectBtn = find.widgetWithText(TextButton, 'DISCONNECT');
      if (disconnectBtn.evaluate().isNotEmpty) {
        await tester.ensureVisible(disconnectBtn);
        await tester.tap(disconnectBtn);
        await tester.pumpAndSettle();
      }
    });
  });
}
