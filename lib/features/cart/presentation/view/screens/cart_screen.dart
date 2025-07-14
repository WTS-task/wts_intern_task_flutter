import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/widgets/loading_indicator.dart';
import 'package:wts_task/features/cart/presentation/view/widgets/cart_appbar.dart';
import 'package:wts_task/features/cart/presentation/view/widgets/cart_body_loaded.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model_state.dart';

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
        body = AppLoadingIndicator();
        break;
      case LoadState.empty:
        body = CartEmpty();
        break;
      case LoadState.error:
        body = CartError(message: state.errorMessage);
        break;
      case LoadState.loaded:
        body = state.products.isEmpty ? CartEmpty() : CartBodyLoaded(vm: vm);
        break;
    }

    return Scaffold(
      appBar: cartAppbar(context),
      body: body,
    );
  }
}

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Корзина пуста',
        style: TextStyle(fontSize: 18, color: AppColors.primaryText),
      ),
    );
  }
}

class CartError extends StatelessWidget {
  const CartError({super.key, this.message});

  final String? message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? 'Ошибка при обработке товаров в корзине!',
        style: TextStyle(fontSize: 18, color: AppColors.error),
      ),
    );
  }
}

