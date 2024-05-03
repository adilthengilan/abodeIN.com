import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  PageController _pageController = PageController();

  int _currentPage = 0;

  final List<String> _getStartedImage = [
    "assets/images/get_started_image_1.png",
    "assets/images/get_started_image_2.png",
    "assets/images/get_started_image_3.png",
  ];

  void moveToNextImage() {
    if (_currentPage < _getStartedImage.length - 1) {
      _currentPage++;
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    }
  }
}
