import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/constants.dart';
import 'package:wts_task/core/page/base_list_view_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/catalog/presentation/model/catalog_model.dart';
import 'package:wts_task/features/catalog/presentation/view/widgets/catalog_card.dart';

class CatalogScreen extends BasePage {
  const CatalogScreen({super.key, super.title = 'Каталог'});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState
    extends BaseListViewPageState<CatalogScreen, CatalogModel> {
  @override
  CatalogModel createModel() =>
      CatalogModel(authLocalDataSource: context.read<AuthLocalDataSource>());

  @override
  void initState() {
    model.addItem(Constants.allProductCategory, position: 0);
    super.initState();
  }

  @override
  void onListItemTap(BuildContext context, int index) {
    final item = model.items[index];
    final categoryId = item.categoryId.toString();
    final catalogName = item.title;

    final uri = Uri(
      path: item.hasSubcategories == 0
          ? '/catalog/category/products'
          : '/catalog/category',
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
