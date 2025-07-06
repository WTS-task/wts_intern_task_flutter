import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop1/core/constants/constants.dart';
import 'package:shop1/features/products/models/remote/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      color: theme.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  color: theme.colorScheme.surface,
                  child: CachedNetworkImage(
                    imageUrl: product.imageUrl ?? Constants.placeholderImageUrl,
                    progressIndicatorBuilder: (context, url, progress) {
                      return Center(
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator.adaptive(
                            value: progress.progress,
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Icon(Icons.error, color: theme.colorScheme.error);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(
                  Icons.shopping_basket_outlined,
                  color: theme.iconTheme.color,
                ),
                onPressed: () {
                  // Переход к деталям товара
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
