import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/models/base_model.dart';
import 'package:wts_task/core/page/base_page.dart';

mixin BasePageModelMixin<T extends BasePage, TModel extends BaseModel>
    on BasePageState<T>
    implements IBaseModelListener {
  late final TModel? pageModel = createModel();
  bool shouldDecorateToModelProvider = true;

  /// Отключить, если не нужно вызывать [BaseModel.dispose] при [dispose] экрана.
  bool shouldDisposeModel = true;

  /// Переопределить для создания модели
  TModel? createModel() {
    return null;
  }

  @override
  void initState() {
    super.initState();
    pageModel?.addModelListener(this);
  }

  @override
  void dispose() {
    super.dispose();
    pageModel?.removeModelListener(this);
    if (shouldDisposeModel) {
      pageModel?.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (shouldDecorateToModelProvider && pageModel != null) {
      return ChangeNotifierProvider.value(
        value: pageModel!,
        child: Consumer<TModel>(
          builder: (context, _, _) => super.build(context),
        ),
      );
    }
    return super.build(context);
  }

  @override
  void onModelUpdated() {
    // override if need
  }

  @override
  void onModelError(String error) {
    showMessage(error);
  }

  @override
  void onModelMessage(String message) {
    showMessage(message);
  }
}
