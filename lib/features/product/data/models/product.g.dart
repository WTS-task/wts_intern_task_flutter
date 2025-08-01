// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product();
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  productId: (json['productId'] as num?)?.toInt(),
  name: json['name'] as String?,
  productDescription: json['productDescription'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  userId: (json['userId'] as num?)?.toInt(),
  categoryId: (json['categoryId'] as num?)?.toInt(),
  rating: (json['rating'] as num?)?.toInt(),
  popularity: (json['popularity'] as num?)?.toInt(),
  imageUrl: json['imageUrl'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  createdAt: (json['createdAt'] as num?)?.toInt(),
  updatedAt: (json['updatedAt'] as num?)?.toInt(),
  isFavorite: json['isFavorite'] ?? false,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'productId': instance.productId,
  'name': instance.name,
  'productDescription': instance.productDescription,
  'price': instance.price,
  'userId': instance.userId,
  'categoryId': instance.categoryId,
  'rating': instance.rating,
  'popularity': instance.popularity,
  'imageUrl': instance.imageUrl,
  'images': instance.images,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'isFavorite': instance.isFavorite,
};
