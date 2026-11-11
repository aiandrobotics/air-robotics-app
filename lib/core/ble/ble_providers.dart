import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ble_connection_manager.dart';
import 'ble_scanner.dart';
import 'ble_transport_interface.dart';
import 'flutter_blue_plus_transport.dart';

/// Provider for the active BLE Transport layer.
///
/// Can be overridden in test environments using `ProviderScope(overrides: [...])`.
final bleTransportProvider = Provider<BleTransport>((ref) {
  final transport = FlutterBluePlusTransport();
  ref.onDispose(() => transport.dispose());
  return transport;
});

/// Provider for the BLE Scanner with prefix filtering and RSSI smoothing.
final bleScannerProvider = Provider<BleScanner>((ref) {
  final transport = ref.watch(bleTransportProvider);
  final scanner = BleScanner(transport: transport);
  ref.onDispose(() => scanner.dispose());
  return scanner;
});

/// Stream of robots currently discovered by the scanner.
final discoveredRobotsProvider =
    StreamProvider.autoDispose<List<DiscoveredRobot>>((ref) {
  final scanner = ref.watch(bleScannerProvider);
  return scanner.discoveredRobotsStream;
});

/// Stream indicating whether BLE scanning is actively running.
final isScanningProvider = StreamProvider.autoDispose<bool>((ref) {
  final scanner = ref.watch(bleScannerProvider);
  return scanner.isScanningStream;
});

/// Provider for the Connection Lifecycle Manager.
final bleConnectionManagerProvider = Provider<BleConnectionManager>((ref) {
  final transport = ref.watch(bleTransportProvider);
  final manager = BleConnectionManager(transport: transport);
  ref.onDispose(() => manager.dispose());
  return manager;
});

/// Stream of the active connection state.
final bleConnectionStateProvider =
    StreamProvider.autoDispose<BleConnectionState>((ref) {
  final manager = ref.watch(bleConnectionManagerProvider);
  return manager.stateStream;
});

/// Notifier for the currently selected robot in the UI.
class SelectedRobotNotifier extends Notifier<DiscoveredRobot?> {
  @override
  DiscoveredRobot? build() => null;

  void select(DiscoveredRobot? robot) {
    state = robot;
  }
}

final selectedRobotProvider =
    NotifierProvider<SelectedRobotNotifier, DiscoveredRobot?>(
  SelectedRobotNotifier.new,
);

/// Notifier managing whether the user is actively viewing the connected device profile
/// or navigating the home dashboard.
class ViewingDeviceNotifier extends Notifier<bool> {
  @override
  bool build() {
    ref.listen<AsyncValue<BleConnectionState>>(bleConnectionStateProvider, (prev, next) {
      if (next.value == BleConnectionState.ready) {
        state = true;
      } else if (next.value == BleConnectionState.disconnected) {
        state = false;
      }
    });
    return false;
  }

  void openDevice() => state = true;
  void closeDevice() => state = false;
}

final isViewingDeviceProvider =
    NotifierProvider<ViewingDeviceNotifier, bool>(ViewingDeviceNotifier.new);

