// import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/pagination/pagination_page.dart';

import 'modules/multi_platform/multi_platform.dart';

// import 'modules/iam_rich/screen1.dart';
// import 'modules/iam_rich/screen2.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  /// multi platform
  // if (Platform.isMacOS || Platform.isLinux || Platform.isMacOS) {
  //   DesktopWindow.setMinWindowSize(const Size(650, 650));
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Modules',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MultiPlatform(),
      // routes: {
      //   '/x1': (context) => const Screen1(),
      //   '/x2': (context) => const Screen2(),
      // },
    );
  }
}
