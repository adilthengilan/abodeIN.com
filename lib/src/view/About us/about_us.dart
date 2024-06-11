import 'package:abodein/src/view/About%20us/help_support.dart';
import 'package:abodein/src/view/About%20us/privacy_policy.dart';
import 'package:abodein/src/view/About%20us/terms_and_conditions.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'About us',
          style: mediumTextStyle,
        ),
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              //=================================privacypolicy=====================================
              top: height * 0.03,
              left: width * 0.05,
              right: width * 0.05,
              bottom: height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: height * 0.20,
                  padding: EdgeInsets.only(left: width * 0.20),
                  child: Image.asset('assets/images/aboutus.png')),
              sizedBox(height * 0.03, width),
              Text('Privacy Policy', style: smallTextStyle),
              //------------------------------------ list of cards privacy policy ,termsand conditions, help and support .contact etc....
              sizedBox(height * 0.01, width),
              Container(
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
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: Icon(
                    Icons.description,
                    color: Color.fromARGB(255, 7, 89, 156),
                  ),
                  title: Text('Privacy Policy'),
                  subtitle: Text('Effective Jan 2030'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrivacyPolicy()));
                  },
                ),
              ),
              //-----------------------------------------------------------------------------------------------------------------------------
              sizedBox(height * 0.03, width),
              Text('Terms and Condition', style: smallTextStyle),
              sizedBox(height * 0.01, width),
              Container(
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
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: Icon(
                    Icons.message_outlined,
                    color: Color.fromARGB(255, 13, 0, 108),
                  ),
                  title: Text('Terms and Condition'),
                  subtitle: Text('Effective Jan 2023'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TermsAndConditions()));
                  },
                ),
              ),
              //------------------------------------------------------------------------------------------------------------------------------------------------------
              sizedBox(height * 0.03, width),
              Text('Help and Support', style: smallTextStyle),
              sizedBox(height * 0.01, width),
              Container(
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
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: Icon(
                    Icons.help_center_outlined,
                    color: Colors.brown,
                  ),
                  title: Text('Help and Support'),
                  subtitle: Text('Effective Jan 2023'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HelpAndSupportScreen()));
                  },
                ),
              ),
              sizedBox(height * 0.03, width),
              //-----------------------------------------------------------------------------------------------------------------------------------------------------------
              Text('Contact us', style: smallTextStyle),
              sizedBox(height * 0.01, width),
              Container(
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
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: Icon(
                    Icons.chat_bubble_outline_outlined,
                    color: Colors.cyan,
                  ),
                  title: Text('Contact Live chat'),
                  onTap: () {
                    // Handle tap
                  },
                ),
              ),
              //---------------------------------------------------------------------------------------------------------------------------------------------------------
              sizedBox(height * 0.02, width),
              Container(
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
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.lightGreen,
                  ),
                  title: Text('Email us'),
                  onTap: () {
                    // Handle tap
                  },
                ),
              ),
              //---------------------------------------------------------------------------------------------------------------------------------------------------------
              sizedBox(height * 0.02, width),
              Container(
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
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: Icon(
                    Icons.question_answer_outlined,
                    color: Color.fromARGB(255, 74, 145, 195),
                  ),
                  title: Text('FAQs'),
                  onTap: () {
                    // Handle tap
                  },
                ),
              ),

              //-----------------------------------------------------------------------------------------------------------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}
