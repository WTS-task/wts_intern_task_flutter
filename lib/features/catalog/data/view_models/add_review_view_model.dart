import 'package:flutter/cupertino.dart';
import 'package:wts_task/features/catalog/data/models/review/review_model.dart';
import 'package:wts_task/features/catalog/data/repositories/product_repository.dart';
import 'package:wts_task/features/catalog/data/view_models/base_view_model.dart';

class AddReviewViewModel extends BaseViewModel {
  final ProductRepository repository;
  final String productId;

  final TextEditingController reviewController = TextEditingController();
  final FocusNode reviewFocusNode = FocusNode();
  int rating = 0;

  AddReviewViewModel(this.repository, this.productId);

  void setRating(int value) {
    rating = value;
    notifyListeners();
  }

  Future<void> submitReview(BuildContext context) async {
    if (rating == 0) {
      setError('Выберите оценку');
      return;
    }

    final review = CreateReviewRequest(
      targetId: productId,
      text: reviewController.text,
      rating: rating,
    );

    try {
      setLoading(true);
      await repository.submitReview(review);
      Navigator.pop(context, true);
      setError(null);
    } catch (e) {
      setError('Ошибка отправки отзыва');
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    reviewController.dispose();
    reviewFocusNode.dispose();
    super.dispose();
  }
}
