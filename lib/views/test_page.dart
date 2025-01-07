import 'package:ai_safety_app/common_widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override //
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        mainTitle: 'Start Test',
        subTitle: 'All previous tests are listed here',
        icon: Icons.quiz,
        onIconPressed: () {},
      ),
    );
  }
}
