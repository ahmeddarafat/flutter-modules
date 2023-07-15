import 'package:flutter/material.dart';

class FloatingButtonImpl extends StatelessWidget {
  const FloatingButtonImpl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('adsf'),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: "floatinggg",
        foregroundColor: Colors.red,
        backgroundColor: Colors.yellow,
        splashColor: Colors.green,
        heroTag: 0,
        child: const Icon(Icons.add),
      )),
    );
  }
}
