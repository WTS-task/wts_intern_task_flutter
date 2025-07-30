import 'package:flutter/cupertino.dart';
import 'package:wts_task/core/models/base_model.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';

class AddReviewViewModel extends BaseModel {
  AddReviewViewModel(this.repository, this.productId);

  final ProductRepository repository;
  final String productId;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? get error => lastError;

  final TextEditingController reviewController = TextEditingController();
  final FocusNode reviewFocusNode = FocusNode();
  int rating = 0;

  void setRating(int value) {
    rating = value;
    notifyModelListeners();
  }

  Future<void> submitReview(BuildContext context) async {
    if (rating == 0) {
      addError('Выберите оценку');
      return;
    }

    final review = CreateReviewRequest(
      targetId: productId,
      text: reviewController.text,
      rating: rating,
    );

    try {
      _isLoading = true;
      notifyModelListeners();

      await repository.submitReview(review);
      Navigator.pop(context, true);
      clearError();
    } catch (e) {
      addError('Ошибка отправки отзыва');
    } finally {
      _isLoading = false;
      notifyModelListeners();
    }
  }

  @override
  void dispose() {
    reviewController.dispose();
    reviewFocusNode.dispose();
    super.dispose();
  }
}
