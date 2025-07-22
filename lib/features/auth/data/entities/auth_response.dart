import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wts_task/core/services/api/json_converters.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed

abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    String? accessToken,
    @BoolJsonConverter() @Default(false) bool isAlreadyRegistered,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
