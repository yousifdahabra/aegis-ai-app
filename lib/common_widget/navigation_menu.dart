import 'package:ai_safety_app/views/auth/login.dart';
import 'package:ai_safety_app/views/list/add_expert_request.dart';
import 'package:ai_safety_app/views/list/test_list.dart';
import 'package:ai_safety_app/views/test_page.dart';
import 'package:flutter/material.dart';
import 'package:ai_safety_app/data/repositories/auth_repository.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: TestList()),
    Center(child: AddExpertRequest()),
    Center(child: TestPage()),
    const SizedBox(),
  ];

  Future<void> _logout() async {
    final authRepository = AuthRepository();
    await authRepository.logout();

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 3 ? const SizedBox() : _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: const Color.fromARGB(122, 40, 156, 210),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) async {
          if (index == 3) {
            await _logout();
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        destinations: const [
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
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}
