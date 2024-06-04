import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/common_Widgets/text_field.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    //-----------------------SignUp Page Text Field Controllers-------------------------------
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController mobileNumberController =
        TextEditingController();

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

            sizedBox(height * 0.02, 0.0),
            //---------------------------------- Use Email Button ---------------------------------------------------------------------
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
              text: "Next",
              onPressed: () {},
              height: height,
              width: width,
              color: [primarycolor],
            ),
            SizedBox(height: height * 0.034),
            Row(
              children: [
                SizedBox(width: width * 0.2),
                Text('Already have an account?', style: smallTextStyle),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text('Login', style: blueSmallTextButtons),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
