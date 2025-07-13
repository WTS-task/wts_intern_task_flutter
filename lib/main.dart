import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/app/app.dart';
import 'package:wts_task/app/routes.dart';
import 'package:wts_task/core/models/app_user.dart';
import 'package:wts_task/core/services/api/private_api.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/cart/data/services/cart_service.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
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
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => AppUser(context.read(), context.read()),
        ),
        Provider(create: (context) => PrivateApi(context.read())),
        Provider<AppRouter>(
          lazy: false,
          create: (context) => AppRouter(context.read()),
        ),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: MyApp(),
    ),
  );
}
