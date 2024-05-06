import 'package:abodein/src/Utils/style.dart';
import 'package:abodein/src/view/common_Widgets/text_field.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController otp1controller = TextEditingController();
  final TextEditingController otp2controller = TextEditingController();
  final TextEditingController otp3controller = TextEditingController();
  final TextEditingController otp4controller = TextEditingController();
  @override
  void dispose() {
    email_controller.dispose();
    otp1controller.dispose();
    otp2controller.dispose();
    otp3controller.dispose();
    otp4controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ---------------------Media Query is for assign with responsive size--------------
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          sizedBox(height * 0.3, width),
          Text(
            'Enter Verification Code',
            textAlign: TextAlign.center,
            style: mediumTextStyle,
          ),
          SizedBox(height: height * 0.10),
          //---------------------------------- Here are the Text Field -----------------------------------------

          AppTextField(
            controller: email_controller,
            hintText: "E - mail",
            height: height,
            width: width,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 28.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _inputtextbox(context, otp1controller),
                _inputtextbox(context, otp2controller),
                _inputtextbox(context, otp3controller),
                _inputtextbox(context, otp4controller),
              ],
            ),
          ),
          sizedBox(height * 0.02, width),
          _extraText(),
          _buildResendcode(),
        ]),
      ),
    );
  }

  Widget _inputtextbox(BuildContext context, TextEditingController controller) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(255, 206, 206, 206),
        ),
      ),
      child: TextField(
        controller: controller,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 25),
        decoration: InputDecoration(
          counterText: " ",
          //     onChanged: (value) {
          //   if (value.length == 1) {
          //     FocusScope.of(context).nextFocus();
          //   }
          // },
          border: InputBorder.none,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.only(left: 8, top: 15),
        ),
      ),
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
          "Resend again",
          style: TextStyle(color: Colors.blue, fontSize: 16),
        ),
      ],
    );
  }
}
