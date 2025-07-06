import 'package:drift/drift.dart';
import 'package:shop1/core/data/app_database.dart';
import 'package:shop1/features/products/models/local/product_table.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [ProductTable])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  ProductDao(super.db);

  // Получить все товары
  Future<List<ProductTableData>> getAllProducts() => select(productTable).get();

  // Получить товар по айдишнику
  Future<List<ProductTableData>> getProductByCategoryId(int categoryId) =>
      (select(
        productTable,
      )..where((t) => t.categoryId.equals(categoryId))).get();

  // Получить товар по айдишнику
  Future<ProductTableData> getProductById(int id) =>
      (select(productTable)..where((t) => t.id.equals(id))).getSingle();

  // Поиск по имени
  Future<List<ProductTableData>> searchProductByName({
    int? categoryId,
    required String searchText,
  }) {
    if (categoryId != null) {
      return (select(productTable)..where(
            (t) =>
                t.categoryId.equals(categoryId) & t.name.contains(searchText),
          ))
          .get();
    }
    return (select(
      productTable,
    )..where((t) => t.name.contains(searchText))).get();
  }

  // Вставить список
  Future<void> insertProducts(List<ProductTableCompanion> items) async =>
      await batch(
        (batch) => batch.insertAllOnConflictUpdate(productTable, items),
      );

  // Очистить табицу
  Future<void> clear() => delete(productTable).go();
}
