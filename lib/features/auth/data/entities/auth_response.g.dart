// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      accessToken: json['accessToken'] as String?,
      isAlreadyRegistered:
          json['isAlreadyRegistered'] == null
              ? false
              : const BoolJsonConverter().fromJson(json['isAlreadyRegistered']),
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'isAlreadyRegistered': const BoolJsonConverter().toJson(
        instance.isAlreadyRegistered,
      ),
    };
