import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I am Poor',
      home: Scaffold(
        backgroundColor: Colors.teal[600],
        appBar: AppBar(
          title: const Text('I am Poor'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: const Center(
          child: Image(
            image: AssetImage('files/images/help.png'),
          ),
        ),
      ),
    );
  }
}
