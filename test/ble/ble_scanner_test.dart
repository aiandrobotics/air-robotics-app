import 'package:air_robotics_app/core/ble/ble_scanner.dart';
import 'package:air_robotics_app/core/ble/ble_transport_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_ble_transport.dart';

void main() {
  group('RssiSmoother EMA Algorithm', () {
    test('initializes directly to first raw reading', () {
      final smoother = RssiSmoother(alpha: 0.25);
      expect(smoother.update(-80), equals(-80.0));
      expect(smoother.current, equals(-80.0));
    });

    test('smooths signal oscillations towards new readings', () {
      final smoother = RssiSmoother(alpha: 0.25);
      smoother.update(-80); // baseline -80

      // Next reading jumps to -60: (0.25 * -60) + (0.75 * -80) = -15 + -60 = -75
      final s1 = smoother.update(-60);
      expect(s1, equals(-75.0));

      // Next reading jumps to -50: (0.25 * -50) + (0.75 * -75) = -12.5 + -56.25 = -68.75
      final s2 = smoother.update(-50);
      expect(s2, equals(-68.75));
    });

    test('validates alpha boundary conditions', () {
      expect(() => RssiSmoother(alpha: 0.0), throwsArgumentError);
      expect(() => RssiSmoother(alpha: 1.1), throwsArgumentError);
    });

    test('reset clears smoothed state', () {
      final smoother = RssiSmoother(alpha: 0.25);
      smoother.update(-70);
      expect(smoother.current, equals(-70.0));
      smoother.reset();
      expect(smoother.current, isNull);
    });
  });

  group('BleScanner', () {
    late MockBleTransport transport;
    late BleScanner scanner;

    setUp(() {
      transport = MockBleTransport();
      scanner = BleScanner(
        transport: transport,
        allowedPrefixes: const ['Fabrica-', 'AIR-'],
        smoothingAlpha: 0.25,
      );
    });

    tearDown(() {
      scanner.dispose();
      transport.dispose();
    });

    test('filters peripherals matching allowed prefixes only', () async {
      final now = DateTime.now();

      final candidatePeripherals = [
        DiscoveredRobot(
          id: 'dev_1',
          name: 'Fabrica-A1B2',
          rawRssi: -65,
          smoothedRssi: -65,
          isPairingMode: true,
          lastSeen: now,
        ),
        DiscoveredRobot(
          id: 'dev_2',
          name: 'AirPods Pro',
          rawRssi: -40,
          smoothedRssi: -40,
          isPairingMode: false,
          lastSeen: now,
        ),
        DiscoveredRobot(
          id: 'dev_3',
          name: 'AIR-Robot-01',
          rawRssi: -50,
          smoothedRssi: -50,
          isPairingMode: false,
          lastSeen: now,
        ),
        DiscoveredRobot(
          id: 'dev_4',
          name: '',
          rawRssi: -90,
          smoothedRssi: -90,
          isPairingMode: false,
          lastSeen: now,
        ),
      ];

      final futureList = scanner.discoveredRobotsStream.first;
      transport.emitDiscoveredRobots(candidatePeripherals);

      final discovered = await futureList;
      expect(discovered.length, equals(2));
      expect(discovered[0].name, equals('AIR-Robot-01')); // -50 dBm > -65 dBm
      expect(discovered[1].name, equals('Fabrica-A1B2'));
    });

    test('sorts discovered robots by smoothed RSSI descending', () async {
      final now = DateTime.now();

      final candidatePeripherals = [
        DiscoveredRobot(
          id: 'dev_weak',
          name: 'Fabrica-Far',
          rawRssi: -85,
          smoothedRssi: -85,
          lastSeen: now,
        ),
        DiscoveredRobot(
          id: 'dev_strong',
          name: 'Fabrica-Near',
          rawRssi: -45,
          smoothedRssi: -45,
          lastSeen: now,
        ),
      ];

      final futureList = scanner.discoveredRobotsStream.first;
      transport.emitDiscoveredRobots(candidatePeripherals);

      final discovered = await futureList;
      expect(discovered.first.id, equals('dev_strong'));
      expect(discovered.last.id, equals('dev_weak'));
    });

    test('automatically prunes stale robots when advertisements cease', () async {
      final fastScanner = BleScanner(
        transport: transport,
        staleThreshold: const Duration(milliseconds: 500),
      );
      addTearDown(() => fastScanner.dispose());
      await fastScanner.startScan();

      final candidate = DiscoveredRobot(
        id: 'dev_unplugged',
        name: 'Fabrica-Unplugged',
        rawRssi: -50,
        smoothedRssi: -50,
        lastSeen: DateTime.now(),
      );

      transport.emitDiscoveredRobots([candidate]);
      await pumpEventQueue();
      expect(fastScanner.discoveredRobots.length, equals(1));

      // Wait past the stale threshold for the prune timer to fire
      await Future<void>.delayed(const Duration(milliseconds: 1200));
      expect(fastScanner.discoveredRobots, isEmpty);
    });

    test('startScan with clearExisting wipes discovered maps', () async {
      final candidate = DiscoveredRobot(
        id: 'dev_old',
        name: 'Fabrica-Old',
        rawRssi: -50,
        smoothedRssi: -50,
        lastSeen: DateTime.now(),
      );
      transport.emitDiscoveredRobots([candidate]);
      await pumpEventQueue();
      expect(scanner.discoveredRobots.length, equals(1));

      await scanner.startScan(clearExisting: true);
      expect(scanner.discoveredRobots, isEmpty);
    });
  });
}
