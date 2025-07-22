import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wts_task/core/widgets/show_toast.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/core/widgets/custom_button.dart';
import 'package:wts_task/features/cart/presentation/view/widgets/cart_item_widget.dart';
import 'package:wts_task/features/cart/presentation/view/widgets/total_price_widget.dart';

class CartBodyLoaded extends StatelessWidget {
  const CartBodyLoaded({required this.vm, super.key});
  final CartViewModel vm;
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
                child: CartItemWidget(product: products[index], index: index),
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
                    final selectedProducts = vm.prepareOrder();
                    if (selectedProducts == null) {
                      showToast(message: 'Выберите хотя бы один товар!');
                      return;
                    }
                    context.pushNamed('checkout', extra: selectedProducts);
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
