import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/catalog/data/models/category.dart';
import 'package:wts_task/features/catalog/data/repositories/catalog_repository.dart';

class CatalogModel extends ListModel<Category> {
  CatalogModel({required this.authLocalDataSource, this.categoryId});
  final String? categoryId;
  final AuthLocalDataSource authLocalDataSource;
  late final CatalogRepository _catalogRepository = CatalogRepository(
    authLocalDataSource,
  );

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    final response = await _catalogRepository.getCatalogList(
      categoryId: categoryId,
      offset: offset,
    );
    if (response.isError) {
      onLoadingError(response.error ?? 'Ошибка');
      return;
    }

    await onNextItemsLoaded(response.result!, loadingUuid);
  }
}
