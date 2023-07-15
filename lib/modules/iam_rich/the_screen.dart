import 'package:flutter/material.dart';

class TheScreen extends StatelessWidget {
  const TheScreen({super.key});

  void selectedScreen(BuildContext ct, int n) {
    Navigator.of(ct).pushNamed(
      n == 1 ? '/x1' : '/x2',
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Multi Screens'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.add_shopping_cart),
                text: 'Part 1',
              ),
              Tab(
                icon: Icon(Icons.add_shopping_cart),
                child: Text(
                  'Part 2',
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: 'Part 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: 'Part 2',
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                onTap: () => selectedScreen(context, 1),
                title: const Text(
                  'Go to Screen 1',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              ListTile(
                onTap: () => selectedScreen(context, 2),
                title: const Text(
                  'Go to Screen 2',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Scaffold(
              body: Center(
                child: Text(
                  'The First Part',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Scaffold(
              body: Center(
                child: Text(
                  'The Second Part',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
