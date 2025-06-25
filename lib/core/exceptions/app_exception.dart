abstract class AppException implements Exception {
  final String errorMessage;
  AppException({this.errorMessage = 'Неизвестная ошибка!'});

  @override
  String toString() => errorMessage;
}

