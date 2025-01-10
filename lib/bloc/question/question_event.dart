part of 'question_bloc.dart';

@immutable
abstract class QuestionEvent {}

class SubmitAnswerEvent extends QuestionEvent {
  final int userId;
  final int questionId;
  final String answer;

  SubmitAnswerEvent({
    required this.userId,
    required this.questionId,
    required this.answer,
  });
}
