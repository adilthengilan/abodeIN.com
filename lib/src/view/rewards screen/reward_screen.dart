import 'dart:math';
import 'dart:ui';

import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view/details/hotel_details_screen.dart';
import 'package:abodein/src/view_Model/splash_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  // final String referralCode = "ABC123";

  // void _shareReferralCode(BuildContext context) {
  //   final RenderBox box = context.findRenderObject() as RenderBox;
  //   Share.share(
  //     "Use my referral code $referralCode to sign up!",
  //     subject: "Join us and use my referral code!",
  //     sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //============================= Arrow Back
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20),
              child: AppIcon(
                iconData: Icons.arrow_back,
                color: blackShadeColor,
                height: 30,
              ),
            ),
            //==================================== Reward points
            sizedbox(height * 0.02, width),
            _rewardpoint(height, width),

            //==================================== Indicators

            sizedbox(height * 0.02, width),
            showingIndicators(),
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
                
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => HotelDetailePage()));
                // _shareReferralCode(context);
                // Text('Share Referral Code');
              },
              text: "Help us grow to get reward",
              images: "assets/images/refer and earn.jpg",
              title: "Reffer a Friend",
            ),
            TicketContainer(
              onPressed: () {},
              title: "Book a Hotel",
              text: "Get up 25% off",
              images: "assets/images/Hotel booking.png",
            ),
            TicketContainer(
              onPressed: () {},
              title: "Rate your Experience",
              text: "Get up to 15% off",
              images: "assets/images/Rating.png",
            ),
          ],
        ),
      ),
    );
  }

  //======================== Reward Point =================================

  Widget _rewardpoint(height, width) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: width * 0.88,
      height: height * 0.42,
      decoration: BoxDecoration(
        gradient: RadialGradient(
            colors: [greyShadeLight, pinkColor, primarycolor],
            transform: GradientRotation(pi / 2)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reward Points", style: whitelargeTextStyle),
                    Text("850", style: whitelargeTextStyle)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Image(
                  image: AssetImage("assets/images/reward.png"),
                  height: 90,
                  width: 90,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Earn more points and Enjoy exclusive benefits",
              style: greyLightTextStyle,
            ),
          ),
          //========================== claim free points
          Container(
            margin: EdgeInsets.only(
              top: 10,
              right: 10,
            ),
            height: 100,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: transparantLightColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Free 50 Points",
                    style: whiteTextStyle,
                  ),
                  Row(
                    children: [
                      Text(
                        "Time Remaining :",
                        style: whiteTextStyle,
                      ),
                      Text(
                        "10:45:22",
                        style: whiteTextStyle,
                      )
                    ],
                  ),
                  sizedbox(height * 0.005, width),
                  Container(
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(09),
                      color: backgroundColor,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HotelDetailePage()));
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
          ),
        ],
      ),
    );
  }

  // This is an indicator that displays a list of images with 3 dots.

  Widget showingIndicators() {
    return Consumer<SplashProvider>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          value.getStartedImage.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: value.currentPage == index ? 10 : 10,
            height: 10,
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

  const TicketContainer(
      {super.key,
      required this.text,
      required this.onPressed,
      this.images,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: onPressed,
        child: 
        ClipPath(
          clipper: DolDurmaClipper(right: 40, holeRadius: 20),
          child: Container(
            height: 130,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(211, 238, 213, 54),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(3, 3),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Stack(children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 35),
                      height: 150,
                      width: 100,
                      child: Image.asset(images!)),
                  sizedbox(height, width * 0.04),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: blacksmallTextStyle,
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
              CustomPaint(
                painter: SideCutsDesign(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                ),
              ),
            ]),
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
class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper({required this.right, required this.holeRadius});

  final double right;
  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - right - holeRadius, 0.0)
      ..arcToPoint(
        Offset(size.width - right, 0),
        clockwise: false,
        radius: Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right, size.height)
      ..arcToPoint(
        Offset(size.width - right - holeRadius, size.height),
        clockwise: false,
        radius: Radius.circular(1),
      );

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}


//====================================================  Ticket Clipper ================================================

class SideCutsDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    var shadowRadius = 20.0;
    var arcRadius = 20.0;

    // // Paint the left shadow arc
    // canvas.drawArc(
    //   Rect.fromCircle(center: Offset(0, h / 2), radius: shadowRadius),
    //   0,
    //   2 * pi,
    //   false,
    //   Paint()
    //     ..style = PaintingStyle.fill
    //     ..color = Colors.black.withOpacity(0.1),
    // );

    // // Paint the right shadow arc
    // canvas.drawArc(
    //   Rect.fromCircle(center: Offset(w, h / 2), radius: shadowRadius),
    //   0,
    //   2 * pi,
    //   false,
    //   Paint()
    //     ..style = PaintingStyle.stroke
    //     ..color = Colors.black.withOpacity(0.1),
    // );

    // Paint the left arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(0, h / 2), radius: arcRadius),
      0,
      2 * pi,
      false,
      Paint()
        ..style = PaintingStyle.fill
        ..color = backgroundColor, // Replace with your background color
    );

    // Paint the right arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(w, h / 2), radius: arcRadius),
      0,
      2 * pi,
      false,
      Paint()
        ..style = PaintingStyle.fill
        ..color = backgroundColor, // Replace with your background color
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
