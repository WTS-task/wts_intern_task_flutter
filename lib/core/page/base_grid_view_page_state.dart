import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/core/page/base_infinity_scroll_page.dart';
import 'package:wts_task/core/page/base_page.dart';

/// Универсальный класс для экранов с "Сеткой" [GridView].
///
/// Для работы экрана необходимо:
/// * обеспечить [ListModel]: переопределить [createModel]
/// * обеспечить виджет для ячейки сетки: переопределить [buildGridItemImpl]
/// * опционально. Добавить обработку нажатия на ячейку сетки: переопределить [onGridItemTap]
abstract class BaseGridViewPageState<
  T extends BasePage,
  TListModel extends ListModel
>
    extends BaseInfinityScrollPageState<T, TListModel> {
  final UniqueKey gridKey = UniqueKey();

  /// Выключить, если нужно отключить сепараторы (разделители) между ячейками сетки.
  bool shouldDisplaySeparator = true;

  /// Включить, для отображения сетки в обратном порядке
  bool shouldReverseGrid = false;

  /// Выключить, если не нужно оборачивать сетку в refreshIndicator
  bool shouldWrapRefreshIndicator = true;

  /// Включить, если нужна "шапка" сетки: блок, который будет
  /// отображаться всегда сверху сетки. Переопределите [buildGridHeaderImpl].
  bool hasGridHeader = false;

  /// Включить, если нужна "нижний колонтитул" сетки: блок, который будет
  /// отображаться всегда снизу сетки. Переопределите [buildGridFooterImpl].
  bool hasGridFooter = false;

  /// Включить, если нужно зафиксировать "верхний колонтитул"
  bool hasFixedHeader = false;

  /// Включить, если нужно зафиксировать "нижний колонтитул"
  bool hasFixedFooter = false;

  /// Переопределить, чтобы задать "нижний колонтитул" сетки.
  Widget? buildGridFooterImpl(BuildContext context) => null;

  /// Переопределить, чтобы задать "фиксированнный нижний колонтитул".
  Widget? buildFixedFooterImpl(BuildContext context) => null;

  bool shrinkWrapGrid = false;

  /// Переопределить, чтобы задать "шапку" сетки.
  Widget? buildGridHeaderImpl(BuildContext context) => null;

  ScrollController? scrollController;
  @protected
  bool isPrimary = true;

  /// Переопределить, чтобы задать "фиксированную шапку".
  Widget? buildFixedHeaderImpl(BuildContext context) => null;

  @protected
  Widget? buildSliverHeader(BuildContext context) => null;

  @override
  Widget buildBodyContent(BuildContext context) {
    final slivers = <Widget>[];

    final header = buildSliverHeader(context);
    if (header != null) {
      slivers.add(SliverToBoxAdapter(child: header));
    }

    slivers.add(
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => buildListItemImpl(context, index),
            childCount: model.items.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
        ),
      ),
    );

    if (hasFixedFooter) {
      slivers.add(buildFixedFooter(context));
    }

    final gridView = CustomScrollView(slivers: slivers);

    if (model.items.isEmpty || model.isLoading) {
      return gridView;
    }
    if (!shouldWrapRefreshIndicator) {
      return gridView;
    }
    return RefreshIndicator(
      color: AppColors.updatingIndicatorColor,
      onRefresh: onGridRefresh,
      child: gridView,
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
  Widget buildGridView(BuildContext context) {
    return GridView.builder(
      key: gridKey,
      shrinkWrap: shrinkWrapGrid,
      controller: isPrimary ? null : scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      primary: isPrimary,
      reverse: shouldReverseGrid,
      itemCount: fullItemCount,
      itemBuilder: (context, index) {
        if (hasGridHeader) {
          if (index == 0) {
            return buildGridHeader(context);
          }
          --index;
        }
        if (hasGridFooter) {
          if (index == fullItemCount - (hasGridHeader ? 2 : 1)) {
            return buildGridFooter(context);
          }
        }
        return buildListItem(context, index);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Два элемента в строке
        mainAxisSpacing: 16, // Расстояние между строками
        crossAxisSpacing: 12, // Расстояние между столбцами
        childAspectRatio: 0.8, // Соотношение сторон элементов
      ),
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

  Future<void> onGridRefresh() async {
    if (!model.isLoading) {
      await reloadData(showLoading: false);
    }
  }

  @override
  int get fullItemCount {
    var itemCount = super.fullItemCount;
    if (hasGridHeader) {
      ++itemCount;
    }
    if (hasGridFooter) {
      ++itemCount;
    }
    return itemCount;
  }

  @protected
  Widget buildGridHeader(BuildContext context) {
    if (model.items.isEmpty && model.isLoading) {
      return const SizedBox.shrink();
    }
    final header = buildGridHeaderImpl(context);
    return header ?? const SizedBox.shrink();
  }

  @protected
  Widget buildGridFooter(BuildContext context) {
    if (model.items.isEmpty && model.isLoading) {
      return const SizedBox.shrink();
    }
    final footer = buildGridFooterImpl(context);
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
  bool get shouldBuildEmptyListPlaceholder => !hasGridHeader && !hasGridFooter;

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }
}
