import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/constants/assets_path.dart';
import 'package:wts_task/features/catalog/presentation/widgets/rating_stars.dart';
import 'package:wts_task/features/catalog/presentation/widgets/submit_button.dart';

class AddReviewDialog extends StatefulWidget {
  final String productName;

  const AddReviewDialog({super.key, required this.productName});

  @override
  State<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<AddReviewDialog> {
  int _selectedRating = 0;
  final _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const SizedBox(width: 24),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Оставить отзыв',
                      style: AppTextStyles.titleProductLarge.copyWith(),
                    ),
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
                        highlightColor: const Color.fromRGBO(
                          158,
                          158,
                          158,
                          0.1,
                        ),
                        child: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.close,
                            size: 24,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
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
              ),
              const SizedBox(height: 12),

              Text(
                'Ваш отзыв помогает нам улучшить наш сервис.',
                style: AppTextStyles.reviewText,
              ),
              const SizedBox(height: 12),

              RatingStars(
                rating: _selectedRating,
                size: 21,
                interactive: true,
                onRatingChanged: (rating) {
                  setState(() {
                    _selectedRating = rating;
                  });
                },
              ),

              const SizedBox(height: 12),

              TextField(
                controller: _reviewController,
                decoration: InputDecoration(
                  hintText: 'Напишите ваш отзыв...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 24),

              SubmitButton(
                text: 'Отправить',
                onPressed: () {
                  //Логика отправки
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
