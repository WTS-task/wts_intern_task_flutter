import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/page/base_list_view_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';
import 'package:wts_task/features/product/presentation/model/product_review_view_model.dart';
import 'package:wts_task/features/product/presentation/view/screens/add_review_dialog.dart';
import 'package:wts_task/features/product/presentation/view/widgets/full_review_item.dart';

class ProductReviewsScreen extends BasePage {
  const ProductReviewsScreen({
    required this.productId,

    super.key,
    this.skipReviews = 0,
  }) : super(title: 'Отзывы');

  final String productId;

  final int skipReviews;

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState
    extends
        BaseListViewPageState<ProductReviewsScreen, ProductReviewsViewModel> {
  @override
  EdgeInsets listPadding() => const EdgeInsets.fromLTRB(16, 0, 16, 16);

  @override
  ProductReviewsViewModel createModel() {
    return ProductReviewsViewModel(
      repository: context.read<ProductRepository>(),
      productId: widget.productId,
    );
  }

  @override
  Widget buildListHeaderImpl(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
        child: OutlinedButton(
          onPressed: () => _showAddReviewDialog(context),
          child: const Text(
            'Оставить отзыв',
            style: AppTextStyles.reviewButtonText,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildListItemImpl(BuildContext context, int index) {
    final review = model.items[index];
    return FullReviewItem(review: review);
  }

  @override
  Widget buildEmptyListPlaceholder(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Отзывов пока нет', style: AppTextStyles.reviewsTitle),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ElevatedButton(
              onPressed: () => reloadData(showLoading: false),
              child: const Text('Обновить список'),
            ),
          ),
        ],
      ),
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
