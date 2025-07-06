import 'dart:convert';

import 'package:drift/drift.dart';

class ProductTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get price => integer().nullable()();
  TextColumn get productDescription => text()();
  TextColumn get imageUrl => text().nullable()();
  IntColumn get isFavorite => integer()();
  IntColumn get categoryId => integer()();
  IntColumn get rating => integer().nullable()();
  IntColumn get createdAt => integer()();
  TextColumn get images => text().map(StringListConverter())();
}

class StringListConverter extends TypeConverter<List<String?>, String> {
  @override
  List<String?> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    return List<String?>.from(json.decode(fromDb));
  }

  @override
  String toSql(List<String?> value) => json.encode(value);
}
