import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  PageController pageController = PageController();
  int currentPage = 0;
  SplashProvider() {
    notifyListeners();
  }
  // get started Screen Images
  final List<String> getStartedImage = [
    "assets/images/ashim-d-silva-CwJb7ly-iqc-unsplash.jpg",
    "assets/images/getstart_image.jpg",
    "assets/images/christian-lambert-vmIWr0NnpCQ-unsplash.jpg",
  ];
// This function for Moving to Next Image, if
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
          builder: (context) => DashBoard(),
        ),
        (route) => false,
      );
    }

    notifyListeners();
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
