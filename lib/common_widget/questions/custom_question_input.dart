import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:flutter/material.dart';

class CustomQuestionInput extends StatefulWidget {
  final Map<String, dynamic> data;
  final Function(String) onSubmit;

  const CustomQuestionInput({
    super.key,
    required this.data,
    required this.onSubmit,
  });

  @override
  State<CustomQuestionInput> createState() => _CustomQuestionInputState();
}

class _CustomQuestionInputState extends State<CustomQuestionInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.data['questionText'] ?? 'Question',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          CustomInput(
            label: 'Your Answer',
            hint: 'Type your answer here',
            icon: const Icon(Icons.question_answer),
            multiLine: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              widget.onSubmit(_controller.text);
            },
            child: const Text('Submit Answer'),
          ),
        ],
      ),
    );
  }
}
