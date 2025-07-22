import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wts_task/app/routes.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/features/catalog/data/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _handleCategoryTap(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              _buildImage(),
              const SizedBox(width: 16),
              Expanded(child: _buildContent()),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: category.icon != null
          ? Image.network(
        category.icon!,
        width: 64,
        height: 64,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildPlaceholder(),
      )
          : _buildPlaceholder(),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 64,
      height: 64,
      color: Colors.grey[200],
      child: const Icon(Icons.category, size: 32),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.title,
          style: AppTextStyles.subtitle,
        ),
        if (category.description != null) ...[
          const SizedBox(height: 4),
          Text(
            category.description!,
            style: AppTextStyles.body,
          ),
        ],
      ],
    );
  }

  void _handleCategoryTap(BuildContext context) {
    if (category.hasSubcategories == 1) {
      context.read<AppRouter>().push(SubcategoriesRoute(category));
    } else {
      context.read<CatalogProvider>().loadProducts(category.categoryId);
      context.read<AppRouter>().push(ProductsRoute(category));
    }
  }
}