import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/design_system/device_command_view.dart';

Map<String, dynamic> device1 = {
  "numberOfCommands": 2,
  "commands": [
    {
      "name": "command1",
      "description": " you can do it",
      "functionality": "wish"
    },
    {
      "name": "command2",
      "description": " you can do it",
      "functionality": "no wish"
    }
  ]
};

Map<String, dynamic> device2 = {
  "numberOfCommands": 3,
  "commands": [
    {
      "name": "command1",
      "description": " you can do it",
      "functionality": "run"
    },
    {
      "name": "command2",
      "description": " you can do it",
      "functionality": "no run"
    },
    {
      "name": "command3",
      "description": " you can do it",
      "functionality": "run run"
    }
  ]
};

class DevicesView extends StatelessWidget {
  const DevicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeviceCommands(
                        map: device1,
                      ),
                    ),
                  );
                },
                child: const Text("device 1")),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeviceCommands(
                        map: device2,
                      ),
                    ),
                  );
                },
                child: const Text("device 2")),
          ],
        ),
      ),
    );
  }
}
