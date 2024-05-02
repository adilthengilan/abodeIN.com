import 'package:abodein/src/Utils/app_colors.dart';
import 'package:abodein/src/utils/style.dart';
import 'package:flutter/widgets.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:flutter/material.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final List<String> _getStartedImage = [
    "assets/images/get_started_image_1.png",
    "assets/images/get_started_image_1.png",
    "assets/images/get_started_image_1.png",
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    PageController _pageController = PageController();
    int _currentPage = 0;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          SizedBox(height: height * .02),
          Container(
            height: height / 2.2,
            width: width,
            margin: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Image(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/get_started_image_1.png"),
                );
              },
            ),
          ),
          SizedBox(height: height *0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _getStartedImage.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: _currentPage == index ? 20 : 10,
                height: 10,
                decoration: BoxDecoration(
                  shape:
                      _currentPage == index ? BoxShape.circle : BoxShape.circle,
                  color: _currentPage == index ? indicatorColorOn : indicatorColorOff,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.04),
          SizedBox(
            height: height * 0.2,
            width: width / 1.5,
            child: Text(
              "Easy Way to Book Your hotel with us!",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 75, 75, 75),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
