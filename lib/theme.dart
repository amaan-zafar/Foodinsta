import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static double bottomPadding = 64.0;
  static Color black = Color(0xFF050505);
  static Color black1 = Color(0xFF151515);
  static Color black2 = Color(0xFF252525);
  static Color white = Color(0xFFE9E9E9);
  static Color white2 = Color(0xFFC9C9C9);
  static Color white3 = Color(0xFFB9B9B9);
  static Color bgColorBeginGradient = Color(0xFFFCB100);
  static Color bgColorEndGradient = Color(0xFFFDBF2D);
  static Color buttonColor1 = Color(0xFF2D9CDB);
  static Color iconColor = Color(0xFFFCBC23);
  static Color textFieldColor = Color(0xFFEEF5FF);
  static Color buttonColor2 = Color(0xFF2D9CDB);
  static Color customApprovedButtonColor = Color(0xFF34FF01);
  static Color customDeclineButtonColor = Color(0xFFEF5C56);
  static Color customRejectedButtonColor = Color(0xFF2D9CDB);
  static Color customCompletedButtonColor = Color(0xFF979797);
  static Color customRequestButtonColor = Color(0xFFF54580);
  static Color tileColorLight = Color(0xFFF4F8FE);

  static LinearGradient bgLinearGradient = LinearGradient(
    colors: [bgColorBeginGradient, bgColorEndGradient],
    begin: const FractionalOffset(0.0, -1.0),
    end: const FractionalOffset(0.0, 1.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );

  static ThemeData themeData({bool isDarkTheme = true, BuildContext context}) {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.amber,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      backgroundColor: isDarkTheme ? Color(0xFF050505) : Color(0xFFF5F9FF),
      indicatorColor: Color(0xFFFCBC23),
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Color(0xFFFEFEFE),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonColor: isDarkTheme ? Color(0xFF252525) : Colors.white,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light(),
          buttonColor: isDarkTheme ? Color(0xFF252525) : Colors.white),
      bottomAppBarColor: isDarkTheme ? Color(0xFF151515) : Color(0xFFFEFEFE),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
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
