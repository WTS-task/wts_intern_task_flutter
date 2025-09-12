// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  userId: (json['userId'] as num).toInt(),
  name: json['name'] as String?,
  lastname: json['lastname'] as String?,
  avatar: json['avatar'] as String?,
  email: json['email'] as String?,
  countryId: json['countryId'] as String?,
  cityId: json['cityId'] as String?,
  dateOfBirth: _$JsonConverterFromJson<int, DateTime>(
    json['dateOfBirth'],
    const DateTimeJsonConverter().fromJson,
  ),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'userId': instance.userId,
  'name': instance.name,
  'lastname': instance.lastname,
  'avatar': instance.avatar,
  'email': instance.email,
  'countryId': instance.countryId,
  'cityId': instance.cityId,
  'dateOfBirth': _$JsonConverterToJson<int, DateTime>(
    instance.dateOfBirth,
    const DateTimeJsonConverter().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
