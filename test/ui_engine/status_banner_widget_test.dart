import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/core/profile/device_profile.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/core/protocol/telemetry_packet.dart';
import 'package:air_robotics_app/ui_engine/widget_catalog/status_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

TelemetryPacket makeTestPacket({
  SystemState systemState = SystemState.idle,
  LedState ledState = LedState.idle,
  int rssi = -60,
  int errorCode = 0,
}) {
  return TelemetryPacket(
    systemState: systemState,
    ledState: ledState,
    activeButtonId: 0,
    currentStepIdx: 0,
    totalSteps: 0,
    stepProgressPct: 0,
    elapsedStepTimeMs: 0,
    channelAngles: List<int>.filled(16, 0),
    lastCmdStatus: CmdStatus.ok,
    freeHeapKb: 198,
    bleRssiDbm: rssi,
    errorCode: errorCode,
    sequenceCounter: 42,
  );
}

void main() {
  group('StatusBannerWidget Unit & Widget Tests', () {
    late MockBleTransport mockTransport;

    setUp(() {
      mockTransport = MockBleTransport();
    });

    tearDown(() {
      mockTransport.dispose();
    });

    testWidgets('renders machine state, LED mirror, and RSSI metrics',
        (tester) async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          bleConnectionStateProvider
              .overrideWith((ref) => Stream.value(BleConnectionState.ready)),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(
              makeTestPacket(
                systemState: SystemState.runningMotion,
                ledState: LedState.running,
                rssi: -58,
              ),
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: StatusBannerWidget(
                config: AirWidgetConfig(
                  type: 'status-banner',
                  props: {'show_led_mirror': true, 'show_rssi': true},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('RUNNING_MOTION'), findsOneWidget);
      expect(find.text('LED: RUNNING'), findsOneWidget);
      expect(find.text('Strong'), findsOneWidget);
      expect(find.text('Heap: 198 KB'), findsOneWidget);
      expect(find.text('IDENTIFY'), findsOneWidget);

      await tester.tap(find.text('IDENTIFY'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(mockTransport.writtenControlPointPayloads.last, equals([0x0E]));
    });

    testWidgets('renders fault alert chips when error bitmask is non-zero',
        (tester) async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          bleConnectionStateProvider
              .overrideWith((ref) => Stream.value(BleConnectionState.ready)),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(
              makeTestPacket(
                systemState: SystemState.estop,
                ledState: LedState.estop,
                errorCode: TelemetryPacket.faultBitI2c |
                    TelemetryPacket.faultBitEstop,
              ),
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: StatusBannerWidget(
                config: AirWidgetConfig(
                  type: 'status-banner',
                  props: {'show_led_mirror': true, 'show_rssi': false},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('ESTOP'), findsOneWidget);
      expect(find.text('LED: ESTOP'), findsOneWidget);
      expect(find.text('I2C FAULT'), findsOneWidget);
      expect(find.text('E-STOP LATCHED'), findsOneWidget);
      expect(find.text('STORAGE FAULT'), findsNothing);
    });

    testWidgets('renders NVS storage fault, calibrating state, and various LED/RSSI ranges', (tester) async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          bleConnectionStateProvider.overrideWith((ref) => Stream.value(BleConnectionState.ready)),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(
              makeTestPacket(
                systemState: SystemState.calibrating,
                ledState: LedState.pairing,
                rssi: -72,
                errorCode: TelemetryPacket.faultBitNvs,
              ),
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: StatusBannerWidget(
                config: AirWidgetConfig(
                  type: 'status-banner',
                  props: {'show_led_mirror': true, 'show_rssi': true},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('CALIBRATING'), findsOneWidget);
      expect(find.text('LED: PAIRING'), findsOneWidget);
      expect(find.text('STORAGE FAULT'), findsOneWidget);
      expect(find.text('Good'), findsOneWidget);
    });

    testWidgets('renders identify LED, error machine state, and Weak RSSI', (tester) async {
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          bleConnectionStateProvider.overrideWith((ref) => Stream.value(BleConnectionState.ready)),
          latestTelemetryProvider.overrideWith(
            (ref) => Stream.value(
              makeTestPacket(
                systemState: SystemState.error,
                ledState: LedState.identify,
                rssi: -82,
              ),
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: StatusBannerWidget(
                config: AirWidgetConfig(
                  type: 'status-banner',
                  props: {'show_led_mirror': true, 'show_rssi': true},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('ERROR'), findsOneWidget);
      expect(find.text('LED: IDENTIFY'), findsOneWidget);
      expect(find.text('Weak'), findsOneWidget);
    });
  });
}
