import 'package:hive/hive.dart';
import 'package:wts_task/features/product/data/models/product_model.dart';

class ProductCacheService {
  static const String _boxName = 'productsByCategoryBox';

  Future<List<ProductModel>> getCachedProducts(String categoryId) async {
    final box = await Hive.openBox(_boxName);
    final list = box.get(categoryId);

    if (list is List<ProductModel>) {
      return list;
    }

    return [];
  }

  Future<void> cacheProducts(String categoryId, List<ProductModel> products) async {
    final box = await Hive.openBox(_boxName);
    await box.put(categoryId, products);
  }

  Future<void> clearCache() async {
    final box = await Hive.openBox(_boxName);
    await box.clear();
  }
}