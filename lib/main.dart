import 'package:abodein/src/view/About%20us/about_us.dart';
import 'package:abodein/src/view/About%20us/terms_and_conditions.dart';
import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/hotel_rooms/rooms_details_screen.dart';
import 'package:abodein/src/view/mybooking/my_booking_screen.dart';
import 'package:abodein/src/view/settings/settings.dart';
import 'package:abodein/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
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
          home: MyBookingScreen()),
    );
  }
}
