part of 'tests_bloc.dart';

abstract class TestsState extends Equatable {
  const TestsState();

  @override
  List<Object> get props => [];
}

class TestsListInitial extends TestsState {}

class TestsListLoading extends TestsState {}

class TestsListSuccess extends TestsState {
  final List<dynamic> data;

  const TestsListSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class TestsListFailure extends TestsState {
  final String message;

  const TestsListFailure({required this.message});

  @override
  List<Object> get props => [message];
}
