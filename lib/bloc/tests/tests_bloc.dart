import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'tests_event.dart';
part 'tests_state.dart';

class TestsBloc extends Bloc<TestsEvent, TestsState> {
  TestsBloc() : super(TestsListInitial()) {
    on<TestsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
