part of 'question_bloc.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object?> get props => [];
}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}
