import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Appcolors {
  static const Color darkRed = Color(0xffA41414);
  static const Color red = Color(0xffFF000F);
  static const Color black = Color(0xff000000);
  static const Color black2 = Color(0xff1B1B1B);
  static const Color grey = Color(0xffC6C6C6);
  static const Color green = Color(0xffA3B667);
  static const Color green2 = Color(0xff606C38);

  static const Color white = Color(0xffffffff);
}

class Images {
  static const String path = 'assets/';
  static const String thunder = path + 'thunder.png';
  static const String send = path + 'Send.png';
  static const String home = path + 'home.png';
  static const String hand = path + 'hand.png';
  static const String bolt = path + 'bolt.png';
}

class Style {
  static TextStyle textStyleinter({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Appcolors.black,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle textStyleSourceSansPro({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Appcolors.black,
  }) {
    return GoogleFonts.sourceSansPro(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
