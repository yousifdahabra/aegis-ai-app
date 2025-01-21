import 'package:ai_safety_app/data/repositories/tests_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'test_details_event.dart';
part 'test_details_state.dart';

class TestDetailsBloc extends Bloc<TestDetailsEvent, TestDetailsState> {
  final TestsRepository testsRepository;

  TestDetailsBloc(this.testsRepository) : super(TestDetailsInitial()) {
    on<FetchTestDetailsEvent>((event, emit) async {
      emit(TestDetailsLoading());

      try {
        final response = await testsRepository.getTestDetails(event.testId);
        if (response['status']) {
          emit(TestDetailsSuccess(
            test: response['data']['test'],
            questions: response['data']['question'],
          ));
        } else {
          emit(
              TestDetailsFailure(response['message'] ?? 'Error loading test.'));
        }
      } catch (e) {
        emit(TestDetailsFailure(e.toString()));
      }
    });
  }
}
