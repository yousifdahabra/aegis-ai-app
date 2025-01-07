import 'package:ai_safety_app/data/repositories/tests_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'tests_event.dart';
part 'tests_state.dart';

class TestsBloc extends Bloc<TestsEvent, TestsState> {
  final TestsRepository testsRepository;

  TestsBloc(this.testsRepository) : super(TestsListInitial()) {
    on<TestsEvent>((event, emit) async {
      emit(TestsListLoading());
      final message = await testsRepository.getTestList();
      if (message['success']) {
        emit(TestsListSuccess(message['message']));
      } else {
        emit(TestsListFailure(message['message']));
      }
    });
  }
}
