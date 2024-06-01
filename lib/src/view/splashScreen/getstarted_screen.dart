import 'package:abodein/src/view/bottom_navigation_controller.dart';
import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/dashBoard/hotel_details_screen/hotel_details_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/splash_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

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
      body: Stack(
        children: [
          Container(
            child: VideoBackgroundPage(),
            height: height / 1,
            width: double.infinity,
          ),
          // listingGetStartedImages(context),
          //---------------------------------------Here we can see the Background image of getstarted screen ---------------------------------------------------
          //------------------------------------------------------------------------------------------------------------------------------------------------------

          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   child: Consumer<SplashProvider>(
          //     builder: (context, value, child) => PageView.builder(
          //       controller: value.pageController,
          //       itemCount: value.getStartedImage.length,
          //       itemBuilder: (context, index) {
          //         return Consumer<SplashProvider>(
          //           builder: (context, value, child) => Image(
          //             fit: BoxFit.fill,
          //             image: AssetImage(
          //               value.getStartedImage[index],
          //             ),
          //           ),
          //         );
          //       },
          //       onPageChanged: (index) {
          //         setState(() {
          //           value.currentPage = index;
          //         });
          //       },
          //     ),
          //   ),
          // ),
          //-------------------------Text in the screen ----------------------------------------
          Center(
            child: Container(
              margin: EdgeInsets.only(top: height * 0.7, left: 0),
              child: Text(
                "Let's Turn This into A Life",
                style: whiteSmallTextStyle,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 0, left: 0),
              child: Text(
                "Book Your Tickets\n  To Your FUTURE",
                style: whiteLargeTextStyle,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Positioned(
              top: height * 0.88,
              left: width * 0.1,
              right: width * 0.1,
              child: Container(
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(214, 212, 212, 0)),
                child: SlideToUnlocks(),
              ))
          // Container(
          //   margin: EdgeInsets.only(top: 730, right: 230),
          //   child: showingIndicators(),
          // ),
//********************************************************************************************************************************************* */
//**************************************************Swipable Buttton************************************************************************** */
//*********************************************************************************************************************************************** */
        ],
      ),
    );
  }

  //The List of Get Started Scrolling Images, when clicked Next Button the image is scroll it to left side
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

class VideoBackgroundPage extends StatefulWidget {
  @override
  _VideoBackgroundPageState createState() => _VideoBackgroundPageState();
}

class _VideoBackgroundPageState extends State<VideoBackgroundPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/getstart.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          // Center(
          //   child:
          //       CircularProgressIndicator(), // You can replace this with your loading indicator
          // ),
        ],
      ),
    );
  }
}

class SlideToUnlocks extends StatefulWidget {
  @override
  _SlideToUnlocksState createState() => _SlideToUnlocksState();
}

class _SlideToUnlocksState extends State<SlideToUnlocks> {
  double _position = 0.0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          _position += details.primaryDelta!;
          if (_position < 0) {
            _position = 0;
          } else if (_position > MediaQuery.of(context).size.width - 130) {
            // Adjust 100 according to the width of your unlock button
            _position = MediaQuery.of(context).size.width - 130;
          }
        });
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        if (_position >= MediaQuery.of(context).size.width - 200) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Bottom_Navigation_Bar(),
              ));
          print('Unlocked!');
        }
        setState(() {
          _position = 0.0;
        });
      },
      child: Container(
        child: Stack(
          children: [
            Row(
              children: [
                sizedBox(height, width * 0.25),
                Text(
                  "GET START",
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                sizedBox(height, width * 0.1),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16,
                  color: Colors.white,
                ),
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
            Positioned(
              left: _position,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(115, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromARGB(208, 0, 0, 0)),
                margin: EdgeInsets.all(4),
                width: 50,
                height: 50,
                child: Center(
                    child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
