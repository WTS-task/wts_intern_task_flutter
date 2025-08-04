import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';
import 'package:wts_task/features/product/data/view_models/product_review_view_model.dart';
import 'package:wts_task/features/product/presentation/view/screens/add_review_dialog.dart';
import 'package:wts_task/features/product/presentation/view/widgets/full_review_item.dart';

class ProductReviewsScreen extends BasePage {
  const ProductReviewsScreen({
    super.key,
    required this.productId,
    required this.repository,
    this.skipReviews = 0,
  }) : super(title: 'Отзывы');

  final String productId;
  final ProductRepository repository;
  final int skipReviews;

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends BasePageState<ProductReviewsScreen> {
  late final ProductReviewsViewModel _vm;
  final ScrollController _scrollController = ScrollController();
  late final int parsedProductId;
  late final bool isValidProductId;

  @override
  void initState() {
    super.initState();

    try {
      final String cleanedProductId = widget.productId.replaceAll(
        RegExp(r'[^0-9]'),
        '',
      );

      if (cleanedProductId.isEmpty) {
        throw const FormatException('Empty productId after cleaning');
      }

      parsedProductId = int.parse(cleanedProductId);
      isValidProductId = parsedProductId > 0;

      if (!isValidProductId) {
        throw FormatException('Invalid productId: ${widget.productId}');
      }
    } catch (e) {
      isValidProductId = false;
      debugPrint('Failed to parse product ID: ${widget.productId}. Error: $e');
      return;
    }

    if (isValidProductId) {
      _vm = ProductReviewsViewModel(
        repository: widget.repository,
        productId: parsedProductId,
        skipReviews: widget.skipReviews,
      )..loadReviews();

      _scrollController.addListener(_scrollListener);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _vm.loadMoreReviews();
    }
  }

  @override
  Widget buildBody(BuildContext context) {
    if (!isValidProductId) {
      return const Center(child: Text('Ошибка: некорректный ID товара'));
    }

    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<ProductReviewsViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading && vm.reviews.isEmpty) {
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
                    onPressed: vm.loadReviews,
                    child: const Text('Попробовать снова'),
                  ),
                ],
              ),
            );
          }

          if (vm.reviews.isEmpty) {
            return _buildEmptyReviewsState(context, vm);
          }

          return _buildReviewsList(vm);
        },
      ),
    );
  }

  Widget _buildEmptyReviewsState(
      BuildContext context,
      ProductReviewsViewModel vm,
      ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Отзывов пока нет', style: AppTextStyles.reviewsTitle),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ElevatedButton(
              onPressed: vm.loadReviews,
              child: const Text('Обновить список'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsList(ProductReviewsViewModel vm) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: OutlinedButton(
              onPressed: () => _showAddReviewDialog(context),
              style: _outlinedButtonStyle(),
              child: const Text(
                'Оставить отзыв',
                style: AppTextStyles.reviewButtonText,
              ),
            ),
          ),
        ),
        NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent &&
                !vm.isLoadingMore) {
              vm.loadMoreReviews();
            }
            return true;
          },
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            itemCount: vm.reviews.length + (vm.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == vm.reviews.length) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return FullReviewItem(review: vm.reviews[index]);
            },
          ),
        ),
      ],
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

  void _showAddReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddReviewDialog(
        productId: widget.productId,
        productName: '',
        productImageUrl: null,
      ),
    );
  }
}