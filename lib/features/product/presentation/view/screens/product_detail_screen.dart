import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
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
  const ProductDetailScreen({required this.productId, super.key})
    : super(title: 'Детали товара');

  final String productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends BasePageState<ProductDetailScreen> {
  ProductDetailViewModel? _vm;
  late int parsedProductId;
  late bool isValidProductId;

  @override
  void initState() {
    super.initState();

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

      if (isValidProductId) {
        _vm = ProductDetailViewModel(
          context.read<ProductRepository>(),
          parsedProductId,
          context.read<CartRepository>(),
          context.read<CartViewModel>(),
        )..loadProduct();
      }
    } catch (e) {
      isValidProductId = false;
      debugPrint('Failed to parse product ID: ${widget.productId}. Error: $e');
    }
  }

  @override
  Widget buildBody(BuildContext context) {
    if (!isValidProductId || _vm == null) {
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

    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<ProductDetailViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading && vm.product == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(vm.error!, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: vm.loadProduct,
                    child: const Text('Повторить попытку'),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                _buildProductImage(context, vm.product),
                _buildProductInfo(vm),
                _buildReviewsSection(context, vm),
                _buildReviewsList(vm),
                _buildCartButton(vm),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductImage(BuildContext context, Product? product) {
    final imageUrl = product?.imageUrl ?? product?.images?.firstOrNull;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: imageUrl != null
          ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  _buildErrorPlaceholder(),
            )
          : _buildErrorPlaceholder(),
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
            vm.product?.name ?? 'Название товара',
            style: AppTextStyles.titleProductLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            vm.product?.productDescription ?? 'Описание товара',
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
                  final currentRoute = GoRouter.of(
                    context,
                  ).routeInformationProvider.value.uri.path;
                  debugPrint(
                    'Current route: $currentRoute, Navigating to reviews, productId: $parsedProductId',
                  );
                  context.push(
                    '/catalog/category/1/product/$parsedProductId/reviews',
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
        productName: vm.product?.name ?? 'Товар',
        productImageUrl: vm.product?.imageUrl,
      ),
    );
  }
}
