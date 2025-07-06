import 'package:flutter/material.dart';
import 'package:shop1/core/constants/constants.dart';
import 'package:shop1/core/widgets/custom_app_bar.dart';
import 'package:shop1/core/widgets/error_view.dart';
import 'package:shop1/features/catalog/models/remote/catalog_model.dart';
import 'package:shop1/features/catalog/view/widgets/catalog_card.dart';
import 'package:shop1/features/catalog/view_models/catalog_view_model.dart';

class CatalogBody extends StatelessWidget {
  const CatalogBody({
    super.key,
    required this.state,
    required this.onCatalogTap,
    this.onBack,
    required this.onRefresh,
    this.isParent = false,
  });

  final bool isParent;
  final CatalogState state;
  final void Function(CatalogModel? catalog, bool isAllProducts) onCatalogTap;
  final VoidCallback? onBack;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(onBack: onBack, titleText: 'Каталог'),
        Builder(
          builder: (context) {
            if (state.isLoading) {
              return SliverFillRemaining(
                child: Center(child: CircularProgressIndicator.adaptive()),
              );
            }
            if (state.errorMessage != null) {
              return SliverFillRemaining(
                child: Center(
                  child: ErrorView(
                    message: state.errorMessage!,
                    onRefresh: onRefresh,
                  ),
                ),
              );
            }
            if (state.data != null && state.data!.isNotEmpty) {
              final catalogList = state.data!;
              return SliverList(
                delegate: SliverChildListDelegate([
                  if (isParent)
                    CategoryCard(
                      image: Constants.allProductsImage,
                      title: 'Все товары',
                      onTap: () => onCatalogTap(null, true),
                    ),
                  ...catalogList.map(
                    (catalog) => CategoryCard(
                      image: catalog.icon,
                      title: catalog.title,
                      onTap: () => onCatalogTap(catalog, false),
                    ),
                  ),
                ]),
              );
            }
            return SliverFillRemaining(
              child: Center(child: Text('Нет данных')),
            );
          },
        ),
      ],
    );
  }
}
