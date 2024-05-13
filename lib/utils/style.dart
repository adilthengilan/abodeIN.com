import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

final TextStyle largeTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 75, 75, 75),
  ),
);

final TextStyle mediumTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 75, 75, 75),
  ),
);

final TextStyle mediumTextStyleSemiBold = GoogleFonts.poppins(
    textStyle: TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Color.fromARGB(255, 75, 75, 75),
));

final TextStyle mediumTextStyleLight = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 20,
    color: Color.fromARGB(255, 75, 75, 75),
    fontWeight: FontWeight.w600,
  ),
);

final TextStyle smallTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 75, 75, 75),
  ),
);

final TextStyle smallTextStyleSemiBold = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 75, 75, 75),
  ),
);

final TextStyle buttonTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 255, 255, 255)),
);

final TextStyle blueSmallTextButtons = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.blue,
  ),
);

final TextStyle whiteMediumTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  ),
);

final TextStyle whiteSmallTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  ),
);

final TextStyle whiteLightTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  ),
);

final TextStyle blackSmallTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  ),
);

final List<BoxShadow> containerBoxShadow = [
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
];
