import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/page/base_form_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/core/widgets/custom_button.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';
import 'package:wts_task/features/product/data/view_models/add_review_view_model.dart';
import 'package:wts_task/features/product/presentation/view/widgets/rating_stars.dart';

class AddReviewDialog extends BasePage {
  const AddReviewDialog({
    super.key,
    required this.productId,
    required this.productName,
    required this.productImageUrl,
  }) : super(title: 'Оставить отзыв');

  final String productId;
  final String productName;
  final String? productImageUrl;

  @override
  State<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState
    extends BaseFormPageState<AddReviewDialog, AddReviewViewModel> {
  late ProductRepository _repository;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _repository = Provider.of<ProductRepository>(context, listen: false);
    super.initState();
  }

  @override
  AddReviewViewModel createModel() {
    return AddReviewViewModel(_repository, widget.productId);
  }

  @override
  Future<void> submitForm() async {
    if (_formKey.currentState!.validate() && vm.rating > 0) {
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
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Form(
              key: _formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductInfoRow(),
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
          ),
        ),
      ),
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
    return Consumer<AddReviewViewModel>(
      builder: (context, viewModel, _) => Container(
        constraints: const BoxConstraints(minHeight: 120),
        child: TextFormField(
          controller: viewModel.reviewController,
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Введите текст отзыва';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Consumer<AddReviewViewModel>(
      builder: (context, viewModel, _) => viewModel.isLoading
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
            ),
    );
  }
}
