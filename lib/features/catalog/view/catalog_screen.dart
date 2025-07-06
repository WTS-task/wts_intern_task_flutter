import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop1/app/router.dart';
import 'package:shop1/core/constants/constants.dart';
import 'package:shop1/features/catalog/view/widgets/catalog_body.dart';
import 'package:shop1/features/catalog/view_models/catalog_view_model.dart';

class CatalogScreen extends ConsumerStatefulWidget {
  const CatalogScreen({super.key});

  @override
  ConsumerState<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends ConsumerState<CatalogScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = ref.read(catalogProvider.notifier);
      viewModel.fetchCatalog(Constants.accessToken, null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(catalogProvider);
    final viewModel = ref.read(catalogProvider.notifier);

    return CatalogBody(
      isParent: true,
      state: state,
      onCatalogTap: (catalog, isAllProducts) {
        if (catalog != null) {
          if (catalog.hasSubcategories == 1) {
            context.go(
              Routes.childCatalog,
              extra: {Constants.parentIdKey: '${catalog.categoryId}'},
            );
          } else {
            context.go(Routes.products, extra: {Constants.catalogKey: catalog});
          }
        } else {
          context.go(
            Routes.products,
            extra: {Constants.isAllProductsKey: isAllProducts},
          );
        }
      },
      onRefresh: () => viewModel.fetchCatalog(Constants.accessToken, null),
    );
  }
}
