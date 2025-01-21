part of 'test_details_bloc.dart';

@immutable
abstract class TestDetailsEvent {}

class FetchTestDetailsEvent extends TestDetailsEvent {
  final int testId;

  FetchTestDetailsEvent({required this.testId});
}
