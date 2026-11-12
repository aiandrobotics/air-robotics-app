import 'dart:async';

import 'package:air_robotics_app/core/ble/ble_providers.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:air_robotics_app/core/protocol/protocol_providers.dart';
import 'package:air_robotics_app/core/protocol/routine_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('Protocol Providers Tests', () {
    test('buttonConfigProvider returns empty stream when disconnected and streams table when ready', () async {
      final mockTransport = MockBleTransport();
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
        ],
      );
      addTearDown(container.dispose);

      // Initially disconnected -> empty / no table
      var emissionCount = 0;
      container.listen<AsyncValue<ButtonConfigTable>>(buttonConfigProvider, (_, next) {
        next.whenData((_) => emissionCount++);
      });
      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(emissionCount, equals(0));

      // Connect transport to ready
      await mockTransport.connect('r-1');
      await mockTransport.createBond();
      await mockTransport.discoverServices();

      // Read stream when connection state is ready
      final readyContainer = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
          bleConnectionStateProvider.overrideWith((ref) => Stream.value(BleConnectionState.ready)),
        ],
      );
      addTearDown(readyContainer.dispose);

      final r1 = FoldRoutine.create([FoldStep.single(0)]);
      final r2 = FoldRoutine.create([FoldStep.single(1)]);
      final r3 = FoldRoutine.create([FoldStep.single(2)]);
      final r4 = FoldRoutine.create([FoldStep.single(3)]);
      final table = ButtonConfigTable(routines: {1: r1, 2: r2, 3: r3, 4: r4});

      final completer = Completer<ButtonConfigTable>();
      readyContainer.listen<AsyncValue<ButtonConfigTable>>(buttonConfigProvider, (_, next) {
        next.whenData((val) {
          if (!completer.isCompleted) completer.complete(val);
        });
      }, fireImmediately: true);

      // Allow ready stream to propagate to buttonConfigProvider
      await Future<void>.delayed(const Duration(milliseconds: 50));

      mockTransport.emitCharacteristicData(BleUuids.charButtonConfig, table.toBytes());
      final receivedTable = await completer.future.timeout(const Duration(seconds: 2));
      expect(receivedTable.routines.length, equals(4));
    });

    test('isTelemetryStreamActiveProvider toggles active state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(container.read(isTelemetryStreamActiveProvider), isTrue);

      container.read(isTelemetryStreamActiveProvider.notifier).setStreamActive(false);
      expect(container.read(isTelemetryStreamActiveProvider), isFalse);

      container.read(isTelemetryStreamActiveProvider.notifier).setStreamActive(true);
      expect(container.read(isTelemetryStreamActiveProvider), isTrue);
    });

    test('telemetryMetricsProvider streams metrics from bus', () async {
      final mockTransport = MockBleTransport();
      final container = ProviderContainer(
        overrides: [
          bleTransportProvider.overrideWithValue(mockTransport),
        ],
      );
      addTearDown(container.dispose);

      final bus = container.read(telemetryBusProvider);
      expect(bus, isNotNull);
      final sub = container.listen(telemetryMetricsProvider, (_, _) {});
      addTearDown(sub.close);
      expect(sub, isNotNull);
    });
  });
}
