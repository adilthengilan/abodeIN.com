import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/splash_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          listingGetStartedImages(context),
          Container(
            margin: EdgeInsets.only(top: 520, left: 10),
            child: Text(
              "Now Let's Turn This into A Life",
              style: whiteSmallTextStyle,
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 550, left: 10),
            child: Text(
              "Easy way to\nbook your hotel\nwith us!",
              style: mediumTextStyle,
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 730, right: 230),
            child: showingIndicators(),
          ),
          Consumer<SplashProvider>(
            builder: (context, value, child) {
              return Container(
                margin: EdgeInsets.fromLTRB(250, 700, 10, 20),
                height: 70,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 214, 212, 212)),
                child: Row(
                  children: [
//       widget to be dragged____________________________________
                    Draggable(
                      axis: Axis.horizontal,
                      feedback: Container(
                        // feedback > the widget that actually gets dragged
                        margin: EdgeInsets.only(left: 10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black),
                      ),
                      childWhenDragging: Container(
                        height: 45,
                        width: 45,
                        color: Colors.transparent,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0.9),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black),
                          child: Center(
                            child: Text(
                              "Go",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      onDragEnd: (details) {
                        value.moveToNextImage(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => DashBoard(),
                        //     ));
                      },
                    ),
                    sizedBox(height, width * 0.04),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: greyShadeLight,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: greyShadeMedium,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  //The List of Get Started Scrolling Images, when clicked Next Button the image is scroll it to left side
  Widget listingGetStartedImages(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Consumer<SplashProvider>(
        builder: (context, value, child) => PageView.builder(
          controller: value.pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: value.getStartedImage.length,
          itemBuilder: (context, index) {
            return Consumer<SplashProvider>(
              builder: (context, value, child) => Image(
                fit: BoxFit.fill,
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

  Widget showingIndicators() {
    return Consumer<SplashProvider>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          value.getStartedImage.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: value.currentPage == index ? 30 : 10,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 188, 188, 188),
                    offset: Offset(0, 4),
                    blurRadius: 4)
              ],
              color: value.currentPage == index ? Colors.white : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
