import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/websockect/view/ws_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const WSApp());
}

class WSApp extends StatelessWidget {
  const WSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Modules',
      debugShowCheckedModeBanner: false,
      home: WSPage(),
    );
  }
}
