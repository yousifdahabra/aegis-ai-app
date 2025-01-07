import 'package:ai_safety_app/data/repositories/tests_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'tests_event.dart';
part 'tests_state.dart';

class TestsBloc extends Bloc<TestsEvent, TestsState> {
  final TestsRepository testsRepository;

  TestsBloc(this.testsRepository) : super(TestsListInitial()) {
    on<TestsListEvent>((event, emit) async {
      emit(TestsListLoading());
      try {
        final response = await testsRepository.getTestList();
        if (response['success'] == true) {
          final data = response['data'] as List<dynamic>;
          emit(TestsListSuccess(data: data));
        } else {
          emit(TestsListFailure(
              message: response['message'] ?? 'Unknown error'));
        }
      } catch (e) {
        emit(TestsListFailure(message: e.toString()));
      }
    });
  }
}
