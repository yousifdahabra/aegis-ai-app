import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ai_safety_app/data/repositories/tests_repository.dart';
import 'package:ai_safety_app/data/models/submit_answer_model.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final TestsRepository testsRepository;

  QuestionBloc(this.testsRepository) : super(QuestionInitial()) {
    on<SubmitAnswerEvent>((event, emit) async {
      emit(QuestionLoading());
      try {
        final responseData =
            await testsRepository.submitAnswer(SubmitAnswerModel(
          user_id: event.userId,
          question_id: event.questionId,
          option_answer: event.answer,
        ));
        final response = responseData['data'];
        if (response['status']) {
          if (response['finish']) {
            emit(QuestionFinished(data: response['data']['result']));
          } else {
            emit(
                NextQuestionLoaded(questionData: response['data']['question']));
          }
        } else {
          emit(QuestionError(message: response['message']));
        }
      } catch (e) {
        emit(QuestionError(message: 'An error occurred: $e'));
      }
    });
  }
}
