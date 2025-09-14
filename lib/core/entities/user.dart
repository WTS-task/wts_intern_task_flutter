import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wts_task/core/formatters/custom_json_formatters.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required int userId,
    String? name,
    String? lastname,
    String? avatar,
    String? email,
    String? countryId,
    String? cityId,
    @DateTimeJsonConverter() DateTime? dateOfBirth,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}