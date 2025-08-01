
import 'package:wts_task/features/catalog/data/models/category.dart';

class Constants {
  static const String placeholderImageUrl =
      'https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=170667a&w=0&k=20&c=Q7gLG-xfScdlTlPGFohllqpNqpxsU1jy8feD_fob87U=';
  static const allProductCategory = Category(
    categoryId: 0,
    parentCategoryId: null,
    title: 'Все товары',
    fullName: 'Все товары',
    description: '',
    isPublic: 1,
    hasSubcategories: 0,
    icon: 'https://s.26-2.ru/images/Kartinka-K/Raznoe-6/Screenshot_15454.jpg',
    createdAt: 1748331100,
    updatedAt: 1748331100,
  );
}
