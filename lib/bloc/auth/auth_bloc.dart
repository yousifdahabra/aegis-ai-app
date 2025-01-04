import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<SignupEvent>((event, emit) async {
      emit(AuthLoading());
      final message = await authRepository.signup(
        UserModel(
          name: event.name,
          email: event.email,
          password: event.password,
          phone_number: '234234',
          links: '',
          extraInformations: '',
        ),
      );

      if (message['success']) {
        emit(AuthSuccess(message['message']));
      } else {
        emit(AuthFailure(message['message']));
      }
    });
  }
}
