import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final orderId = GoRouterState.of(context).pathParameters['id'];
    return Scaffold(
      appBar: AppBar(title: Text('Заказ #$orderId'), centerTitle: true,),
      body: const Center(child: Text('Детали заказа')),
    );
  }
}
