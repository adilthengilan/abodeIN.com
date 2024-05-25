import 'dart:async';

import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view_Model/registration.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController mobilenumbercontrollor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBox(height * 0.3, width),
            const Text(
              'Login',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            sizedBox(height * 0.06, width),
            _inputField("Mobile Number", mobilenumbercontrollor),
            _buildemaillogin(),
            _loginButton(loginProvider),
            _extraText(),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
    String hintText,
    TextEditingController controller,
  ) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.grey));

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextField(
        style: const TextStyle(color: Colors.grey),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }

  Widget _buildemaillogin() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Use Email",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _loginButton(LoginProvider loginProvider) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: ElevatedButton(
        onPressed: () async {
          // Simulate a login process and save the login state
          await loginProvider.saveLoginState(true);
        },
        child: const SizedBox(
          width: double.infinity,
          child: Text(
            'Send Otp',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: primarycolor,
            padding: const EdgeInsets.symmetric(vertical: 16)),
      ),
    );
  }
}

Widget _extraText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don't Have An Account?",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      const Text(
        " Signup",
        style: TextStyle(color: Colors.blue, fontSize: 16),
      )
    ],
  );
}

Widget sizedBox(height, width) {
  return SizedBox(
    height: height,
    width: width,
  );
}
