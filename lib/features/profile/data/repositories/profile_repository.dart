import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/entities/user.dart';
import 'package:wts_task/core/services/api/api_response_parser.dart';
import 'package:wts_task/core/services/api/private_api.dart';

class ProfileRepository extends PrivateApi {
  ProfileRepository(super.authRepository);

  Future<ApiResponse<User>> profile() async {
    final response = await get('user/profile');

    return ApiResponseParser.parseObjectFromResponse(
      response,
      key: 'user',
      fromJson: User.fromJson,
    );
  }

  Future<ApiResponse<void>> updateProfile(Map<String, dynamic> data) async {
    // либо put, либо post в зависимости от бек‑энда
    final response = await post('user/change-profile', data: data);
    // если успеха нет — ApiResponse.error
    return ApiResponseParser.parseObjectFromResponse<void>(
      response,
      fromJson: (_) => null,
    );
  }
}
