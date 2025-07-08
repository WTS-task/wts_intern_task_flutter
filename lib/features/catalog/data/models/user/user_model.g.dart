// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  toRelationStatus: (json['toRelationStatus'] as num?)?.toInt(),
  fromRelationStatus: (json['fromRelationStatus'] as num?)?.toInt(),
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'toRelationStatus': instance.toRelationStatus,
      'fromRelationStatus': instance.fromRelationStatus,
    };
