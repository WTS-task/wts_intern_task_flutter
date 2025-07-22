import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/services/api/api_response_parser.dart';
import 'package:wts_task/core/services/api/dio_network_service.dart';
import 'package:wts_task/features/auth/data/entities/auth_response.dart';

class AuthRepository extends DioNetworkService {
  AuthRepository();

  Future<ApiResponse<AuthResponse>> login({
    required String phone,
    required String code,
  }) async {
    final params = {'phone': phone, 'code': code};
    final response = await post('auth/phone/login-by-phone', data: params);

    return ApiResponseParser.parseObjectFromResponse(
      response,
      fromJson: AuthResponse.fromJson,
      emptyError: 'Объект не найден',
    );
  }

  Future<ApiResponse<bool>> sendSmsCode({required String phone}) async {
    final params = {'phone': phone};
    final response = await post('auth/phone/send-sms', data: params);
    return ApiResponse<bool>(
      baseApiResponse: response,
      result: !response.isError,
    );
  }
}
