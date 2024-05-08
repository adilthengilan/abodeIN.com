import 'package:abodein/src/view/common_Widgets/text_field.dart';
import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_model/registration.dart';
import 'package:abodein/utils/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatefulWidget {
  final String MobileNumber;
  final String veirificatioId;
  const OTPScreen(
      {super.key, required this.MobileNumber, required this.veirificatioId});

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

          // AppTextField(
          //   controller: email_controller,
          //   hintText: "E - mail",
          //   height: height,
          //   width: width,
          // ),
          // Padding(
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: 20.0, vertical: 28.0),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.max,
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       _inputtextbox(context, otp1controller),
          //       _inputtextbox(context, otp2controller),
          //       _inputtextbox(context, otp3controller),
          //       _inputtextbox(context, otp4controller),
          //     ],
          //   ),
          // ),
          OTPTextField(
              length: 6,
              onCompleted: (value) {
                otpverification(value);
              }),
          sizedBox(height * 0.02, width),
          _extraText(),
          _buildResendcode(),
        ]),
      ),
    );
  }

// --------------------Enter the function here when otp is submitted.-------------------------
  void otpverification(String otp) async {
    final cred = PhoneAuthProvider.credential(
        verificationId: widget.veirificatioId, smsCode: otp);
    await FirebaseAuth.instance.signInWithCredential(cred);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoard(),
        ));
    // Perform OTP verification here
    print('Entered OTP:============================ $otp');
  }

  Widget _inputtextbox(BuildContext context, TextEditingController controller) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Color.fromARGB(198, 163, 213, 255),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(255, 206, 206, 206),
        ),
      ),
      child: Center(
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

class OTPTextField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;

  OTPTextField({required this.length, this.onCompleted});

  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
    _controllers =
        List.generate(widget.length, (index) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (index) => Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 226, 242, 255),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey)),
          width: 40,
          height: 40,
          child: Center(
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              onChanged: (value) {
                if (value.length == 1 && index < widget.length - 1) {
                  _focusNodes[index].unfocus();
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else if (value.isEmpty && index > 0) {
                  _focusNodes[index].unfocus();
                  FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                }

                // Combine all OTP digits and pass it to the parent widget
                String otp =
                    _controllers.map((controller) => controller.text).join();
                if (otp.length == widget.length) {
                  widget.onCompleted?.call(otp);
                }
              },
              decoration: InputDecoration(
                  counterText: '',
                  border: UnderlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
        ),
      ),
    );
  }
}
