import 'package:flutter/material.dart';

import '../app_bar_theme.dart';
import '../custom_colors.dart';
import 'light_color_scheme.dart';
import 'light_text_theme.dart';

ThemeData lightTheme() {
  return ThemeData(
    colorScheme: lightColorScheme(),
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: bkgColor,
    textTheme: lightTextTheme(),
  );
}
