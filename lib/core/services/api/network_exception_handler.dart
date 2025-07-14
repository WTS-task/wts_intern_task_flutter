import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/entities/base_api_response.dart';
import 'package:wts_task/core/services/api/network_service.dart';

/// A mixin that provides exception handling for network requests.
///
/// It provides a [handleException] method that wraps network requests in a try-catch block
/// and handles common exceptions, such as [SocketException], [DioException], and [AppException].
mixin ExceptionHandlerMixin on NetworkService {
  /// Handles exceptions that may occur during network requests.
  ///
  /// [handler] The function that performs the actual network request.
  /// [endpoint] An optional endpoint string to provide additional context for logging.
  ///
  /// Returns a `Future<ApiResponse>` that resolves to the response data if the request is successful,
  /// or throws an `AppException` if an error occurs.
  Future<BaseApiResponse> handleException(
      Future<Response<Map<String, dynamic>>> Function() handler, {
        String endpoint = '',
      }) async {
    try {
      final res = await handler();
      final meta = Meta.fromJson(res.data?['meta']);
      final data = res.data?['data'];
      return BaseApiResponse(dataJson: data, meta: meta, error: meta.error);
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      String message = '';
      switch (e.runtimeType) {
        case const (SocketException):
          e as SocketException;
          message = 'Unable to connect to the server.';
          break;

        case const (DioException):
          e as DioException;
          message = e.response?.data?['message'] ?? 'Internal Error occurred';
          break;
        default:
          message = 'Unknown error occurred';
      }
      return BaseApiResponse(error: message);
    }
  }
}
