part of 'user_expert_request_bloc.dart';

sealed class UserExpertRequestState extends Equatable {
  const UserExpertRequestState();

  @override
  List<Object> get props => [];
}

final class AddUserExpertRequestInitial extends UserExpertRequestState {}

class AddUserExpertRequestLoading extends UserExpertRequestState {}

class UserExpertRequestSuccess extends UserExpertRequestState {
  final String message;

  UserExpertRequestSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class UserExpertRequestFailure extends UserExpertRequestState {
  final String error;

  UserExpertRequestFailure(this.error);

  @override
  List<Object> get props => [error];
}
