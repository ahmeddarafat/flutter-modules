import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/caching/view/caching_layouts.dart';
import 'package:flutter_modules/modules/caching/view/caching_page1.dart';

import '../view/caching_page2.dart';

void main() async {
  runApp(const CachingApp());
}

class CachingApp extends StatelessWidget {
  const CachingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Modules',
      debugShowCheckedModeBanner: false,
      home: CachingLayouts(),
    );
  }
}
