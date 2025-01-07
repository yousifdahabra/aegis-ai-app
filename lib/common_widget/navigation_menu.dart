import 'package:ai_safety_app/views/auth/profile.dart';
import 'package:ai_safety_app/views/list/expert_request.dart';
import 'package:ai_safety_app/views/list/test_list.dart';
import 'package:ai_safety_app/views/test_page.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: TestList()),
    Center(child: ExpertRequest()),
    Center(child: TestPage()),
    Center(child: Profile()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
