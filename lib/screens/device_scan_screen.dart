import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class DeviceScanScreen extends StatefulWidget {
  @override
  _DeviceScanScreenState createState() => _DeviceScanScreenState();
}

class _DeviceScanScreenState extends State<DeviceScanScreen> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> devicesList = new List<BluetoothDevice>();
  StreamSubscription<BluetoothDiscoveryResult>? scanSubscription;

  @override
  void initState() {
    super.initState();
    startScan();
  }

  void startScan() {
    scanSubscription = flutterBlue.scan().listen((scanResult) {
      setState(() {
        devicesList.add(scanResult.device);
      });
    });
  }

  @override
  void dispose() {
    scanSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Scan'),
      ),
      body: ListView.builder(
        itemCount: devicesList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(devicesList[index].name.isEmpty ? 'Unknown Device' : devicesList[index].name),
            subtitle: Text(devicesList[index].id.toString()),
            onTap: () {
              // Handle device tap
            },
          );
        },
      ),
    );
  }
}