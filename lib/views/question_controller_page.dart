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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Question'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
