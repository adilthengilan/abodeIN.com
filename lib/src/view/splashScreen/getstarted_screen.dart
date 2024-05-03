import 'package:abodein/src/Utils/app_colors.dart';
import 'package:abodein/src/utils/style.dart';
import 'package:abodein/src/view/registration/login.dart';
import 'package:flutter/material.dart';

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
          SizedBox(height: height * .04),
          listingGetStartedImages(height, width),
          SizedBox(height: height * 0.03),
          showingIndicators(),
          SizedBox(height: height * 0.03),
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
          LargeTextButton(
            text: _currentPage == 2 ? "Get Start Now" : "Next",
            height: height * 0.08,
            width: width,
            onPressed: () {
              moveToNextImage();
            },
          )
        ],
      ),
    );
  }

  void moveToNextImage() {
    if (_currentPage < _getStartedImage.length - 1) {
      setState(
        () {
          _currentPage++;
          _pageController.animateToPage(
            _currentPage,
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
          );
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

//
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

  Widget showingIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _getStartedImage.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
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

class LargeTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  const LargeTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height * 0.8,
        width: width,
        margin: EdgeInsets.symmetric(horizontal: width * 0.06),
        decoration: BoxDecoration(
          color: primarycolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(text, style: buttonTextStyle),
        ),
      ),
    );
  }
}

