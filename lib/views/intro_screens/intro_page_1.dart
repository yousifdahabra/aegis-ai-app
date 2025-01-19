import 'package:ai_safety_app/theme/app_colors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPageColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  'assets/images/welcome.gif',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Spacer(),
            FadeInDown(
              duration: const Duration(milliseconds: 1600),
              child: Text(
                "You must know your weakness \nbefore anyone.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const SizedBox(height: 16),
            FadeInUp(
              duration: const Duration(milliseconds: 1600),
              child: Text(
                "Everyone has a weakness, whether it's\nme or others.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
