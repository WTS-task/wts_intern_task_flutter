import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop1/core/constants/constants.dart';
import 'package:shop1/features/cart/view/cart_screen.dart';
import 'package:shop1/features/catalog/models/remote/catalog_model.dart';
import 'package:shop1/features/catalog/view/catalog_screen.dart';
import 'package:shop1/features/catalog/view/child_catalog_screen.dart';
import 'package:shop1/features/products/view/products_screen.dart';
import 'package:shop1/features/profile/view/profile_screen.dart';
import 'package:shop1/app/bottom_nav_bar.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.catalog,
    routes: [
      ShellRoute(
        pageBuilder: (context, state, child) =>
            NoTransitionPage(child: TabScreen(child: child)),
        routes: [
          GoRoute(
            path: Routes.catalog,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: CatalogScreen()),
          ),
          GoRoute(
            path: Routes.bag,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: BagScreen()),
          ),
          GoRoute(
            path: Routes.profile,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileScreen()),
          ),
          GoRoute(
            path: Routes.childCatalog,
            pageBuilder: (context, state) {
              final parameters = state.extra as Map<String, dynamic>;
              final int parentId = int.parse(parameters[Constants.parentIdKey]);
              return NoTransitionPage(
                child: ChildCatalogScreen(parentId: parentId),
              );
            },
          ),
          GoRoute(
            path: Routes.products,
            pageBuilder: (context, state) {
              final parameters = state.extra as Map<String, dynamic>;
              final CatalogModel? catalog =
                  parameters[Constants.catalogKey] as CatalogModel?;
              final bool? isAllProducts =
                  parameters[Constants.isAllProductsKey] as bool?;
              return NoTransitionPage(
                child: ProductsScreen(
                  catalog: catalog,
                  isAllProducts: isAllProducts ?? false,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );

  static int getCurrentIndex(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);

    switch (state.fullPath) {
      case Routes.catalog:
        return 0;
      case Routes.bag:
        return 1;
      case Routes.profile:
        return 2;
      default:
        return 0;
    }
  }

  static void onTabTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(Routes.catalog);
        break;
      case 1:
        context.go(Routes.bag);
        break;
      case 2:
        context.go(Routes.profile);
        break;
    }
  }
}

class Routes {
  static const String catalog = '/catalog';
  static const String childCatalog = '/child-catalog';
  static const String bag = '/bag';
  static const String profile = '/profile';
  static const String products = '/products';
}
