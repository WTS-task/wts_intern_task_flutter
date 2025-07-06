import 'package:drift/drift.dart';
import 'package:shop1/core/data/app_database.dart';
import 'package:shop1/features/catalog/models/local/category_table.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [CategoryTable])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.db);

  // Получить все категории
  Future<List<CategoryTableData>> getAllCategories() =>
      select(categoryTable).get();

  // Взять родительские категории
  Future<List<CategoryTableData>> getParentCategories() =>
      (select(categoryTable)..where((t) => t.parentCategoryId.isNull())).get();

  // Взять подкатегории
  Future<List<CategoryTableData>> getSubcategories(int parentId) => (select(
    categoryTable,
  )..where((t) => t.parentCategoryId.equals(parentId))).get();

  // Вставить список
  Future<void> insertCategories(List<CategoryTableCompanion> items) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(categoryTable, items);
    });
  }

  // Очистить таблицу
  Future<void> clear() => delete(categoryTable).go();
}
