import 'package:ai_safety_app/views/auth/login.dart';
import 'package:ai_safety_app/views/intro_screens/intro_page_1.dart';
import 'package:ai_safety_app/views/intro_screens/intro_page_2.dart';
import 'package:ai_safety_app/views/intro_screens/intro_page_3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
            alignment: Alignment(-0.9, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Login();
                          },
                        ),
                      );
                    },
                    child: Text('Skip')),
                SmoothPageIndicator(controller: controller, count: 3),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Login();
                              },
                            ),
                          );
                        },
                        child: Text('Done'))
                    : GestureDetector(
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
