import 'package:flutter/material.dart';
import 'package:wts_task/core/page/base_page.dart';

class OrderDetailScreen extends BasePage {
  const OrderDetailScreen({required this.orderId, super.key}) : super(title: 'Заказ #$orderId');

  final String orderId;

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends BasePageState<OrderDetailScreen> {

  @override
  Widget buildBody(BuildContext context) {
    return const Center(child: Text('Детали заказа'));
  }
}
