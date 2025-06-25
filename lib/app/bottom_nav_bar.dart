import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wts_task/core/constants/app_colors.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const AppBottomNavBar({super.key, required this.currentIndex});

  static const _routes = ['/catalog', '/cart', '/profile'];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: AppColors.primaryText,
      unselectedItemColor: AppColors.secondaryText,
      currentIndex: currentIndex,
      onTap: (index) {
        if (index != currentIndex) {
          context.go(_routes[index]);
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Каталог'),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Корзина',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
      ],
    );
  }
}
