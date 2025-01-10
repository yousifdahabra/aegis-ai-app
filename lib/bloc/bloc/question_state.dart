part of 'question_bloc.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object?> get props => [];
}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}

class NextQuestionLoaded extends QuestionState {
  final Map<String, dynamic> questionData;

  const NextQuestionLoaded({required this.questionData});

  @override
  List<Object?> get props => [questionData];
}
