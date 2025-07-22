import 'dart:async';

import 'package:wts_task/core/models/base_model.dart';

typedef UpdateViewModelFunction<T> = Function(BaseDataModel<T> model);

/// Базовая модель для загрузки, хранения и обработки любых данных.
/// Для реализации:
/// * Реализовать загрузку данных в [loadData]. Обычно из API.
///
abstract class BaseDataModel<T> extends BaseModel {
  BaseDataModel({this.data});

  T? data;
  bool isLoading = false;

  /// Переопределить для загрузки данных модели
  Future<void> loadData();

  Future<void> reloadData({bool soft = false}) async {
    reset(soft: soft);
    await loadData();
  }

  @override
  void dispose() {
    clearData();
    super.dispose();
  }

  void update(UpdateViewModelFunction<T> changeFunction) {
    changeFunction(this);
    clearCache();
    if (!isDisposed) {
      notifyModelListeners();
    }
  }

  void reset({bool soft = false}) {
    isLoading = false;
    if (!soft) {
      clearData();
    }
  }

  void clearData() {
    clearError();
    clearCache();
  }

  void clearCache() {
    /// Add impl if need
  }

  void onLoadingError(String error) {
    isLoading = false;
    addError(error);
  }
}
