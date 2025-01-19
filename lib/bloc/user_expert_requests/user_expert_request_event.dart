part of 'user_expert_request_bloc.dart';

@immutable
abstract class UserExpertRequestEvent {}

class AddUserExpertRequestEvent extends UserExpertRequestEvent {
  final String userNote;
  final String aboutUser;
  final String? links;

  AddUserExpertRequestEvent(
      {required this.userNote, required this.aboutUser, this.links});
}
