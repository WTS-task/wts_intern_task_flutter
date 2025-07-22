import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/app/routes.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:wts_task/app/theme/app_theme.dart';
import 'package:wts_task/core/models/app_user.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppUser appUser = context.read();

  bool _isInitialized = false;
  String? _error;

  @override
  void initState() {
    preloadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final router = Provider.of<AppRouter>(context, listen: false).appRouter;
        return MaterialApp.router(
          routerConfig: router,
          title: 'Flutter Demo',
          theme: ThemeBuilder.buildThemeData(),
          builder: BotToastInit(),
        );
      },
    );
  }

  Future<void> preloadData() async {
    final error = await appUser.checkUserProfile();
    if (error != null) {
      BotToast.showText(text: error);
      return;
    }
    initializeApp(error);
  }

  void initializeApp(String? error) {
    setState(() {
      _isInitialized = true;
      _error = error;
    });
  }
}
