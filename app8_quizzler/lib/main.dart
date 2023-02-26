import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';

import 'alert.dart';
import 'quiz_brain.dart';

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
    return Sizer(builder: (context, orientation, deviceType) => const App());
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text(
            'Quiz App',
            style: GoogleFonts.allura(
              fontSize: 30,
            ),
          ),
        ),
        body: const SafeArea(
          child: Quiz(),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int aIndex = 0;
  int correctAnswerIndex = 0;

  List<Icon> answerKeeper = [];
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();

  void _showWarning() {
    ShowAlert alert = ShowAlert(
      context: context,
      type: AlertType.warning,
      title: 'Warning',
      desc: 'Are you sure you want to restart the quiz?',
    );
    alert.show();
    _reset();
  }

  void _showSuccess() {
    ShowAlert alert = ShowAlert(
        context: context,
        type: AlertType.success,
        title: 'Success',
        desc:
            'You have finished the quiz with $correctAnswerIndex / $aIndex correct answers.');

    alert.show();
  }

  void _reset() {
    setState(() {
      scoreKeeper = [];
      answerKeeper = [];
      aIndex = 0;
      correctAnswerIndex = 0;
      quizBrain.resetQuestionIndex();
    });
  }

  void _goBack() {
    setState(() {
      if (scoreKeeper.isNotEmpty) {
        scoreKeeper.removeLast();
      }
      if (answerKeeper.isNotEmpty) {
        answerKeeper.last.semanticLabel == 'true' ? correctAnswerIndex-- : null;
        answerKeeper.removeLast();
      }
      aIndex--;
      quizBrain.previousQuestion();
    });
  }

  void _checkAnswer({required bool userAnswer}) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      aIndex++;
      answerKeeper.add(_chosenAnswer(chosenAnswer: userAnswer));

      if (correctAnswer == userAnswer) {
        correctAnswerIndex++;
        scoreKeeper.add(_correctAnswer(isCorrect: true));
      } else {
        scoreKeeper.add(_correctAnswer(isCorrect: false));
      }
      quizBrain.nextQuestion();
      if (aIndex == quizBrain.getQuestionListLength()) {
        _showSuccess();
      }
    });
  }

  Icon _chosenAnswer({required bool chosenAnswer}) {
    if (chosenAnswer == true) {
      return const Icon(
        Icons.check,
        color: Colors.green,
        semanticLabel: 'true',
      );
    } else {
      return const Icon(
        Icons.close,
        color: Colors.red,
        semanticLabel: 'false',
      );
    }
  }

  Icon _correctAnswer({required bool isCorrect}) {
    if (isCorrect == true) {
      return const Icon(
        Icons.thumb_up_sharp,
        color: Colors.green,
        semanticLabel: 'true',
      );
    } else {
      return const Icon(
        Icons.thumb_down_sharp,
        color: Colors.red,
        semanticLabel: 'false',
      );
    }
  }

  Widget _buttons() {
    if (aIndex != quizBrain.getQuestionListLength()) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _checkAnswer(userAnswer: true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade600,
              textStyle: GoogleFonts.poppins(
                fontSize: 20,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              width: 35.w,
              height: 7.h,
              child: const Text('True'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _checkAnswer(userAnswer: false);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              textStyle: GoogleFonts.poppins(
                fontSize: 20,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              width: 35.w,
              height: 7.h,
              child: const Text('False'),
            ),
          ),
        ],
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          _reset();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white54,
          textStyle: GoogleFonts.poppins(
            fontSize: 20,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          width: 83.w,
          height: 7.h,
          child: const Text('Reset'),
        ),
      );
    }
  }

  List<Icon> _answers() {
    if (aIndex == quizBrain.getQuestionListLength()) {
      return [...scoreKeeper];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 100.w,
          height: 45.h,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12,
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 5,
                  right: 5,
                  child: SizedBox(
                    width: 55,
                    height: 55,
                    child: TextButton(
                      onPressed: () {
                        _showWarning();
                      },
                      style: IconButton.styleFrom(
                        padding: const EdgeInsets.all(2),
                      ),
                      child: const Icon(
                        Icons.refresh,
                        size: 50,
                        color: Colors.white,
                        semanticLabel: 'reset',
                      ),
                    ),
                  )),
              Positioned(
                  top: 5,
                  left: 5,
                  child: SizedBox(
                    width: 55,
                    height: 55,
                    child: TextButton(
                      onPressed: () {
                        _goBack();
                      },
                      style: IconButton.styleFrom(
                        padding: const EdgeInsets.all(2),
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        size: 50,
                        color: Colors.white,
                        semanticLabel: 'go back',
                      ),
                    ),
                  )),
              Positioned(
                  top: 8.h,
                  left: 20,
                  right: 20,
                  bottom: 5.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        quizBrain.getQuestionText(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 100.w,
              height: 8.h,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 3),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color: Colors.black12,
              ),
              child: Wrap(
                spacing: 7,
                children: [...answerKeeper],
              ),
            ),
            Container(
              width: 100.w,
              height: 8.h,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.zero,
                  topLeft: Radius.zero,
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.black12,
              ),
              child: Wrap(
                spacing: 7,
                children: _answers(),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        _buttons(),
      ],
    );
  }
}
