import 'package:flutter/cupertino.dart';
import 'package:wts_task/core/models/base_model.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';

class AddReviewViewModel extends BaseModel {
  AddReviewViewModel(this.repository, this.productId);

  final ProductRepository repository;
  final int productId;
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;

  String? get error => _error;

  final TextEditingController reviewController = TextEditingController();
  final FocusNode reviewFocusNode = FocusNode();
  int rating = 0;

  void setRating(int value) {
    rating = value;
    notifyListeners();
  }

  Future<void> submitReview(BuildContext context) async {
    if (rating == 0) {
      _error = 'Выберите оценку';
      notifyModelListeners();
      return;
    }

    if (reviewController.text.isEmpty) {
      _error = 'Введите текст отзыва';
      notifyModelListeners();
      return;
    }

    final review = CreateReviewRequest(
      relatedItemId: productId,
      objectType: 'product',
      text: reviewController.text,
      rating: rating,
    );

    try {
      _isLoading = true;
      _error = null;
      notifyModelListeners();

      final response = await repository.submitReview(review);

      if (response.isError) {
        throw Exception(response.error);
      }

      Navigator.pop(context, true);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyModelListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyModelListeners();
  }

  @override
  void dispose() {
    reviewController.dispose();
    reviewFocusNode.dispose();
    super.dispose();
  }
}