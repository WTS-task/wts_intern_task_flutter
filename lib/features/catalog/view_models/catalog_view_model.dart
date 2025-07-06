import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop1/core/di/service_locator.dart';
import 'package:shop1/core/models/abstract_app_state.dart';
import 'package:shop1/features/catalog/models/remote/catalog_model.dart';
import 'package:shop1/features/catalog/repo/catalog_repo.dart';

class CatalogState extends AbstractAppState<List<CatalogModel>> {
  CatalogState({super.data, super.isLoading, super.errorMessage});

  static const _sentinel = Object();

  CatalogState copyWith({
    List<CatalogModel>? data,
    bool? isLoading,
    Object? errorMessage = _sentinel,
  }) {
    return CatalogState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage == _sentinel
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}

class CatalogViewModel extends StateNotifier<CatalogState> {
  CatalogViewModel(this.repo) : super(CatalogState());

  final CatalogRepo repo;

  Future<void> fetchCatalog(String accessToken, int? parentId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final data = await repo.getCatalogItems(accessToken, parentId);
      state = state.copyWith(data: data, isLoading: false, errorMessage: null);
    } on DioException catch (e) {
      state = state.copyWith(errorMessage: e.message, isLoading: false);
    } catch (e) {
      log(e.toString());
      state = state.copyWith(
        errorMessage: 'Неизвестная ошибка',
        isLoading: false,
      );
    }
  }
}

final catalogProvider = StateNotifierProvider<CatalogViewModel, CatalogState>((
  ref,
) {
  return CatalogViewModel(getIt.get());
});
