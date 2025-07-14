import 'package:wts_task/core/exceptions/app_exception.dart';

class RepositoryException extends AppException {
  RepositoryException({String errorMsg = 'Ошибка репозитория'})
      : super(errorMessage: errorMsg);
}
