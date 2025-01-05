import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_user_expert_request_event.dart';
part 'add_user_expert_request_state.dart';

class AddUserExpertRequestBloc extends Bloc<AddUserExpertRequestEvent, AddUserExpertRequestState> {
  AddUserExpertRequestBloc() : super(AddUserExpertRequestInitial()) {
    on<AddUserExpertRequestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
