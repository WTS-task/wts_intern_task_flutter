import 'package:wts_task/features/cart/data/models/cart_product_model.dart';
import 'package:wts_task/features/product/data/models/product.dart';

// тестовые товары
List<CartProductModel> fakeCartItems = [
  CartProductModel(
    count: 1,
    isSelected: true,
    product: Product(
      productId: 0,
      name: "name",
      productDescription: "description",
      price: 2,
      userId: 1,
      categoryId: 1,
      rating: 2,
      popularity: 2,
      imageUrl:
          "https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1999&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      images: ["img_urls"],
      createdAt: 0,
      updatedAt: 0,
      isFavorite: 0,
    ),
  ),
  CartProductModel(
    count: 5,
    isSelected: true,
    product: Product(
      productId: 2,
      name: "name2",
      productDescription: "description2",
      price: 55,
      userId: 1,
      categoryId: 1,
      rating: 2,
      popularity: 2,
      imageUrl:
          "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      images: ["img_urls"],
      createdAt: 0,
      updatedAt: 0,
      isFavorite: 0,
    ),
  ),
  CartProductModel(
    count: 5,
    isSelected: true,
    product: Product(
      productId: 3,
      name: "headphones",
      productDescription: "description3",
      price: 123,
      userId: 1,
      categoryId: 1,
      rating: 2,
      popularity: 2,
      imageUrl:
          "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      images: ["img_urls"],
      createdAt: 0,
      updatedAt: 0,
      isFavorite: 0,
    ),
  ),
];
