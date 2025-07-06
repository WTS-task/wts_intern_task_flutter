import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.titleText, this.onBack});

  final String titleText;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      pinned: true,
      leading: onBack != null
          ? IconButton(onPressed: onBack, icon: Icon(Icons.arrow_back))
          : null,
      title: Text(titleText),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))],
      backgroundColor: theme.colorScheme.surface,
    );
  }
}
