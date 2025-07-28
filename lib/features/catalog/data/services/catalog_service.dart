import 'package:go_router/go_router.dart';
import 'package:wts_task/features/catalog/presentation/view/catalog_screen.dart';
import 'package:wts_task/features/catalog/presentation/view/sub_catalog_screen.dart';
import 'package:wts_task/features/catalog/presentation/view/product_list_screen.dart';
import 'package:wts_task/features/catalog/presentation/view/product_reviews_screen.dart';
import 'package:wts_task/features/catalog/presentation/view/add_review_screen.dart';

class CatalogRout {
  static final branch = StatefulShellBranch(
    routes: [
      GoRoute(
        path: '/catalog',
        builder: (context, state) => const CatalogScreen(),
        routes: [
          GoRoute(
            path: 'category',
            builder: (context, state) {
              final categoryId = state.uri.queryParameters['categoryId'];
              final catalogName = state.uri.queryParameters['catalogName'];

              if (categoryId == null || catalogName == null) {
                throw Exception("Missing query parameters: 'categoryId' and 'catalogName' required");
              }

              return SubCatalogScreen(
                categoryId: categoryId,
                catalogName: catalogName,
              );
            },
            routes: [
              GoRoute(
                path: 'products',
                builder: (context, state) {
                  final categoryId = state.uri.queryParameters['categoryId'];
                  final catalogName = state.uri.queryParameters['catalogName'];

                  if (categoryId == null || catalogName == null) {
                    throw Exception("Missing query parameters: 'categoryId' and 'catalogName' required");
                  }

                  return ProductListScreen(
                    categoryId: categoryId,
                    catalogName: catalogName,
                  );
                },
                routes: [
                  GoRoute(
                    path: 'reviews',
                    builder: (context, state) => const ProductReviewsScreen(),
                    routes: [
                      GoRoute(
                        path: 'add',
                        builder: (context, state) => const AddReviewScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}