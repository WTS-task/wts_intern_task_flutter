import 'package:wts_task/core/exceptions/app_exception.dart';

class CacheInitException extends AppException {
  CacheInitException({
    String errorMsg = 'Ошибка при инициализации локального хранилища!',
  }) : super(errorMessage: errorMsg);
}

class CacheReadException extends AppException {
  CacheReadException({
    String errorMsg = 'Ошибка при чтении из локального хранилища!',
  }) : super(errorMessage: errorMsg);
}

class CacheWriteException extends AppException {
  CacheWriteException({
    String errorMsg = 'Ошибка при записи в локальное хранилище!',
  }) : super(errorMessage: errorMsg);
}

