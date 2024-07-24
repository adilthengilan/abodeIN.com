import 'package:abodein/src/view/bottom_navigation_controller.dart';
import 'package:abodein/src/view/splashScreen/getstarted_screen.dart';
import 'package:abodein/src/view/splashScreen/splash_screen.dart';
import 'package:abodein/src/view/theme/themeData.dart';
import 'package:abodein/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
          darkTheme: darkMode,
          title: 'tuchtrip.com',
          theme: lightMode,
          debugShowCheckedModeBanner: false,
          home: GetStartedScreen()),
    );
  }
}
