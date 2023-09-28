import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RedirectPage extends StatelessWidget {
  const RedirectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Redirect Page"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: const Center(
        child: Text("Redirect"),
      ),
    );
  }
}