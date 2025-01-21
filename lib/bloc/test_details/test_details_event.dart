abstract class TestDetailsEvent {}

class FetchTestDetailsEvent extends TestDetailsEvent {
  final int testId;

  FetchTestDetailsEvent(this.testId);
}
