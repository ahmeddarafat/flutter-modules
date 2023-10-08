// import 'package:firebase_core/firebase_core.dart';
// import 'dart:io';

// import 'package:desktop_window/desktop_window.dart';
// import 'package:flutter_modules/modules/counter_app/counter_app.dart';
// import 'package:flutter_modules/modules/pagination/pagination_page.dart';
// import 'modules/counter_with_cubit/counter_page.dart';
// import 'modules/multi_platform/multi_platform.dart';

// import 'modules/iam_rich/screen1.dart';
// import 'modules/iam_rich/screen2.dart';
// import 'firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modules/modules/go_router/app/go_router_app.dart';
import 'package:flutter_modules/modules/payment/payment_register_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'modules/counter_with_cubit/bloc_observer.dart';
import 'modules/firebase/firebase_options.dart';
import 'modules/push_notification/data/pn_firebase_service.dart';
import 'modules/push_notification/view/pn_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  /// firebase core
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// notification
  await PNFirebaseService().initNotification();

  /// multi platform
  // if (Platform.isMacOS || Platform.isLinux || Platform.isMacOS) {
  //   DesktopWindow.setMinWindowSize(const Size(650, 650));
  // }

  runApp(const GoRouterApp());
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
      home: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, _) {
          return const NFView();
        },
      ),
      // routes: {
      //   '/x1': (context) => const Screen1(),
      //   '/x2': (context) => const Screen2(),
      // },
    );
  }
}
