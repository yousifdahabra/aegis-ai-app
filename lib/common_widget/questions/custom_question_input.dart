import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/custom_input.dart';
import 'package:ai_safety_app/common_widget/questions/custom_result.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomInput(
              label: 'question here',
              hint: 'write here',
              icon: Icon(Icons.question_answer),
              multiLine: true,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CustomResult();
                    },
                  ),
                );
              },
              text: 'Finish',
            ),
          ],
        ),
      ),
    );
  }
}
