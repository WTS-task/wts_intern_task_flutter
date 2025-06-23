import 'package:flutter/material.dart';
import 'package:wts_task/app/bottom_nav_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Корзина')),
      body: const Center(child: Text('Товары в корзине')),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 1),
    );
  }
}
