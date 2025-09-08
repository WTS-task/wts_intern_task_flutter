import 'package:wts_task/core/models/list_model.dart';

class CatalogModel extends ListModel {
  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    // TODO: Реализовать загрузку товаров
    await Future.delayed(Duration(milliseconds: 300));
    return;
  }
}
