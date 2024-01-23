import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/caching/view/caching_layouts.dart';
import 'package:flutter_modules/modules/caching/view/caching_page1.dart';
import 'package:flutter_modules/modules/design_system/device_view.dart';


void main() async {
  runApp(const SystemApp());
}

class SystemApp extends StatelessWidget {
  const SystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Modules',
      debugShowCheckedModeBanner: false,
      home: DevicesView(),
    );
  }
}
