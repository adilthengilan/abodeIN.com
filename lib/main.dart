import 'package:abodein/src/Utils/providers.dart';
import 'package:abodein/src/view/face_authentication.dart/face_authentication.dart';
import 'package:abodein/src/view/registration/signup.dart';
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
          home: SignupScreen()),
    );
  }
}
