import 'package:abodein/src/Utils/app_colors.dart';
import 'package:abodein/src/utils/style.dart';
import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup_Screen extends StatelessWidget {
  const Signup_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    //-----------------------SignUp Page Text Field Controllers-------------------------------
    //---------------------
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController mobileNumberController =
        TextEditingController();

    //-------------------------
//---------------------Media Query is for assign with responsive size--------------
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.135),
            Text('SignUp', style: mediumTextStyle),
            SizedBox(height: height * 0.12),
            //---------------------------------- Here are the Text Field -----------------------------------------
            AppTextField(
              controller: firstNameController,
              hintText: "First Name",
              height: height,
              width: width,
            ),
            sizedBox(height * 0.044, 0.0),
            AppTextField(
              controller: lastNameController,
              hintText: "Last Name",
              height: height,
              width: width,
            ),
            sizedBox(height * 0.044, 0.0),
            AppTextField(
              controller: mobileNumberController,
              hintText: "Mobile Number",
              height: height,
              width: width,
            ),
            sizedBox(height * 0.044, 0.0),
            //--------------------------------------------------------------------------------------------------------
            LargeTextButton(
                text: "Next", onPressed: () {}, height: height, width: width),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.2,
                ),
                Text(
                  'Already have an account ?',
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style:
                        GoogleFonts.poppins(color: Colors.blue, fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double width;
  final double height;
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
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
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.only(left: 20, top: 10),
        ),
      ),
    );
  }
}
