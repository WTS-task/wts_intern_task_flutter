import 'package:drift/drift.dart';
import 'package:shop1/features/catalog/models/local/category_dao.dart';
import 'package:shop1/features/catalog/models/local/category_table.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop1/features/products/models/local/product_dao.dart';
import 'package:shop1/features/products/models/local/product_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [CategoryTable, ProductTable],
  daos: [CategoryDao, ProductDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'app_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
