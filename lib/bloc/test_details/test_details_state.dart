abstract class TestDetailsState {}

class TestDetailsLoading extends TestDetailsState {}

class TestDetailsLoaded extends TestDetailsState {
  final Map<String, dynamic> data;

  TestDetailsLoaded(this.data);
}

class TestDetailsError extends TestDetailsState {
  final String message;

  TestDetailsError(this.message);
}
