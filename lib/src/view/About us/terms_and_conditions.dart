import 'package:abodein/src/view/About%20us/privacy_policy.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

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
                  image: AssetImage('assets/images/termsandconditions.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Terms and conditions',
                  style: mediumTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            //---------------------------------------------------------------------------------------------------------------
            sizedBox(height * 0.03, width),
            Padding(
              padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              child: Column(
                children: [
                  Text(
                    'The Future develution company is now part of Touchtrips. We\'ve updated our Terms of Service, Data Policy, and Cookies Policy to reflect this change. While our company name has changed, we are continuing to offer the same services and features you know and love.',
                    style: smallTextStyle,
                  ),
                  sizedBox(height * 0.01, width),
                  Text('Welcome to TouchTrip!', style: mediumTextStylepurple),
                  sizedBox(height * 0.01, width),
                  Text(
                    'These Terms of Service (or "Terms") govern your use of TouchTrip, except where we expressly state that separate terms (and not these) apply, and provide information about the TouchTrip Service (the "Service"), outlined below. When you create a TouchTrip account or use TouchTrip, you agree to these terms. The Future Develution Terms of Service do not apply to this Service.',
                    style: smallTextStyle,
                  ),
                  sizedBox(height * 0.01, width),
                  Text(
                    'The TouchTrip Service',
                    style: mediumLightTextStyle,
                  ),
                  sizedBox(height * 0.01, width),
                  Text(
                    'We agree to provide you with the TouchTrip Service. The Service includes all of the TouchTrip products, features, applications, services, technologies, and software that we provide to advance TouchTrip\'s mission: To bring you closer to the people and places you love. The Service is made up of the following aspects:',
                    style: smallTextStyle,
                  ),
                  // Add more sections as needed
                ],
              ),
            ),
          ],
          //----------------------------------------------------------------------------------------------------------------------------------------------
        ),
      ),
    );
  }
}
