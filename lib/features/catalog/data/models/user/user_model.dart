import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class User with _$User {
  @JsonSerializable()
  const factory User({
    required String id,
    required String name,
    String? avatarUrl,
    int? toRelationStatus,
    int? fromRelationStatus,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
