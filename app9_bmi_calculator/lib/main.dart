import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/routes/routes.dart';
import 'theme/dark/dark_theme.dart';
import 'theme/light/light_theme.dart';

void main() {
  runApp(const BmiCalc());
}

class BmiCalc extends StatelessWidget {
  const BmiCalc({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calc',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: routes(),
    );
  }
}
