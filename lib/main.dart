import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/app/app.dart';
import 'package:wts_task/features/catalog/data/repositories/product_repository.dart';
import 'package:wts_task/features/catalog/presentation/view/product_detail_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() {
  final productRepository = MockProductRepository();
  runApp(
    MultiProvider(
      providers: [Provider<ProductRepository>.value(value: productRepository)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final productRepository = Provider.of<ProductRepository>(context);

    return MaterialApp(
      title: 'E-commerce',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductDetailScreen(
        productId: '1',
        repository: productRepository,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
