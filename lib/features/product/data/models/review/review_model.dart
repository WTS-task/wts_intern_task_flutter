import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';

part 'review_model.g.dart';

@freezed
abstract class Review with _$Review {
  const factory Review({
    required String id,
    required String authorId,
    required String authorName,
    required String? authorAvatarUrl,
    required String targetId,
    required String text,
    required int rating,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
abstract class CreateReviewRequest with _$CreateReviewRequest {
  const factory CreateReviewRequest({
    required String targetId,
    required String text,
    required int rating,
  }) = _CreateReviewRequest;

  factory CreateReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReviewRequestFromJson(json);
}
