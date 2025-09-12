import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/app/app.dart';
import 'package:wts_task/app/routes.dart';
import 'package:wts_task/core/models/app_user.dart';
import 'package:wts_task/core/services/api/private_api.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/cart/data/repositories/cart_repository.dart';
import 'package:wts_task/features/cart/data/services/cart_service.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/features/chat/data/repositories/message_repository.dart';
import 'package:wts_task/features/place_order/presentation/view_model/place_order_view_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';
import 'package:wts_task/features/profile/data/repositories/profile_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await CartService.init();

  runApp(
    MultiProvider(
      providers: [
        Provider(lazy: false, create: (context) => AuthLocalDataSource()),
        Provider(
          lazy: false,
          create: (context) => ProfileRepository(context.read()),
        ),
        Provider(
          lazy: false,
          create: (context) => MessageRepository(context.read()),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => AppUser(context.read(), context.read()),
        ),
        Provider(create: (context) => PrivateApi(context.read())),
        Provider<ProductRepository>(
          lazy: false,
          create: (context) => ProductRepository(context.read()),
        ),
        Provider<CartRepository>(
          lazy: false,
          create: (context) => CartRepository(),
        ),
        Provider<AppRouter>(
          lazy: false,
          create: (context) => AppRouter(context.read()),
        ),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
        ChangeNotifierProvider(create: (context) => PlaceOrderViewModel(context.read())),
      ],
      child: const MyApp(),
    ),
  );
}
