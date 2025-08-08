import 'package:flutter/cupertino.dart';
import 'package:wts_task/core/models/base_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';

class AddReviewViewModel extends BaseModel {
  AddReviewViewModel(this.repository, this.productId);

  final ProductRepository repository;
  final String productId;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final TextEditingController reviewController = TextEditingController();
  int rating = 0;

  void setRating(int value) {
    rating = value;
    notifyListeners();
  }

  Future<bool> submitReview() async {
    _isLoading = true;
    notifyListeners();

    final response = await repository.submitReview(
      relatedItemId: int.tryParse(productId)!,
      objectType: 2,
      text: reviewController.text,
      rating: rating,
    );

    _isLoading = false;
    notifyListeners();

    if (response.isError) {
      if (response.error?.contains('уже существует') ?? false) {
        addError('Вы уже оставляли отзыв на этот товар');
      } else {
        addError(response.error ?? 'Ошибка при отправке отзыва');
      }
      return false;
    }

    return true;
  }

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }
}