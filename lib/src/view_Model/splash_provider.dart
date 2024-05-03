import 'package:abodein/src/view/registration/login_page.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  PageController pageController = PageController();

  int currentPage = 0;

  final List<String> getStartedImage = [
    "assets/images/get_started_image_1.png",
    "assets/images/get_started_image_2.png",
    "assets/images/get_started_image_3.png",
  ];

  void moveToNextImage(context) {
    if (currentPage < getStartedImage.length - 1) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    } else {
      // Go to the Login Screen screen after all images
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false,
      );
    }
    notifyListeners();
  }
}
