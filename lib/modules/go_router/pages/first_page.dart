import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => {
                context.go("/first/second"),
                // GoRouter.of(context).pushNamed("Second Page"),
                // GoRouter.of(context).push("/first/second"),

                // GoRouter.of(context).pushReplacementNamed("Second Page"),
                // GoRouter.of(context).pushReplacement("/first/second"),

                // // short hand
                // context.pushNamed("Second Page"),
                // context.push("/first/second"),

                // context.pushReplacementNamed("Second Page"),
                // context.pushReplacement("/first/second"),
              },
              child: const Text("go second"),
            ),
            ElevatedButton(
              onPressed: () => context.push("/first/second"),
              child: const Text("push second"),
            ),
            ElevatedButton(
              onPressed: () {
                context.go("/first/third?userName=ahmed");
                // context.go(
                //   Uri(
                //       path: '/first/third',
                //       queryParameters: {'userName': 'Arafattttt'}).toString(),
                // );
                print(Uri(
                    path: '/first/third',
                    queryParameters: {'userName': 'Arafattttt'}).toString());
              },
              child: const Text("go third"),
            ),
            ElevatedButton(
              onPressed: () => context.push("/first/third/Ahmed"),
              child: const Text("push third"),
            ),
          ],
        ),
      ),
    );
  }
}
