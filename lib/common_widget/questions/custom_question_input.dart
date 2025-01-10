import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:flutter/material.dart';

class CustomQuestionInput extends StatefulWidget {
  final Map<String, dynamic> data;
  final Function(String) onResponse;

  const CustomQuestionInput({
    super.key,
    required this.data,
    required this.onResponse,
  });

  @override
  State<CustomQuestionInput> createState() => _CustomQuestionInputState();
}

class _CustomQuestionInputState extends State<CustomQuestionInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      widget.onResponse(_controller.text.trim());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.data['title'] ?? 'Question',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          CustomInput(
            controller: _controller,
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
