import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();

    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
