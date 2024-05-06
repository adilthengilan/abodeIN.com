import 'package:abodein/src/Utils/style.dart';
import 'package:flutter/material.dart';

class VerifyingFaceAuth extends StatefulWidget {
  const VerifyingFaceAuth({super.key});

  @override
  State<VerifyingFaceAuth> createState() => _VerifyingFaceAuthState();
}

class _VerifyingFaceAuthState extends State<VerifyingFaceAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Verifying photo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40, left: 25),
            height: 30,
            width: 45,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 100, left: 45),
            child: Text(
              "Face Authentication",
              style: whitelargeTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 140, left: 25),
            child: Text(
              "Lorem ipsum dolor sit amet",
              style: whiteLightTextStyle,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 135),
              height: 300,
              width: 300,
              child: Image(
                  image: AssetImage(
                "assets/images/scanning.png",
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 670, left: 170),
            child: Text(
              "40%",
              style: whiteSmallTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 700, left: 50),
            child: SizedBox(
              width: 300,
              child: TweenAnimationBuilder<double>(
                builder: (context, value, child) => LinearProgressIndicator(
                  color: Colors.blue,
                  value: value,
                ),
                tween: Tween(begin: 0, end: 0.5),
                duration: Duration(seconds: 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 710, left: 160),
            child: Text(
              "Verifying....",
              style: whiteSmallTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
