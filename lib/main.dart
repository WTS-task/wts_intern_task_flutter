import 'package:flutter/material.dart';
import 'package:wts_task/app/app.dart';
import 'package:wts_task/features/catalog/presentation/view/product_detail_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() {
  runApp(const MyTestApp());
}

class MyTestApp extends StatelessWidget {
  const MyTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Тест ProductDetailScreen',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductDetailScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
