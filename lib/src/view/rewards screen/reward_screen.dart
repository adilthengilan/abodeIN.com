import 'dart:async';
import 'dart:math';

import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view_Model/login_provider.dart';
import 'package:abodein/src/view_Model/splash_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  Timer? _timer;
  Duration _remainingTime = Duration(hours: 10, minutes: 45, seconds: 22);

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_remainingTime.inSeconds == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _remainingTime = Duration(seconds: _remainingTime.inSeconds - 1);
        });
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addreward = Provider.of<LoginProvider>(context, listen: false);

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
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: blackShadeColor,
                  size: 30,
                ),
              ),
            ),
            //==================================== Reward points
            sizedbox(height * 0.02, width),
            _rewardpoint(height, width, addreward),

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
                addreward.addRewardPoints(10);

                Share.share("how are you");
              },
              text: "Help us grow to get reward",
              images: "assets/images/refer and earn.jpg",
              title: "Reffer a Friend",
            ),
            TicketContainer(
              onPressed: () {
                addreward.addRewardPoints(10);
              },
              title: "Book a Hotel",
              text: "Get up 25% off",
              images: "assets/images/Hotel booking.png",
            ),
            TicketContainer(
              onPressed: () {
                addreward.addRewardPoints(10);
              },
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

  Widget _rewardpoint(height, width, addreward) {
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
                    Text("${addreward.rewardPoints}",
                        style: whitelargeTextStyle)
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
                  Text(
                    'Time Remaining : ${_formatDuration(_remainingTime)}',
                    style: whiteTextStyle,
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
        child: ClipPath(
          clipper: CustomTicketShape(),
          child: Container(
            height: 130,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 220, 204, 55),
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
              // CustomPaint(
              //   painter: SideCutsDesign(),
              //   child: SizedBox(
              //     height: MediaQuery.of(context).size.height * 0.25,
              //     width: double.infinity,
              //   ),
              // ),
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
