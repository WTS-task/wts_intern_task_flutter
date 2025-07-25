import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repository.dart';
import 'package:wts_task/features/product/data/models/product_model.dart';

class ProductViewModel extends ListModel<ProductModel> {
  ProductViewModel({required this.categoryId, super.items});
  final String categoryId;
  final ProductRepository _productRepository = ProductRepository();

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    final response = await _productRepository.getProductList(
      categoryId: categoryId,
    );
    if (response.isError) {
      addError(response.error);
      return;
    }

    final items = response.result;
    if (items == null) {
      addError('Не удалось загрузить каталог');
      return;
    }
    await onNextItemsLoaded(items, loadingUuid);
  }

  Future<void> setSearchString(String text) async {
    final response = await _productRepository.getProductList(
      categoryId: categoryId,
      text: text,
    );
    if (response.isError) {
      addError(response.error);
      return;
    }

    final items = response.result;
    if (items == null) {
      addError('Не удалось загрузить каталог');
      return;
    }
    replaceItems(items);
  }
}
