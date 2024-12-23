import 'package:ai_safety_app/views/intro_screens/intro_page_1.dart';
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
            IntroPage1(),
            Container(
              color: Colors.black,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
        Container(
            alignment: Alignment(-0.9, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      controller.jumpToPage(2);
                    },
                    child: Text('Skip')),
                SmoothPageIndicator(controller: controller, count: 3),
                GestureDetector(
                    onTap: () {
                      controller.nextPage(
                        duration: Duration(microseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text('Next')),
              ],
            )),
      ],
    ));
  }
}
