import 'dart:io' show Platform;
import 'package:app14/providers/task_list.dart';
import 'package:app14/screens/task_screen.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    doWhenWindowReady(() {
      final win = appWindow;
      const initialSize = Size(500, 900);
      win.minSize = initialSize;
      win.size = initialSize;
      win.alignment = Alignment.center;
      win.title = "Todoey";
      win.show();
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskList>(create: (_) => TaskList()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        home: TasksScreen(),
      ),
    );
  }
}
