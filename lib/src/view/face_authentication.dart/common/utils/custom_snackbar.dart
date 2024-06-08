import 'package:flutter/material.dart';

class CustomSnackBar {
  static errorSnackBar(
    BuildContext context,
    String message,
  ) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.yellow,
          behavior: SnackBarBehavior.floating,
        ),
      );

  static successSnackBar(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.yellow,
        ),
      );
}
