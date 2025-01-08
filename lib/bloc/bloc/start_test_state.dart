part of 'start_test_bloc.dart';

sealed class StartTestState extends Equatable {
  const StartTestState();

  @override
  List<Object?> get props => [];
}

final class StartTestInitial extends StartTestState {}

class StartTestLoading extends StartTestState {}

class StartTestSuccess extends StartTestState {
  final Map<String, dynamic> data;

  const StartTestSuccess(this.data);

  @override
  List<Object?> get props => [data];
}
