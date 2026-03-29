import 'package:flutter/material.dart';

class DeviceTile extends StatelessWidget {
  final String deviceName;
  final String deviceStatus;
  final VoidCallback onTap;

  DeviceTile({required this.deviceName, required this.deviceStatus, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(deviceName),
      subtitle: Text(deviceStatus),
      trailing: Icon(Icons.arrow_forward),
      onTap: onTap,
    );
  }
}
