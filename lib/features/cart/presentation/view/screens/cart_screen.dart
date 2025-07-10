import 'package:flutter/material.dart';
import 'package:wts_task/core/model/base_model.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/core/widgets/show_toast.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/features/cart/presentation/view/widgets/cart_appbar.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/features/cart/presentation/view/widgets/cart_body_loaded.dart';

class CartScreen extends BasePage {
  const CartScreen({super.key}) : super(title: 'Корзина');

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends BasePageState<CartScreen>
    implements IBaseModelListener {
  late final CartViewModel vm;
  @override
  void initState() {
    super.initState();
    vm = CartViewModel()
      ..addModelListener(this)
      ..getCartProducts();
  }

  @override
  void dispose() {
    vm
      ..removeModelListener(this)
      ..dispose();
    super.dispose();
  }

  @override
  void onModelUpdated() {
    if (vm.isLoading) {
      showLoadingIndicator();
    } else {
      hideLoadingIndicator();
    }
    setState(() {});
  }

  @override
  void onModelError(String error) {
    hideLoadingIndicator();
    showToast(message: error);
  }

  @override
  void onModelMessage(String message) {
    hideLoadingIndicator();
    showToast(message: message);
  }

  @override
  Widget buildBody(BuildContext context) {
    if (vm.isLoading) {
      showLoadingIndicator();
      return SizedBox.shrink();
    }

    if (vm.hasError) {
      return CartError(message: vm.lastError);
    }
    if (vm.products.isEmpty) {
      return CartEmpty();
    }
    return CartBodyLoaded(vm: vm);
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return cartAppbar(vm: vm, context: context);
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
