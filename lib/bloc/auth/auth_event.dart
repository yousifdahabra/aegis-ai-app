part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  @override
  List<Object> get props => [];
}

class SignupEvent extends AuthEvent {
  final UserModel user;

  SignupEvent(this.user);

  @override
  List<Object> get props => [user];
}
