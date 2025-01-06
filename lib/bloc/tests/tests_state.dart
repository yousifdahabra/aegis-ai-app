part of 'tests_bloc.dart';

sealed class TestsState extends Equatable {
  const TestsState();
  
  @override
  List<Object> get props => [];
}

final class TestsInitial extends TestsState {}
