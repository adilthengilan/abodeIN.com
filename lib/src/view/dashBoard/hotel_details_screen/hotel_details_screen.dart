import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class HotelDetailePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final detailpageProvider =
    //     Provider.of<HotelDetailProvider>(context, listen: false);
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/getstartedbackgroundimage.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBar(context),
            Container(
              margin: EdgeInsets.only(bottom: height * 0.02),
              height: 360,
              width: 370,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: transparantColor),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //======================================================= Map & Map View ===========================================
                        MapViewButton(
                          height: height,
                          width: width,
                          top: height * 0.015,
                          left: width * 0.03,
                        ),
                        Spacer(),
                        //======================================================= Rating Icon & Text ===========================================
                        RatingBoxTransparant(
                          top: height * 0.10,
                          left: width * 0.10,
                          height: height,
                          width: width,
                          rating: 4.8,
                        ),
                        //================================================== 3D View Transparant Box ============================================
                        ThreeDView(
                          top: height * 0.015,
                          right: width * 0.03,
                          onTap: () {},
                          height: height,
                          width: width,
                        ),
                      ],
                    ),
                    sizedBox(height * 0.04, width),
                    PriceAndBookingPersons(
                      bottom: height * 0.038,
                      left: width * 0.500,
                      right: width * 0.04,
                      city: "Bankok",
                      location: "phuket",
                      price: 589,
                      personCount: 4,
                    ),
                    sizedBox(height * 0.04, width),
                    Container(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partu",
                        style: whiteLightTextStyle,
                      ),
                    ),
                    sizedBox(height * 0.01, width),
                    SwipeableButton(height, width),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget AppBar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(top: 50, left: 25),
          height: 50,
          width: 55,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30),
              color: backgroundColor),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: primarycolor,
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 45),
          child: Text(
            "Details",
            style: whiteMediumTextStyle,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50, right: 25),
          height: 50,
          width: 55,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30),
              color: backgroundColor),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.notifications_none_outlined,
                color: primarycolor,
              )),
        ),
      ],
    );
  }

  Widget SwipeableButton(height, width) {
    return Container(
      height: 70,
      width: 400,
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
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.black),
            ),
            childWhenDragging: Container(
              height: 60,
              width: 60,
              color: Colors.transparent,
            ),
            child: Container(
              margin: EdgeInsets.only(left: 7),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.black),
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  color: backgroundColor,
                ),
              ),
            ),
            // onDragEnd: (details) {
            //   value.moveToNextImage(context);
            //   // Navigator.push(
            //   //     context,
            //   //     MaterialPageRoute(
            //   //       builder: (context) => DashBoard(),
            //   //     ));
            // },
          ),

          sizedBox(height, width * 0.10),
          Text(
            "Book Now",
            style: blackSmallTextStyle,
          ),
          sizedBox(height, width * 0.20),

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
  }
}
