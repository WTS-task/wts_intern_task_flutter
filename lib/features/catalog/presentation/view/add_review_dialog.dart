import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/constants/assets_path.dart';
import 'package:wts_task/features/catalog/data/repositories/product_repository.dart';
import 'package:wts_task/features/catalog/data/view_models/add_review_view_model.dart';
import 'package:wts_task/features/catalog/presentation/widgets/rating_stars.dart';
import 'package:wts_task/features/catalog/presentation/widgets/submit_button.dart';

class AddReviewDialog extends StatefulWidget {
  final String productId;
  final String productName;
  final ProductRepository repository;

  const AddReviewDialog({
    super.key,
    required this.productId,
    required this.productName,
    required this.repository,
  });

  @override
  State<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<AddReviewDialog> {
  late final AddReviewViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = AddReviewViewModel(widget.repository, widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<AddReviewViewModel>(
        builder: (context, vm, child) {
          return Material(
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
                      const SizedBox(height: 18),
                      _buildProductInfoRow(),
                      if (vm.error != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          vm.error!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                      const SizedBox(height: 12),
                      _buildHelpText(),
                      const SizedBox(height: 12),
                      _buildRatingSection(vm),
                      const SizedBox(height: 18),
                      _buildReviewTextField(vm),
                      const SizedBox(height: 12),
                      _buildSubmitButton(vm, context),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _buildHeader() {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(width: 24),
        Align(
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
              hoverColor: const Color.fromRGBO(158, 158, 158, 0.1),
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

  _buildProductInfoRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 77,
          height: 77,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(headphonesImage),
              fit: BoxFit.cover,
            ),
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

  _buildHelpText() {
    return Text(
      'Ваш отзыв помогает нам улучшить наш сервис.',
      style: AppTextStyles.reviewText,
    );
  }

  _buildRatingSection(AddReviewViewModel vm) {
    return RatingStars(
      rating: vm.rating,
      size: 21,
      interactive: true,
      onRatingChanged: vm.setRating,
    );
  }

  _buildReviewTextField(AddReviewViewModel vm) {
    return Container(
      constraints: BoxConstraints(minHeight: 120),
      child: TextField(
        controller: vm.reviewController,
        focusNode: vm.reviewFocusNode,
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
      ),
    );
  }

  _buildSubmitButton(AddReviewViewModel vm, BuildContext context) {
    return vm.isLoading
        ? const Center(child: CircularProgressIndicator())
        : SubmitButton(
            text: 'Отправить',
            onPressed: () => vm.submitReview(context),
          );
  }
}
