import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';
import 'package:wts_task/core/models/base_data_model.dart';

mixin SearchFilter {
  String searchString = '';
}

/// Модель для загрузки, накопления, хранения и обработки списочных данных.
///
/// Для реализации:
/// * Реализовать загрузку следующей порции данных списка в [loadNextItems]. Обычно из API.
/// * При успешной загрузке вызвать [onNextItemsLoaded]
/// * Если в процессе загрузки данных возникла ошибка, вызвать [onLoadingError]
///
abstract class ListModel<T> extends BaseDataModel<List<T>> {
  ListModel({List<T>? items}) : super(data: items ?? []);
  List<T>? _preparedItems;
  int _defaultItemsPortionSize = 0;
  bool isAllLoaded = false;
  bool _isFullReloading = false;
  String? lastLoadingUuid;
  List<T>? _lastLoadedItems;

  /// Переопределить для загрузки следующей порции данных списка.
  @protected
  Future<void> loadNextItems(String? loadingUuid);

  @override
  void reset({bool soft = false}) {
    isAllLoaded = false;
    _isFullReloading = true;
    lastLoadingUuid = null;
    _defaultItemsPortionSize = 0;
    super.reset(soft: soft);
  }

  @override
  Future<void> loadData() async {
    if (isAllLoaded || isLoading) {
      return;
    }
    lastLoadingUuid = const Uuid().v1();
    isLoading = true;
    await loadNextItems(lastLoadingUuid);
  }

  Future<void> onNextItemsLoaded(List<T> nextItems, String? loadingUuid) async {
    if (loadingUuid != lastLoadingUuid) {
      return;
    }
    if (_isFullReloading) {
      clearData();
      _isFullReloading = false;
    }
    if (nextItems.isNotEmpty) {
      rawItems.addAll(nextItems);
      _defaultItemsPortionSize = max(
        _defaultItemsPortionSize,
        nextItems.length,
      );
    }
    isAllLoaded = checkAllLoaded(nextItems);
    isLoading = false;
    _lastLoadedItems = nextItems;
    _preparedItems = null;
    notifyModelListeners();
  }

  bool checkAllLoaded(List<T> nextItems) {
    return nextItems.isEmpty || (nextItems.length <= _defaultItemsPortionSize);
  }

  @override
  void onLoadingError(String error) {
    _lastLoadedItems = null;
    isAllLoaded = true;
    super.onLoadingError(error);
  }

  int get offset {
    return _isFullReloading ? 0 : rawItems.length;
  }

  List<T> get items {
    _preparedItems ??= prepareItems(rawItems);
    return _preparedItems!;
  }

  bool get isItemsUpdated {
    return (_lastLoadedItems?.isNotEmpty ?? false) ||
        (_preparedItems?.isEmpty ?? true);
  }

  @protected
  List<T> get rawItems {
    return data!;
  }

  @override
  void clearData() {
    super.clearData();
    rawItems.clear();
  }

  @override
  void clearCache() {
    _lastLoadedItems = null;
    _preparedItems = null;
  }

  @protected
  List<T> prepareItems(List<T> rawItems) {
    return rawItems;
  }

  Future<bool> deleteItem(T item) async {
    update((_) => rawItems.remove(item));
    notifyListeners();
    return true;
  }

  void replaceItems(List<T> newItems) {
    update((_) {
      rawItems
        ..clear()
        ..addAll(newItems);
    });
  }

  void replaceItemAtIndex(T item, int itemIndex) {
    update((_) {
      rawItems[itemIndex] = item;
    });
  }

  void replaceItem(T oldItem, T newItem) {
    final position = rawItems.indexOf(oldItem);
    if (position == -1) {
      return;
    }
    update((model) {
      rawItems
        ..removeAt(position)
        ..insert(position, newItem);
    });
  }

  void addItem(T newItem, {int? position}) {
    if (position != null) {
      update((model) => rawItems.insert(position, newItem));
    } else {
      update((model) => rawItems.add(newItem));
    }
  }
}
