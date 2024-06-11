import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
      ),
      //-------------------------------------------------------------------------------------------------------------
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //------------------------------- PRIVACY POLICY ,IMAGE -----------------------------------------------------
            Container(
              margin: EdgeInsets.only(
                left: width * 0.10,
              ),
              height: height * 0.36,
              width: width * 0.80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/about.jpg'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.26),
              child: Text(
                'Privacy Policy',
                style: mediumTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            //------------------------------------------------------------------------------------------------------------------
            sizedBox(height * 0.02, width),
            //------------------------------------------ SHORT POLICY MESSAGE FOR USERS ---------------------------------------
            policyList(height, width),
            //===================================================================================================================
            //=============================pRIVACY AND POLICY REPORTS ===========================================================
            AboutPolicy(
              title: 'About Policy',
              text:
                  'This Privacy Policy covers the information we collect about you when you use our products or services, or otherwise interact with us (for example, by attending our premises or events or by communicating with us), unless a different policy is displayed. For information about how we process applicant and former employee data, please see the Atlassian Careers Privacy Notice or the Former Workplace Privacy Notice. For information about how we process information submitted in a voluntary demographic survey during the application process, see our Demographic Survey Privacy Notice. Atlassian, we and us refers to Atlassian Pty Ltd, Atlassian US, Inc. and any of our corporate affiliates. We offer a wide range of products, including our cloud, server and data center products.  We refer to all of these products, together with our other services and websitesasServices in this policy',
            ),
            AboutPolicy(
              title: 'What information do we collect about you',
              text:
                  'This Privacy Policy covers the information we collect about you when you use our products or services, or otherwise interact with us (for example, by attending our premises or events or by communicating with us), unless a different policy is displayed. For information about how we process applicant and former employee data, please see the Atlassian Careers Privacy Notice or the Former Workplace Privacy Notice. For information about how we process information submitted in a voluntary demographic survey during the application process, see our Demographic Survey Privacy Notice. Atlassian, we and us refers to Atlassian Pty Ltd, Atlassian US, Inc. and any of our corporate affiliates. We offer a wide range of products, including our cloud, server and data center products.  We refer to all of these products, together with our other services and websitesasServices in this policy',
            ),
            AboutPolicy(
              title: 'Questions or complaints',
              text:
                  'If you have questions or concerns about our processing of your personal data you are welcome to contact us via our data protection officer via dataprotectionoffice@booking.com. If you want to exercise any of the rights you have under this Privacy Statement, please contact our data protection officer via dataprotectionoffice@abodien.com.  All questions and complaints reported to Booking.com will be investigated. Booking.com will attempt to resolve complaints and questions in line with internal policies. You may also contact your local data protection authority with questions and complaints.',
            ),
            AboutPolicy(
              title: 'Changes to the privacy System',
              text:
                  'This Privacy Statement may change from time to time. If you want to see changes made to this Privacy Statement from time to time, we invite you to access this Privacy Statement to see the changes. If we make material changes or changes that will have an impact on you (e.g. when we start processing your personal data for other purposes than set out above), we will contact you prior to commencing that processing.',
            ),
          ],
        ),
      ),
    );
  }

//===========================HERE SHORT MESSAGES FOR USERS ==================
//USING LISTVIEWBUILDER
  Widget policyList(height, width) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          String image = '';
          String title = '';
          String text = '';
          VoidCallback onPressed = () {};
          switch (index) {
            case 0:
              title = 'No Surprises!';
              text =
                  "We are only collect information about you when you provide it to us, when you use our Services, and when other sources provide it to us";

            case 1:
              title = 'Keeping your information Safe';

              text =
                  ' we focus on keeping your information secure, treating it responsibly, and keeping you in control.';
            case 2:
              title = 'You are always in control';
              text =
                  'Update your profile and communication preferences at any time your information secure, treating it responsibly,';

            default:
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height * 0.200,
                  width: width * 0.900,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(-0.3, 1),
                            blurRadius: 2,
                            blurStyle: BlurStyle.normal,
                            spreadRadius: 0,
                            color: Colors.deepPurpleAccent
                            // color: darktheme
                            //     ? Color.fromARGB(255, 165, 223, 254)
                            //     : Color.fromARGB(255, 248, 248, 248),
                            ),
                      ],
                      color: backgroundColor),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.02, left: width * 0.05),
                            child: Row(
                              children: [
                                Text(
                                  title,
                                  style: mediumTextStyleblue,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: width * 0.05),
                              width: width * 0.750,
                              child: Text(
                                text,
                                style: smallboldTextStyleroboto,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}

// HERE PRIVACY POLICY ,LEGAL SIDE ,SECURITY OF USERS ETC.. HERE HAVE A HEADER AND WHEN IT TAPS EXPAND THE CONCEPT IN THAT CONTAINER
class AboutPolicy extends StatelessWidget {
  final String title;
  final String text;

  const AboutPolicy({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.05, top: height * 0.01, bottom: height * 0.02),
      child: Container(
        width: width * 0.900,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
            color: backgroundColor),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: backgroundColor),
          child: ExpansionTile(
            childrenPadding: EdgeInsets.all(10),
            title: Text(
              title,
              style: mediumTextStyleroboto,
            ),
            children: [
              Text(
                text,
                style: smallboldTextStyleroboto,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//************************************************************************************************************************************************************************** */
