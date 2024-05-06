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
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: greyShadeLight,),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: smallTextStyle,
          contentPadding: EdgeInsets.only(top: 15),
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 10,right: 15),
            child: Image.asset("assets/images/filter_icon.png"),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 10, left: 15, right: 5),
            child: Icon(Icons.search, color: greyShadeMedium, size: 30),
          ),
        ),
      ),
    );
  }
}
