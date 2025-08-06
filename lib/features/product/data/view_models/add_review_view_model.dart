import 'package:flutter/cupertino.dart';
import 'package:wts_task/core/models/base_model.dart';
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
    debugPrint('Setting rating: $value');
    rating = value;
    notifyListeners();
  }

  Future<bool> submitReview(BuildContext context) async {
    if (rating == 0) {
      _error = 'Выберите оценку';
      notifyModelListeners();
      return false;
    }

    if (reviewController.text.isEmpty) {
      _error = 'Введите текст отзыва';
      notifyModelListeners();
      return false;
    }

    try {
      _isLoading = true;
      _error = null;
      notifyModelListeners();

      final response = await repository.submitReview(
        relatedItemId: productId,
        objectType: 'product',
        text: reviewController.text,
        rating: rating,
      );

      if (response.isError) {
        throw Exception(response.error);
      }

      return true;
    } catch (e) {
      _error = e.toString();
      return false;
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