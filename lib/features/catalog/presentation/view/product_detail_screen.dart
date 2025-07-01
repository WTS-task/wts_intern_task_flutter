import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wts_task/app/bottom_nav_bar.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/app/top_app_bar.dart';
import 'package:wts_task/core/constants/assets_path.dart';
import 'package:wts_task/features/catalog/presentation/view/product_reviews_screen.dart';
import 'package:wts_task/features/catalog/presentation/view/add_review_dialog.dart';
import 'package:wts_task/features/catalog/presentation/widgets/submit_button.dart';
import 'package:wts_task/features/catalog/presentation/widgets/price_widget.dart';
import 'package:wts_task/features/catalog/presentation/widgets/review_item.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  final int _currentNavIndex = 0;
  final productTitle = 'Беспроводные наушники Logitech G435 черный';
  final productSubtitle =
      'Беспроводные наушники Logitech G435 черный [2021, 2.0, поддержка Nintendo Switch, PS4, PS5, охватывающие, 20 Гц - 20000 Гц, 45Ω, Bluetooth, радиоканал]';
  final double productPrice = 6999;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        title: 'Детали товара',
        onBackPressed: () {},
        onCartPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProductImage(context),
            _buildProductInfo(),
            _buildReviewsSection(context),
            _buildReviewsList(),
            _buildCartButton(),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(currentIndex: _currentNavIndex),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      height: screenWidth,
      child: Image.asset(
        headphonesImage,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[200],
            child: const Center(child: Icon(Icons.error_outline)),
          );
        },
      ),
    );
  }

  Widget _buildProductInfo() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 8,
          ),
          child: Text(
            productTitle,
            style: AppTextStyles.titleProductLarge,
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 12,
            right: 16,
            bottom: 12,
          ),
          child: Text(
            productSubtitle,
            style: AppTextStyles.subtitleProductMedium,
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
          child: Align(
            alignment: Alignment.centerRight,
            child: PriceWidget(
              amount: productPrice,
              style: AppTextStyles.productPrice,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Отзывы', style: AppTextStyles.reviewsTitle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () => _showAddReviewDialog(context),
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  minimumSize: WidgetStateProperty.all(const Size(123, 21)),
                  side: WidgetStateProperty.all(const BorderSide(width: 1)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.hovered)) {
                      return Color.fromRGBO(158, 158, 158, 0.1);
                    }
                    if (states.contains(WidgetState.pressed)) {
                      return Color.fromRGBO(158, 158, 158, 0.2);
                    }
                    return Colors.transparent;
                  }),
                  foregroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.pressed)) {
                      return AppColors.primaryText;
                    }
                    return AppColors.primaryText;
                  }),
                  overlayColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.hovered)) {
                      return Color.fromRGBO(158, 158, 158, 0.5);
                    }
                    return null;
                  }),
                ),
                child: Text(
                  'Оставить отзыв',
                  style: AppTextStyles.reviewButtonText,
                ),
              ),

              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductReviewsScreen(),
                  ),
                ),
                borderRadius: BorderRadius.circular(8),
                hoverColor: Color.fromRGBO(158, 158, 158, 0.1),
                splashColor: Color.fromRGBO(158, 158, 158, 0.2),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Text(
                    'Все отзывы',
                    style: AppTextStyles.reviewLinkText,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildCartButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 16, left: 16),
      child: SubmitButton(text: 'Добавить в корзину', onPressed: () {}),
    );
  }

  Widget _buildReviewsList() {
    final reviews = [
      ReviewItem(
        userName: 'Sophia',
        reviewDate: DateTime.now().subtract(const Duration(days: 60)),
        rating: 5,
        reviewText: 'Great product, exactly as described!',
        userImage: avatarOneImage,
      ),
      ReviewItem(
        userName: 'Ethan',
        reviewDate: DateTime.now().subtract(const Duration(days: 90)),
        rating: 4,
        reviewText: 'Good quality, but could be better.',
        userImage: avatarTwoImage,
      ),
    ];

    ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 137,
            viewportFraction: 0.7,
            enableInfiniteScroll: true,
            autoPlay: false,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            padEnds: false,
            onPageChanged: (index, reason) {
              currentIndex.value = index;
            },
          ),
          items: reviews.map((review) => review).toList(),
        ),
        const SizedBox(height: 8),

        ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: reviews.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: entry.key == index
                        ? AppColors.primaryText
                        : Color.fromRGBO(158, 158, 158, 0.4),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  void _showAddReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddReviewDialog(productName: productTitle),
    );
  }
}
