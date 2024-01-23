import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/design_system/device_model.dart';

class DeviceCommands extends StatefulWidget {
  final Map<String, dynamic> map;
  const DeviceCommands({super.key, required this.map});

  @override
  State<DeviceCommands> createState() => _DeviceCommandsState();
}

class _DeviceCommandsState extends State<DeviceCommands> {
  late Device device;

  @override
  void initState() {
    super.initState();
    device = Device.fromMap(widget.map);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            itemCount: device.numberOfCommands,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
            ),
            itemBuilder: (context, index) => Card(
              color: Colors.blue,
              child: Column(
                children: [
                  Text(device.commands[index].name),
                  Text(device.commands[index].description),
                  Text(device.commands[index].functionality),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
