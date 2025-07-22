import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    // тут можно вот так получить список выбранных товаров с прошлого экрана
    final List<CartProductModel>? items = GoRouterState.of(context).extra as List<CartProductModel>?;

    return Scaffold(
      appBar: AppBar(title: const Text('CheckoutScreen')),
      body: const Center(child: Text('Оформление заказа')),
    );
  }
}
