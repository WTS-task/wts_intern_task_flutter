import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:wts_task/config.dart';
import 'package:wts_task/core/entities/base_api_response.dart';
import 'package:wts_task/core/services/api/network_exception_handler.dart';
import 'package:wts_task/core/services/api/network_service.dart';

/// Abstract class extending [NetworkService] and implementing [ExceptionHandlerMixin] for Dio-based network operations.
///
/// This class provides a foundation for making network requests using the Dio library. It includes functionalities
/// for setting up the Dio instance with base options, headers, and interceptors. It also integrates with the Talker
/// logging library for detailed request and response logging. The class inherits exception handling capabilities
/// from [ExceptionHandlerMixin] to manage network-related errors.
abstract class DioNetworkService extends NetworkService
    with ExceptionHandlerMixin {
  /// Constructor initializes the Dio instance with base options and interceptors.
  DioNetworkService() {
    dio.options = dioBaseOptions;
    dio.interceptors.add(TalkerDioLogger());
  }

  /// Dio instance for making network requests.
  final Dio dio = Dio();

  /// Returns the base options for the Dio instance.
  ///
  /// Includes [baseUrl] and [headers] from the configuration.
  BaseOptions get dioBaseOptions =>
      BaseOptions(baseUrl: baseUrl, headers: headers);

  /// Returns the base URL for network requests from [Config].
  @override
  String get baseUrl => Config.host;

  /// Returns the headers for network requests.
  ///
  /// Includes default headers for accepting JSON and content type.
  @override
  Map<String, Object> get headers => {
    Headers.acceptHeader: Headers.jsonContentType,
    Headers.contentTypeHeader: Headers.formUrlEncodedContentType,
  };

  /// Performs a POST request with exception handling.
  ///
  /// [endpoint] The endpoint for the POST request.
  /// [data] Optional data to be sent in the request body.
  ///
  /// Returns a `Future<ApiResponse>` containing the response data.
  @override
  Future<BaseApiResponse> post(String endpoint, {Map<String, dynamic>? data}) {
    final res = handleException(
          () => dio.post(endpoint, data: data),
      endpoint: endpoint,
    );
    return res;
  }

  /// Performs a POST request with file upload and exception handling.
  ///
  /// [endpoint] The endpoint for the POST request.
  /// [data] Optional FormData containing the file and other data to be sent in the request body.
  ///
  /// Returns a `Future<ApiResponse>` containing the response data.
  @override
  Future<BaseApiResponse> postWithFile(String endpoint, {FormData? data}) {
    final res = handleException(
          () => dio.post(endpoint, data: data),
      endpoint: endpoint,
    );
    return res;
  }

  /// Performs a GET request with exception handling.
  ///
  /// [endpoint] The endpoint for the GET request.
  /// [queryParameters] Optional query parameters to be included in the request.
  ///
  /// Returns a `Future<ApiResponse>` containing the response data.
  @override
  Future<BaseApiResponse> get(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
      }) {
    final res = handleException(
          () => dio.get(endpoint, queryParameters: queryParameters),
      endpoint: endpoint,
    );
    return res;
  }
}
