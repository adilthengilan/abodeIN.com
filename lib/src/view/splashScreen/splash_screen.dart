import 'dart:async';

import 'package:abodein/src/view/bottom_navigation_controller.dart';
import 'package:abodein/src/view/splashScreen/getstarted_screen.dart';
import 'package:abodein/src/view_model/bools_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  bool _animation = false;
  late final AnimationController _controller;
  var firsttry;

  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<boolsProvider>(context).loadSwitchValue();
    final bools = Provider.of<boolsProvider>(context);
    firsttry = bools.firstentry;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 72, 94, 1),
      body: Center(
        child: _animation == true
            ? Image.asset('assets/Logo_Image_Splash.png')
            : SizedBox(
                height: 900,
                child: LottieBuilder.asset(
                  // height: height, width: width,
                  fit: BoxFit.cover,
                  'assets/animations/Wow-[remix] (1).json',
                  // controller: _controller,
                  // onLoaded: (composition) {
                  //   _controller
                  //     ..duration = composition.duration
                  //     ..forward();
                  // },
                ),
              ),
      ),
    );
  }

  Future<void> _navigateToHome() async {
    print('========================================');
    await Future.delayed(Duration(seconds: 3)); // Simulate a delay
    setState(() {
      print('=====hellosss');
      _animation = true;
    });
    await Future.delayed(Duration(seconds: 5)); // Simulate a delay
    firsttry == true
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Bottom_Navigation_Bar()),
          )
        : Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => GetStartedScreen()),
          );
  }
}
