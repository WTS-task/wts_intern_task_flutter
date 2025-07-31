import 'package:wts_task/core/models/item_model.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/catalog/data/models/category.dart';
import 'package:wts_task/features/catalog/data/repositories/catalog_repository.dart';
import 'package:wts_task/features/product/data/models/product.dart';

class ProductDetailViewModel extends ItemModel<CatalogResponse> {
  ProductDetailViewModel({
    required Product product,
    required this.authLocalDataSource,
    super.item,
  });
  final AuthLocalDataSource authLocalDataSource;
  late final CatalogRepository _catalogRepository = CatalogRepository(
    authLocalDataSource,
  );
  @override
  Future<void> loadItemData() {
    throw UnimplementedError();
  }
}
