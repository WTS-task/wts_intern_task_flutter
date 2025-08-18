import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/presentation/view/widgets/review_item.dart';

class ReviewsListWidget extends StatelessWidget {
  const ReviewsListWidget({
    super.key,
    required this.reviews,
  });

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text('Отзывов пока нет', style: AppTextStyles.reviewsTitle),
      );
    }

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 137,
            viewportFraction: 0.7,
            initialPage: 0,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            padEnds: false,
            pageSnapping: true,
          ),
          items: reviews
              .map((review) => ReviewItem(review: review))
              .toList(),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}