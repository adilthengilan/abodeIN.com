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
            builder: (context, value, child) {
              return LargeTextButton(
                text: value.currentPage == 2 ? "Get Start Now" : "Next",
                height: height,
                width: width,
                onPressed: () {
                  value.moveToNextImage(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

//The List of Get Started Scrolling Images, when clicked Next Button the image is scroll it to left side
  Widget listingGetStartedImages(height, width) {
    return Container(
      height: height / 2.2,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
      child: Consumer<SplashProvider>(
        builder: (context, value, child) => PageView.builder(
          controller: value.pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: value.getStartedImage.length,
          itemBuilder: (context, index) {
            return Consumer<SplashProvider>(
              builder: (context, value, child) => Image(
                fit: BoxFit.contain,
                image: AssetImage(
                  value.getStartedImage[value.currentPage],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

// This is an indicator that displays a list of images with 3 dots.
// The dot corresponding to the current image will be filled, while the others will remain empty.
  Widget showingIndicators() {
    return Consumer<SplashProvider>(builder: (context, value, child) {
      print(value.currentPage);
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          value.getStartedImage.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: value.currentPage == index ? 30 : 10,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(blurStyle: BlurStyle.solid, color: Colors.black)
              ],
              color: value.currentPage == index
                  ? indicatorColorOn
                  : indicatorColorOff,
            ),
          ),
        ),
      );
    });
  }
}
