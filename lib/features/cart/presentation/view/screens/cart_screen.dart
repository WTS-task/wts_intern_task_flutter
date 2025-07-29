import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wts_task/core/page/base_list_view_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/core/widgets/custom_alert_dialog.dart';
import 'package:wts_task/core/widgets/custom_button.dart';
import 'package:wts_task/core/widgets/show_toast.dart';
import 'package:wts_task/features/cart/presentation/view/widgets/cart_item_widget.dart';
import 'package:wts_task/features/cart/presentation/view/widgets/total_price_widget.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/core/constants/app_colors.dart';

class CartScreen extends BasePage {
  const CartScreen({super.key}) : super(title: 'Корзина');

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState
    extends BaseListViewPageState<CartScreen, CartViewModel> {
  @override
  CartViewModel createModel() => CartViewModel();

  @override
  bool get hasFixedFooter => true;

  @override
  Widget? buildFixedFooterImpl(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TotalPriceWidget(vm: model),
          const SizedBox(height: 25),
          CustomButton(
            title: 'Оформить заказ',
            onPressed: () {
              final selectedProducts = model.prepareOrder();
              if (selectedProducts == null) {
                showToast(message: 'Выберите хотя бы один товар!');
                return;
              }
              context.pushNamed('checkout', extra: selectedProducts);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget buildListItemImpl(BuildContext context, int index) {
    final item = model.items[index];
    return CartItemWidget(vm: model, product: item, index: index);
  }

  @override
  List<Widget>? buildAppBarActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () async {
          await model.addFakeCartItems();
          showToast(message: 'Тестовые товары добавлены');
        },
        icon: const Icon(Icons.add),
      ),
      IconButton(
        onPressed: () {
          CustomAlertDialog.show(
            context,
            title: 'Очистка корзины',
            content: 'Все товары из корзины будут удалены, продолжить?',
            onConfirm: () {
              model.removeAllProducts();
              showToast(message: 'Корзина очищена!');
            },
          );
        },
        icon: const Icon(Icons.delete),
      ),
    ];
  }

  @override
  Widget buildEmptyListPlaceholder(BuildContext context) {
    return const Center(
      child: Text(
        'Корзина пуста',
        style: TextStyle(fontSize: 18, color: AppColors.primaryText),
      ),
    );
  }
}
