import 'package:abodein/src/Utils/app_colors.dart';
import 'package:abodein/src/Utils/style.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view/registration/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController email_controller = TextEditingController();

    //---------------------Media Query is for assign with responsive size--------------
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
            child: Column(children: [
          sizedBox(height * 0.3, width),
          Text(
            'Enter Verification Code',
            textAlign: TextAlign.center,
            style: largeTextStyle,
          ),
          sizedBox(height * 0.06, width),
          Input_Text_Field(email_controller, 'Email'),
          sizedBox(height * 0.10, width),
          _extraText(),
          _buildResendcode()
        ])));
  }
}

Widget _Verficationcode(
  TextEditingController controller,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color.fromARGB(255, 206, 206, 206),
          ),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              // hintText: hinttext,
              hintStyle: GoogleFonts.poppins(
                  color: Colors.grey, fontWeight: FontWeight.w400),
              contentPadding: EdgeInsets.only(left: 20, top: 10)),
        ),
      )
    ],
  );
}

Widget _extraText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Didn't Recieve Verification Code ?",
        textAlign: TextAlign.center,
        style: smallTextStyle,
      ),
    ],
  );
}

Widget _buildResendcode() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Resend Again",
        style: TextStyle(color: Colors.blue, fontSize: 16),
      ),
    ],
  );
}
