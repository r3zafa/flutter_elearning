import 'package:app11_bitcoin_ticker/views/home_screen.dart';
import 'package:app11_bitcoin_ticker/views/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes() {
  return {
    '/root': (context) => const SplashScreen(),
    '/home': (context) => const HomeScreen(),
  };
}
