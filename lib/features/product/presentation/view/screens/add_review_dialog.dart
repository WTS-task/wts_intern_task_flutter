import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/widgets/custom_button.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';
import 'package:wts_task/features/product/data/view_models/add_review_view_model.dart';
import 'package:wts_task/features/product/presentation/view/widgets/rating_stars.dart';

class AddReviewDialog extends StatefulWidget {
  const AddReviewDialog({
    super.key,
    required this.productId,
    required this.productName,
    required this.productImageUrl,
  });

  final String productId;
  final String productName;
  final String? productImageUrl;

  @override
  State<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<AddReviewDialog> {
  late final AddReviewViewModel vm;
  int parsedProductId = -1;
  bool isValidProductId = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _initializeViewModel();
  }

  void _initializeViewModel() {
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

      vm = AddReviewViewModel(
        Provider.of<ProductRepository>(context, listen: false),
        parsedProductId,
      );
    } catch (e) {
      isValidProductId = false;
      debugPrint('Failed to parse product ID: ${widget.productId}. Error: $e');
      vm = AddReviewViewModel(
        Provider.of<ProductRepository>(context, listen: false),
        -1,
      );
    }
  }

  Future<void> _submitForm() async {
    final result = await vm.submitReview(context);
    if (result && mounted) {
      Navigator.pop(context, true);
    }
  }

  void _trySubmitForm(BuildContext context) {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
    _submitForm();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  if (!isValidProductId)
                    const Center(child: Text('Ошибка: некорректный ID товара')),
                  if (isValidProductId) ...[
                    const SizedBox(height: 18),
                    _buildProductInfoRow(),
                    Consumer<AddReviewViewModel>(
                      builder: (context, viewModel, _) => Column(
                        children: [
                          if (viewModel.error != null) ...[
                            const SizedBox(height: 8),
                            Text(viewModel.error!, style: const TextStyle(color: Colors.red)),
                          ],
                          const SizedBox(height: 12),
                          _buildHelpText(),
                          const SizedBox(height: 12),
                          _buildRatingSection(viewModel),
                          const SizedBox(height: 18),
                          _buildReviewTextField(viewModel),
                          const SizedBox(height: 12),
                          _buildSubmitButton(viewModel),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(width: 24),
        const Align(
          alignment: Alignment.center,
          child: Text('Оставить отзыв', style: AppTextStyles.titleProductLarge),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => Navigator.pop(context),
              splashColor: const Color.fromRGBO(158, 158, 158, 0.2),
              highlightColor: const Color.fromRGBO(158, 158, 158, 0.1),
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                child: const Icon(Icons.close, size: 24, color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfoRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 77,
          height: 77,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: widget.productImageUrl != null
                ? DecorationImage(
              image: NetworkImage(widget.productImageUrl!),
              fit: BoxFit.cover,
            )
                : null,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            widget.productName,
            style: AppTextStyles.subtitleProductMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildHelpText() {
    return const Text(
      'Ваш отзыв помогает нам улучшить наш сервис.',
      style: AppTextStyles.reviewText,
    );
  }

  Widget _buildRatingSection(AddReviewViewModel viewModel) {
    return RatingStars(
      rating: viewModel.rating,
      size: 21,
      interactive: true,
      onRatingChanged: (rating) {
        debugPrint('Tapped star: $rating');
        viewModel.setRating(rating);
      },
    );
  }

  Widget _buildReviewTextField(AddReviewViewModel viewModel) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      child: TextFormField(
        controller: viewModel.reviewController,
        focusNode: viewModel.reviewFocusNode,
        decoration: InputDecoration(
          hintText: 'Напишите ваш отзыв...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        maxLines: null,
        minLines: 4,
        keyboardType: TextInputType.multiline,
        autovalidateMode: autovalidateMode,
        onChanged: (value) {
          if (viewModel.error != null && value.isNotEmpty) {
            viewModel.clearError();
          }
        },
      ),
    );
  }

  Widget _buildSubmitButton(AddReviewViewModel viewModel) {
    return viewModel.isLoading
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
      width: 358,
      height: 48,
      child: Theme(
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
          title: 'Отправить',
          onPressed: () => _trySubmitForm(context),
        ),
      ),
    );
  }
}