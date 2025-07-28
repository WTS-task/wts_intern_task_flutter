import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/constants.dart';
import 'package:wts_task/core/page/base_grid_view_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/cart/presentation/view/screens/cart_screen.dart';
import 'package:wts_task/features/catalog/presentation/model/product_model.dart';
import 'package:wts_task/features/catalog/presentation/view/product_detail_screen.dart';

class ProductListScreen extends BasePage {
  const ProductListScreen({
    required this.categoryId,
    required this.catalogName,
    super.key,
  }) : super(title: catalogName);
  final String categoryId;
  final String catalogName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState
    extends BaseGridViewPageState<ProductListScreen, ProductModel> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  ProductModel createModel() =>
      ProductModel(categoryId: widget.categoryId);

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  bool get shouldBuildEmptyListPlaceholder => true;

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget buildEmptyListPlaceholder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            key: _formKey,
            controller: _searchController,
            focusNode: _searchFocusNode,
            decoration: InputDecoration(
              hintText: 'Поиск товаров',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (text) {
              model.setSearchString(text);
            },
          ),
          const Expanded(child: Center(child: Text("Нет данных"))),
        ],
      ),
    );
  }

  @override
  Widget? buildSliverHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            key: _formKey,
            controller: _searchController,
            focusNode: _searchFocusNode,
            decoration: InputDecoration(
              hintText: 'Поиск товаров',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (text) {
              model.setSearchString(text);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget buildListItemImpl(BuildContext context, int index) {
    final theme = Theme.of(context);
    final item = model.items[index];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      color: theme.colorScheme.surface,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: item, productId: '',),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  color: theme.colorScheme.surface,
                  child: CachedNetworkImage(
                    width: 64,
                    height: 64,
                    imageUrl: item.imageUrl ?? Constants.placeholderImageUrl,
                    progressIndicatorBuilder: (context, url, progress) {
                      return Center(
                        child: SizedBox(
                          width: 64,
                          height: 64,
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
              const SizedBox(height: 8),
              Text(
                item.name ?? "Нет названия",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}