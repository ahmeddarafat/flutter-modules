import 'package:flutter/material.dart';

class PageFadeTransition extends PageRouteBuilder {
  final dynamic page;

  PageFadeTransition(this.page)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Align(
              alignment: Alignment.center,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
        );
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page 1")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, PageFadeTransition(Page2));
          },
          child: const Text('push'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page 2")),
    );
  }
}
