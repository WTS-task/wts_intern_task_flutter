import 'package:flutter/material.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: Color(0xFF8A6163),
  shadow: Color(0xFF171212),
  surface: Color(0xFFF5F5F5),
  error: Color(0xFFFF0000),
  onSecondary: Color(0xFF808080),
);

final theme = ThemeData(
  colorScheme: colorScheme,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: colorScheme.primary,
    selectedItemColor: colorScheme.shadow,
  ),
  scaffoldBackgroundColor: colorScheme.surface,
  cardTheme: CardThemeData(color: colorScheme.surface),
);
