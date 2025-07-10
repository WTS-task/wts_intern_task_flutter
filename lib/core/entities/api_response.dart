import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wts_task/core/entities/base_api_response.dart';

part 'api_response.freezed.dart';

part 'api_response.g.dart';

class ApiResponse<T> extends BaseApiResponse {
  ApiResponse({required BaseApiResponse baseApiResponse, this.result})
    : super(
        meta: baseApiResponse.meta,
        rawData: baseApiResponse.rawData,
        dataJson: baseApiResponse.dataJson,
        error: baseApiResponse.error,
      );

  ApiResponse.error({
    required String error,
    required BaseApiResponse baseApiResponse,
  }) : super(
         meta: baseApiResponse.meta,
         rawData: baseApiResponse.rawData,
         error: error,
       );
  T? result;
}

@freezed
abstract class Meta with _$Meta {
  const factory Meta({
    @Default(false) bool success,
    @Default(null) String? error,
    @Default(false) bool invalidAccessToken,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
