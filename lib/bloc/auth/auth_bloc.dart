import 'package:ai_safety_app/data/api/api_endpoints.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../../utils/error_handler.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Dio dio;

  AuthBloc(this.dio) : super(AuthInitial()) {
    on<SignupEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await dio.post(
          ApiEndpoints.signup,
          data: {
            'name': event.name,
            'email': event.email,
            'password': event.password,
            'phone_number': '234324234234',
          },
        );
        emit(AuthSuccess(response.data['message']));
      } catch (error) {
        if (error is DioException) {
          final errorMessage = handleDioError(error);
          emit(AuthFailure(errorMessage));
        } else {
          emit(AuthFailure('An unexpected error occurred.'));
        }
      }
    });
  }
}
