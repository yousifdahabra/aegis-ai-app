import 'package:ai_safety_app/data/models/add_user_expert_requests_model.dart';
import 'package:ai_safety_app/data/repositories/user_expert_requests_repository.dart';
import 'package:ai_safety_app/utils/functions.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'user_expert_request_event.dart';
part 'user_expert_request_state.dart';

class UserExpertRequestBloc
    extends Bloc<AddUserExpertRequestEvent, UserExpertRequestState> {
  final UserExpertRequestRepository userExpertRequestRepository;

  UserExpertRequestBloc(this.userExpertRequestRepository)
      : super(AddUserExpertRequestInitial()) {
    on<AddUserExpertRequestEvent>((event, emit) async {
      emit(AddUserExpertRequestLoading());

      final userData = await Functions.getUserData();
      final userId = userData?['id'];

      final message = await userExpertRequestRepository
          .addUserExpertRequest(AddUserExpertRequestModel(
        about_user: event.aboutUser,
        user_note: event.userNote,
        links: event.links,
        user_id: userId,
      ));

      if (message['success']) {
        emit(UserExpertRequestSuccess(message['message']));
      } else {
        emit(UserExpertRequestFailure(message['message']));
      }
    });
  }
}
