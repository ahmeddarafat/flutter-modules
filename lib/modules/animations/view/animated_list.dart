import 'dart:developer';

import 'package:flutter/material.dart';

class Animation3 extends StatefulWidget {
  const Animation3({super.key});

  @override
  State<Animation3> createState() => _Animation3State();
}

class _Animation3State extends State<Animation3> {
  List<String> list = [];
  final listKey = GlobalKey<AnimatedListState>();

  void addItem() {
    list.insert(0,"item ${list.length}");
    listKey.currentState!.insertItem(
      0,
      duration: const Duration(milliseconds: 400),
    );
    log(list.toString());
  }

  void removeItem(int index) {
    final name = list.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) {
        return ListTile(
          title: Text(
            name,
            style: const TextStyle(color: Colors.red),
          ),
        );
      },
      duration: const Duration(milliseconds: 50),
    );
    log(list.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animation 3")),
      body: AnimatedList(
        key: listKey,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: ListTile(
              title: Text(list[index]),
              trailing: IconButton(
                onPressed: () {
                  removeItem(index);
                },
                icon: const Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
