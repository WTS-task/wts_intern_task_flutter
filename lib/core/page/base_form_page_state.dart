import 'dart:core';

import 'package:flutter/material.dart';
import 'package:wts_task/core/mixins/base_page_model_mixin.dart';
import 'package:wts_task/core/models/base_model.dart';
import 'package:wts_task/core/page/base_page.dart';

enum FormType { normal, fullScreenSize, sliverFixedFooter }

abstract class BaseFormPageState<
  T extends BasePage,
  TFormModel extends BaseModel
>
    extends BasePageState<T>
    with BasePageModelMixin<T, TFormModel> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isFormSubmitting = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool setWhiteBack = false;

  EdgeInsetsGeometry? get marginBody => null;

  TFormModel get vm => pageModel!;

  /// Переопределить и реализовать отправку формы
  @protected
  Future<void> submitForm();

  /// Переопределить и реализовать внешний вид формы
  @protected
  Widget buildForm(BuildContext context);

  @override
  Widget buildBody(BuildContext context) {
    return buildDefaultFormBody(context);
  }

  @protected
  Widget buildDefaultFormBody(BuildContext context) {
    return AutofillGroup(
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: SafeArea(child: buildForm(context)),
      ),
    );
  }

  @protected
  Future<void> trySubmitForm(BuildContext context) async {
    if (isFormSubmitting || !context.mounted) {
      return;
    }
    isFormSubmitting = true;
    if (await validate()) {
      formKey.currentState?.save();
      FocusScope.of(context).unfocus();
      showLoadingIndicator();
      await submitForm();
      hideLoadingIndicator();
    }
    isFormSubmitting = false;
  }

  @protected
  Future<bool> validate() async {
    return formKey.currentState?.validate() ?? false;
  }
}
