import 'package:flutter/material.dart';
import 'package:shop1/app/router.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: AppRouter.getCurrentIndex(context),
        onTap: (index) => AppRouter.onTabTapped(index, context),
        iconSize: 35,
        selectedItemColor: theme.primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Каталог'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }
}
