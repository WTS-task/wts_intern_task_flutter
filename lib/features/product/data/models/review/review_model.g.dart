// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
  id: json['id'] as String,
  authorId: json['authorId'] as String,
  authorName: json['authorName'] as String,
  authorAvatarUrl: json['authorAvatarUrl'] as String?,
  targetId: json['targetId'] as String,
  text: json['text'] as String,
  rating: (json['rating'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
  'id': instance.id,
  'authorId': instance.authorId,
  'authorName': instance.authorName,
  'authorAvatarUrl': instance.authorAvatarUrl,
  'targetId': instance.targetId,
  'text': instance.text,
  'rating': instance.rating,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

_CreateReviewRequest _$CreateReviewRequestFromJson(Map<String, dynamic> json) =>
    _CreateReviewRequest(
      targetId: json['targetId'] as String,
      text: json['text'] as String,
      rating: (json['rating'] as num).toInt(),
    );

Map<String, dynamic> _$CreateReviewRequestToJson(
  _CreateReviewRequest instance,
) => <String, dynamic>{
  'targetId': instance.targetId,
  'text': instance.text,
  'rating': instance.rating,
};
