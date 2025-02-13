part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignupEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String age;

  SignupEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.age});
}
