import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static const double bottomPadding = 64.0;
  static const whiteBgScreenColor = Color(0xFFF5F9FF);
  static const whiteBgCardColor = Color(0xFFFEFEFE);
  static const bgColorBeginGradient = Color(0xFFFCB100);
  static const bgColorEndGradient = Color(0xFFFDBF2D);
  static const buttonColor1 = Color(0xFF2D9CDB);
  static const iconColor = Color(0xFFFCBC23);
  static const textFieldColor = Color(0xFFEEF5FF);
  static const buttonColor2 = Color(0xFF2D9CDB);
  static const customApprovedButtonColor = Color(0xFF34FF01);
  static const customRejectedButtonColor = Color(0xFF2D9CDB);
  static const customCompletedButtonColor = Color(0xFF979797);
  static const selectedTabBgColor = Color(0xFFE5E5E5);
  static const customRequestButtonColor = Color(0xFFF54580);
  static const bgLinearGradient = LinearGradient(
    colors: [bgColorBeginGradient, bgColorEndGradient],
    begin: const FractionalOffset(0.0, -1.0),
    end: const FractionalOffset(0.0, 1.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );

  static ThemeData themeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonColor: iconColor,
      textTheme: _textTheme,
    );
  }

  static TextTheme _textTheme = TextTheme(
    //App Title
    headline1: GoogleFonts.nunito(
        fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: 0.37),
    // Form Headings
    headline2: GoogleFonts.nunito(
        fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 0.37),
    headline3: GoogleFonts.nunito(fontSize: 51, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.nunito(
        fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.25),

    headline5: GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.w800),
    headline6: GoogleFonts.nunito(
        fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 0.37),
    subtitle1: GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.37), // Form Desc
    subtitle2: GoogleFonts.nunito(
        fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: -0.17),
    bodyText1: GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15), // Text Field
    bodyText2: GoogleFonts.nunito(
        fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.15), // T&C
    button: GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.37), // Buttons
    // Post Caption
    caption: GoogleFonts.nunito(
        fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: -0.17),
    overline: GoogleFonts.nunito(
        fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );
}
