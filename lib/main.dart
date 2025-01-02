import 'package:ai_safety_app/views/intro_screens/onboarding_screen.dart';
import 'package:ai_safety_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AegisAI',
      theme: AppTheme.lightTheme,
      home: OnboardingScreen(),
    );
  }
}
