import 'package:ai_safety_app/common_widget/custom_app_bar.dart';
import 'package:ai_safety_app/common_widget/questions/custom_result.dart';
import 'package:ai_safety_app/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_safety_app/bloc/question/question_bloc.dart';
import 'package:ai_safety_app/common_widget/custom_button.dart';
import 'package:ai_safety_app/common_widget/questions/question_widget.dart';

class QuestionControllerPage extends StatefulWidget {
  final String questionType;
  final Map<String, dynamic> questionData;

  const QuestionControllerPage({
    super.key,
    required this.questionType,
    required this.questionData,
  });

  @override
  State<QuestionControllerPage> createState() => _QuestionControllerPageState();
}

class _QuestionControllerPageState extends State<QuestionControllerPage> {
  String userResponse = '';
  bool isVoiceInteraction = false;

  @override
  void initState() {
    super.initState();
    isVoiceInteraction = widget.questionType == '6';
  }

  @override
  Widget build(BuildContext context) {
    final questionWidgetSelect = questionWidget[widget.questionType]?.call(
      widget.questionData,
      (response) {
        setState(() {
          userResponse = response;
        });
        if (isVoiceInteraction && response.isNotEmpty) {
          handleNext(context, response);
        }
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        mainTitle: 'Test',
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
          } else if (state is NextQuestionLoaded) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => QuestionControllerPage(
                  questionType:
                      state.questionData['question_type_id'].toString(),
                  questionData: state.questionData,
                ),
              ),
            );
          } else if (state is QuestionFinished) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CustomResult(
                  analysis: state.data['analysis'],
                  score: state.data['score'],
                ),
              ),
            );
          } else if (state is QuestionError) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (questionWidgetSelect != null)
                Expanded(child: questionWidgetSelect),
              if (!isVoiceInteraction) const SizedBox(height: 20),
              if (!isVoiceInteraction)
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    if (userResponse.isNotEmpty) {
                      handleNext(context, userResponse);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select or provide an answer.'),
                        ),
                      );
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void handleNext(BuildContext context, String response) async {
    final questionId = widget.questionData['id'];
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
}
