import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';

part 'review_model.g.dart';

@freezed
abstract class Review with _$Review {
  const factory Review({
    required int reviewId,
    required int relatedItemId,
    required String objectType,
    required int rating,
    required String text,
    required int moderationStatus,
    required ReviewUser user,
    required int createdAt,
    int? updatedAt,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
abstract class ReviewUser with _$ReviewUser {
  const factory ReviewUser({
    required int userId,
    required String name,
    String? avatar,
    required int toRelationStatus,
    required int fromRelationStatus,
  }) = _ReviewUser;

  factory ReviewUser.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserFromJson(json);
}

