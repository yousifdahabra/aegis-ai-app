part of 'add_user_expert_request_bloc.dart';

sealed class AddUserExpertRequestState extends Equatable {
  const AddUserExpertRequestState();
  
  @override
  List<Object> get props => [];
}

final class AddUserExpertRequestInitial extends AddUserExpertRequestState {}
