import 'package:app12/screens/home_builder.dart';
import 'package:app12/screens/login_builder.dart';
import 'package:app12/screens/register_builder.dart';
import 'package:app12/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes() {
  return {
    WelcomeScreen.route: (context) => WelcomeScreen(),
    LoginBuilder.route: (context) => const LoginBuilder(),
    RegisterBuilder.route: (context) => const RegisterBuilder(),
    HomeBuilder.route: (context) => const HomeBuilder(),
  };
}
