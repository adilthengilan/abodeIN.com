import 'package:abodein/src/view/details/hotel_details_screen.dart';
import 'package:abodein/src/view/profile/profile_screen.dart';
import 'package:abodein/src/view/services/service_screen.dart';
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
          home: ServiceScreen()),
    );
  }
}

