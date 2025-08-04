import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/page/base_grid_view_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/catalog/presentation/model/product_model.dart';
import 'package:wts_task/features/catalog/presentation/view/widgets/product_card.dart';
import 'package:wts_task/features/catalog/presentation/view/widgets/search_text_field.dart';

class ProductListScreen extends BasePage {
  const ProductListScreen({
    required this.categoryId,
    required String catalogName,
    super.key,
  }) : super(title: catalogName);
  final String categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState
    extends BaseGridViewPageState<ProductListScreen, ProductListModel> {
  @override
  ProductListModel createModel() => ProductListModel(
    categoryId: widget.categoryId,
    authLocalDataSource: context.read<AuthLocalDataSource>(),
  );

  @override
  bool get shouldBuildEmptyListPlaceholder => false;

  @override
  Widget buildEmptyListPlaceholder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SearchTextField(onChanged: onSearch),
          const Expanded(child: Center(child: Text("Нет данных"))),
        ],
      ),
    );
  }

  @override
  Widget? buildSliverHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [SearchTextField(onChanged: onSearch)]),
    );
  }

  @override
  Widget buildListItemImpl(BuildContext context, int index) {
    final theme = Theme.of(context);
    final item = model.items[index];

    return ProductItemCard(item: item, theme: theme);
  }

  void onSearch(String searchString) {
    if (searchString == model.searchString ||
        (searchString.isNotEmpty && searchString.length < 2)) {
      return;
    }
    model.searchString = searchString;
    reloadData();
  }
}
