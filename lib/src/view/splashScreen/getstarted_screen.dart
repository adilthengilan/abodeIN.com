import 'package:abodein/src/Utils/app_colors.dart';
import 'package:abodein/src/utils/style.dart';
import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view_Model/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final List<String> _getStartedImage = [
    "assets/images/get_started_image_1.png",
    "assets/images/get_started_image_2.png",
    "assets/images/get_started_image_3.png",
  ];
  int _currentPage = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          SizedBox(height: height * .03),
          listingGetStartedImages(height, width),
          SizedBox(height: height * 0.04),
          showingIndicators(),
          SizedBox(height: height * 0.04),
          SizedBox(
            height: height * 0.17,
            width: width / 1.5,
            child: Center(
              child: Text("Easy way to book your hotel with us!",
                  textAlign: TextAlign.center, style: largeTextStyle),
            ),
          ),
          SizedBox(height: height * 0.03),
          Container(
            height: height / 12,
            width: width,
            margin: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: Center(
              child: Column(
                children: [
                  Text("Lorem ipsum dolor sit amet,", style: smallTextStyle),
                  Text("consectetuer adipiscing elit. Aenean",
                      style: smallTextStyle),
                ],
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
          Consumer<SplashProvider>(
            builder: (context, value, child) => LargeTextButton(
              text: _currentPage == 2 ? "Get Start Now" : "Next",
              height: height,
              width: width,
              onPressed: () {
              },
            ),
          ),
        ],
      ),
    );
  }

//The List of Get Started Images
  Widget listingGetStartedImages(height, width) {
    return Container(
      height: height / 2.2,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
      child: PageView.builder(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _getStartedImage.length,
        itemBuilder: (context, index) {
          return Image(
            fit: BoxFit.contain,
            image: AssetImage(_getStartedImage[_currentPage]),
          );
        },
      ),
    );
  }

// This is an indicator that displays a list of images with 3 dots.
// The dot corresponding to the current image will be filled, while the others will remain empty.
  Widget showingIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _getStartedImage.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: _currentPage == index ? 30 : 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(blurStyle: BlurStyle.solid, color: Colors.black)
            ],
            color: _currentPage == index ? indicatorColorOn : indicatorColorOff,
          ),
        ),
      ),
    );
  }
}
