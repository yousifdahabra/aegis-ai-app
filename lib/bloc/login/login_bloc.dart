import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/models/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<AuthLoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(LoginLoading());
      final message = await authRepository.login(
        UserModel(
          email: event.email,
          password: event.password,
        ),
      );

      if (message['success']) {
        emit(LoginSuccess(message['message']));
      } else {
        emit(LoginFailure(message['message']));
      }
    });
  }
}
