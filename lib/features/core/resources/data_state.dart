abstract class DataState<T> {
  final T? data;
  final Exception? error;

  const DataState({this.data, this.error});
}

class Success<T> extends DataState<T> {
  const Success(T data) : super(data: data);
}

class Failed<T> extends DataState<T> {
  const Failed(Exception error) : super(error: error);
}
