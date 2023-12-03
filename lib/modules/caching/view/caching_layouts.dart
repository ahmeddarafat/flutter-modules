import 'package:flutter/material.dart';

import 'caching_page1.dart';
import 'caching_page2.dart';

class CachingLayouts extends StatefulWidget {
  const CachingLayouts({super.key});

  @override
  State<CachingLayouts> createState() => _CachingLayoutsState();
}

class _CachingLayoutsState extends State<CachingLayouts> {
  List<Widget> pages = const [
    CachingPage1(),
    CachingPage2(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Caching")),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.one_k),
            label: "first page",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.two_k),
            label: "second page",
          ),
        ],
      ),
    );
  }
}
