import 'package:flutter/material.dart';

ColorScheme darkColorScheme() {
  return  ColorScheme(
    //-----------------------
    //relevant on dark theme
    //-----------------------
    brightness: Brightness.dark,
    onSurface: Colors.white,
    surface: Colors.blueGrey.shade700, //appbar color on dark mode

    //-----------------------
    // relevant in light mode
    //-----------------------
    primary: Colors.red, //appbar color on light mode
    onPrimary: Colors.white,
    background: Colors.blue ,
    error: Colors.yellow,
    onError: Colors.yellowAccent,
    onBackground: Colors.purple,

    //-----------------------
    // relevant in light and dark mode
    //-----------------------
    secondary: Colors.blueGrey.shade400,
    onSecondary: Colors.white,

  );
}