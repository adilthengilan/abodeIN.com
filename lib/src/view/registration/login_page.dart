import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/common_Widgets/text_field.dart';
import 'package:abodein/src/view/registration/signup.dart';
import 'package:abodein/src/view/registration/verification.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobilenumbercontrollor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.255),
            Text('Login',
                style: GoogleFonts.poppins(
                    color: Colors.blue, fontWeight: FontWeight.w500)),
            SizedBox(height: height * 0.12),
            //---------------------------------- Here are the Text Field -----------------------------------------

            AppTextField(
              controller: mobilenumbercontrollor,
              hintText: "Mobile Number",
              height: height,
              width: width,
            ),
            sizedBox(height * 0.02, 0.0),
            Padding(
              padding: EdgeInsets.only(right: width * 0.04),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Use Email",
                    style: blueSmallTextButtons,
                  ),
                ),
              ),
            ),
            sizedBox(height * 0.039, 0.0),
            //------------------------------------ Text Button --------------------------------------------------------------------
            AppTextButton(
              text: "Send Otp",
              onPressed: () async {
                // String phonenumberwithcode =
                //     '+91${mobilenumbercontrollor.text}';
                // verifyPhoneNumber(context, phonenumberwithcode);
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => OTPScreen(
                //           MobileNumber: mobilenumbercontrollor.text,
                //         )));

                FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: mobilenumbercontrollor.text,
                  verificationCompleted: (phoneAuthCredential) {},
                  verificationFailed: (error) {
                    print('$error=====================================');
                  },
                  codeSent: (verificationId, forceResendingToken) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(
                            MobileNumber: mobilenumbercontrollor.text,
                            veirificatioId: verificationId,
                          ),
                        ));
                  },
                  codeAutoRetrievalTimeout: (
                    verificationId,
                  ) {
                    print('====================timout');
                  },
                );
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
                      textAlign: TextAlign.center, style: smallTextStylewhite),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignupScreen()));
                    },
                    child: Text('Signup', style: blueSmallTextButtons),
                  )
                ],
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
