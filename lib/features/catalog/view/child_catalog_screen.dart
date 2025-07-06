import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop1/app/router.dart';
import 'package:shop1/core/constants/constants.dart';
import 'package:shop1/features/catalog/view/widgets/catalog_body.dart';
import 'package:shop1/features/catalog/view_models/catalog_view_model.dart';
import 'package:shop1/features/catalog/models/remote/catalog_model.dart';

class ChildCatalogScreen extends ConsumerStatefulWidget {
  const ChildCatalogScreen({super.key, required this.parentId});

  final int parentId;

  @override
  ConsumerState<ChildCatalogScreen> createState() => _ChildCatalogScreenState();
}

class _ChildCatalogScreenState extends ConsumerState<ChildCatalogScreen> {
  CatalogModel? currentCategory;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = ref.read(catalogProvider.notifier);
      viewModel.fetchCatalog(Constants.accessToken, widget.parentId);
      _fetchCurrentCategory();
    });
  }

  @override
  void didUpdateWidget(covariant ChildCatalogScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.parentId != oldWidget.parentId) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final viewModel = ref.read(catalogProvider.notifier);
        viewModel.fetchCatalog(Constants.accessToken, widget.parentId);
        _fetchCurrentCategory();
      });
    }
  }

  void _fetchCurrentCategory() async {
    try {
      final viewModel = ref.read(catalogProvider.notifier);
      // Получаем все категории, чтобы найти текущую
      final allCategories = await viewModel.repo.getCatalogItems(
        Constants.accessToken,
        null, // Получаем корневые категории
      );

      // Ищем текущую категорию среди всех категорий
      for (final category in allCategories) {
        if (category.categoryId == widget.parentId) {
          setState(() {
            currentCategory = category;
          });
          return;
        }
      }

      // Если не нашли среди корневых, ищем среди подкатегорий
      for (final rootCategory in allCategories) {
        if (rootCategory.hasSubcategories == 1) {
          final subcategories = await viewModel.repo.getCatalogItems(
            Constants.accessToken,
            rootCategory.categoryId,
          );

          for (final subcategory in subcategories) {
            if (subcategory.categoryId == widget.parentId) {
              setState(() {
                currentCategory = subcategory;
              });
              return;
            }
          }
        }
      }
    } catch (e) {
      // Игнорируем ошибки при получении информации о категории
    }
  }

  void _handleBackNavigation() {
    // Если у текущей категории есть родитель, переходим к нему
    if (currentCategory?.parentCategoryId != null) {
      context.go(
        Routes.childCatalog,
        extra: {Constants.parentIdKey: '${currentCategory!.parentCategoryId}'},
      );
    } else {
      // Если родителя нет, возвращаемся к основному каталогу
      context.go(Routes.catalog);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(catalogProvider);
    final viewModel = ref.read(catalogProvider.notifier);

    return Scaffold(
      body: CatalogBody(
        state: state,
        onCatalogTap: (catalog, isAllProducts) {
          if (catalog != null) {
            if (catalog.hasSubcategories == 1) {
              context.go(
                Routes.childCatalog,
                extra: {Constants.parentIdKey: '${catalog.categoryId}'},
              );
            } else {
              context.go(
                Routes.products,
                extra: {Constants.catalogKey: catalog},
              );
            }
          } else {
            context.go(
              Routes.products,
              extra: {Constants.isAllProductsKey: isAllProducts},
            );
          }
        },
        onBack: _handleBackNavigation,
        onRefresh: () {
          viewModel.fetchCatalog(Constants.accessToken, widget.parentId);
          _fetchCurrentCategory();
        },
      ),
    );
  }
}
