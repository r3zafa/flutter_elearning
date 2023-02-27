import 'package:app13/screens/responsive_layout_builder.dart';
import 'package:app13/screens/tablet/main_tablet_screen.dart';
import 'package:app13/screens/ultra_wide/main_ultra_wide_screen.dart';
import 'package:flutter/material.dart';

import 'desktop/main_desktop_screen.dart';
import 'mobile/main_mobile_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayoutBuilder(
      mobileBody: MainMobileScreen(),
      tabletBody: MainTabletScreen(),
      desktopBody: MainDesktopScreen(),
      ultraWideBody: MainUltraWideScreen(),
    );
  }
}
