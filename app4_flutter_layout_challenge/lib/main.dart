import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layouts Challenge',
      home: Scaffold(
        backgroundColor: Colors.teal[300],
        body: SafeArea(
          child: Container(
            //width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 100.0,
                  color: Colors.red[500],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 100.0, height: 100.0, color: Colors.yellow),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      color: Colors.green[700],
                    ),
                  ],
                ),
                Container(
                  width: 100.0,
                  color: Colors.blue[500],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
