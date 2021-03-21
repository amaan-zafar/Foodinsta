import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color appBarColor = Color(0xFF020202); //900
const Color buttonColor = Color(0xFF212121); //800
const Color primaryColor = Color(0xFF212121); //800

ThemeData blueTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryColor,
    primaryColorDark: appBarColor,
    backgroundColor: primaryColor,
    textTheme: _textTheme,
    // colorScheme: _colorScheme,
    buttonTheme: ButtonThemeData(
        height: 50,
        textTheme: ButtonTextTheme.primary,
        buttonColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    // dividerTheme: const DividerThemeData(
    //   thickness: 1,
    //   space: 30,
    //   color: dividerColor,
    // ),

    //dialogTheme: DialogTheme(backgroundColor: lightColor1)
  );
}

final TextTheme _textTheme = TextTheme(
  headline1: GoogleFonts.ubuntu(
      fontSize: 98, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.ubuntu(
      fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.ubuntu(fontSize: 49, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.ubuntu(
      fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.ubuntu(fontSize: 24, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.ubuntu(
      fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.ubuntu(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.ubuntu(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.sourceSansPro(
      fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.sourceSansPro(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.sourceSansPro(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.sourceSansPro(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.sourceSansPro(
      fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
