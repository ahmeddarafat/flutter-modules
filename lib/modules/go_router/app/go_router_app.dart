import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/go_router/configs/router_config.dart';

class GoRouterApp extends StatelessWidget {
  const GoRouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
    );
  }
}
