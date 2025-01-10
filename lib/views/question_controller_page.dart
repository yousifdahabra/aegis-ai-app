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

    if (!context.mounted) return;

    context.read<QuestionBloc>().add(
          SubmitAnswerEvent(
            userId: userId,
            questionId: questionId,
            answer: response,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final questionWidgetSelect = questionWidget[questionType]?.call(
      questionData,
      (response) => handleNext(context, response),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Question'),
        backgroundColor: Colors.blue,
      ),
      body: BlocListener<QuestionBloc, QuestionState>(
        listener: (context, state) {
          if (state is QuestionLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
        child: Padding(
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
      ),
    );
  }
}
