import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double width;
  final double height;
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(255, 206, 206, 206),
        ),
      ),
      child: TextField(
        controller: controller,
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
  final TextEditingController controller;
  final String hintText;
  final double width;
  final double height;
  const AppSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.055,
      width: width * 0.72,
      margin: EdgeInsets.only(left: width * 0.06),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 205, 205, 205), // Shadow color
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: Offset(0, 1), // Bottom shadow
          ),
          BoxShadow(
            color: Color.fromARGB(255, 239, 239, 239), // Shadow color
            offset: Offset(1.5, 0), // Right shadow
          ),
          BoxShadow(
            color: Color.fromARGB(255, 205, 205, 205), // Shadow color
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, -1), // Top shadow
          ),
          BoxShadow(
            color: Color.fromARGB(255, 239, 239, 239), // Shadow color
            offset: Offset(-3, 0), // Left shadow
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: smallTextStyle,
          contentPadding: EdgeInsets.only(top: height * 0.013),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              top: height * 0.006,
              left: width * 0.04,
              right: width * 0.02,
            ),
            child: Icon(
              Icons.search,
              color: greyShadeMedium,
              size: height * 0.033,
            ),
          ),
        ),
      ),
    );
  }
}
