import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/core/page/base_infinity_scroll_page.dart';
import 'package:wts_task/core/page/base_page.dart';

/// Универсальный класс для экранов в формате "Списка" [ListView].
///
/// Для работы экрана необходимо:
/// * обеспечить [ListModel]: переопределить [createModel]
/// * обеспечить виджет для ячейки списка: переопределить [buildListItemImpl]
/// * опционально. Добавить обработку нажатия на ячейку списка: переопределить [onListItemTap]
abstract class BaseListViewPageState<
  T extends BasePage,
  TListModel extends ListModel
>
    extends BaseInfinityScrollPageState<T, TListModel> {
  final UniqueKey listKey = UniqueKey();

  /// Выключить, если нужно отключить сепараторы (разделители) между ячейками списка.
  bool shouldDisplaySeparator = true;

  /// Включить, для отображения списка в обратном порядке
  bool shouldReverseList = false;

  /// Выключить, если не нужно оборачивать список в refreshIndicator
  bool shouldWrapRefreshIndicator = true;

  /// Включить, если нужна "шапка" списка: блок, который будет
  /// отображаться всегда сверху списка. Переопределите [buildListHeaderImpl].
  bool hasListHeader = false;

  /// Включить, если нужна "нижний колонтитул" списка: блок, который будет
  /// отображаться всегда снизу списка. Переопределите [buildListFooterImpl].
  bool hasListFooter = false;

  /// Включить, если нужно зафиксировать "верхний колонтитул"
  bool hasFixedHeader = false;

  /// Включить, если нужно зафиксировать "нижний колонтитул"
  bool hasFixedFooter = false;

  /// Переопределить, чтобы задать "нижний колонтитул" списка.
  Widget? buildListFooterImpl(BuildContext context) => null;

  /// Переопределить, чтобы задать "фиксированнный нижний колонтитул".
  Widget? buildFixedFooterImpl(BuildContext context) => null;

  bool shrinkWrapList = false;

  /// Переопределить, чтобы задать "шапку" списка.
  Widget? buildListHeaderImpl(BuildContext context) => null;

  ScrollController? scrollController;
  @protected
  bool isPrimary = true;

  /// Переопределить, чтобы задать "фиксированнную шапку".
  Widget? buildFixedHeaderImpl(BuildContext context) => null;

  @override
  Widget buildBodyContent(BuildContext context) {
    final listView = Column(
      children: [
        if (hasFixedHeader) buildFixedHeader(context),
        Expanded(child: buildListView(context)),
        if (hasFixedFooter) buildFixedFooter(context),
      ],
    );
    if (model.items.isEmpty || model.isLoading) {
      return listView;
    }
    if (!shouldWrapRefreshIndicator) {
      return listView;
    }
    return RefreshIndicator(
      color: AppColors.updatingIndicatorColor,
      onRefresh: onListRefresh,
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    final baseBuild = super.build(context);
    if (!isPrimary || scrollController == null) return baseBuild;

    return PrimaryScrollController(
      controller: scrollController!,
      child: baseBuild,
    );
  }

  @protected
  Widget buildListView(BuildContext context) {
    return ListView.separated(
      key: listKey,
      shrinkWrap: shrinkWrapList,
      controller: isPrimary ? null : scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      primary: isPrimary,
      reverse: shouldReverseList,
      itemCount: fullItemCount,
      itemBuilder: (context, index) {
        if (hasListHeader) {
          if (index == 0) {
            return buildListHeader(context);
          }
          --index;
        }
        if (hasListFooter) {
          if (index == fullItemCount - (hasListHeader ? 2 : 1)) {
            return buildListFooter(context);
          }
        }
        return buildListItem(context, index);
      },
      separatorBuilder: (context, index) {
        if (hasListHeader) {
          if (index == 0) {
            return buildSeparator(shouldBuild: false);
          }
          --index;
        }
        return index >= model.items.length
            ? const SizedBox()
            : buildSeparator(
                context: context,
                index: index,
                shouldBuild:
                    shouldDisplaySeparator && index < totalItemCount - 1,
              );
      },
      padding: listPadding(),
    );
  }

  @protected
  Widget buildSeparator({
    BuildContext? context,
    int? index,
    bool shouldBuild = true,
  }) {
    if (!shouldBuild) {
      return const SizedBox.shrink();
    }
    final insets = separatorInsets();
    return Divider(
      thickness: 1,
      height: insets.top + insets.bottom,
      color: shouldBuild ? AppColors.background : Colors.transparent,
      indent: insets.left,
      endIndent: insets.right,
    );
  }

  @protected
  EdgeInsets separatorInsets() => EdgeInsets.zero;

  Future<void> onListRefresh() async {
    if (!model.isLoading) {
      await reloadData(showLoading: false);
    }
  }

  @override
  int get fullItemCount {
    var itemCount = super.fullItemCount;
    if (hasListHeader) {
      ++itemCount;
    }
    if (hasListFooter) {
      ++itemCount;
    }
    return itemCount;
  }

  @protected
  Widget buildListHeader(BuildContext context) {
    if (model.items.isEmpty && model.isLoading) {
      return const SizedBox.shrink();
    }
    final header = buildListHeaderImpl(context);
    return header ?? const SizedBox.shrink();
  }

  @protected
  Widget buildListFooter(BuildContext context) {
    if (model.items.isEmpty && model.isLoading) {
      return const SizedBox.shrink();
    }
    final footer = buildListFooterImpl(context);
    return footer ?? const SizedBox.shrink();
  }

  @protected
  Widget buildFixedHeader(BuildContext context) {
    if (model.items.isEmpty && model.isLoading) {
      return const SizedBox.shrink();
    }
    final fixedHeader = buildFixedHeaderImpl(context);
    return fixedHeader ?? const SizedBox.shrink();
  }

  @protected
  Widget buildFixedFooter(BuildContext context) {
    if (model.items.isEmpty && model.isLoading) {
      return const SizedBox.shrink();
    }
    final fixedFooter = buildFixedFooterImpl(context);
    return fixedFooter ?? const SizedBox.shrink();
  }

  @override
  bool get shouldBuildEmptyListPlaceholder => !hasListHeader && !hasListFooter;

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }
}
