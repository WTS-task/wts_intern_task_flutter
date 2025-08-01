// import 'package:wts_task/core/models/item_model.dart';
// import 'package:wts_task/features/product/data/models/product/product.dart';
// import 'package:wts_task/features/product/data/repositories/product_repositories.dart';
//
// class ProductModel extends ItemModel<Product> {
//   final ProductRepository repository;
//   final String productId;
//
//   ProductModel({
//     required this.repository,
//     required this.productId,
//     Product? product,
//   }) : super(item: product);
//
//   @override
//   Future<void> loadItemData() async {
//     try {
//       isLoading = true;
//       final loadedProduct = await repository.getProductById(productId);
//       await onItemLoaded(loadedProduct);
//     } catch (e) {
//       onLoadingError(e.toString());
//     } finally {
//       isLoading = false;
//     }
//   }
// }
