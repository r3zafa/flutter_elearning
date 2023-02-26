import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade400,
      body: SafeArea(
        child: Center(
            child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Loading...',
              textStyle: GoogleFonts.poppins(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              speed: const Duration(milliseconds: 250),
            ),
          ],
          totalRepeatCount: 1,
          onFinished: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/home');
          },
          pause: const Duration(milliseconds: 15),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        )),
      ),
    );
  }
}
