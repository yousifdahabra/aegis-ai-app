part of 'tests_bloc.dart';

sealed class TestsState extends Equatable {
  const TestsState();

  @override
  List<Object> get props => [];
}

final class TestsListInitial extends TestsState {}

class TestsListLoading extends TestsState {}

class TestsListSuccess extends TestsState {
  final String message;

  TestsListSuccess(this.message);

  @override
  List<Object> get props => [message];
}
