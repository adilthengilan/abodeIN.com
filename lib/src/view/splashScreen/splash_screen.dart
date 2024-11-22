import 'dart:async';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:abodein/src/view/bottom_navigation_controller.dart';
import 'package:abodein/src/view/splashScreen/getstarted_screen.dart';
import 'package:abodein/src/view_model/bools_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

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
      backgroundColor: Color.fromRGBO(36, 94, 65, 1),
      body: Stack(children: [
        Center(
          child: Container(
              height: 250, width: 200, child: VideoBackgroundPageSplash()),
          // child: _animation == true
          //     ? Image.asset('assets/Logo_Image_Splash.png')
          //     : SizedBox(
          //         height: 900,
          //         child: LottieBuilder.asset(
          //           // height: height, width: width,
          //           fit: BoxFit.cover,
          //           'assets/animations/Wow-[remix] (1).json',
          //           // controller: _controller,
          //           // onLoaded: (composition) {
          //           //   _controller
          //           //     ..duration = composition.duration
          //           //     ..forward();
          //           // },
          //         ),
          //       ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: height / 1.2),
            child: SizedBox(
              height: 50,
              width: 50,
              child:
                  LoadingAnimationWidget.inkDrop(color: Colors.white, size: 20),
            ),
          ),
        )
      ]),
    );
  }

  Future<void> _navigateToHome() async {
    print('========================================');
    await Future.delayed(Duration(seconds: 5)); // Simulate a delay
    setState(() {
      print('=====hellosss');
      _animation = true;
    });
    await Future.delayed(Duration(seconds: 5)); // Simulate a delay
    firsttry == true
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const GetStartedScreen()),
          )
        : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const Bottom_Navigation_Bar()),
          );
  }
}

class VideoBackgroundPageSplash extends StatefulWidget {
  @override
  _VideoBackgroundPageSplashState createState() =>
      _VideoBackgroundPageSplashState();
}

class _VideoBackgroundPageSplashState extends State<VideoBackgroundPageSplash> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/logo_anim.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    // _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          // Center(
          //   child:
          //       CircularProgressIndicator(), // You can replace this with your loading indicator
          // ),
        ],
      ),
    );
  }
}
