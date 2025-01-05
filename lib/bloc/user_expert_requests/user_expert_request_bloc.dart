import 'package:ai_safety_app/data/repositories/user_expert_requests_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'user_expert_request_event.dart';
part 'user_expert_request_state.dart';

class UserExpertRequestBloc
    extends Bloc<UserExpertRequestBloc, UserExpertRequestState> {
  final UserExpertRequestRepository userExpertRequestRepository;

  UserExpertRequestBloc(this.userExpertRequestRepository)
      : super(AddUserExpertRequestInitial()) {
    on<UserExpertRequestBloc>((event, emit) async {
      emit(AddUserExpertRequestLoading());
    });
  }
}
