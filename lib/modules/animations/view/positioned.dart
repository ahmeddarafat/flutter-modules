import 'dart:developer';

import 'package:flutter/material.dart';

class Animation4 extends StatefulWidget {
  const Animation4({super.key});

  @override
  State<Animation4> createState() => _Animation4State();
}

class _Animation4State extends State<Animation4>
    with SingleTickerProviderStateMixin {
  late final Animation<RelativeRect> animation;
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animation = Tween<RelativeRect>(
      begin: RelativeRect.fromLTRB(
        0,
        0,
        MediaQuery.sizeOf(context).width - 150,
        MediaQuery.sizeOf(context).height - 150,
      ),
      end: RelativeRect.fromLTRB(
        MediaQuery.sizeOf(context).width - 150,
        MediaQuery.sizeOf(context).height - 150,
        0,
        0,
      ),
    ).animate(controller);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animation 4")),
      body: Stack(
        children: [
          PositionedTransition(
              rect: animation,
              child: Container(
                color: Colors.red,
              )),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            child: Container(color: Colors.blue),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
