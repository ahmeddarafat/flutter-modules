import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});


  void selectedScreen(BuildContext ct) {
    Navigator.of(ct).pushReplacementNamed(
      '/x1',

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: InkWell(
          onTap: () => selectedScreen(context),
          child: const Text(
            'Go to Screen 1',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}