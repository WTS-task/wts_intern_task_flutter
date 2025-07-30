import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/presentation/view/widgets/user_avatar.dart';
import 'package:intl/intl.dart';

class ReviewItem extends StatelessWidget {
  final Review review;
  final int maxLines;
  final bool showFullDate;

  const ReviewItem({
    super.key,
    required this.review,
    this.maxLines = 2,
    this.showFullDate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 264,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(158, 158, 158, 0.4),
            blurRadius: 4,
            offset: const Offset(0, 2),
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
                avatarUrl: review.authorAvatarUrl,
                userName: review.authorName,
              ),
              const SizedBox(width: 12),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.authorName,
                    style: AppTextStyles.reviewUserName,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    showFullDate
                        ? DateFormat('dd.MM.yyyy').format(
                            review.createdAt,
                          ) //????
                        : _formatTimeAgo(review.createdAt),
                    style: AppTextStyles.reviewData,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 8),
          _buildRatingStars(review.rating),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              review.text,
              style: AppTextStyles.reviewText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    } else if (difference.inDays >= 14) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
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
