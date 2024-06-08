import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme(bool bool) {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}