import 'package:abodein/src/Utils/providers.dart';
import 'package:abodein/src/view/Booking/booking_screen.dart';
import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/dashBoard/navbar.dart';
import 'package:abodein/src/view/face_authentication.dart/face_authentication_screen.dart';
import 'package:abodein/src/view/face_authentication.dart/verifying_faceauth.dart';
import 'package:abodein/src/view/registration/signup.dart';
import 'package:abodein/src/view/splashScreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: BookingScreen()),
    );
  }
}
