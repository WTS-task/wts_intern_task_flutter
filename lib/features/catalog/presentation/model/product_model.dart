import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/product/data/models/product/product.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';

class ProductListModel extends ListModel<Product> {
  ProductListModel({
    required this.categoryId,
    required this.authLocalDataSource,
  });

  final AuthLocalDataSource authLocalDataSource;
  final String categoryId;
  late final ProductRepository _productRepository = ProductRepository(
    authLocalDataSource,
  );

  String? searchString;

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    final response = await _productRepository.getProductList(
      categoryId: categoryId,
      searchString: searchString,
      offset: offset,
    );
    if (response.isError) {
      onLoadingError(response.error ?? 'Не удалось загрузить каталог');
      return;
    }
    await onNextItemsLoaded(response.result!, loadingUuid);
  }
}
