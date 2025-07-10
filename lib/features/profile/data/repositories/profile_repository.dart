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
}
