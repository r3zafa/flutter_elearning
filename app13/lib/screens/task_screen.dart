import 'package:app13/screens/add_task_screen.dart';
import 'package:app13/screens/responsive_layout_builder.dart';
import 'package:app13/screens/tablet/main_tablet_screen.dart';
import 'package:app13/screens/ultra_wide/main_ultra_wide_screen.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';
import 'desktop/main_desktop_screen.dart';
import 'mobile/main_mobile_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> items = [];

  addItem(taskTitle) {
    Task task = Task(name: taskTitle);
    setState(() {
      items.add(task);
    });
  }

  removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (context) {
                return AddTaskScreen(
                  addItemCallBack: addItem,
                );
              });
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          size: 36,
        ),
      ),
      body: ResponsiveLayoutBuilder(
        mobileBody: MainMobileScreen(
          items: items,
          removeItem: removeItem,
        ),
        tabletBody: const MainTabletScreen(),
        desktopBody: const MainDesktopScreen(),
        ultraWideBody: const MainUltraWideScreen(),
      ),
    );
  }
}
