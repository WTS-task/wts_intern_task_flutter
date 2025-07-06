import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop1/app/theme/app_theme.dart';
import 'package:shop1/core/di/service_locator.dart';
import 'package:shop1/app/router.dart';

void main() {
  registerDep();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: AppRouter.router,
    );
  }
}
