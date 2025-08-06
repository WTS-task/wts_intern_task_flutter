// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
  reviewId: (json['reviewId'] as num).toInt(),
  relatedItemId: (json['relatedItemId'] as num).toInt(),
  objectType: json['objectType'] as String,
  rating: (json['rating'] as num).toInt(),
  text: json['text'] as String,
  moderationStatus: (json['moderationStatus'] as num).toInt(),
  user: ReviewUser.fromJson(json['user'] as Map<String, dynamic>),
  createdAt: (json['createdAt'] as num).toInt(),
  updatedAt: (json['updatedAt'] as num?)?.toInt(),
);

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
  'reviewId': instance.reviewId,
  'relatedItemId': instance.relatedItemId,
  'objectType': instance.objectType,
  'rating': instance.rating,
  'text': instance.text,
  'moderationStatus': instance.moderationStatus,
  'user': instance.user,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

_ReviewUser _$ReviewUserFromJson(Map<String, dynamic> json) => _ReviewUser(
  userId: (json['userId'] as num).toInt(),
  name: json['name'] as String,
  avatar: json['avatar'] as String?,
  toRelationStatus: (json['toRelationStatus'] as num).toInt(),
  fromRelationStatus: (json['fromRelationStatus'] as num).toInt(),
);

Map<String, dynamic> _$ReviewUserToJson(_ReviewUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'avatar': instance.avatar,
      'toRelationStatus': instance.toRelationStatus,
      'fromRelationStatus': instance.fromRelationStatus,
    };
