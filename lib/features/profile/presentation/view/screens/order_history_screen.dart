import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/page/base_list_view_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/profile/presentation/view/widgets/order_items_grid.dart';
import 'package:wts_task/features/profile/presentation/view_models/order_history_view_model.dart';
import 'package:wts_task/features/profile/utils/datetime_to_string.dart';
import 'package:wts_task/features/profile/utils/order_status_to_string.dart';
import 'package:wts_task/features/profile/data/models/order_detail.dart';

class OrderHistoryScreen extends BasePage {
  const OrderHistoryScreen({super.key}) : super(title: 'Заказы');

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState
    extends BaseListViewPageState<OrderHistoryScreen, OrderHistoryViewModel> {
  @override
  OrderHistoryViewModel createModel() => OrderHistoryViewModel();

  @override
  Widget buildListItemImpl(BuildContext context, int index) {
    final orderDetail = model.items[index];
    return OrderDetailWidget(orderDetail: orderDetail);
  }

  @override
  EdgeInsetsGeometry listPadding() {
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  }
}

class OrderDetailWidget extends StatelessWidget {
  const OrderDetailWidget({required this.orderDetail, super.key});
  final OrderDetail orderDetail;

  @override
  Widget build(BuildContext context) {
    final order = orderDetail.shopOrder;

    if (order == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderDetailHeader(orderDetail: orderDetail),
        const SizedBox(height: 12),
        OrderItemsGrid(items: order.shopOrderItems ?? []),
        const SizedBox(height: 30),
      ],
    );
  }
}

class OrderDetailHeader extends StatelessWidget {
  const OrderDetailHeader({required this.orderDetail, super.key});

  final OrderDetail orderDetail;

  @override
  Widget build(BuildContext context) {
    final order = orderDetail.shopOrder;
    final orderItemCount = order?.shopOrderItems?.length ?? 0;

    if (order == null) {
      return const SizedBox.shrink();
    }

    return InkWell(
      onTap: () {
        final id = orderDetail.shopOrder?.shopOrderId.toString();
        // context.push('/profile/orders/${id}');
        context.pushNamed('order_detail', pathParameters: {'id': id!});
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
              const InkWell(child: Icon(Icons.arrow_forward, size: 24)),
            ],
          ),
          Text(
            '${orderItemCount.toString()} ${ (orderItemCount > 1 || orderItemCount == 0) ? 'items' : 'item'}',
            style: AppTextStyles.bodySmall,
          ),
          Text(
            '${datetimeToString(order.createdAt!)} · ${orderStatusToString(order.status ?? 0)}',
            style: AppTextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}
