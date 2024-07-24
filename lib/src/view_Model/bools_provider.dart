import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class boolsProvider extends ChangeNotifier {
  bool isDarkMode = false;
  bool isLogined = false;
  bool firstentry = false;
  int bottombarindex = 0;
  void toggleentry() {
    firstentry = !firstentry;
    notifyListeners();
  }

  void isLoginedset() {
    isLogined = !isLogined;
    notifyListeners();
  }

  void setBottomBarindex(index) {
    bottombarindex = index;
    notifyListeners();
  }
  // bool get isDarkMode => isDarkMode;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  File? image;
  // This is the image picker
  final _picker = ImagePicker();

  // Implementing the image picker
  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    notifyListeners();
  }

  Future<void> loadSwitchValue() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('DarkMode') ?? false;
    isLogined = prefs.getBool('Login') ?? false;
    firstentry = prefs.getBool('firstentry') ?? false;
    print('Logined Successfully');
    print(firstentry);
    notifyListeners();
  }

  Future<void> saveSwitchValue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('DarkMode', isDarkMode);
    await prefs.setBool('Login', isLogined);
    await prefs.setBool('firstentry', firstentry);
    print('saved----------------');
    notifyListeners();
  }
}
