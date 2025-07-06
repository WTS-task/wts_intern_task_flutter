import 'package:drift/drift.dart';
import 'package:shop1/core/data/app_database.dart';
import '../remote/catalog_model.dart';

extension CatalogModelDriftExt on CatalogModel {
  static CatalogModel fromDrift(CategoryTableData data) {
    return CatalogModel(
      categoryId: data.id,
      parentCategoryId: data.parentCategoryId,
      title: data.title,
      fullName: data.fullName,
      description: data.description,
      isPublic: data.isPublic,
      hasSubcategories: data.hasSubcategories,
      icon: data.icon,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }

  CategoryTableCompanion toDrift() {
    return CategoryTableCompanion(
      id: Value(categoryId),
      parentCategoryId: Value(parentCategoryId),
      title: Value(title),
      fullName: Value(fullName),
      description: Value(description),
      isPublic: Value(isPublic),
      hasSubcategories: Value(hasSubcategories),
      icon: Value(icon),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }
}
