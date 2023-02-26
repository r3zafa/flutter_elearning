import 'package:flutter/material.dart';

import '../custom_colors.dart';

// add custom color to app

ColorScheme lightColorScheme() {
  return ColorScheme(
    //-----------------------
    //relevant on dark theme
    //-----------------------
    brightness: Brightness.light,
    onSurface: Colors.white,
    surface: primaryColor, //appbar color on dark mode
    //-----------------------
    // relevant in light mode
    //-----------------------
    primary: primaryColor, //appbar bkg color on light mode
    onPrimary: Colors.white, //text color
    background: Colors.blue,
    error: Colors.yellow,
    onError: Colors.yellowAccent,
    onBackground: Colors.purple,

    //-----------------------
    // relevant in light and dark mode
    //-----------------------
    secondary: secondaryColor,
    onSecondary: Colors.white,
  );
}
