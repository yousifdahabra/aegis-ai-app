import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/questions/question_widget.dart';
import 'package:flutter/material.dart';

class QuestionControllerPage extends StatelessWidget {
  final String questionType;
  final Map<String, dynamic> questionData;

  const QuestionControllerPage({
    super.key,
    required this.questionType,
    required this.questionData,
  });

  @override
  Widget build(BuildContext context) {
    final questionWidgetSelect =
        questionWidget[questionType]?.call(questionData);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Question'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (questionWidgetSelect != null)
              Expanded(child: questionWidgetSelect),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Next',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
