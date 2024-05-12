import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookingScreen extends StatelessWidget {
  // final int price;
  BookingScreen({
    super.key,
  });
  // TextEditingController datecontroller = TextEditingController();
  // DateTime selectDate = DateTime.now();

//  void initstate() {
//     datecontroller.text = DateFormat('dd/MM/yy').format(DateTime.now());
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBox(height * 0.03, width),
            //<<<<<<<<<<<<<<<<<<<<<<<<AppBar>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ],
            ),
            sizedBox(height * 0.02, width),
            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Booking Confirmation message<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 170,
              width: 365,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // border: Border.all(color: greyShadeLight),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-2, -2),
                    color: greyShadeLightboxshadow,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Congratulations!",
                      style: mediumTextStyle,
                    ),
                    sizedBox(height * 0.008, 0.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        sizedBox(0.0, 5.0),
                        Text("Your tickets are successfully booked",
                            style: smallTextStyle),
                      ],
                    ),
                    sizedBox(height * 0.008, 0.0),

                    // ------------------------ It Shows Rating of Hotel And Price -----------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Booking ID",
                          style: smallTextStyleSemiBold,
                        ),
                        Text("#459AXD", style: smallTextStyle),
                      ],
                    ),
                    sizedBox(height * 0.008, 0.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Booking On",
                          style: smallTextStyleSemiBold,
                        ),
                        Text("10/05/2024", style: smallTextStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            sizedBox(height * 0.03, width),

//++++=====================Departure and Arrival ===================================================
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 180,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Booking Details",
                          style: smallTextStyleSemiBold,
                        ),
                        Text(
                          "Change",
                          style: blueSmallTextButtons,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            sizedBox(height * 0.03, width * 0.01),
                            Text(
                              "Arrival",
                              style: smallTextStyle,
                            ),
                            sizedBox(height * 0.01, width * 0.02),
                            Text(
                              "Mon,01,2024",
                              style: smallTextStyleSemiBold,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            sizedBox(height * 0.03, width * 0.01),
                            Text(
                              "Departure",
                              style: smallTextStyle,
                            ),
                            sizedBox(height * 0.01, width * 0.02),
                            Text(
                              "Tue,02,2024",
                              style: smallTextStyleSemiBold,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<______________Price Details___________________________________>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 190,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: greyShadeLight)
                  // boxShadow: [
                  //   BoxShadow(
                  //       offset: Offset(2, 2),
                  //       color: greyShadeLight,
                  //       blurRadius: 15),
                  //   BoxShadow(
                  //       offset: Offset(-2, -2),
                  //       color: backgroundColor,
                  //       spreadRadius: 1,
                  //       blurRadius: 10)
                  // ],
                  ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Details",
                      style: mediumTextStyle,
                    ),
                    sizedBox(height * 0.02, width),

                    Row(
                      children: [
                        Text(
                          "4000 × 8 persons ",
                          style: smallTextStyle,
                        ),
                        sizedBox(0.0, 70.0),
                        Text(
                          "#36,000 THB",
                          style: smallTextStyle,
                        )
                      ],
                    ),
                    sizedBox(height * 0.01, width),
                    Row(
                      children: [
                        Text(
                          "Tax",
                          style: smallTextStyle,
                        ),
                        sizedBox(0.0, 230.0),
                        Text(
                          "50 THB",
                          style: smallTextStyle,
                        ),
                      ],
                    ),
                    Divider(),
//___________________________________ToTal Price_____________
                    Row(
                      children: [
                        Text(
                          "Total",
                          style: mediumTextStyleSemiBold,
                        ),
                        sizedBox(0.0, 160.0),
                        Text(
                          "36,050 THB",
                          style: smallTextStyle,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            sizedBox(height * 0.03, width),

            AppTextButton(
                text: "Pay Now", onPressed: () {}, height: height, width: width)
          ],
        ),
      ),
    );
  }
}
