import 'package:flutter/material.dart';
import 'custom_paint_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Custom Paint App',
      home: CustomPaintPage(),
    );
  }
}
