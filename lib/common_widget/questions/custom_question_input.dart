import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:flutter/material.dart';

class CustomQuestionInput extends StatefulWidget {
  const CustomQuestionInput({super.key});

  @override
  State<CustomQuestionInput> createState() => _CustomQuestionInputState();
}

class _CustomQuestionInputState extends State<CustomQuestionInput> {
  final List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question'),
      ),
    );
  }
}
