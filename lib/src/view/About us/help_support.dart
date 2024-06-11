import 'package:abodein/src/view/About%20us/privacy_policy.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      //------------------------------------------- APPBAR------------------------------------------------------
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
      ), //-------------------------------------------------------------------------------------------------------------
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //------------------------------- help and support -----------------------------------------------------
            Container(
              margin: EdgeInsets.only(
                left: width * 0.10,
              ),
              height: height * 0.30,
              width: width * 0.80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/messageicon.jpg'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Help and Support',
                  style: mediumTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            //---------------------------------------------------------------------------------------------------------------
            sizedBox(height * 0.03, width),
            //------------------------------------------ this how it works instruction given to users --------------to navigate next page
            Container(
              height: height * 0.10,
              width: width,
              decoration: BoxDecoration(
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(-0.3, 1),
                      blurRadius: 2,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 0,
                      color: greyShadeDark
                      // color: darktheme
                      //     ? Color.fromARGB(255, 165, 223, 254)
                      //     : Color.fromARGB(255, 248, 248, 248),
                      ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.workspace_premium_outlined,
                      color: Colors.blue,
                    ),
                    Text(
                      'How it works',
                      style: mediumTextStyleroboto,
                    ),
                    sizedBox(height, width * 0.30),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: blackShadeColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            //---------------------------------------------------------------------------------------------------------------------------
            //========================================== any bug report this navigate a web=============================================
            Container(
              height: height * 0.10,
              width: width,
              decoration: BoxDecoration(
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(-0.3, 1),
                      blurRadius: 2,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 0,
                      color: greyShadeDark
                      // color: darktheme
                      //     ? Color.fromARGB(255, 165, 223, 254)
                      //     : Color.fromARGB(255, 248, 248, 248),
                      ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.bug_report,
                      color: Colors.blue,
                    ),
                    Text(
                      'Report a bug',
                      style: mediumTextStyleroboto,
                    ),
                    sizedBox(height, width * 0.30),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_outward_rounded,
                        color: blackShadeColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            //=============================================================================================================================
            //----------------------------------- frequently added questions---------------------------------------------------------------
            //=============================================================================================================================
            Padding(
              padding: EdgeInsets.only(right: width * 0.05, top: height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'FAQ',
                    style: mediumTextStyle,
                  ),
                  sizedBox(height * 0.01, width),
                  AboutPolicy(
                    title: 'How do I request an invoice?',
                    text:
                        'Go to your confirmation email or the confirmation page and click "Request an invoice." Complete the form and submit your request. If you don’t see the link, go to the Help Center for assistance.\n  Youll get your invoice after check-out. This email will come from Booking.com or a partner company',
                  ),
                  AboutPolicy(
                    title: 'I was charged incorrectly. What should I do?',
                    text:
                        'If Booking.com charged you incorrectly, visit the Help Center. We`ll likely need a copy of your bank statement showing the incorrect charges as well as your booking confirmation number and PIN.',
                  ),
                  AboutPolicy(
                      title: 'How do I confirm that I paid for my booking?',
                      text:
                          'You’ll find payment confirmation in your confirmation email. In the email, there`s also an option to download the payment confirmation as a .pdf.')
                ],
              ),
            )
          ],
          //----------------------------------------------------------------------------------------------------------------------------------------------
        ),
      ),
    );
  }
}
