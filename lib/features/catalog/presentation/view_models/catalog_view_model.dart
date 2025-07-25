import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/catalog/data/model/catalog_model.dart';
import 'package:wts_task/features/catalog/data/repositories/catalog_repository.dart';

class CatalogViewModel extends ListModel<CatalogResponse> {
  CatalogViewModel({super.items, this.categoryId});
  final String? categoryId;
  final CatalogRepository _catalogRepository = CatalogRepository();

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    final response = await _catalogRepository.getCatalogList(categoryId);
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
}
