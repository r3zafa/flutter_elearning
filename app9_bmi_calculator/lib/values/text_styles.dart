import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/custom_colors.dart';

TextStyle labelTextStyle({required bool isActive}) {
  return GoogleFonts.poppins(
    fontSize: 20,
    color: isActive ? Colors.white : mutedTextColor,
    fontWeight: FontWeight.w500,
  );
}

final tsSliderLabelTextStyle = GoogleFonts.fjallaOne(
  fontSize: 48,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  letterSpacing: 3,
);

final tsResultTitle = GoogleFonts.poppins(
  fontSize: 32,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

final tsResultStatus = GoogleFonts.poppins(
  fontSize: 20,
  color: Colors.teal.shade400,
  fontWeight: FontWeight.w500,
);

final tsResultBoldValue = GoogleFonts.fjallaOne(
  fontSize: 90,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  letterSpacing: 3,
);
