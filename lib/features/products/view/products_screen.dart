import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop1/app/router.dart';
import 'package:shop1/core/constants/constants.dart';
import 'package:shop1/core/widgets/custom_app_bar.dart';
import 'package:shop1/core/widgets/error_view.dart';
import 'package:shop1/features/catalog/models/remote/catalog_model.dart';
import 'package:shop1/features/products/view/widgets/product_card.dart';
import 'package:shop1/features/products/view_models/product_view_model.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({
    super.key,
    required this.catalog,
    this.isAllProducts = false,
  });

  final CatalogModel? catalog;
  final bool isAllProducts;

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.isAllProducts) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final viewModel = ref.read(productsProvider.notifier);
        viewModel.fetchProducts(Constants.accessToken, null, null);
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final viewModel = ref.read(productsProvider.notifier);
        viewModel.fetchProducts(
          Constants.accessToken,
          widget.catalog?.categoryId,
          null,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(productsProvider);
    final viewModel = ref.read(productsProvider.notifier);

    void onRefresh() {
      viewModel.fetchProducts(
        Constants.accessToken,
        widget.catalog?.categoryId,
        null,
      );
    }

    void onSearch(String value) {
      if (value.isNotEmpty) {
        viewModel.fetchProducts(
          Constants.accessToken,
          widget.catalog?.categoryId,
          value,
        );
      } else {
        viewModel.fetchProducts(
          Constants.accessToken,
          widget.catalog?.categoryId,
          null,
        );
        FocusScope.of(context).unfocus();
      }
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            titleText: widget.catalog?.title ?? 'Все товары',
            onBack: () {
              if (widget.catalog != null) {
                context.go(
                  Routes.childCatalog,
                  extra: {
                    Constants.parentIdKey:
                        '${widget.catalog!.parentCategoryId}',
                  },
                );
              } else {
                context.go(Routes.catalog);
              }
            },
          ),
          Builder(
            builder: (context) {
              if (state.errorMessage == null && state.data != null) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: theme.iconTheme.color,
                        ),
                        hintText: 'Поиск',
                        hintStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.hintColor,
                        ),
                        filled: true,
                        fillColor: theme.colorScheme.onSecondary.withValues(
                          alpha: 0.1,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: onSearch,
                    ),
                  ),
                );
              } else {
                return SliverToBoxAdapter();
              }
            },
          ),
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
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.8,
                        ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          ProductCard(product: state.data![index]),
                      childCount: state.data!.length,
                    ),
                  ),
                );
              }
              return SliverFillRemaining(
                child: Center(child: Text('Нет данных')),
              );
            },
          ),
        ],
      ),
    );
  }
}
