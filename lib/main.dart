import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/app/app.dart';
import 'features/cart/data/services/cart_service.dart';
import 'package:wts_task/features/chat/presentation/view_models/chat_view_model.dart';
import 'package:wts_task/features/chat/data/services/message_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CartService.init();
  await MessageService.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartViewModel()),
        ChangeNotifierProvider(create: (_) => ChatViewModel()),
      ],
      child: MyApp(),
    ),
  );
}
