import 'package:flutter/material.dart';
import 'package:wts_task/app/bottom_nav_bar.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Каталог')),
      body: const Center(child: Text('Категории товаров')),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}
