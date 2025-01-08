import 'package:ai_safety_app/data/models/start_test_model.dart';
import 'package:ai_safety_app/data/repositories/tests_repository.dart';
import 'package:ai_safety_app/utils/functions.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'start_test_event.dart';
part 'start_test_state.dart';

class StartTestBloc extends Bloc<StartTest, StartTestState> {
  final TestsRepository testsRepository;

  StartTestBloc(this.testsRepository) : super(StartTestInitial()) {
    on<StartTest>((event, emit) async {
      emit(StartTestLoading());

      final userData = await Functions.getUserData();
      final userId = userData?['id'];

      if (userId == null) {
        emit(StartTestFailure(message: 'User ID not found.'));
        return;
      }

      try {
        final response = await testsRepository.startTest(
          StartTestModel(
            title: event.title,
            user_id: userId,
            expert_id: event.expertId ?? 3,
            test_state_id: event.testStateId ?? 1,
          ),
        );

        if (response['success'] == true) {
          final data = response['data'];
          emit(StartTestSuccess(data: data));
        } else {
          emit(StartTestFailure(
              message: response['message'] ?? 'Unknown error'));
        }
      } catch (e) {
        emit(StartTestFailure(message: e.toString()));
      }
    });
  }
}
