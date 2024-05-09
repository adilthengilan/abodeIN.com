import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingScreen extends StatelessWidget {
  final String? details;
  // final int price;
  const BookingScreen({
    super.key,
    this.details = 'Lorem ipsum dolor sit amet, adipiscing elit.',
  });

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
            Container(
              margin: EdgeInsets.only(left: 50, top: 170),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: primarycolor)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Details",
                    style: mediumTextStyle,
                  ),
                  sizedBox(height * 0.008, 0.0),
                  Row(
                    children: [_bulletpoints(width)],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _bulletpoints(width) {
    return RichText(
        text: TextSpan(
            children: [
          WidgetSpan(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\u2022', // Unicode character for bullet point
                    style: TextStyle(
                      color: greyShadeLight,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                      width: 8.0), // Adjust space between bullet point and text
                  Expanded(
                    child: Text(
                      details!,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 75, 75, 75),
                          fontSize: width * 0.044,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
            text: details,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Color.fromARGB(255, 75, 75, 75),
                fontSize: width * 0.044,
              ),
            )));
  }
}
