import 'package:flutter/material.dart';
import 'package:wts_task/features/profile/data/models/shop_order_item.dart';
import 'package:wts_task/features/profile/presentation/view/widgets/product_card.dart';

class OrderItemsGrid extends StatelessWidget {
  const OrderItemsGrid({required this.items, super.key});

  final List<ShopOrderItem> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - 12) / 2;
        return Wrap(
          spacing: 12,
          runSpacing: 16,
          children: items
              .map(
                (item) => SizedBox(
              width: itemWidth,
              child: ProductCard(product: item, width: itemWidth),
            ),
          )
              .toList(),
        );
      },
    );
  }
}