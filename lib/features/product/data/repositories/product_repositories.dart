import 'package:wts_task/core/constants/assets_catalog.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/data/models/product/product.dart';

abstract class ProductRepository {
  Future<Product> getProductById(String id);

  Future<List<Review>> getProductReviews(
    String productId, {
    int? limit,
    int offset = 0,
  });

  Future<void> submitReview(CreateReviewRequest review);

  Future<void> addToCart(Product product);

  // Future<List<Product>> getProducts();
}

class MockProductRepository implements ProductRepository {
  @override
  Future<Product> getProductById(String productId) async {
    await Future.delayed(const Duration(seconds: 1));
    return Product(
      productId: int.tryParse(productId),
      name: 'Беспроводные наушники Logitech G435 черный',
      productDescription:
          'Беспроводные наушники Logitech G435 черный [2021, 2.0, поддержка Nintendo Switch, PS4, PS5, охватывающие, 20 Гц - 20000 Гц, 45Ω, Bluetooth, радиоканал]',
      price: 6999,
      images: ['assets/headphones.png'],
    );
  }

  @override
  Future<List<Review>> getProductReviews(
    String productId, {
    int? limit,
    int offset = 0,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final allReviews = [
      Review(
        id: '1',
        authorId: 'user1',
        authorName: 'Sophia',
        authorAvatarUrl: AssetsCatalog.avatarOneImage,
        targetId: productId,
        text: 'Great product, exactly as described!',
        rating: 5,
        createdAt: DateTime.now().subtract(const Duration(days: 60)),
        updatedAt: null,
      ),
      Review(
        id: '2',
        authorId: 'user2',
        authorName: 'Ethan',
        targetId: productId,
        authorAvatarUrl: AssetsCatalog.avatarTwoImage,
        text: 'Good quality, but could be better.',
        rating: 4,
        createdAt: DateTime.now().subtract(const Duration(days: 90)),
        updatedAt: null,
      ),
      Review(
        id: '3',
        authorId: 'user3',
        authorName: 'TestName',
        targetId: productId,
        authorAvatarUrl: null,
        text: 'Test review.',
        rating: 2,
        createdAt: DateTime.now().subtract(const Duration(days: 9)),
        updatedAt: null,
      ),
      Review(
        id: '4',
        authorId: 'user4',
        authorName: 'Ethan Carter',
        authorAvatarUrl: AssetsCatalog.reviewsPersonOne,
        targetId: productId,
        text:
            'This product exceeded my expectations! The quality is outstanding, and it performs flawlessly. I highly recommend it to anyone looking for a reliable and efficient solution.',
        rating: 5,
        createdAt: DateTime.now().subtract(const Duration(days: 14)),
      ),
      Review(
        id: '5',
        authorId: 'user5',
        authorName: 'Olivia Bennett',
        authorAvatarUrl: AssetsCatalog.reviewsPersonTwo,
        targetId: productId,
        text:
            "I'm quite satisfied with my purchase. The product is well-designed and functions as described. There are a few minor improvements that could be made, but overall, it's a great value for the price.",
        rating: 4,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
      ),
      Review(
        id: '6',
        authorId: 'user6',
        authorName: 'Noah Thompson',
        authorAvatarUrl: AssetsCatalog.reviewsPersonThree,
        targetId: productId,
        text:
            "The product is decent, but it didn't quite meet my expectations. It works, but there are some noticeable drawbacks. I might consider other options in the future.",
        rating: 3,
        createdAt: DateTime.now().subtract(const Duration(days: 60)),
      ),
      Review(
        id: '7',
        authorId: 'user7',
        authorName: 'Anna',
        authorAvatarUrl: null,
        targetId: productId,
        text:
            "Great headphones! The sound is clear, the bass is deep. I've been using it for a month now - no complaints.",
        rating: 5,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];

    return limit == null
        ? allReviews.skip(offset).toList()
        : allReviews.skip(offset).take(limit).toList();
  }

  //фейковая отправка отзыва
  @override
  Future<void> submitReview(CreateReviewRequest review) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Отправлен отзыв на ${review.targetId} с оценкой ${review.rating}');
  }

  //фейковое добавление в корзину
  @override
  Future<void> addToCart(Product product) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Товар добавлен в корзину: ${product.name}');
  }
}
