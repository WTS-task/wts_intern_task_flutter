import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/page/base_list_view_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/catalog/presentation/model/catalog_model.dart';
import 'package:wts_task/features/catalog/presentation/view/widgets/catalog_card.dart';

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
    extends BaseListViewPageState<SubCatalogScreen, CatalogModel> {
  @override
  CatalogModel createModel() => CatalogModel(
    categoryId: widget.categoryId.toString(),
    authLocalDataSource: context.read<AuthLocalDataSource>(),
  );
  @override
  void onListItemTap(BuildContext context, int index) {
    final item = model.items[index];
    final categoryId = item.categoryId.toString();
    final catalogName = item.title;

    final path = item.hasSubcategories == 0
        ? '/catalog/category/products'
        : '/catalog/category';

    final uri = Uri(
      path: path,
      queryParameters: {'categoryId': categoryId, 'catalogName': catalogName},
    );

    context.push(uri.toString());
  }

  @override
  Widget buildListItemImpl(BuildContext context, int index) {
    final item = model.items[index];

    return CatalogCard(item: item);
  }
}
