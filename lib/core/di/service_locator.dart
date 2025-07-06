import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop1/core/constants/constants.dart';
import 'package:shop1/core/data/app_database.dart';
import 'package:shop1/features/catalog/models/local/category_dao.dart';
import 'package:shop1/features/catalog/repo/catalog_repo.dart';
import 'package:shop1/core/services/catalog_api_service.dart';
import 'package:shop1/features/products/models/local/product_dao.dart';
import 'package:shop1/features/products/repo/product_repo.dart';
import 'package:shop1/core/services/product_api_service.dart';

final getIt = GetIt.instance;

void registerDep() {
  _registerServices();
  _registerLocalDatabase();
  _registerRepos();
  // _registerViewModels();
}

void _registerServices() {
  getIt.registerLazySingleton(
    () => Dio(BaseOptions(baseUrl: Constants.baseUrl)),
  );

  getIt.registerLazySingleton(() => CatalogApiService(getIt.get()));
  getIt.registerLazySingleton(() => ProductApiService(getIt.get()));
}

void _registerLocalDatabase() {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
  getIt.registerLazySingleton<CategoryDao>(
    () => getIt<AppDatabase>().categoryDao,
  );
  getIt.registerLazySingleton<ProductDao>(
    () => getIt.get<AppDatabase>().productDao,
  );
}

void _registerRepos() {
  getIt.registerLazySingleton(() => CatalogRepo(getIt.get(), getIt.get()));
  getIt.registerLazySingleton(() => ProductRepo(getIt.get(), getIt.get()));
}

