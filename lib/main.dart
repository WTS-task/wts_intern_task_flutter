import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/app/app.dart';
import 'core/database/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartViewModel())],
      child: MyApp(),
    ),
  );
}
