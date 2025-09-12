import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/page/base_form_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/core/widgets/custom_button.dart';
import 'package:wts_task/core/widgets/custom_text_field.dart';
import 'package:wts_task/core/widgets/show_toast.dart';
import 'package:wts_task/features/cart/presentation/view/widgets/total_price_widget.dart';
import 'package:wts_task/features/place_order/presentation/view/widgets/place_order_item.dart';
import 'package:wts_task/features/place_order/presentation/view_model/place_order_view_model.dart';
import 'package:provider/provider.dart';

class PlaceOrderScreen extends BasePage {
  const PlaceOrderScreen({super.key, super.title = "Оформление"});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState
    extends BaseFormPageState<PlaceOrderScreen, PlaceOrderViewModel> {
  @override
  PlaceOrderViewModel? createModel() => context.read();

  @override
  bool get shouldDisposeModel => false;

  @override
  bool get hasFixedFooter => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.loadData();
    });
  }

  @override
  Widget? buildFixedFooterImpl(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32, left: 16, right: 16, top: 16),
      child: Column(
        children: [
          const SizedBox(height: 5),
          TotalPriceWidget(totalPrice: vm.totalPrice),
          const SizedBox(height: 25),
          CustomButton(
            title: 'Оформить заказ',
            onPressed: () {
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });
              trySubmitForm(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Адрес доставки', style: AppTextStyles.bodyMedium),
          const SizedBox(height: 6),
          AddressForm(vm: vm),

          const SizedBox(height: 12),
          CustomTextField(
            label: 'Номер телефона для связи',
            controller: vm.phoneController,
            formatter: vm.phoneFormatter,
            validator: vm.validatePhone,
            inputType: TextInputType.phone,
            hintText: '+7(___) ___-__-__',
          ),
          const SizedBox(height: 12),
          CustomTextField(
            label: 'Имя',
            controller: vm.nameController,
            validator: vm.validateName,
          ),
          const SizedBox(height: 12),
          CustomTextField(
            label: 'Комментарий (необязательно)',
            controller: vm.commentController,
            maxLines: 3,
          ),
          const SizedBox(height: 28),
          const Text('Ваш заказ', style: AppTextStyles.appBarText),
          const SizedBox(height: 16),

          if (vm.items.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: vm.items.length,
              itemBuilder: (_, index) => PlaceOrderItem(
                vm: vm,
                product: vm.items[index],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Future<void> submitForm() async {
    final isSuccess = await vm.placeOrder();
    if (!mounted) return;

    if (isSuccess) {
      showToast(message: 'Заказ успешно оформлен!');
      context.go('/cart');
    } else {
      showToast(message: 'Ошибка при оформлении заказа!');
    }
  }
}

class AddressForm extends StatelessWidget {
  const AddressForm({required this.vm, super.key});

  final PlaceOrderViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: CustomTextField(
            controller: vm.cityController,
            validator: vm.validateCity,
            labelText: 'город',
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: CustomTextField(
            controller: vm.streetController,
            validator: vm.validateStreet,
            labelText: 'улица',
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: CustomTextField(
            controller: vm.houseController,
            validator: vm.validateHouse,
            inputType: TextInputType.number,
            labelText: 'дом',
          ),
        ),
      ],
    );
  }
}
