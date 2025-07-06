import 'package:drift/drift.dart';

class CategoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get parentCategoryId => integer().nullable()();
  TextColumn get title => text()();
  TextColumn get fullName => text()();
  TextColumn get description => text()();
  IntColumn get isPublic => integer()();
  IntColumn get hasSubcategories => integer()();
  TextColumn get icon => text()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
}
