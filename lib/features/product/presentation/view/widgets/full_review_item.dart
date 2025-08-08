import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/presentation/view/widgets/time_formatter.dart';
import 'package:wts_task/features/product/presentation/view/widgets/user_avatar.dart';

class FullReviewItem extends StatelessWidget {
  const FullReviewItem({
    super.key,
    required this.review,
    this.showFullDate = false,
  });

  final Review review;
  final bool showFullDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          const BoxShadow(
            color: Color.fromRGBO(158, 158, 158, 0.4),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAvatar(
                avatarUrl: review.user.avatar,
                userName: review.user.name ?? '',
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.user.name ?? 'Анонимный пользователь',
                    style: AppTextStyles.reviewUserName,
                  ),
                  Text(
                    showFullDate
                        ? TimeFormatter.formatReviewTime(
                            review.createdAt,
                            fullDate: true,
                          )
                        : TimeFormatter.formatReviewTime(review.createdAt),
                    style: AppTextStyles.reviewData,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildRatingStars(review.rating),
          const SizedBox(height: 12),
          Text(review.text, style: AppTextStyles.reviewText),
        ],
      ),
    );
  }

  Widget _buildRatingStars(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: AppColors.star,
          size: 16,
        );
      }),
    );
  }
}
