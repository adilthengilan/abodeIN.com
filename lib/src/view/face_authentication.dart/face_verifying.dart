import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class FaceVerifying extends StatelessWidget {
  const FaceVerifying({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Verifying photo.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 160, left: 30),
              child: Image(image: AssetImage("assets/images/scanning.png")),
            ),
            sizedBox(height * 0.20, width),
            Text(
              "18%",
              style: whiteSmallTextStyle,
            ),
            
          ],
        ),
      ),
    );
  }
}
