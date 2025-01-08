part of 'start_test_bloc.dart';

sealed class StartTestState extends Equatable {
  const StartTestState();
  
  @override
  List<Object> get props => [];
}

final class StartTestInitial extends StartTestState {}
