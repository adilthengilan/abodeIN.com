import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: width * 0.87,
        decoration: BoxDecoration(
          color: primarycolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(text, style: buttonTextStyle),
        ),
      ),
    );
  }
}
