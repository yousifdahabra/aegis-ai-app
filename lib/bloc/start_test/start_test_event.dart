part of 'start_test_bloc.dart';

@immutable
abstract class StartTestEvent {}

class StartTest extends StartTestEvent {
  final String? title;
  final int? expertId;
  final int? testStateId;

  StartTest({
    this.title,
    this.expertId = 3,
    this.testStateId = 1,
  });
}
