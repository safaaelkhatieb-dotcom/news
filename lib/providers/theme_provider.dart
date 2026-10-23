import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  bool get isDark => appTheme == ThemeMode.dark;

  void toggleTheme() {
    appTheme = isDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) return;
    appTheme = newTheme;
    notifyListeners();
  }
}

