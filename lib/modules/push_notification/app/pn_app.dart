import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../firebase/firebase_options.dart';
import '../data/pn_firebase_service.dart';
import '../view/pn_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// firebase core
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// notification
  await PNFirebaseService().initNotification();

  runApp(const PNApp());
}

class PNApp extends StatelessWidget {
  const PNApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Modules',
      debugShowCheckedModeBanner: false,
      home: NFView(),
    );
  }
}
