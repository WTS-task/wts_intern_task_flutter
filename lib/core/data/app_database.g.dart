// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _parentCategoryIdMeta = const VerificationMeta(
    'parentCategoryId',
  );
  @override
  late final GeneratedColumn<int> parentCategoryId = GeneratedColumn<int>(
    'parent_category_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isPublicMeta = const VerificationMeta(
    'isPublic',
  );
  @override
  late final GeneratedColumn<int> isPublic = GeneratedColumn<int>(
    'is_public',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hasSubcategoriesMeta = const VerificationMeta(
    'hasSubcategories',
  );
  @override
  late final GeneratedColumn<int> hasSubcategories = GeneratedColumn<int>(
    'has_subcategories',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parentCategoryId,
    title,
    fullName,
    description,
    isPublic,
    hasSubcategories,
    icon,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_category_id')) {
      context.handle(
        _parentCategoryIdMeta,
        parentCategoryId.isAcceptableOrUnknown(
          data['parent_category_id']!,
          _parentCategoryIdMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_public')) {
      context.handle(
        _isPublicMeta,
        isPublic.isAcceptableOrUnknown(data['is_public']!, _isPublicMeta),
      );
    } else if (isInserting) {
      context.missing(_isPublicMeta);
    }
    if (data.containsKey('has_subcategories')) {
      context.handle(
        _hasSubcategoriesMeta,
        hasSubcategories.isAcceptableOrUnknown(
          data['has_subcategories']!,
          _hasSubcategoriesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hasSubcategoriesMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      parentCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_category_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      isPublic: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_public'],
      )!,
      hasSubcategories: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}has_subcategories'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(attachedDatabase, alias);
  }
}

class CategoryTableData extends DataClass
    implements Insertable<CategoryTableData> {
  final int id;
  final int? parentCategoryId;
  final String title;
  final String fullName;
  final String description;
  final int isPublic;
  final int hasSubcategories;
  final String icon;
  final int createdAt;
  final int updatedAt;
  const CategoryTableData({
    required this.id,
    this.parentCategoryId,
    required this.title,
    required this.fullName,
    required this.description,
    required this.isPublic,
    required this.hasSubcategories,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || parentCategoryId != null) {
      map['parent_category_id'] = Variable<int>(parentCategoryId);
    }
    map['title'] = Variable<String>(title);
    map['full_name'] = Variable<String>(fullName);
    map['description'] = Variable<String>(description);
    map['is_public'] = Variable<int>(isPublic);
    map['has_subcategories'] = Variable<int>(hasSubcategories);
    map['icon'] = Variable<String>(icon);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      id: Value(id),
      parentCategoryId: parentCategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentCategoryId),
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

  factory CategoryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryTableData(
      id: serializer.fromJson<int>(json['id']),
      parentCategoryId: serializer.fromJson<int?>(json['parentCategoryId']),
      title: serializer.fromJson<String>(json['title']),
      fullName: serializer.fromJson<String>(json['fullName']),
      description: serializer.fromJson<String>(json['description']),
      isPublic: serializer.fromJson<int>(json['isPublic']),
      hasSubcategories: serializer.fromJson<int>(json['hasSubcategories']),
      icon: serializer.fromJson<String>(json['icon']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentCategoryId': serializer.toJson<int?>(parentCategoryId),
      'title': serializer.toJson<String>(title),
      'fullName': serializer.toJson<String>(fullName),
      'description': serializer.toJson<String>(description),
      'isPublic': serializer.toJson<int>(isPublic),
      'hasSubcategories': serializer.toJson<int>(hasSubcategories),
      'icon': serializer.toJson<String>(icon),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  CategoryTableData copyWith({
    int? id,
    Value<int?> parentCategoryId = const Value.absent(),
    String? title,
    String? fullName,
    String? description,
    int? isPublic,
    int? hasSubcategories,
    String? icon,
    int? createdAt,
    int? updatedAt,
  }) => CategoryTableData(
    id: id ?? this.id,
    parentCategoryId: parentCategoryId.present
        ? parentCategoryId.value
        : this.parentCategoryId,
    title: title ?? this.title,
    fullName: fullName ?? this.fullName,
    description: description ?? this.description,
    isPublic: isPublic ?? this.isPublic,
    hasSubcategories: hasSubcategories ?? this.hasSubcategories,
    icon: icon ?? this.icon,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CategoryTableData copyWithCompanion(CategoryTableCompanion data) {
    return CategoryTableData(
      id: data.id.present ? data.id.value : this.id,
      parentCategoryId: data.parentCategoryId.present
          ? data.parentCategoryId.value
          : this.parentCategoryId,
      title: data.title.present ? data.title.value : this.title,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      description: data.description.present
          ? data.description.value
          : this.description,
      isPublic: data.isPublic.present ? data.isPublic.value : this.isPublic,
      hasSubcategories: data.hasSubcategories.present
          ? data.hasSubcategories.value
          : this.hasSubcategories,
      icon: data.icon.present ? data.icon.value : this.icon,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableData(')
          ..write('id: $id, ')
          ..write('parentCategoryId: $parentCategoryId, ')
          ..write('title: $title, ')
          ..write('fullName: $fullName, ')
          ..write('description: $description, ')
          ..write('isPublic: $isPublic, ')
          ..write('hasSubcategories: $hasSubcategories, ')
          ..write('icon: $icon, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    parentCategoryId,
    title,
    fullName,
    description,
    isPublic,
    hasSubcategories,
    icon,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTableData &&
          other.id == this.id &&
          other.parentCategoryId == this.parentCategoryId &&
          other.title == this.title &&
          other.fullName == this.fullName &&
          other.description == this.description &&
          other.isPublic == this.isPublic &&
          other.hasSubcategories == this.hasSubcategories &&
          other.icon == this.icon &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryTableData> {
  final Value<int> id;
  final Value<int?> parentCategoryId;
  final Value<String> title;
  final Value<String> fullName;
  final Value<String> description;
  final Value<int> isPublic;
  final Value<int> hasSubcategories;
  final Value<String> icon;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  const CategoryTableCompanion({
    this.id = const Value.absent(),
    this.parentCategoryId = const Value.absent(),
    this.title = const Value.absent(),
    this.fullName = const Value.absent(),
    this.description = const Value.absent(),
    this.isPublic = const Value.absent(),
    this.hasSubcategories = const Value.absent(),
    this.icon = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CategoryTableCompanion.insert({
    this.id = const Value.absent(),
    this.parentCategoryId = const Value.absent(),
    required String title,
    required String fullName,
    required String description,
    required int isPublic,
    required int hasSubcategories,
    required String icon,
    required int createdAt,
    required int updatedAt,
  }) : title = Value(title),
       fullName = Value(fullName),
       description = Value(description),
       isPublic = Value(isPublic),
       hasSubcategories = Value(hasSubcategories),
       icon = Value(icon),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CategoryTableData> custom({
    Expression<int>? id,
    Expression<int>? parentCategoryId,
    Expression<String>? title,
    Expression<String>? fullName,
    Expression<String>? description,
    Expression<int>? isPublic,
    Expression<int>? hasSubcategories,
    Expression<String>? icon,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentCategoryId != null) 'parent_category_id': parentCategoryId,
      if (title != null) 'title': title,
      if (fullName != null) 'full_name': fullName,
      if (description != null) 'description': description,
      if (isPublic != null) 'is_public': isPublic,
      if (hasSubcategories != null) 'has_subcategories': hasSubcategories,
      if (icon != null) 'icon': icon,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CategoryTableCompanion copyWith({
    Value<int>? id,
    Value<int?>? parentCategoryId,
    Value<String>? title,
    Value<String>? fullName,
    Value<String>? description,
    Value<int>? isPublic,
    Value<int>? hasSubcategories,
    Value<String>? icon,
    Value<int>? createdAt,
    Value<int>? updatedAt,
  }) {
    return CategoryTableCompanion(
      id: id ?? this.id,
      parentCategoryId: parentCategoryId ?? this.parentCategoryId,
      title: title ?? this.title,
      fullName: fullName ?? this.fullName,
      description: description ?? this.description,
      isPublic: isPublic ?? this.isPublic,
      hasSubcategories: hasSubcategories ?? this.hasSubcategories,
      icon: icon ?? this.icon,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentCategoryId.present) {
      map['parent_category_id'] = Variable<int>(parentCategoryId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isPublic.present) {
      map['is_public'] = Variable<int>(isPublic.value);
    }
    if (hasSubcategories.present) {
      map['has_subcategories'] = Variable<int>(hasSubcategories.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('parentCategoryId: $parentCategoryId, ')
          ..write('title: $title, ')
          ..write('fullName: $fullName, ')
          ..write('description: $description, ')
          ..write('isPublic: $isPublic, ')
          ..write('hasSubcategories: $hasSubcategories, ')
          ..write('icon: $icon, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ProductTableTable extends ProductTable
    with TableInfo<$ProductTableTable, ProductTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productDescriptionMeta =
      const VerificationMeta('productDescription');
  @override
  late final GeneratedColumn<String> productDescription =
      GeneratedColumn<String>(
        'product_description',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<int> isFavorite = GeneratedColumn<int>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
    'rating',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String?>, String> images =
      GeneratedColumn<String>(
        'images',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String?>>($ProductTableTable.$converterimages);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    price,
    productDescription,
    imageUrl,
    isFavorite,
    categoryId,
    rating,
    createdAt,
    images,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('product_description')) {
      context.handle(
        _productDescriptionMeta,
        productDescription.isAcceptableOrUnknown(
          data['product_description']!,
          _productDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productDescriptionMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    } else if (isInserting) {
      context.missing(_isFavoriteMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      ),
      productDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_description'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_favorite'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rating'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      images: $ProductTableTable.$converterimages.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}images'],
        )!,
      ),
    );
  }

  @override
  $ProductTableTable createAlias(String alias) {
    return $ProductTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String?>, String> $converterimages =
      StringListConverter();
}

class ProductTableData extends DataClass
    implements Insertable<ProductTableData> {
  final int id;
  final String name;
  final int? price;
  final String productDescription;
  final String? imageUrl;
  final int isFavorite;
  final int categoryId;
  final int? rating;
  final int createdAt;
  final List<String?> images;
  const ProductTableData({
    required this.id,
    required this.name,
    this.price,
    required this.productDescription,
    this.imageUrl,
    required this.isFavorite,
    required this.categoryId,
    this.rating,
    required this.createdAt,
    required this.images,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<int>(price);
    }
    map['product_description'] = Variable<String>(productDescription);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['is_favorite'] = Variable<int>(isFavorite);
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<int>(rating);
    }
    map['created_at'] = Variable<int>(createdAt);
    {
      map['images'] = Variable<String>(
        $ProductTableTable.$converterimages.toSql(images),
      );
    }
    return map;
  }

  ProductTableCompanion toCompanion(bool nullToAbsent) {
    return ProductTableCompanion(
      id: Value(id),
      name: Value(name),
      price: price == null && nullToAbsent
          ? const Value.absent()
          : Value(price),
      productDescription: Value(productDescription),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      isFavorite: Value(isFavorite),
      categoryId: Value(categoryId),
      rating: rating == null && nullToAbsent
          ? const Value.absent()
          : Value(rating),
      createdAt: Value(createdAt),
      images: Value(images),
    );
  }

  factory ProductTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<int?>(json['price']),
      productDescription: serializer.fromJson<String>(
        json['productDescription'],
      ),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      isFavorite: serializer.fromJson<int>(json['isFavorite']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      rating: serializer.fromJson<int?>(json['rating']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      images: serializer.fromJson<List<String?>>(json['images']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<int?>(price),
      'productDescription': serializer.toJson<String>(productDescription),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'isFavorite': serializer.toJson<int>(isFavorite),
      'categoryId': serializer.toJson<int>(categoryId),
      'rating': serializer.toJson<int?>(rating),
      'createdAt': serializer.toJson<int>(createdAt),
      'images': serializer.toJson<List<String?>>(images),
    };
  }

  ProductTableData copyWith({
    int? id,
    String? name,
    Value<int?> price = const Value.absent(),
    String? productDescription,
    Value<String?> imageUrl = const Value.absent(),
    int? isFavorite,
    int? categoryId,
    Value<int?> rating = const Value.absent(),
    int? createdAt,
    List<String?>? images,
  }) => ProductTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    price: price.present ? price.value : this.price,
    productDescription: productDescription ?? this.productDescription,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    isFavorite: isFavorite ?? this.isFavorite,
    categoryId: categoryId ?? this.categoryId,
    rating: rating.present ? rating.value : this.rating,
    createdAt: createdAt ?? this.createdAt,
    images: images ?? this.images,
  );
  ProductTableData copyWithCompanion(ProductTableCompanion data) {
    return ProductTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      productDescription: data.productDescription.present
          ? data.productDescription.value
          : this.productDescription,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      rating: data.rating.present ? data.rating.value : this.rating,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      images: data.images.present ? data.images.value : this.images,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('productDescription: $productDescription, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('categoryId: $categoryId, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt, ')
          ..write('images: $images')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    price,
    productDescription,
    imageUrl,
    isFavorite,
    categoryId,
    rating,
    createdAt,
    images,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.productDescription == this.productDescription &&
          other.imageUrl == this.imageUrl &&
          other.isFavorite == this.isFavorite &&
          other.categoryId == this.categoryId &&
          other.rating == this.rating &&
          other.createdAt == this.createdAt &&
          other.images == this.images);
}

class ProductTableCompanion extends UpdateCompanion<ProductTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> price;
  final Value<String> productDescription;
  final Value<String?> imageUrl;
  final Value<int> isFavorite;
  final Value<int> categoryId;
  final Value<int?> rating;
  final Value<int> createdAt;
  final Value<List<String?>> images;
  const ProductTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.productDescription = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.rating = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.images = const Value.absent(),
  });
  ProductTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.price = const Value.absent(),
    required String productDescription,
    this.imageUrl = const Value.absent(),
    required int isFavorite,
    required int categoryId,
    this.rating = const Value.absent(),
    required int createdAt,
    required List<String?> images,
  }) : name = Value(name),
       productDescription = Value(productDescription),
       isFavorite = Value(isFavorite),
       categoryId = Value(categoryId),
       createdAt = Value(createdAt),
       images = Value(images);
  static Insertable<ProductTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? price,
    Expression<String>? productDescription,
    Expression<String>? imageUrl,
    Expression<int>? isFavorite,
    Expression<int>? categoryId,
    Expression<int>? rating,
    Expression<int>? createdAt,
    Expression<String>? images,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (productDescription != null) 'product_description': productDescription,
      if (imageUrl != null) 'image_url': imageUrl,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (categoryId != null) 'category_id': categoryId,
      if (rating != null) 'rating': rating,
      if (createdAt != null) 'created_at': createdAt,
      if (images != null) 'images': images,
    });
  }

  ProductTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int?>? price,
    Value<String>? productDescription,
    Value<String?>? imageUrl,
    Value<int>? isFavorite,
    Value<int>? categoryId,
    Value<int?>? rating,
    Value<int>? createdAt,
    Value<List<String?>>? images,
  }) {
    return ProductTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      productDescription: productDescription ?? this.productDescription,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      categoryId: categoryId ?? this.categoryId,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      images: images ?? this.images,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (productDescription.present) {
      map['product_description'] = Variable<String>(productDescription.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<int>(isFavorite.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (images.present) {
      map['images'] = Variable<String>(
        $ProductTableTable.$converterimages.toSql(images.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('productDescription: $productDescription, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('categoryId: $categoryId, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt, ')
          ..write('images: $images')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  late final CategoryDao categoryDao = CategoryDao(this as AppDatabase);
  late final ProductDao productDao = ProductDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categoryTable,
    productTable,
  ];
}

typedef $$CategoryTableTableCreateCompanionBuilder =
    CategoryTableCompanion Function({
      Value<int> id,
      Value<int?> parentCategoryId,
      required String title,
      required String fullName,
      required String description,
      required int isPublic,
      required int hasSubcategories,
      required String icon,
      required int createdAt,
      required int updatedAt,
    });
typedef $$CategoryTableTableUpdateCompanionBuilder =
    CategoryTableCompanion Function({
      Value<int> id,
      Value<int?> parentCategoryId,
      Value<String> title,
      Value<String> fullName,
      Value<String> description,
      Value<int> isPublic,
      Value<int> hasSubcategories,
      Value<String> icon,
      Value<int> createdAt,
      Value<int> updatedAt,
    });

class $$CategoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parentCategoryId => $composableBuilder(
    column: $table.parentCategoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isPublic => $composableBuilder(
    column: $table.isPublic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hasSubcategories => $composableBuilder(
    column: $table.hasSubcategories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parentCategoryId => $composableBuilder(
    column: $table.parentCategoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isPublic => $composableBuilder(
    column: $table.isPublic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hasSubcategories => $composableBuilder(
    column: $table.hasSubcategories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get parentCategoryId => $composableBuilder(
    column: $table.parentCategoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isPublic =>
      $composableBuilder(column: $table.isPublic, builder: (column) => column);

  GeneratedColumn<int> get hasSubcategories => $composableBuilder(
    column: $table.hasSubcategories,
    builder: (column) => column,
  );

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CategoryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoryTableTable,
          CategoryTableData,
          $$CategoryTableTableFilterComposer,
          $$CategoryTableTableOrderingComposer,
          $$CategoryTableTableAnnotationComposer,
          $$CategoryTableTableCreateCompanionBuilder,
          $$CategoryTableTableUpdateCompanionBuilder,
          (
            CategoryTableData,
            BaseReferences<
              _$AppDatabase,
              $CategoryTableTable,
              CategoryTableData
            >,
          ),
          CategoryTableData,
          PrefetchHooks Function()
        > {
  $$CategoryTableTableTableManager(_$AppDatabase db, $CategoryTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> parentCategoryId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> isPublic = const Value.absent(),
                Value<int> hasSubcategories = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
              }) => CategoryTableCompanion(
                id: id,
                parentCategoryId: parentCategoryId,
                title: title,
                fullName: fullName,
                description: description,
                isPublic: isPublic,
                hasSubcategories: hasSubcategories,
                icon: icon,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> parentCategoryId = const Value.absent(),
                required String title,
                required String fullName,
                required String description,
                required int isPublic,
                required int hasSubcategories,
                required String icon,
                required int createdAt,
                required int updatedAt,
              }) => CategoryTableCompanion.insert(
                id: id,
                parentCategoryId: parentCategoryId,
                title: title,
                fullName: fullName,
                description: description,
                isPublic: isPublic,
                hasSubcategories: hasSubcategories,
                icon: icon,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoryTableTable,
      CategoryTableData,
      $$CategoryTableTableFilterComposer,
      $$CategoryTableTableOrderingComposer,
      $$CategoryTableTableAnnotationComposer,
      $$CategoryTableTableCreateCompanionBuilder,
      $$CategoryTableTableUpdateCompanionBuilder,
      (
        CategoryTableData,
        BaseReferences<_$AppDatabase, $CategoryTableTable, CategoryTableData>,
      ),
      CategoryTableData,
      PrefetchHooks Function()
    >;
typedef $$ProductTableTableCreateCompanionBuilder =
    ProductTableCompanion Function({
      Value<int> id,
      required String name,
      Value<int?> price,
      required String productDescription,
      Value<String?> imageUrl,
      required int isFavorite,
      required int categoryId,
      Value<int?> rating,
      required int createdAt,
      required List<String?> images,
    });
typedef $$ProductTableTableUpdateCompanionBuilder =
    ProductTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int?> price,
      Value<String> productDescription,
      Value<String?> imageUrl,
      Value<int> isFavorite,
      Value<int> categoryId,
      Value<int?> rating,
      Value<int> createdAt,
      Value<List<String?>> images,
    });

class $$ProductTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productDescription => $composableBuilder(
    column: $table.productDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String?>, List<String>, String>
  get images => $composableBuilder(
    column: $table.images,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$ProductTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productDescription => $composableBuilder(
    column: $table.productDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get images => $composableBuilder(
    column: $table.images,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get productDescription => $composableBuilder(
    column: $table.productDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<int> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String?>, String> get images =>
      $composableBuilder(column: $table.images, builder: (column) => column);
}

class $$ProductTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductTableTable,
          ProductTableData,
          $$ProductTableTableFilterComposer,
          $$ProductTableTableOrderingComposer,
          $$ProductTableTableAnnotationComposer,
          $$ProductTableTableCreateCompanionBuilder,
          $$ProductTableTableUpdateCompanionBuilder,
          (
            ProductTableData,
            BaseReferences<_$AppDatabase, $ProductTableTable, ProductTableData>,
          ),
          ProductTableData,
          PrefetchHooks Function()
        > {
  $$ProductTableTableTableManager(_$AppDatabase db, $ProductTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> price = const Value.absent(),
                Value<String> productDescription = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<int> isFavorite = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<int?> rating = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<List<String?>> images = const Value.absent(),
              }) => ProductTableCompanion(
                id: id,
                name: name,
                price: price,
                productDescription: productDescription,
                imageUrl: imageUrl,
                isFavorite: isFavorite,
                categoryId: categoryId,
                rating: rating,
                createdAt: createdAt,
                images: images,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<int?> price = const Value.absent(),
                required String productDescription,
                Value<String?> imageUrl = const Value.absent(),
                required int isFavorite,
                required int categoryId,
                Value<int?> rating = const Value.absent(),
                required int createdAt,
                required List<String?> images,
              }) => ProductTableCompanion.insert(
                id: id,
                name: name,
                price: price,
                productDescription: productDescription,
                imageUrl: imageUrl,
                isFavorite: isFavorite,
                categoryId: categoryId,
                rating: rating,
                createdAt: createdAt,
                images: images,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductTableTable,
      ProductTableData,
      $$ProductTableTableFilterComposer,
      $$ProductTableTableOrderingComposer,
      $$ProductTableTableAnnotationComposer,
      $$ProductTableTableCreateCompanionBuilder,
      $$ProductTableTableUpdateCompanionBuilder,
      (
        ProductTableData,
        BaseReferences<_$AppDatabase, $ProductTableTable, ProductTableData>,
      ),
      ProductTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db, _db.categoryTable);
  $$ProductTableTableTableManager get productTable =>
      $$ProductTableTableTableManager(_db, _db.productTable);
}
