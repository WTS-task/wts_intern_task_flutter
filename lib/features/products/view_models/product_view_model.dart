import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop1/core/di/service_locator.dart';
import 'package:shop1/core/models/abstract_app_state.dart';
import 'package:shop1/features/products/models/remote/product_model.dart';
import 'package:shop1/features/products/repo/product_repo.dart';

class ProductState extends AbstractAppState<List<ProductModel>> {
  ProductState({super.data, super.isLoading, super.errorMessage});

  static const _sentinel = Object();

  ProductState copyWith({
    List<ProductModel>? data,
    bool? isLoading,
    Object? errorMessage = _sentinel,
  }) {
    return ProductState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage == _sentinel
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}

class ProductViewModel extends StateNotifier<ProductState> {
  ProductViewModel(this.repo) : super(ProductState());

  final ProductRepo repo;

  Future<void> fetchProducts(
    String accesToken,
    int? categoryId,
    String? searchText,
  ) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final data = await repo.getProductItems(
        accesToken,
        categoryId,
        searchText,
      );
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

final productsProvider = StateNotifierProvider<ProductViewModel, ProductState>((
  ref,
) {
  return ProductViewModel(getIt.get());
});
