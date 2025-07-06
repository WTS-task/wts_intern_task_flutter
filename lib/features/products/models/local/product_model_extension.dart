import 'package:drift/drift.dart';
import 'package:shop1/core/data/app_database.dart';
import 'package:shop1/features/products/models/remote/product_model.dart';

extension ProductModelExt on ProductModel {
  static ProductModel fromDrift(ProductTableData data) {
    return ProductModel(
      productId: data.id,
      name: data.name,
      price: data.price,
      productDescription: data.productDescription,
      imageUrl: data.imageUrl,
      isFavorite: data.isFavorite,
      categoryId: data.categoryId,
      rating: data.rating,
      createdAt: data.createdAt,
      images: data.images,
    );
  }

  ProductTableCompanion toDrift() {
    return ProductTableCompanion(
      id: Value(productId),
      name: Value(name),
      price: Value(price),
      productDescription: Value(productDescription),
      imageUrl: Value(imageUrl),
      isFavorite: Value(isFavorite),
      categoryId: Value(categoryId),
      rating: Value(rating),
      createdAt: Value(createdAt),
      images: Value(images),
    );
  }
}
