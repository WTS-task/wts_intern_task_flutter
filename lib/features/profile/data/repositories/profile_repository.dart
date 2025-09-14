import 'package:dio/dio.dart';
import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/entities/base_api_response.dart';
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

  Future<ApiResponse<User>> updateProfile(Map<String, dynamic> data) async {
    final avatarPath = data['image'] as String?;
    BaseApiResponse response;

    if (avatarPath != null && avatarPath.isNotEmpty) {
      final formMap = <String, dynamic>{};
      data.forEach((k, v) {
        if (k != 'image' && v != null) formMap[k] = v.toString();
      });

      final multipart = await MultipartFile.fromFile(
        avatarPath,
      );
      formMap['image'] = multipart;
      final formData = FormData.fromMap(formMap);

      response = await postWithFile('user/change-profile', data: formData);
    } else {
      response = await post('user/change-profile', data: data);
    }

    return ApiResponseParser.parseObjectFromResponse(
      response,
      key: 'user',
      fromJson: User.fromJson,
    );
  }
}