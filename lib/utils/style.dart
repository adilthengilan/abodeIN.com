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

final TextStyle smallTextStylewhite = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 255, 255, 255),
  ),
);

Widget smallTextStylewhitefun(Text, size) {
  return Text(Text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ));
}

final TextStyle smallTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 0, 0, 0),
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

final TextStyle whiteLargeTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),
);

final TextStyle whiteMediumTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
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
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  ),
);
