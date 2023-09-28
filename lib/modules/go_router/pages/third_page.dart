import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThirdPage extends StatelessWidget {
  final String? userName;
  const ThirdPage({super.key, this.userName = "Nonen"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Page"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: Text( userName?? "None"),
      ),
    );
  }
}
