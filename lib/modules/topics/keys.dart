import 'dart:developer';

import 'package:flutter/material.dart';

class KeysTopic extends StatefulWidget {
  const KeysTopic({super.key});

  @override
  State<KeysTopic> createState() => _KeysTopicState();
}

class _KeysTopicState extends State<KeysTopic> {
  late List<Widget> boxes = List.empty(growable: true);
  @override
  void initState() {
    super.initState();
    boxes = [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Box(
          color: Colors.red,
          key: UniqueKey(),
             ),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Box(
          color: Colors.yellow,
          key: UniqueKey()
             ),
       ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: boxes,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swap,
        child: const Icon(Icons.swap_calls),
      ),
    );
  }

  void swap() {
    boxes.insert(0, boxes.removeLast());
    setState(() {
      log("swap");
    });
  }
}

class Box extends StatelessWidget {
  final Color color;
  const Box({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: color,
    );
  }
}

// ----------------------- Keys ------------------------
// -----------------------------------------------------
// [1] There are 2 types of keys
//       1. local key
//             - Value key
//             - Object key
//             - Unique key
//             - page storage key
//       2. Global key
//             - global key
// [2] Why to use keys
//      - to differinate among widget which have the same type 
// [3] When to use keys
//      - while adding, removing and reordering 
// -----------------------------------------------------