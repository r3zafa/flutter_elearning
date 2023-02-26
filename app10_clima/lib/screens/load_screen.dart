import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({Key? key}) : super(key: key);

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  void getWeatherData() async {
    Weather weather = Weather();
    await weather.initData();
    await weather.getWeatherData();
    await Future.delayed(const Duration(milliseconds: 700));
    navigateToHome();
  }

  void navigateToHome() {
    Navigator.pushNamed(context, '/main');
  }

  @override
  void initState() {
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SpinKitSquareCircle(
            color: Colors.white38,
            size: 80.0,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'LOADING...',
            style: GoogleFonts.abel(fontSize: 30, color: Colors.white54),
          ),
        ],
      ),
    );
  }
}
