import 'package:flutter/cupertino.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/widgets/custom_cached_image.dart';

class ProductInfoCard extends StatelessWidget {
  const ProductInfoCard({
    required this.productName,
    super.key,
    this.productImageUrl,
  });

  final String productName;
  final String? productImageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCachedImage(
          imageUrl: productImageUrl,
          width: 77,
          height: 77,
          borderRadius: BorderRadius.circular(12),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            productName,
            style: AppTextStyles.subtitleProductMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
