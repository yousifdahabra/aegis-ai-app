import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Test List',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_search),
            label: 'Expert',
          ),
          NavigationDestination(
            icon: Icon(Icons.create),
            label: 'New Test',
          ),
        ],
      ),
    );
  }
}
