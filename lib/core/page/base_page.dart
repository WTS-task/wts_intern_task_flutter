import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/widgets/base_error_widget.dart';
import 'package:wts_task/core/widgets/loading_indicator.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({super.key, this.title, this.subtitle});

  final String? title;
  final String? subtitle;
}

/// Базовый экран для всех экранов приложения.
///
/// * Создает [Scaffold] для экрана - [buildScaffold]
/// * Создает и настраивает [AppBar] - [buildAppBar]
abstract class BasePageState<T extends BasePage> extends State<T> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<StreamSubscription> subscriptions = [];

  /// Выключить, чтобы не оборачивать экран в [Scaffold]
  bool shouldBuildScaffold = true;

  /// Включить, чтобы обернуть экран в [SafeArea]
  bool isSafeAreaEnabled = false;
  bool _isLoadingIndicatorVisible = false;
  bool _shouldHideContentWithLoadingIndicator = false;
  bool shouldDecorateToAbsorbPointer = false;

  bool get canPop => ModalRoute.of(context)?.canPop ?? false;

  /// Включить, чтобы расположить title в центре Appbar
  bool shouldCenterAppBarTitle = true;

  /// Включить, чтобы изменять размер Scaffold при открытии клавиатуры
  bool get shouldResizeFromOpenKeyBoard => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var body = buildBody(context);
    body = decorateBody(context, body);
    if (isSafeAreaEnabled) {
      body = SafeArea(child: body);
    }
    final scaffold = buildScaffold(context, body);
    return decorateScaffold(context, scaffold);
  }

  @protected
  Widget buildScaffold(BuildContext context, Widget body) {
    if (!shouldBuildScaffold) {
      return body;
    }
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: buildAppBar(context),
      drawer: buildDrawer(context),
      key: scaffoldKey,
      body: body,
      floatingActionButton: buildFloatingActionButton(context),
      resizeToAvoidBottomInset: shouldResizeFromOpenKeyBoard,
    );
  }

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: shouldCenterAppBarTitle,
      leadingWidth: 68,
      toolbarHeight: 74,
      title: buildAppBarTitle(context),
      leading: buildAppBarLeading(context),
      actions: buildAppBarActions(context),
      bottom: buildAppBarBottom(context),
    );
  }

  @protected
  Widget? buildAppBarTitle(BuildContext context) {
    if (widget.title == null) {
      return null;
    }
    return Text(widget.title ?? '', maxLines: 2);
  }

  @protected
  Widget decorateBody(BuildContext context, Widget body) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        if (!_isLoadingIndicatorVisible ||
            !_shouldHideContentWithLoadingIndicator)
          body,
        if (_isLoadingIndicatorVisible) buildLoadingIndicator(),
      ],
    );
  }

  Widget buildLoadingIndicator({double? margin, bool needShowOverlay = false}) {
    return AppLoadingIndicator(
      margin: margin != null ? EdgeInsets.only(top: margin) : EdgeInsets.zero,
      needShowOverlay: needShowOverlay,
    );
  }

  @protected
  Widget decorateScaffold(BuildContext context, Widget scaffold) {
    return AbsorbPointer(
      absorbing: shouldDecorateToAbsorbPointer,
      child: scaffold,
    );
  }

  /// Переопределите для построения тела экрана приложения.
  Widget buildBody(BuildContext context);

  @protected
  Widget? buildFloatingActionButton(BuildContext context) {
    return null;
  }

  @protected
  PreferredSizeWidget? buildAppBarBottom(BuildContext context) {
    return null;
  }

  @protected
  List<Widget>? buildAppBarActions(BuildContext context) {
    return null;
  }

  @protected
  Widget? buildDrawer(BuildContext context) {
    return null;
  }

  @protected
  Widget? buildAppBarLeading(BuildContext context) {
    if (canPop) {
      return IconButton(icon: const Icon(Icons.arrow_back), onPressed: onPop);
    }
    return null;
  }

  @protected
  Widget buildBaseError({required VoidCallback onPressedButton}) {
    return BaseErrorWidget(onPressedButton: onPressedButton);
  }

  void onPop() {
    Navigator.pop(context);
  }

  Future<void> logout() async {
    showLoadingIndicator();
    // await appUser.logout();
  }

  void showMessage([String? message]) {
    BotToast.showText(text: message ?? "");
  }

  void showLoadingIndicator({
    bool shouldHideContentWithLoadingIndicator = false,
  }) {
    setState(() {
      _isLoadingIndicatorVisible = true;
      _shouldHideContentWithLoadingIndicator =
          shouldHideContentWithLoadingIndicator;
    });
  }

  void hideLoadingIndicator() {
    setState(() {
      _isLoadingIndicatorVisible = false;
      _shouldHideContentWithLoadingIndicator = false;
    });
  }

  bool get isLoadingIndicatorVisible {
    return _isLoadingIndicatorVisible;
  }

  @override
  void dispose() {
    for (final e in subscriptions) {
      e.cancel();
    }
    super.dispose();
  }
}
