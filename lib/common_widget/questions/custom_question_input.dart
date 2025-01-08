import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:flutter/material.dart';

class CustomQuestionInput extends StatelessWidget {
  final Map<String, dynamic> data;

  const CustomQuestionInput({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            data['questionText'] ?? 'Question',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          CustomInput(
            label: 'Your Answer',
            hint: 'Type your answer here',
            icon: const Icon(Icons.question_answer),
            multiLine: true,
          ),
        ],
      ),
    );
  }
}
