import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wts_task/core/page/base_list_view_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/catalog/presentation/view_models/catalog_view_model.dart';
import 'package:wts_task/features/product/presentation/view/product_list_screen.dart';

class SubCatalogScreen extends BasePage {
  const SubCatalogScreen({
    required this.categoryId,
    required this.catalogName,
    super.key,
  }) : super(title: catalogName);
  final String catalogName;
  final String categoryId;

  @override
  State<SubCatalogScreen> createState() => _SubCatalogScreenState();
}

class _SubCatalogScreenState
    extends BaseListViewPageState<SubCatalogScreen, CatalogViewModel> {
  @override
  CatalogViewModel createModel() =>
      CatalogViewModel(categoryId: widget.categoryId.toString());

  @override
  Widget buildListItemImpl(BuildContext context, int index) {
    final theme = Theme.of(context);
    final item = model.items[index];

    return GestureDetector(
      onTap: () {
        final categoryId = item.categoryId.toString();
        final catalogName = item.title;

        if (item.hasSubcategories == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductListScreen(
                categoryId: categoryId,
                catalogName: catalogName,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubCatalogScreen(
                categoryId: categoryId,
                catalogName: catalogName,
              ),
            ),
          );
        }
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl: item.icon,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text('Shop Now', style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
