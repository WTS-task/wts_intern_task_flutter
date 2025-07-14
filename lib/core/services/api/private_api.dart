import 'package:dio/dio.dart';
import 'package:wts_task/core/services/api/dio_network_service.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';

/// [PrivateApi] class for authorized request
class PrivateApi extends DioNetworkService {
  PrivateApi(this.authRepository) {
    dio.options = dioBaseOptions;
    dio.interceptors.add(InterceptorsWrapper(onRequest: onRequest));
  }

  bool shouldLogRequest = true;
  bool shouldLogResponse = false;
  final AuthLocalDataSource authRepository;

  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    if (!await authRepository.isAuthenticated()) {
      return;
    } else {
      final accessToken = {
        'accessToken': await authRepository.getAccessToken() ?? '',
      };
      options.queryParameters.addAll(accessToken);
    }
    handler.next(options);
  }
}
