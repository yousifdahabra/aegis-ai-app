import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller,
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
        Container(
            alignment: Alignment(-0.9, 0.2),
            child: SmoothPageIndicator(controller: controller, count: 3)),
      ],
    ));
  }
}
