import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/page/base_list_view_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';
import 'package:wts_task/features/product/data/view_models/product_review_view_model.dart';
import 'package:wts_task/features/product/presentation/view/widgets/full_review_item.dart';
import 'package:wts_task/features/product/presentation/view/screens/add_review_dialog.dart';

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

class _ProductReviewsScreenState
    extends BaseListViewPageState<ProductReviewsScreen, ProductReviewsViewModel> {
  int parsedProductId = -1;
  bool isValidProductId = false;

  @override
  ProductReviewsViewModel createModel() {
    isValidProductId = false;
    parsedProductId = -1;

    try {
      if (widget.productId.isEmpty) {
        throw const FormatException('Product ID is empty');
      }

      final String cleanedProductId = widget.productId.replaceAll(
        RegExp(r'[^0-9]'),
        '',
      );

      if (cleanedProductId.isEmpty) {
        throw const FormatException('Product ID contains no digits');
      }

      parsedProductId = int.parse(cleanedProductId);
      isValidProductId = parsedProductId > 0;

      return ProductReviewsViewModel(
        repository: widget.repository,
        productId: parsedProductId,
        skipReviews: widget.skipReviews,
      );
    } catch (e) {
      isValidProductId = false;
      debugPrint('Failed to parse product ID: ${widget.productId}. Error: $e');
      return ProductReviewsViewModel(
        repository: widget.repository,
        productId: -1,
        skipReviews: widget.skipReviews,
      );
    }
  }

  @override
  Widget buildListHeaderImpl(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
        child: OutlinedButton(
          onPressed: () => _showAddReviewDialog(context),
          style: _outlinedButtonStyle(),
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
  Widget buildBodyContent(BuildContext context) {
    if (!isValidProductId) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Не удалось загрузить отзывы: некорректный ID товара'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Вернуться назад'),
            ),
          ],
        ),
      );
    }

    return ChangeNotifierProvider.value(
      value: model,
      child: super.buildBodyContent(context),
    );
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
    if (!isValidProductId) {
      debugPrint('Cannot show review dialog, invalid productId: $parsedProductId');
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AddReviewDialog(
        productId: parsedProductId.toString(),
        productName: '',
        productImageUrl: null,
      ),
    );
  }

  @override
  EdgeInsets listPadding() => const EdgeInsets.fromLTRB(16, 0, 16, 16);
}