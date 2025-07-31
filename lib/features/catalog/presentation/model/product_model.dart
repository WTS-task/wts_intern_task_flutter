import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/catalog/data/repositories/product_repository.dart';
import 'package:wts_task/features/product/data/models/product.dart';

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

  @override
  Future<void> loadNextItems(String? loadingUuid, {String? searchText}) async {
    final response = await _productRepository.getProductList(
      categoryId: categoryId,
      text: searchText,
      offset: offset,
    );
    if (response.isError) {
      onLoadingError(response.error ?? 'Ошибка');

      return;
    }

    final items = response.result;
    if (items == null) {
      onLoadingError('Не удалось загрузить каталог');
      return;
    }
    if (searchText != null) reset(soft: true);
    await onNextItemsLoaded(items, loadingUuid);
  }
}
