import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/app/bottom_nav_bar.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/app/top_app_bar.dart';
import 'package:wts_task/core/constants/assets_path.dart';
import 'package:wts_task/features/catalog/data/repositories/product_repository.dart';
import 'package:wts_task/features/catalog/data/view_models/product_detail_view_model.dart';
import 'package:wts_task/features/catalog/presentation/view/product_reviews_screen.dart';
import 'package:wts_task/features/catalog/presentation/view/add_review_dialog.dart';
import 'package:wts_task/features/catalog/presentation/widgets/submit_button.dart';
import 'package:wts_task/features/catalog/presentation/widgets/price_widget.dart';
import 'package:wts_task/features/catalog/presentation/widgets/review_item.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;
  final ProductRepository repository;

  const ProductDetailScreen({
    super.key,
    required this.productId,
    required this.repository,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late final ProductDetailViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = ProductDetailViewModel(widget.repository, widget.productId)
      ..loadProduct();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<ProductDetailViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading && vm.product == null) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (vm.error != null) {
            return Scaffold(body: Center(child: Text(vm.error!)));
          }

          return Scaffold(
            appBar: TopAppBar(
              title: 'Детали товара',
              onBackPressed: () => Navigator.pop(context),
              onCartPressed: () {},
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _buildProductImage(context),
                  _buildProductInfo(vm),
                  _buildReviewsSection(context, vm),
                  _buildReviewsList(vm),
                  _buildCartButton(vm),
                ],
              ),
            ),
            bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
          );
        },
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
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

  Widget _buildProductInfo(ProductDetailViewModel vm) {
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
            vm.product?.name ?? 'Название товара',
            style: AppTextStyles.titleProductLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            vm.product?.description ?? 'Описание товара',
            style: AppTextStyles.subtitleProductMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
          child: Align(
            alignment: Alignment.centerRight,
            child: PriceWidget(
              amount: vm.product?.price ?? 0,
              style: AppTextStyles.productPrice,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsSection(BuildContext context, ProductDetailViewModel vm) {
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
                onPressed: () => _showAddReviewDialog(context, vm),
                style: _outlinedButtonStyle(),
                child: Text(
                  'Оставить отзыв',
                  style: AppTextStyles.reviewButtonText,
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductReviewsScreen(
                      productId: widget.productId,
                      repository: widget.repository,
                      skipReviews: vm.reviews.length,
                    ),
                  ),
                ),
                borderRadius: BorderRadius.circular(8),
                hoverColor: const Color.fromRGBO(158, 158, 158, 0.1),
                splashColor: const Color.fromRGBO(158, 158, 158, 0.2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
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

  ButtonStyle _outlinedButtonStyle() {
    return ButtonStyle(
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 8),
      ),
      minimumSize: WidgetStateProperty.all(const Size(123, 21)),
      side: WidgetStateProperty.all(const BorderSide(width: 1)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered))
          return const Color.fromRGBO(158, 158, 158, 0.1);
        if (states.contains(WidgetState.pressed))
          return const Color.fromRGBO(158, 158, 158, 0.2);
        return Colors.transparent;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered))
          return const Color.fromRGBO(158, 158, 158, 0.5);
        return null;
      }),
    );
  }

  Widget _buildReviewsList(ProductDetailViewModel vm) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 137,
            viewportFraction: 0.7,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            enlargeCenterPage: true,
            padEnds: false,
            disableCenter: true,
            pageSnapping: true,
          ),
          items: vm.reviews
              .map((review) => ReviewItem(review: review))
              .toList(),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildCartButton(ProductDetailViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SubmitButton(text: 'Добавить в корзину', onPressed: vm.addToCart),
    );
  }

  void _showAddReviewDialog(BuildContext context, ProductDetailViewModel vm) {
    showDialog(
      context: context,
      builder: (context) => AddReviewDialog(
        productId: widget.productId,
        repository: widget.repository,
        productName: vm.product?.name ?? 'Товар',
      ),
    );
  }
}
