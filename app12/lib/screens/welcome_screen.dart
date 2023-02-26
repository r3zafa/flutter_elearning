import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../controllers/firebase_controller.dart';

class WelcomeScreen extends StatelessWidget {
  static String route = '/';
  WelcomeScreen({Key? key}) : super(key: key);

  final FirebaseController firebaseController = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade400,
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return SafeArea(
            child: SizedBox(
              width: orientation == Orientation.portrait ? 100.w : 100.h,
              height: orientation == Orientation.portrait ? 100.h : 100.w,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'hero1',
                    child: Text(
                      'LiveChat',
                      style: GoogleFonts.poppins(
                        fontSize: 38.sp,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Welcome',
                        textStyle: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        speed: const Duration(milliseconds: 250),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 15),
                    onFinished: () {
                      firebaseController.isLoggedIn();
                    },
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
