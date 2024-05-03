import 'package:abodein/src/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class Signup_Screen extends StatelessWidget {
  const Signup_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            'Signup',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 75, 75, 75),),
          )
        ],
      ),
    );
  }
}

Widget Input_Text_Field() {
  return TextField(
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
  );
}
