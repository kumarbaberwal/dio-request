class DataLoaded<T> extends DisplayDataState {
  final T data;

  DataLoaded({required this.data});
}

class DataLoadFailure extends DisplayDataState {
  final String errorMessage;

  DataLoadFailure({required this.errorMessage});
}

class DataLoading extends DisplayDataState {}

abstract class DisplayDataState {}
