import 'package:flutter/material.dart';
import 'package:wts_task/core/page/base_list_view_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/catalog/presentation/model/catalog_model.dart';

class CatalogScreen extends BasePage {
  const CatalogScreen({super.key, super.title = 'Каталог'});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState
    extends BaseListViewPageState<CatalogScreen, CatalogModel> {
  @override
  CatalogModel createModel() => CatalogModel();

  @override
  Widget buildListItemImpl(BuildContext context, int index) {
    // TODO: implement buildListItemImpl
    throw UnimplementedError();
  }
}
