import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/common_Widgets/text_field.dart';
import 'package:abodein/src/view/registration/signup.dart';
import 'package:abodein/src/view/registration/verification.dart';
import 'package:abodein/src/view_model/registration.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _mobilenumbercontrollor = TextEditingController();
  String verificationId = '';
  String? _countryCode;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final reg = Provider.of<Reg>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBox(height * 0.1, width),
            SizedBox(
              height: height * 0.3,
              width: width * 0.6,
              child: LottieBuilder.asset(
                  'assets/animations/Animation - 1716138803012.json'),
            ),
            sizedBox(height * 0.05, width),

            Text('Login',
                style: GoogleFonts.poppins(
                    fontSize: height * 0.03,
                    color: Colors.blue,
                    fontWeight: FontWeight.w700)),
            //---------------------------------- Here are the Text Field -----------------------------------------
            sizedBox(height * 0.03, width),

            reg.otpfield == false
                ? Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.025,
                          left: width * 0.03,
                          right: 10,
                          bottom: 5),
                      child: IntlPhoneField(
                        style: TextStyle(color: Colors.black),
                        controller: _mobilenumbercontrollor,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'phone',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.only(top: 10)),
                        initialCountryCode:
                            'United Arab Emirates', // Default country code
                        onChanged: (phone) {
                          setState(() {
                            _countryCode = phone.countryCode;
                          });
                        },
                      ),
                    ),
                  )
                : OTPScreen(
                    MobileNumber: _mobilenumbercontrollor.text,
                    veirificatioId: verificationId),
            sizedBox(height * 0.001, 0.0),
            Padding(
              padding: EdgeInsets.only(right: width * 0.04),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      reg.otpfield == true ? [reg.editotpfield()] : [];
                    },
                    child: Text(
                      reg.otpfield == true ? '' : 'Use email',
                      style: blueSmallTextButtons,
                    ),
                  )),
            ),
            sizedBox(height * 0.02,
                width), //------------------------------------ Text Button --------------------------------------------------------------------
            AppTextButton(
              color: [Colors.black, Colors.black],
              text: reg.otpfield == true ? 'Edit Number' : 'Send Otp',
              onPressed: () async {
                // String phonenumberwithcode =
                //     '+91${mobilenumbercontrollor.text}';
                // verifyPhoneNumber(context, phonenumberwithcode);
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => OTPScreen(
                //           MobileNumber: mobilenumbercontrollor.text,
                //         )));
                var number = '${_countryCode}${_mobilenumbercontrollor.text}';

                reg.otpfield == false
                    ? [
                        reg.showotpfield(),
                        FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: number,
                          verificationCompleted: (phoneAuthCredential) {},
                          verificationFailed: (error) {
                            print(
                                '$error=====================================');
                          },
                          codeSent: (verificationId, forceResendingToken) {
                            verificationId = verificationId;
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => OTPScreen(
                            //         MobileNumber: mobilenumbercontrollor.text,
                            //         veirificatioId: verificationId,
                            //       ),
                            //     ));
                          },
                          codeAutoRetrievalTimeout: (
                            verificationId,
                          ) {
                            print('====================timout');
                          },
                        )
                      ]
                    : [reg.editotpfield()];
              },
              height: height,
              width: width,
            ),
            SizedBox(height: height * 0.034),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have An Account?",
                      textAlign: TextAlign.center, style: smallTextStyleblack),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignupScreen()));
                    },
                    child: Text('Signup', style: blueSmallTextButtons),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                signInWithGoogle(context);

                //////////////////////////////////////////////////
                ///________THIS FUNCTION IS USED FOR SIGNOUT FROM THE APP.AND NAVIGATE
                ///TO THE LOGIN PAGE./////////////////////////////////
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('assets/images/google.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget sizedBox(
  height,
  width,
) {
  return SizedBox(
    height: height,
    width: width,
  );
}
