import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ai_safety_app/data/repositories/tests_repository.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final TestsRepository testsRepository;

  QuestionBloc(this.testsRepository) : super(QuestionInitial()) {
    on<SubmitAnswerEvent>((event, emit) async {});
  }
}
