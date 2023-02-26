import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme lightTextTheme() {
  return TextTheme(
    bodyLarge: GoogleFonts.poppins(
      fontSize: 32.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  );
}
