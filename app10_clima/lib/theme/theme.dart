import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: ColorScheme(
//-----------------------
      //relevant on dark theme
      //-----------------------
      brightness: Brightness.light,
      onSurface: Colors.white,
      surface: Colors.blueGrey.shade900, //appbar color on dark mode
      //-----------------------
      // relevant in light mode
      //-----------------------
      primary: Colors.blueGrey.shade900, //appbar bkg color on light mode
      onPrimary: Colors.white, //text color
      background: Colors.yellow,
      error: Colors.yellow,
      onError: Colors.yellow,
      onBackground: Colors.yellow,

      //-----------------------
      // relevant in light and dark mode
      //-----------------------
      secondary: Colors.red.shade900,
      onSecondary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
