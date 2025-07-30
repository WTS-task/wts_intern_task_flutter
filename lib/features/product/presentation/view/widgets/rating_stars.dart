import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_colors.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final int maxRating;
  final double size;
  final bool interactive;
  final ValueChanged<int>? onRatingChanged;

  const RatingStars({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 16,
    this.interactive = false,
    this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(maxRating, (index) {
        return GestureDetector(
          onTap: interactive ? () => onRatingChanged?.call(index + 1) : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: AppColors.star,
              size: size,
            ),
          ),
        );
      }),
    );
  }
}
