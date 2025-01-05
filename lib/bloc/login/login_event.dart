part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class AuthLoginEvent extends LoginEvent {
  final String name;
  final String email;
  final String password;

  AuthLoginEvent(
      {required this.name, required this.email, required this.password});
}
