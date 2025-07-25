// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      productId: fields[0] as int?,
      name: fields[1] as String?,
      productDescription: fields[2] as String?,
      price: fields[3] as double?,
      userId: fields[4] as int?,
      categoryId: fields[5] as int?,
      rating: fields[6] as int?,
      popularity: fields[7] as int?,
      imageUrl: fields[8] as String?,
      images: (fields[9] as List?)?.cast<String>(),
      createdAt: fields[10] as int?,
      updatedAt: fields[11] as int?,
      isFavorite: fields[12] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.productDescription)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.categoryId)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.imageUrl)
      ..writeByte(9)
      ..write(obj.images)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      productId: (json['productId'] as num?)?.toInt(),
      name: json['name'] as String?,
      productDescription: json['productDescription'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      userId: (json['userId'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toInt(),
      popularity: (json['popularity'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: (json['createdAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      isFavorite: (json['isFavorite'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
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
