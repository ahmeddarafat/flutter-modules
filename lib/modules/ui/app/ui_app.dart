import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/ui/screens/update_photo_page.dart';

void main() async {

  runApp(const UIApp());
}

class UIApp extends StatelessWidget {
  const UIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Modules',
      debugShowCheckedModeBanner: false,
      home: UpdatePhotoPage(),
    );
  }
}
