import 'package:flutter/material.dart';
import 'package:wts_task/core/page/base_page.dart';

class OrderDetailScreen extends BasePage {
  const OrderDetailScreen({required this.orderId, super.key});

  final String orderId;

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends BasePageState<OrderDetailScreen> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    debugPrint('details');
    debugPrint(widget.orderId);
    return AppBar(title: Text('Заказ #${widget.orderId}'), centerTitle: true);
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Center(child: Text('Детали заказа'));
  }
}
