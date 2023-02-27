import 'package:app13/screens/desktop/main_desktop_screen.dart';
import 'package:app13/screens/mobile/main_mobile_screen.dart';
import 'package:app13/screens/responsive_layout_builder.dart';
import 'package:app13/screens/tablet/main_tablet_screen.dart';
import 'package:app13/screens/task_screen.dart';
import 'package:app13/screens/ultra_wide/main_ultra_wide_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: TasksScreen(),
      ),
    );
  }
}
