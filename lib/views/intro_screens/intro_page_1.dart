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
      ),
    );
  }
}
