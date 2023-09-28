import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => context.go("/first/third/ara"),
                child: const Text("go third"),
              ),
              ElevatedButton(
                onPressed: () => context.push("/first/third/ahm"),
                child: const Text("push third"),
              ),
              ElevatedButton(
                onPressed: () => context.go("/first"),
                child: const Text("go first"),
              ),
              ElevatedButton(
                onPressed: () => context.push("/first"),
                child: const Text("push first"),
              ),
            ],
          ),
        ));
  }
}
