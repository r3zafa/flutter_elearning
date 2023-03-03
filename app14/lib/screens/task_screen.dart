import 'package:app14/providers/task_list.dart';
import 'package:app14/screens/add_task_screen.dart';
import 'package:app14/screens/responsive_layout_builder.dart';
import 'package:app14/screens/tablet/main_tablet_screen.dart';
import 'package:app14/screens/ultra_wide/main_ultra_wide_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'desktop/main_desktop_screen.dart';
import 'mobile/main_mobile_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

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
                  context: context,
                );
              });
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          size: 36,
        ),
      ),
      body: const ResponsiveLayoutBuilder(
        mobileBody: MainMobileScreen(),
        tabletBody: MainTabletScreen(),
        desktopBody: MainDesktopScreen(),
        ultraWideBody: MainUltraWideScreen(),
      ),
    );
  }
}
