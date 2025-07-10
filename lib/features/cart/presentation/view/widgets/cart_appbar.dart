import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/widgets/custom_alert_dialog.dart';
import 'package:wts_task/core/widgets/show_toast.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';

PreferredSizeWidget? cartAppbar({
  required CartViewModel vm,
  required BuildContext context,
}) {
  return AppBar(
    title: Text("Корзина", style: AppTextStyles.appBarText),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () async {
          await vm.addFakeCartItems();
          await vm.getCartProducts();
          showToast(message: 'Тестовые товары добавлены');
        },
        icon: Icon(Icons.add),
      ),
      IconButton(
        onPressed: () {
          CustomAlertDialog.show(
            context,
            title: 'Очистка корзины',
            content: 'Все товары из корзины будут удалены, продолжить?',
            onConfirm: () {
              vm.removeAllProducts();
              showToast(message: 'Корзина очищена!');
            },
          );
        },
        icon: Icon(Icons.delete),
      ),
    ],
  );
}
