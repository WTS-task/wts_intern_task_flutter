import 'package:wts_task/core/models/item_model.dart';
import 'package:wts_task/features/catalog/data/model/catalog_model.dart';
import 'package:wts_task/features/catalog/data/repositories/catalog_repository.dart';
import 'package:wts_task/features/product/data/models/product_model.dart';

class ProductDetailViewModel extends ItemModel<CatalogResponse> {
  ProductDetailViewModel({super.item, required ProductModel product});

  final CatalogRepository _catalogRepository = CatalogRepository();

  @override
  Future<void> loadItemData() {
    throw UnimplementedError();
  }
}
