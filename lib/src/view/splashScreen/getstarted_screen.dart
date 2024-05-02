import 'package:abodein/src/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          SizedBox(height: height * .045),
          Align(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage("assets/images/get_started_image_1.png"),
            ),
          ),
        ],
      ),
    );
  }
}
