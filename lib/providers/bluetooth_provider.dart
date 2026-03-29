import 'package:flutter_riverpod/flutter_riverpod.dart';

class BluetoothState {
  final bool isConnected;

  BluetoothState({this.isConnected = false});
}

class BluetoothNotifier extends StateNotifier<BluetoothState> {
  BluetoothNotifier() : super(BluetoothState());

  void connect() {
    // Logic for connecting to Bluetooth device
    state = BluetoothState(isConnected: true);
  }

  void disconnect() {
    // Logic for disconnecting from Bluetooth device
    state = BluetoothState(isConnected: false);
  }
}

final bluetoothProvider = StateNotifierProvider<BluetoothNotifier, BluetoothState>((ref) {
  return BluetoothNotifier();
});
