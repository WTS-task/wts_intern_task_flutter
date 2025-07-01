import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onCartPressed;
  final bool showBackButton;
  final bool showCartButton;

  const TopAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.onCartPressed,
    this.showBackButton = true,
    this.showCartButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.appBarText.copyWith(height: 23 / 18),
      ),
      centerTitle: true,
      leading: showBackButton
          ? Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: IconButton(
                  onPressed: onBackPressed,
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.arrow_back, size: 24),
                ),
              ),
            )
          : null,
      actions:
          showCartButton
          ? [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    onPressed: onCartPressed,
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.shopping_cart, size: 24),
                  ),
                ),
              ),
            ]
          : null,
      toolbarHeight: 72,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
