import 'package:abodein/src/Utils/app_colors.dart';
import 'package:abodein/src/Utils/style.dart';
import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/face_authentication.dart/verifying_faceauth.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:flutter/material.dart';

class FaceAuthentication extends StatefulWidget {
  const FaceAuthentication({super.key});

  @override
  State<FaceAuthentication> createState() => _FaceAuthenticationState();
}

class _FaceAuthenticationState extends State<FaceAuthentication> {
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
            SizedBox(
              height: height * 0.255,
            ),
            Center(
              child: Image(
                image: AssetImage(
                  "assets/images/face_authentication.png",
                ),
              ),
            ),
            SizedBox(height: height * 0.10),
            Center(
              child: Text('Face Authentication', style: mediumTextStyle),
            ),
            SizedBox(height: height * 0.02),

            Text(
              "Lorem ipsum dolor sit amet,consdddd",
              style: smallTextStyle,
            ),
            sizedBox(height * 0.120, 0.0),
            //------------------------------------ Text Button --------------------------------------------------------------------
            AppTextButton(
              text: "Get Start",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VerifyingFaceAuth()));
              },
              height: height,
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}
