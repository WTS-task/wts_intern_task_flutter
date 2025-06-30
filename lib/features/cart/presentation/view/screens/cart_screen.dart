import 'package:flutter/material.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model_state.dart';
import 'package:wts_task/features/cart/presentation/view/widgets/cart_appbar.dart';
import 'package:provider/provider.dart';
import '../../../../../app/bottom_nav_bar.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/loading_indicator.dart';
import '../../view/widgets/cart_body_loaded.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartViewModel>().getCartProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CartViewModel>();
    final state = vm.state;

    Widget body;
    switch (state.loadState) {
      case LoadState.loading:
        body = loadingIndicator();
        break;
      case LoadState.empty:
        body = cartEmpty();
        break;
      case LoadState.error:
        body = cartError(state.errorMessage);
        break;
      case LoadState.loaded:
        body = state.products.isEmpty
            ? cartEmpty()
            : CartBodyLoaded(vm: vm);
        break;
    }

    return Scaffold(
      appBar: cartAppbar(context),
      body: body,
    );
  }
}

Widget cartEmpty() {
  return const Center(
    child: Text(
      'Корзина пуста',
      style: TextStyle(fontSize: 18, color: AppColors.primaryText),
    ),
  );
}

Widget cartError(String? message) {
  return Center(
    child: Text(
      message ?? 'Ошибка при обработке товаров в корзине!',
      style: TextStyle(fontSize: 18, color: AppColors.error),
    ),
  );
}