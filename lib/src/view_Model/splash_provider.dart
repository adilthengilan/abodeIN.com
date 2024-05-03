import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  PageController _pageController = PageController();

  final List<String> _getStartedImage = [
    "assets/images/get_started_image_1.png",
    "assets/images/get_started_image_2.png",
    "assets/images/get_started_image_3.png",
  ];
}
