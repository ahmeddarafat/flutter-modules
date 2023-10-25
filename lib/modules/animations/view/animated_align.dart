import 'package:flutter/material.dart';

class Animation2 extends StatefulWidget {
  const Animation2({super.key});

  @override
  State<Animation2> createState() => _Animation2State();
}

class _Animation2State extends State<Animation2> {
  int position = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animation 2")),
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: getAlignment(position),
            duration: const Duration(milliseconds: 250),
            child: Container(
              height: 50,
              width: 50,
              color: Colors.red,
              
            ),
          ),
          AnimatedAlign(
            alignment: getAlignment(position + 1),
            duration: const Duration(milliseconds: 500),
            child: Container(
              height: 50,
              width: 50,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            position++;
          });
        },
        child: const Icon(Icons.change_circle),
      ),
    );
  }

  AlignmentGeometry getAlignment(int position) {
    switch (position) {
      case 0:
        return Alignment.center;
      case 1:
        return Alignment.topLeft;
      case 2:
        return Alignment.topRight;
      case 3:
        return Alignment.bottomLeft;
      case 4:
        return Alignment.bottomRight;
      case 5:
        return Alignment.topCenter;
      case 6:
        return Alignment.bottomCenter;
      default:
        this.position = 0;
        return Alignment.center;
    }
  }
}
