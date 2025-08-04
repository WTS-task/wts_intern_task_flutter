import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';
import 'package:wts_task/features/product/data/view_models/product_review_view_model.dart';
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Отзывов пока нет',
                    style: AppTextStyles.reviewsTitle,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: ElevatedButton(
                      onPressed: vm.loadReviews,
                      child: const Text('Обновить'),
                    ),
                  ),
                ],
              ),
            );
          }

          return NotificationListener<ScrollNotification>(
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

                final review = vm.reviews[index];
                return FullReviewItem(review: review);
              },
            ),
          );
        },
      ),
    );
  }
}
