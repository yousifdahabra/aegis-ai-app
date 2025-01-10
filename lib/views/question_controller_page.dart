import 'package:ai_safety_app/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_safety_app/bloc/question/question_bloc.dart';
import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/questions/question_widget.dart';

class QuestionControllerPage extends StatelessWidget {
  final String questionType;
  final Map<String, dynamic> questionData;

  const QuestionControllerPage({
    super.key,
    required this.questionType,
    required this.questionData,
  });

  void handleNext(BuildContext context, String response) async {
    final questionId = questionData['id'];
    final userId = await Functions.getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Question'),
        backgroundColor: Colors.blue,
      ),
      body: BlocListener<QuestionBloc, QuestionState>(
        listener: (context, state) {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomButton(
                text: 'Next',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
