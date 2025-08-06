import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/page/base_item_details_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/core/widgets/custom_button.dart';
import 'package:wts_task/features/cart/data/repositories/cart_repository.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';
import 'package:wts_task/features/product/data/view_models/product_detail_view_model.dart';
import 'package:wts_task/features/product/presentation/view/screens/add_review_dialog.dart';
import 'package:wts_task/features/product/presentation/view/widgets/price_widget.dart';
import 'package:wts_task/features/product/presentation/view/widgets/review_item.dart';
import 'package:wts_task/features/product/data/models/product/product.dart';

class ProductDetailScreen extends BasePage {
  const ProductDetailScreen({
    required this.productId,
    required this.categoryId,
    super.key,
  }) : super(title: 'Детали товара');

  final String productId;
  final String categoryId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends
        BaseItemDetailsPageState<ProductDetailScreen, ProductDetailViewModel> {
  late int parsedProductId;
  late bool isValidProductId;

  @override
  ProductDetailViewModel createModel() {
    isValidProductId = false;
    parsedProductId = -1;

    try {
      if (widget.productId.isEmpty) {
        throw FormatException('Product ID is empty');
      }

      final String cleanedProductId = widget.productId.replaceAll(
        RegExp(r'[^0-9]'),
        '',
      );

      if (cleanedProductId.isEmpty) {
        throw FormatException('Product ID contains no digits');
      }

      parsedProductId = int.parse(cleanedProductId);
      isValidProductId = parsedProductId > 0;

      return ProductDetailViewModel(
        context.read<ProductRepository>(),
        parsedProductId,
        context.read<CartRepository>(),
        context.read<CartViewModel>(),
      );
    } catch (e) {
      isValidProductId = false;
      debugPrint('Failed to parse product ID: ${widget.productId}. Error: $e');
      return ProductDetailViewModel(
        context.read<ProductRepository>(),
        -1,
        context.read<CartRepository>(),
        context.read<CartViewModel>(),
      );
    }
  }

  @override
  Widget buildItemDetails(BuildContext context) {
    if (!isValidProductId) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Не удалось загрузить товар: некорректный ID'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Вернуться назад'),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildProductImage(context, model.item),
          _buildProductInfo(model),
          _buildReviewsSection(context, model),
          _buildReviewsList(model),
          _buildCartButton(model),
        ],
      ),
    );
  }

  Widget _buildProductImage(BuildContext context, Product? product) {
    final images = product?.images ?? [];
    final screenWidth = MediaQuery.of(context).size.width;
    int currentIndex = 0; // Track current image index

    if (images.isEmpty) {
      return SizedBox(
        width: screenWidth,
        height: screenWidth,
        child: _buildErrorPlaceholder(),
      );
    }

    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenWidth,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: screenWidth,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: images.length > 1,
                  autoPlay: images.length > 1,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                items: images.map((imageUrl) {
                  return Container(
                    width: screenWidth,
                    height: screenWidth,
                    alignment: Alignment.center,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.contain,
                      width: screenWidth,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildErrorPlaceholder(),
                    ),
                  );
                }).toList(),
              ),
            ),
            if (images.length > 1)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '${currentIndex + 1}/${images.length}',
                  style: AppTextStyles.subtitleProductMedium.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: const Center(child: Icon(Icons.error_outline)),
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
            vm.item?.name ?? 'Название товара',
            style: AppTextStyles.titleProductLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            vm.item?.productDescription ?? 'Описание товара',
            style: AppTextStyles.subtitleProductMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
          child: Align(
            alignment: Alignment.centerRight,
            child: PriceWidget(
              amount: vm.item?.price ?? 0,
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
          const Text('Отзывы', style: AppTextStyles.reviewsTitle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () => _showAddReviewDialog(context, vm),
                style: _outlinedButtonStyle(),
                child: const Text(
                  'Оставить отзыв',
                  style: AppTextStyles.reviewButtonText,
                ),
              ),
              InkWell(
                onTap: () {
                  context.push(
                    '/catalog/category/products/${widget.productId}/reviews',
                    extra: context.read<ProductRepository>(),
                  );
                },
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color.fromRGBO(158, 158, 158, 0.2),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
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
        if (states.contains(WidgetState.pressed)) {
          return const Color.fromRGBO(158, 158, 158, 0.2);
        }
        return Colors.transparent;
      }),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
    );
  }

  Widget _buildReviewsList(ProductDetailViewModel vm) {
    debugPrint(
      'Reviews count: ${vm.reviews.length}, isLoading: ${vm.isLoading}',
    );
    if (vm.isLoading && vm.reviews.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (vm.reviews.isEmpty) {
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
      child: SizedBox(
        width: 358,
        height: 48,
        child: Builder(
          builder: (context) {
            return Theme(
              data: Theme.of(context).copyWith(
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A2C2A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              child: CustomButton(
                title: 'Добавить в корзину',
                onPressed: () async {
                  await vm.addToCart();
                  if (vm.error == null) {
                    showMessage('Товар добавлен в корзину');
                  } else {
                    showMessage(vm.error);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _showAddReviewDialog(BuildContext context, ProductDetailViewModel vm) {
    debugPrint(
      'Attempting to show review dialog, isValidProductId: $isValidProductId, productId: $parsedProductId',
    );
    if (!isValidProductId) {
      debugPrint(
        'Cannot show review dialog, invalid productId: $parsedProductId',
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AddReviewDialog(
        productId: parsedProductId.toString(),
        productName: vm.item?.name ?? 'Товар',
        productImageUrl: vm.item?.imageUrl,
      ),
    );
  }
}
