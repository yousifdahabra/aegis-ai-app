part of 'test_details_bloc.dart';

sealed class TestDetailsState extends Equatable {
  const TestDetailsState();

  @override
  List<Object?> get props => [];
}

final class TestDetailsInitial extends TestDetailsState {}

class TestDetailsLoading extends TestDetailsState {}

class TestDetailsSuccess extends TestDetailsState {
  final Map<String, dynamic> test;
  final List<Map<String, dynamic>> questions;

  const TestDetailsSuccess({required this.test, required this.questions});

  @override
  List<Object?> get props => [test, questions];
}

class TestDetailsFailure extends TestDetailsState {
  final String error;

  const TestDetailsFailure(this.error);

  @override
  List<Object?> get props => [error];
}
