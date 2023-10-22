import 'package:flutter/material.dart';
import '../view/blogs_page.dart';

void main() {
  runApp(const GQApp());
}

class GQApp extends StatelessWidget {
  const GQApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData.light(),
      home: const BlogsPage(),
    );
  }
}
