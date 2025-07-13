// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Meta _$MetaFromJson(Map<String, dynamic> json) => _Meta(
  success: json['success'] as bool? ?? false,
  error: json['error'] as String? ?? null,
  invalidAccessToken: json['invalidAccessToken'] as bool? ?? false,
);

Map<String, dynamic> _$MetaToJson(_Meta instance) => <String, dynamic>{
  'success': instance.success,
  'error': instance.error,
  'invalidAccessToken': instance.invalidAccessToken,
};
