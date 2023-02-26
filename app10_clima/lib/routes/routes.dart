import 'package:app10_clima/screens/load_screen.dart';
import 'package:app10_clima/screens/main_screen.dart';
import 'package:app10_clima/screens/search_fragment.dart';
import 'package:flutter/cupertino.dart';
import '../screens/home_fragment.dart';

Map<String, Widget Function(BuildContext)> routes() {
  return {
    '/': (context) => const LoadScreen(),
    '/main': (context) => const MainScreen(),
    '/home': (context) => HomeFragment(),
    '/search': (context) => SearchFragment(),
  };
}
