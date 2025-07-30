import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/app/top_app_bar.dart';
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
  });

  final String productId;
  final ProductRepository repository;
  final int skipReviews;

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends BasePageState<ProductReviewsScreen> {
  late final ProductReviewsViewModel _vm;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _vm = ProductReviewsViewModel(
      widget.repository,
      widget.productId,
      skipReviews: widget.skipReviews,
    )..loadReviews();

    _scrollController.addListener(_scrollListener);
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
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return TopAppBar(
      title: widget.title ?? 'Отзывы',
      onBackPressed: canPop ? onPop : null,
      showBackButton: canPop,
      showCartButton: false,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<ProductReviewsViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading && vm.reviews.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.error != null) {
            return Center(child: Text(vm.error!));
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
