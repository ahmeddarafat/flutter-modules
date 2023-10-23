import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/animations/view/animation1.dart';

void main() {
  runApp(const AnimApp());
}

class AnimApp extends StatelessWidget {
  const AnimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData.light(),
      home: const Animation1(),
    );
  }
}
