import 'package:flutter/material.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'cart_item_widget.dart';
import 'total_price_widget.dart';

class CartBodyLoaded extends StatelessWidget {
  final CartViewModel vm;
  const CartBodyLoaded({super.key, required this.vm});
  @override
  Widget build(BuildContext context) {
    final products = vm.state.products;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CartItemWidget(
                  product: products[index],
                  index: index,
                ),
              ),
              childCount: products.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 10),
                TotalPriceWidget(),
                SizedBox(height: 25),
                CustomButton(
                  title: 'Оформить заказ',
                  onPressed: () {
                    if (!vm.hasSelectedProducts) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Выберите хотя бы один товар!'),
                        ),
                      );
                    } else {
                      vm.onPlaceOrderButtonPressed(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
