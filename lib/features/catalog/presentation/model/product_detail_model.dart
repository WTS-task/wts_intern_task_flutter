import 'package:wts_task/core/models/item_model.dart';
import 'package:wts_task/features/catalog/data/models/category.dart';
import 'package:wts_task/features/catalog/data/repositories/catalog_repository.dart';
import 'package:wts_task/features/catalog/data/models/product.dart';

class ProductDetailViewModel extends ItemModel<CatalogResponse> {
  ProductDetailViewModel({super.item, required Product product});

  final CatalogRepository _catalogRepository = CatalogRepository();

  @override
  Future<void> loadItemData() {
    throw UnimplementedError();
  }
}
