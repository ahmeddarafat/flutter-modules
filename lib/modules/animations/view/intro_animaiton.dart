import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  const Animation1({super.key});

  @override
  State<Animation1> createState() => _Animation1State();
}

class _Animation1State extends State<Animation1>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 12).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.bounceInOut,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Animation controller Value: ${controller.value.toStringAsFixed(2)} "),
            const SizedBox(height: 30),
            Text("Animation Value: ${animation.value.toStringAsFixed(2)} "),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  controller.forward();
                },
                child: const Text("Forward")),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  controller.reverse();
                },
                child: const Text("Reverse")),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 15),
              duration: const Duration(seconds: 2),
              builder: (context, value, child) {
                return Container(
                    // you can use value here;
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
