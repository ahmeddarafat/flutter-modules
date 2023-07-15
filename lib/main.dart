// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modules/modules/counter_with_cubit/counter_page.dart';
import 'package:flutter_modules/modules/counter_with_cubit/cubit/counter_cubit.dart';
import 'package:flutter_modules/modules/iam_rich/the_screen.dart';

import 'modules/iam_rich/screen1.dart';
import 'modules/iam_rich/screen2.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
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
      home: const CounterPage(title: 'counter'),
      routes: {
        '/x1': (context) => const Screen1(),
        '/x2': (context) => const Screen2(),
      },
    );
  }
}
