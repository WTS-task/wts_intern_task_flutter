import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/app/bottom_nav_bar.dart';
import 'package:wts_task/app/top_app_bar.dart';
import 'package:wts_task/features/catalog/data/repositories/product_repository.dart';
import 'package:wts_task/features/catalog/data/view_models/product_review_view_model.dart';
import 'package:wts_task/features/catalog/presentation/widgets/full_review_item.dart';

class ProductReviewsScreen extends StatefulWidget {
  final String productId;
  final ProductRepository repository;
  final int skipReviews;

  const ProductReviewsScreen({
    super.key,
    required this.productId,
    required this.repository,
    this.skipReviews = 0,
  });

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<ProductReviewsViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading && vm.reviews.isEmpty) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (vm.error != null) {
            return Scaffold(body: Center(child: Text(vm.error!)));
          }

          return Scaffold(
            appBar: TopAppBar(
              title: 'Отзывы',
              onBackPressed: () => Navigator.pop(context),
              showBackButton: true,
              showCartButton: false,
            ),
            body: NotificationListener<ScrollNotification>(
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
            ),
            bottomNavigationBar: AppBottomNavBar(currentIndex: 0),
          );
        },
      ),
    );
  }
}
