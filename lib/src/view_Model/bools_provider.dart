import 'package:flutter/material.dart';

class boolsProvider extends ChangeNotifier {
  bool isDarkMode = true;

  changeDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
