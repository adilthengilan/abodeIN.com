
import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view_Model/login_provider.dart';
import 'package:abodein/src/view_Model/splash_provider.dart';
import 'package:abodein/src/view_Model/timer_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addreward = Provider.of<LoginProvider>(context, listen: false);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          'Rewards',
          style: mediumTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //==================================== Reward points
            sizedbox(height * 0.02, width),
            _rewardpoint(height, width, addreward),

            //==================================== Indicators

            sizedbox(height * 0.02, width),
            showingIndicators(height),
            sizedbox(height * 0.03, width),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Earn Rewards",
                  style: mediumTextStyleLight,
                ),
              ],
            ),

            //============================= Reward plans ===================================

            TicketContainer(
              onPressed: () {
                addreward.addRewardPoints(10);

                Share.share("com.example.abodein");
              },
              text: "Help us grow to get reward",
              images: "assets/images/refer and earn.jpg",
              title: "Reffer a Friend",
              color: [
                Color(0xffed6ea0), // Converted from #ed6ea0 (starting color)
                Color(0xffec8c69),
              ],
            ),
            TicketContainer(
              onPressed: () {
                addreward.addRewardPoints(10);
              },
              title: "Book a Hotel",
              text: "Get up 25% off",
              images: "assets/images/Hotel booking.png",
              color: [
                Color(0xff96deda), // Converted from #96deda (starting color)
                Color(0xff50c9c3),
              ],
            ),
            TicketContainer(
              onPressed: () {
                addreward.addRewardPoints(10);
              },
              title: "Rate your Experience",
              text: "Get up to 15% off",
              images: "assets/images/Rating.png",
              color: [
                Color(0xff89f7fe), // Converted from #89f7fe (starting color)
                Color(0xff66a6ff), // Converted from #66a6ff (ending color)
              ],
            ),
          ],
        ),
      ),
    );
  }

  //======================== Reward Point =================================
  Widget _rewardpoint(height, width, addreward) {
    return Container(
      width: width * 0.88,
      height: height * 0.40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // Rotate the gradient by -225 degrees
          transform: GradientRotation(-225.0),
          colors: [
            Color.fromARGB(255, 73, 136, 203), // #B6CEE8
            Color.fromARGB(255, 113, 189, 231), // #F578DC
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.03, left: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reward Points", style: whitelargeTextStyle),
                    Text("${addreward.rewardPoints}",
                        style: whitelargeTextStyle)
                  ],
                ),
              ),
              Image(
                image: AssetImage("assets/images/reward.png"),
                height: 90,
                width: 90,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.01, left: width * 0.05),
            child: Text(
              "Earn more points and Enjoy exclusive benefits",
              style: whiteLightTextStyle,
            ),
          ),
          //========================== claim free points
          Consumer<TimerProvider>(
            builder: (context, timerProvider, child) {
              return Container(
                margin: EdgeInsets.only(
                  top: height * 0.02,
                  right: width * 0.01,
                ),
                height: height * 0.150,
                width: width * 0.800,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: transparantLightColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.03, top: height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Free 50 Points",
                        style: whiteTextStyle,
                      ),
                      Text(
                        'Time Remaining : ${timerProvider.formatDuration(timerProvider.remainingTime)}',
                        style: whiteTextStyle,
                      ),
                      sizedbox(height * 0.020, width),
                      Container(
                        height: height * 0.05,
                        width: width * 0.20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(09),
                          color: backgroundColor,
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              addreward.addRewardPoints(50);
                            },
                            child: Text(
                              "Claim",
                              style: blueSmallTextButtons,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }

  // This is an indicator that displays a list of images with 3 dots.
  Widget showingIndicators(height) {
    return Consumer<SplashProvider>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          value.getStartedImage.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: value.currentPage == index ? 10 : 10,
            height: height * 0.01,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 188, 188, 188),
                    offset: Offset(0, 4),
                    blurRadius: 4)
              ],
              color:
                  value.currentPage == index ? backgroundColor : greyShadeLight,
            ),
          ),
        ),
      ),
    );
  }
}

//======================================================================
//========================= Ticket Container ===========================
//======================================================================

class TicketContainer extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onPressed;
  final String? images;
  final List<Color> color;

  const TicketContainer(
      {super.key,
      required this.text,
      required this.onPressed,
      this.images,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: InkWell(
        onTap: onPressed,
        child: ClipPath(
          clipper: CustomTicketShape(),
          child: Container(
            height: height * 0.170,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: color,
              ),
            ),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: width * 0.05),
                    height: height * 0.10,
                    width: width * 0.30,
                    child: Image.asset(images!)),
                sizedbox(height, width * 0.04),
                Container(
                  margin: EdgeInsets.only(top: height * 0.04),
                  width: width * 0.450,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: smallTextStyle,
                      ),
                      Text(
                        text,
                        style: whiteTextStyle,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('images', images));
  }
}

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  TICKET SHAPE
class CustomTicketShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(20)));
    path.addOval(
        Rect.fromCircle(center: Offset(0, (size.height / 2)), radius: 15));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, (size.height / 2)), radius: 15));
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
