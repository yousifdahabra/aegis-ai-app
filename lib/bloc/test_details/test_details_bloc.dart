import 'package:flutter_bloc/flutter_bloc.dart';
import 'test_details_event.dart';
import 'test_details_state.dart';
import 'package:ai_safety_app/data/repositories/tests_repository.dart';

class TestDetailsBloc extends Bloc<TestDetailsEvent, TestDetailsState> {
  final TestsRepository testsRepository = TestsRepository();

  TestDetailsBloc() : super(TestDetailsLoading()) {
    on<FetchTestDetailsEvent>((event, emit) async {
      emit(TestDetailsLoading());
      try {
        final data = await testsRepository.getTestDetails(event.testId);
        emit(TestDetailsLoaded(data));
      } catch (e) {
        emit(TestDetailsError(e.toString()));
      }
    });
  }
}
