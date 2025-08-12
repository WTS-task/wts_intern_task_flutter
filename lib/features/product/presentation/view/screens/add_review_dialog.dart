import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/page/base_form_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/core/widgets/custom_button.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';
import 'package:wts_task/features/product/presentation/view_models/add_review_view_model.dart';
import 'package:wts_task/features/product/presentation/view/widgets/product_info_card.dart';
import 'package:wts_task/features/product/presentation/view/widgets/rating_stars.dart';

class AddReviewDialog extends BasePage {
  const AddReviewDialog({
    required this.productId,
    required this.productName,
    required this.productImageUrl,
    super.key,
  }) : super(title: 'Оставить отзыв');

  final String productId;
  final String productName;
  final String? productImageUrl;

  @override
  State<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState
    extends BaseFormPageState<AddReviewDialog, AddReviewViewModel> {
  @override
  AddReviewViewModel createModel() {
    return AddReviewViewModel(
      context.read<ProductRepository>(),
      widget.productId,
    );
  }

  @override
  Future<void> submitForm() async {
    if (vm.rating > 0) {
      final result = await vm.submitReview();
      if (result && mounted) {
        Navigator.pop(context, true);
      }
    }
  }

  @override
  Widget buildForm(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: SingleChildScrollView(
        controller: ModalScrollController.of(context),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductInfoCard(
              productName: widget.productName,
              productImageUrl: widget.productImageUrl,
            ),
            const SizedBox(height: 12),
            _buildHelpText(),
            const SizedBox(height: 12),
            Consumer<AddReviewViewModel>(
              builder: (context, viewModel, _) =>
                  _buildRatingSection(viewModel),
            ),
            const SizedBox(height: 18),
            _buildReviewTextField(),
            const SizedBox(height: 12),
            _buildSubmitButton(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpText() {
    return const Text(
      'Ваш отзыв помогает нам улучшить наш сервис.',
      style: AppTextStyles.reviewText,
    );
  }

  Widget _buildRatingSection(AddReviewViewModel viewModel) {
    return Column(
      children: [
        RatingStars(
          rating: viewModel.rating,
          size: 21,
          interactive: true,
          onRatingChanged: viewModel.setRating,
        ),
        if (viewModel.rating == 0 &&
            autovalidateMode == AutovalidateMode.always)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text('Выберите оценку', style: TextStyle(color: Colors.red)),
          ),
      ],
    );
  }

  Widget _buildReviewTextField() {
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      child: TextFormField(
        controller: vm.reviewController,
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
        validator: vm.validateComment,
      ),
    );
  }

  Widget _buildSubmitButton() {
    return vm.isLoading
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            width: 358,
            height: 48,
            child: CustomButton(
              title: 'Отправить',
              onPressed: () {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
                trySubmitForm(context);
              },
            ),
          );
  }
}
