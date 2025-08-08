import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/page/base_item_details_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/core/widgets/custom_button.dart';
import 'package:wts_task/features/cart/data/repositories/cart_repository.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/features/product/data/models/product/product.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';
import 'package:wts_task/features/product/data/view_models/product_detail_view_model.dart';
import 'package:wts_task/features/product/presentation/view/screens/add_review_dialog.dart';
import 'package:wts_task/features/product/presentation/view/widgets/price_widget.dart';
import 'package:wts_task/features/product/presentation/view/widgets/product_image_carousel.dart';
import 'package:wts_task/features/product/presentation/view/widgets/reviews_list_widget.dart';

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
  @override
  ProductDetailViewModel createModel() {
    return ProductDetailViewModel(
      context.read<ProductRepository>(),
      widget.productId,
      context.read<CartRepository>(),
      context.read<CartViewModel>(),
    );
  }

  @override
  Widget buildItemDetails(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildProductImage(context, model.item),
          _buildProductInfo(),
          _buildReviewsSection(context),
          ReviewsListWidget(reviews: model.reviews),
          _buildCartButton(),
        ],
      ),
    );
  }

  Widget _buildProductImage(BuildContext context, Product? product) {
    return ProductImageCarousel(images: product?.images ?? []);
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
            model.item?.name ?? 'Название товара',
            style: AppTextStyles.titleProductLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            model.item?.productDescription ?? 'Описание товара',
            style: AppTextStyles.subtitleProductMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
          child: Align(
            alignment: Alignment.centerRight,
            child: PriceWidget(
              amount: model.item?.price ?? 0,
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
          const Text('Отзывы', style: AppTextStyles.reviewsTitle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () => _showAddReviewDialog(context, model),
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


  Widget _buildCartButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomButton(
        title: 'Добавить в корзину',
        onPressed: () async {
          try {
            await model.addToCart();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Товар добавлен в корзину')),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ошибка: $e')),
            );
          }
        },
      ),
    );
  }

  void _showAddReviewDialog(
    BuildContext context,
    ProductDetailViewModel model,
  ) {
    showDialog(
      context: context,
      builder: (context) => AddReviewDialog(
        productId: widget.productId,
        productName: model.item?.name ?? 'Товар',
        productImageUrl: model.item?.imageUrl,
      ),
    );
  }
}
