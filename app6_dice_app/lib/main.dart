import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'svgAssets.dart' as constants;

const List<String> _assetNames = constants.assetNames;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const SizerClass()));
}

class SizerClass extends StatelessWidget {
  const SizerClass({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return const Dice();
    });
  }
}

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDiceNum = 0;
  int rightDiceNum = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red.shade600,
        appBar: AppBar(
          title: const Text('App 6 / Dice'),
          backgroundColor: Colors.red.shade900,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 35.w,
                    width: 35.w,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          leftDiceNum = generateRandomNumber();
                        });

                        if (kDebugMode) {
                          print('left dice $leftDiceNum');
                        }
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: SvgPicture.asset(_assetNames[leftDiceNum]),
                    ),
                  ),
                  SizedBox(
                    height: 35.w,
                    width: 35.w,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          rightDiceNum = generateRandomNumber();
                        });

                        if (kDebugMode) {
                          print('right dice: $rightDiceNum');
                        }
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: SvgPicture.asset(_assetNames[rightDiceNum]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: SizedBox(
                  width: 60.w,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        rightDiceNum = generateRandomNumber();
                        leftDiceNum = generateRandomNumber();
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.black54,
                      ),
                      textStyle: MaterialStateProperty.all(
                        GoogleFonts.dancingScript(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    child: const Text('Roll Dices'),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    rightDiceNum = 0;
                    leftDiceNum = 0;
                  });
                },
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                  ),
                ),
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// functions
generateRandomNumber() {
  Random rand = Random();
  int randNum = rand.nextInt(6) + 1;
  return randNum;
}
