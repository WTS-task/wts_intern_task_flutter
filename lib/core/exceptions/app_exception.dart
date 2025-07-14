abstract class AppException implements Exception {
  AppException({this.errorMessage = 'Неизвестная ошибка!'});

  final String errorMessage;

  @override
  String toString() => errorMessage;
}
