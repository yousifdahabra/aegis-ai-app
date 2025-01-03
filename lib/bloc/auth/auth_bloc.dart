import 'package:ai_safety_app/data/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/user_model.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<SignupEvent>(_onSignup);
  }

  Future<void> _onSignup(SignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.signup(event.user);
      emit(AuthSuccess('Signup Successful'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
