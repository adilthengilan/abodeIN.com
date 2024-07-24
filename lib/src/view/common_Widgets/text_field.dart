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
  final TextEditingController? controller;
  final ValueChanged? onChange;
  final Widget? prefixIcon;
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.055,
      width: width * 0.72,
      margin: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          // BoxShadow(
          //   offset: Offset(2, 4),
          //   blurRadius: 3,
          //   color: Color.fromARGB(47, 80, 79, 79),
          // ),
          // BoxShadow(
          //   offset: Offset(-2, -1),
          //   blurRadius: 3,
          //   color: Color.fromARGB(255, 216, 216, 216),
          // ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: smallTextStyleblack,
          contentPadding: EdgeInsets.only(top: height * 0.02),
          prefixIcon: Padding(
              padding: EdgeInsets.only(
                top: height * 0.006,
                left: width * 0.04,
                right: width * 0.02,
              ),
              child: prefixIcon),
        ),
      ),
    );
  }
}
