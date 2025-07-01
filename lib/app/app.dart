import 'package:flutter/material.dart';
import 'package:wts_task/app/routes.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:wts_task/app/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Demo',
      theme: mainTheme,
      builder: BotToastInit(),
    );
  }
}
