import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:wts_task/app/top_app_bar.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/constants/assets_catalog.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/core/widgets/custom_button.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';
import 'package:wts_task/features/product/data/view_models/product_detail_view_model.dart';
import 'package:wts_task/features/product/presentation/view/screens/add_review_dialog.dart';
import 'package:wts_task/features/product/presentation/view/screens/product_reviews_screen.dart';
import 'package:wts_task/features/product/presentation/view/widgets/price_widget.dart';
import 'package:wts_task/features/product/presentation/view/widgets/review_item.dart';

class ProductDetailScreen extends BasePage {
  const ProductDetailScreen({required this.productId, super.key});

  final String productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends BasePageState<ProductDetailScreen> {
  late final ProductDetailViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = ProductDetailViewModel(
      context.read<ProductRepository>(),
      widget.productId,
    )..loadProduct();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return TopAppBar(
      title: widget.title ?? 'Детали товара',
      showBackButton: true,
      showCartButton: true,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<ProductDetailViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading && vm.product == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.hasError) {
            return Center(child: Text(vm.lastError ?? 'Ошибка'));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                _buildProductImage(context),
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

  Widget _buildProductImage(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Image.asset(
        AssetsCatalog.headphonesImage,
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
                  print(
                    'Navigating to reviews, productId: ${widget.productId}',
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductReviewsScreen(
                        productId: widget.productId,
                        repository: context.read<ProductRepository>(),
                      ),
                    ),
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
                onPressed: vm.addToCart,
              ),
            );
          },
        ),
      ),
    );
  }

  void _showAddReviewDialog(BuildContext context, ProductDetailViewModel vm) {
    showDialog(
      context: context,
      builder: (context) => AddReviewDialog(
        productId: widget.productId,
        //repository: widget.repository,
        productName: vm.product?.name ?? 'Товар',
      ),
    );
  }
}
