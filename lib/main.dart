import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/details/hotel_details_screen.dart';
import 'package:abodein/src/view/drawer/drawer_screen.dart';
import 'package:abodein/src/view/hotel_rooms/rooms_details_screen.dart';
import 'package:abodein/src/view/rewards%20screen/reward_screen.dart';
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
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home:RewardScreen()),
    );
  }
}
