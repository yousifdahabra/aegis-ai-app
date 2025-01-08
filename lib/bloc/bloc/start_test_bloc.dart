import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'start_test_event.dart';
part 'start_test_state.dart';

class StartTestBloc extends Bloc<StartTestEvent, StartTestState> {
  StartTestBloc() : super(StartTestInitial()) {
    on<StartTestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
