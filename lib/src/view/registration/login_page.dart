import 'package:abodein/src/Utils/app_colors.dart';
import 'package:abodein/src/Utils/style.dart';
import 'package:abodein/src/view/registration/verification.dart';
import 'package:abodein/src/view/splashScreen/getstarted_screen.dart';
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
          children: [
            sizedBox(height * 0.3, width),
            Text(
              'Login',
              textAlign: TextAlign.center,
              style: largeTextStyle,
            ),
            sizedBox(height * 0.06, width),
            _inputField("Mobile Number", mobilenumbercontrollor),
            _buildemaillogin(),
            sizedBox(35, width),
            LargeTextButton(
              text: "Send Otp",
              height: height * 0.08,
              width: width,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Verification()));
              },
            ),
            sizedBox(20, width),
            _extraText(),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
    String hintText,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(color: const Color.fromARGB(255, 206, 206, 206))),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: GoogleFonts.poppins(
                  color: Colors.grey, fontWeight: FontWeight.w400),
              contentPadding: EdgeInsets.only(left: 20, top: 10)),
        ),
      ),
    );
  }

  Widget _buildemaillogin() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Use Email",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

Widget _extraText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Don't Have An Account?",
        textAlign: TextAlign.center,
        style: smallTextStyle,
      ),
      Text(
        " Signup",
        style: TextStyle(color: Colors.blue, fontSize: 16),
      )
    ],
  );
}

Widget sizedBox(height, width) {
  return SizedBox(
    height: height,
    width: width,
  );
}
