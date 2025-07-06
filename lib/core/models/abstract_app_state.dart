abstract class AbstractAppState<T> {
  final T? data;
  final bool isLoading;
  final String? errorMessage;

  AbstractAppState({this.data, this.isLoading = false, this.errorMessage});
}
