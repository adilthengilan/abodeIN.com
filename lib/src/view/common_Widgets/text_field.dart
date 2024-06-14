import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged? onchanged;
  final double width;
  final double height;
  const AppTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.width,
    required this.height,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.065,
      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color.fromARGB(255, 206, 206, 206),
        ),
      ),
      child: TextField(
        controller: controller,
        onChanged: onchanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.only(left: 20, top: 10),
        ),
      ),
    );
  }
}

class AppSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged? onChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final double width;
  final double height;
  const AppSearchBar({
    super.key,
    this.controller,
    required this.hintText,
    required this.width,
    required this.height,
    this.onChange,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.065,
      width: width ,
      margin: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 4),
            blurRadius: 3,
            color: Color.fromARGB(47, 80, 79, 79),
          ),
          BoxShadow(
            offset: Offset(-2, -1),
            blurRadius: 3,
            color: Color.fromARGB(255, 216, 216, 216),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: smallTextStyle,
          contentPadding: EdgeInsets.all(height * 0.015),
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              top: height * 0.006,
              left: width * 0.04,
              right: width * 0.02,
            ),
            child: prefixIcon
          ),
        ),
      ),
    );
  }
}
