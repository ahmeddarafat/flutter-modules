import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});


  void selectedScreen(BuildContext ct) {
    Navigator.of(ct).pushReplacementNamed(
      '/x2',

    );
  }

  @override
  Widget build( BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: Center(

        child: InkWell(
          onTap: () => selectedScreen(context),
          child: const Text(
            'Go to Screen 2',
            style: TextStyle(fontSize: 30),
          ),
        ),
       ),
    );
  }
}