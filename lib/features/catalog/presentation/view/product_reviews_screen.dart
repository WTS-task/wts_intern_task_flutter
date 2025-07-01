import 'package:flutter/material.dart';
import 'package:wts_task/app/bottom_nav_bar.dart';
import 'package:wts_task/app/top_app_bar.dart';
import 'package:wts_task/core/constants/assets_path.dart';
import 'package:wts_task/features/catalog/presentation/widgets/full_review_item.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reviews = [
      FullReviewItem(
        userName: 'Ethan Carter',
        reviewDate: DateTime.now().subtract(const Duration(days: 14)),
        rating: 5,
        reviewText:
            'This product exceeded my expectations! The quality is outstanding, and it performs flawlessly. I highly recommend it to anyone looking for a reliable and efficient solution.',
        userImage: reviewsPersonOne,
      ),
      FullReviewItem(
        userName: 'Olivia Bennet',
        reviewDate: DateTime.now().subtract(const Duration(days: 30)),
        rating: 4,
        reviewText:
            "I'm quite satisfied with my purchase. The product is well-designed and functions as described. There are a few minor improvements that could be made, but overall, it's a great value for the price.",
        userImage: reviewsPersonTwo,
      ),
      FullReviewItem(
        userName: 'Noah Thompson',
        reviewDate: DateTime.now().subtract(const Duration(days: 60)),
        rating: 3,
        reviewText:
            "The product is decent, but it didn't quite meet my expectations. It works, but there are some noticeable drawbacks. I might consider other options in the future.",
        userImage: reviewsPersonThree,
      ),
    ];

    final int _currentNavIndex = 0;

    return Scaffold(
      appBar: TopAppBar(
        title: 'Отзывы',
        onBackPressed: () => Navigator.pop(context),
        showBackButton: true,
        showCartButton: false,
      ),
      body: ListView(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
        children: [...reviews.map((reviews) => reviews).toList()],
      ),
      bottomNavigationBar: AppBottomNavBar(currentIndex: _currentNavIndex),
    );
  }
}
