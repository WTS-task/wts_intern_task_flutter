import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/page/base_list_view_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/core/widgets/custom_cached_image.dart';
import 'package:wts_task/features/profile/presentation/view_models/order_history_view_model.dart';
import 'package:wts_task/features/profile/utils/datetime_to_string.dart';
import 'package:wts_task/features/profile/utils/order_status_to_string.dart';
import 'package:wts_task/features/profile/data/models/order_detail.dart';
import 'package:wts_task/features/profile/data/models/shop_order_item.dart';

class OrderHistoryScreen extends BasePage {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState
    extends BaseListViewPageState<OrderHistoryScreen, OrderHistoryViewModel> {
  @override
  OrderHistoryViewModel createModel() => OrderHistoryViewModel();

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Заказы', style: AppTextStyles.appBarText),
      centerTitle: true,
    );
  }

  @override
  Widget buildListItemImpl(BuildContext context, int index) {
    final orderDetail = model.items[index];
    return OrderDetailWidget(orderDetail: orderDetail);
  }
}

class OrderDetailWidget extends StatelessWidget {
  const OrderDetailWidget({required this.orderDetail, super.key});
  final OrderDetail orderDetail;

  @override
  Widget build(BuildContext context) {
    final order = orderDetail.shopOrder!;
    final orderItemCount = order.shopOrderItems?.length ?? 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          InkWell(
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
          const SizedBox(height: 8),
          OrderItemsGrid(items: order.shopOrderItems ?? []),
          const SizedBox(height: 12),
        ],
      ),
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
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});
  final ShopOrderItem product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        // можно добавить переход на экран с деталями товара из каталога (по id)
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCachedImage(
            imageUrl: product.imageUrl!,
            width: double.infinity,
            height: 180,
            borderRadius: BorderRadius.circular(16),
          ),
          const SizedBox(height: 5),
          Flexible(
            child: Text(
              product.name!,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
