import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/widgets/custom_cached_image.dart';
import 'package:wts_task/core/widgets/loading_indicator.dart';
import 'package:wts_task/features/profile/data/models/order_detail.dart';
import 'package:wts_task/features/profile/data/models/shop_order_item.dart';
import 'package:wts_task/features/profile/presentation/view_models/order_history_view_model.dart';
import 'package:wts_task/features/profile/utils/datetime_to_string.dart';
import 'package:wts_task/features/profile/utils/order_status_to_string.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = OrderHistoryViewModel()..loadOrders();
        return vm;
      },
      child: OrderHistoryView(),
    );
  }
}

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OrderHistoryViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Заказы', style: AppTextStyles.appBarText),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Builder(
          builder: (_) {
            if (vm.isLoading) {
              return AppLoadingIndicator();
            }
            if (vm.error != null) {
              return Center(
                child: Text(
                  vm.error!,
                  style: TextStyle(color: AppColors.error),
                ),
              );
            }
            if (vm.orders.isEmpty) {
              return const Center(
                child: Text('Нет заказов', style: AppTextStyles.bodyMedium),
              );
            }
            return ListView.builder(
              itemCount: vm.orders.length,
              itemBuilder: (context, index) {
                final orderDetail = vm.orders[index];
                return OrderDetailWidget(orderDetail: orderDetail);
              },
            );
          },
        ),
      ),
    );
  }
}

class OrdersListWidget extends StatelessWidget {
  const OrdersListWidget({required this.vm, super.key});

  final OrderHistoryViewModel vm;

  @override
  Widget build(BuildContext context) {
    final orders = vm.orders;
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final orderDetail = orders[index];
        return OrderDetailWidget(orderDetail: orderDetail);
      },
    );
  }
}

class OrderDetailWidget extends StatelessWidget {
  const OrderDetailWidget({required this.orderDetail, super.key});

  final OrderDetail orderDetail;

  @override
  Widget build(BuildContext context) {
    final order = orderDetail.shopOrder!;
    final orderItemCount = order.shopOrderItems?.length ?? 0;
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.pushNamed(
              'order_detail',
              pathParameters: {'id': order.shopOrderId.toString()},
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Заказ #${order.shopOrderId}',
                    style: AppTextStyles.bodyMedium,
                  ),
                  InkWell(child: const Icon(Icons.arrow_forward, size: 24)),
                ],
              ),
              Text(
                '${orderItemCount.toString()} ${orderItemCount > 1 ? 'items' : 'item'}',
                style: AppTextStyles.bodySmall,
              ),
              Text(
                '${datetimeToString(order.createdAt!)} · ${orderStatusToString(order.status!)}',
                style: AppTextStyles.bodySmall,
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        OrderItemsGrid(items: order.shopOrderItems ?? []),
      ],
    );
  }
}

class OrderItemsGrid extends StatelessWidget {
  const OrderItemsGrid({required this.items, super.key});

  final List<ShopOrderItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final product = items[index];
            return ProductCard(product: product);
          },
          itemCount: items.length,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final ShopOrderItem product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCachedImage(
          imageUrl: product.imageUrl!,
          width: double.infinity,
          height: 180,
          borderRadius: BorderRadius.circular(16),
        ),
        SizedBox(height: 5),
        Text(
          product.name!,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryText,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
